public class Dog extends RealmObject {
    @PrimaryKey
    public String name;

    public int age;

    public String breed;

    public Person owner;

    public Dog(String name, int age, String breed, Person owner) {
        if (name != null) {
            this.name = name;
        } else {
            this.name = "";
        }
        this.age = age;
        this.breed = breed;
        this.owner = owner;
    }
}
