const { expect } = require('chai');

const Contract = artifacts.require('Migrations');

describe("#Migration", function () {

contract('Migration', function () {
  beforeEach(async function () {
    this.contract = await Contract.new();
  });

  it('retrieve returns a value previously stored', async function () {
    let value = 10
    let expected_value = '10' 
    await this.contract.set(value);
    expect((await this.contract.get()).toString()).to.equal(expected_value);
  });
  
});
});