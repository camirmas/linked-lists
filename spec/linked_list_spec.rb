require "spec_helper"
require "linked_list"

describe Node do
  let(:node) {Node.new(5)}

  it "has a value" do
    expect(node.value).to be == 5
  end

  it "has a next_node" do
    node.next_node = Node.new(4)

    expect(node.next_node.value).to be == 4
  end
end

describe LinkedList do
  let(:my_list) {LinkedList.new(5)}

  it "has a head that is a node" do
    expect(my_list.head.class).to be == Node
  end

  it "has a tail that is a node" do
    expect(my_list.tail.class).to be == Node
  end

  it "has a tail that is a node" do
    expect(my_list.tail.class).to be == Node
  end

  it "can have items appended to it" do
    my_list.append(4)

    expect(my_list.tail.value).to be == 4
  end

  it "can be printed" do
    expect(my_list.to_s).to be == "5"
  end

  it "can have items prepended to it" do
    my_list.prepend("hello")

    expect(my_list.head.value).to be == "hello"
  end

  it "has a length" do
    my_list.append(4)
    my_list.append(5)

    expect(my_list.length).to be == 3
  end

  it "finds items" do
    my_list.append("hello")
    found_node = my_list.find("hello")

    expect(found_node.value).to be == "hello"
  end

  it "returns 'not found' when items are not found" do
    my_list.append("hello")
    found_node = my_list.find("yes")

    expect(found_node).to be nil
  end

  it "deletes items" do
    my_list.append("hello")
    my_list.delete(5)

    expect(my_list.find(5)).to be nil
  end

  it "cannot delete items that don't exist!" do
    my_list.append("hello")
    my_list.delete("what?")

    expect(my_list.delete("what?")).to be == "not found"
  end

  it "inserts items after a given item" do
    my_list.insert_after(5, "yes")
    expect(my_list.tail.value).to be == "yes"
  end

  it "does not insert items after a given item that doesn't exist" do
    expect(my_list.insert_after("hello", "yes")).to be == "not found!"
  end

  it "deletes items that are in the linked list" do
    my_list.append("hello")
    my_list.delete("hello")

    expect(my_list.find("hello")).to be == nil
  end

  it "returns 'not found' when the item to delete is not in the linked list" do
    expect(my_list.delete("hello")).to be == "not found"
  end
end