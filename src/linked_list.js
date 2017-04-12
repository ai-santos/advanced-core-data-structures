'use strict'

class Node {
  constructor(data, next) {
    this.data = data
    this.next = next || null
  }
}

class LinkedList {
  constructor() {
    this._length = 0
    this.head = null
  }

  insert(value) {
    let node = new Node(value)
    //case 1, no value, throw error
    if(!value){
      throw new Error('Please pass in a value')
    }
    //case 2 no head, make the new node the new head
    if(!this.head) {
      this.head = node
      this._length++

      return node
    }
    //case 3, head exists,
    let currentNode = this.head
    while(currentNode.next) {
      currentNode = currentNode.next
    }
    currentNode.next = node
    this._length++
    return node
  }

  insertFirst(value) {
    let node = new Node(value)
    //case 1, no head, make the new node the new head
    if(!this.head) {
      this.head = node
      this._length++

      return node
    }
    //case 2, head exists
    let currentNode = this.head
    node.next = currentNode
    this.head = node

    return node
  }

  insertBefore( data, newData ) {
    let currentNode = this.head
    let insertedNode
    while( (currentNode !== null) && (insertedNode === undefined) ) {
      if( JSON.stringify(currentNode.next.data) === JSON.stringify(data) ){
       insertedNode = new Node( newData )
       // make inserted node's next the old currentNode's next
       insertedNode.next = currentNode.next
       // set the new inserted node as the old currentNode's next
       currentNode.next = insertedNode
       this._length++
      }
      if( (currentNode === this.head) && (currentNode.data === data) ) {
        insertedNode = new Node( newData )
        insertedNode.next = currentNode
        this.head = insertedNode
        this._length++
      }
    }
    return insertedNode
  }

  insertAfter( data, newData ) {
    let node = new Node( newData )
    let currentNode = this.head

    while( currentNode.next ) {
      if( currentNode.data === data ){
        node.next = currentNode.next
        currentNode.next = node
        return node
      }
      currentNode = currentNode.next
    }
  }

  getHeadNode() {
    return this.head
  }

  getTailNode() {
    let currentNode = this.head
    while(currentNode.next) {
      currentNode = currentNode.next
    }
    return currentNode
  }

  size() {
    return this._length
  }
}

const ll = new LinkedList()
ll.insert(1)
ll.insert(3)
ll.insert(4)
ll.insertBefore(3, 2)
console.log(ll)

// export default LinkedList