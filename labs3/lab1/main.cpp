#include <iostream>
#include <fstream>
#include <string>
#include "input.h"
#include "hash.h"
#include "include/gtest/gtest.h"

//g++ -Lgtestbuild -I./include --coverage tests.cpp main.cpp input.cpp hash.cpp -lgtest
//gcov -abcfu tests.cpp main.cpp input.cpp hash.cpp 


//assignment --- *ht = *ht2;

using namespace std;

GTEST_API_ int main (int argc, char ** argv)
{	
	string str;
    ifstream input;
    input.open("qwe.txt");
    HashTable ht;
    while (getline(input, str))
    {
        Key key = str;
        Value value;
        getkey(str, key);
        getvalue(str, value);
        ht.insert(key, value);
    }

    cout << endl << endl;
    //ht->print();

    input.close();
    ht.print();
    input.open("asd.txt");
    HashTable ht2;
    //ht2.print();
    //input.close();
    while (getline(input, str))
    {
        
        Key key = str;
        Value value;
        getkey(str, key);
        getvalue(str, value);
        
        ht2.insert(key, value);
        
    }
    input.close();
    ht2.print();
    ht2.swap(ht);
    ht.print();
    ht2.print();
    //ht2.print();
    /*cout << "Waiting" << endl;
    while (cin >> str)
    {
        if(ht2.search(str))
        {
            cout << ht2.at(str).age << " age" << endl;
            cout << ht2.at(str).weight << " weight" << endl; 
        }
        else
        {
            cout << "Not found" << endl;
            break;
        }
    }*/
    /*cout << endl << endl;
    const HashTable ht3 = ht;

    cout << ht3.at("qas").age << " 3 age" << endl;
    ht3.at("qas").age = 5;
    cout << ht3.at("qas").age << " 4 age" << endl;*/
    //cout << "Running tests\n" << endl;
    //testing::InitGoogleTest(&argc, argv);
    //return RUN_ALL_TESTS();
 
}




/* cout << "test swap" << endl;
    ht->swap(*ht2);
    ht->print();
    ht2->print();
    ht2 = ht2;
    cout << endl << endl;
    cout << "test operator =" << endl;
    ht->print();
    ht2->print();
    cout << endl << endl;
    cout << "test clear" << endl;
    ht->clear();
    ht->print();
    ht2->print();
    cout << endl << endl;
    cout << "test erase" << endl;
    ht2->erase("uggu");
    ht2->erase("qas");
    ht2->erase("qwe");
    ht2->erase("rtyu");
    ht2->erase("gfhbjbh");
    ht2->erase("uggu");
    ht2->erase("uggu");
    ht2->print();
    cout << endl << endl;
    int size = ht2->getsize();
    cout << "SIZE " << size << endl;
    bool empt1 = ht->empty();
    bool empt2 = ht2->empty();
    cout << "EMPTY CHECK " << empt1 << ' ' << empt2 << endl;
    cout << endl << endl << "== CHECK " << endl;
    if (ht == ht2)
        cout << "YES" << endl;
    else
        cout << "NO" << endl;
    if (ht != ht2)
        cout << "no" << endl;
    else
        cout << "yes" << endl;
    //ht = ht2;
    if (ht == ht2)
        cout << "YES" << endl;
    else
        cout << "NO" << endl;
    if (ht != ht2)
        cout << "no" << endl;
    else
        cout << "yes" << endl;
    cout << endl << endl;
    cout << "test at" << endl;
   // Value test = ht2->at("gg");
    cout << endl << endl;
    cout << "test operator []" << endl;
    ht->print();
    ht2->print();
    //test = (*ht)[(const Key &)("qwe")];
    //cout << "testing [] " << test.age << ' ' << test.weight << endl; */