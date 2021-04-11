import 'package:flutter/material.dart';

class Object {
  String work;

  // 自定义构造方法
  Object(this.work);

  // 静态方法
  static void runLearning() {
    Object('ssss').printSelf();
    Object.show();
  }

  void printSelf() {
    print('this is ${this} printSelf');
  }

  static void show() {
    print('this is Object show');

    var sub = SubLearningObject('hahha', 'ssss');
    sub.printSelf();
    sub.name = 'ssss';
    sub.age = 30;
    print('sub.name=${sub.name}');
    print('sub.age=${sub.age}');

    Tiger().eat();
    Tiger().sleep();
    print(Tiger().getData('ssssss'));
  }
}

/// 对象继承使用extends
class SubLearningObject extends Object {
  String name;
  int age;

  // 实现父类构造方法
  SubLearningObject(String work, String name) : super(work) {
    this.name = name;
  }

  // 重写父类方法，覆盖父类实现, (@override可加可不加)
  @override
  void printSelf() {
    print('override ${this} printSelf');
  }
}

// 使用 abstract 修饰的类为抽象类，（类似于协议）
abstract class Animal {
  // 提供默认实现，子类继承可不实现
  void eat() {
    print('this is animal eat');
  }

  // 未实现方法必须在子类中实现
  void sleep();

  // 泛型
  T getData<T>(T value);
}

//
class Tiger implements Animal {
  @override
  void eat() {
    // TODO: implement eat
    print('this is Tiger eat');
  }

  @override
  void sleep() {
    // TODO: implement sleep
    print('this is Tiger sleep');
  }

  @override
  T getData<T>(T value) {
    // TODO: implement getData
    return value;
  }
}
