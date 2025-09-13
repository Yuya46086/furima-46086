import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.setupEventListeners();
    this.calculate(); // 初期表示時の計算
  }

  setupEventListeners() {
    const priceInput = document.getElementById("item-price");
    if (priceInput) {
      priceInput.addEventListener("input", this.calculate.bind(this));
    }
  }

  calculate() {
    const priceInput = document.getElementById("item-price");
    if (!priceInput) return;

    const price = parseInt(priceInput.value);
    const addTaxPriceElement = document.getElementById("add-tax-price");
    const profitElement = document.getElementById("profit");

    if (isNaN(price) || price < 0) {
      addTaxPriceElement.innerHTML = 0;
      profitElement.innerHTML = 0;
      return;
    }

    const tax = Math.floor(price * 0.1);
    const profit = price - tax;

    addTaxPriceElement.innerHTML = tax;
    profitElement.innerHTML = profit;
  }
}