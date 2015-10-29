
use strict;
use warnings;
use List::Slice qw( head tail );
use List::Util qw( shuffle );
use Benchmark qw( cmpthese );

my @names = shuffle qw( aardvark albatross alligator alpaca ant anteater antelope ape
armadillo ass auk baboon badger barracuda bass bat bear beaver bee beetle bird
bison bittern bloodhound boar bobcat bovine buffalo bullfinch bullock butterfly
buzzard camel caribou cat caterpillar cattle cheetah chicken chimpanzee
chinchilla cicada clam cockroach cod colt coot cougar cow coyote crab crane
cricket crocodile crow deer dog dolphin donkey dotterel dove duck eagle eel
elephant elk ewe falcon ferret finch fish flamingo fly flying fish fowl fox
frog gerbil giraffe gnat gnu goat goldfinch goldfish goose gorilla goshawk
grasshopper greyhound grouse guinea pig gull hamster hare hawk hedgehog hen
heron herring hippopotamus hog hornet horse hound hummingbird hyena hyrax
impala jackrabbit jellyfish kangaroo kitten koala lark lemur leopard lice lion
llama lobster locust louse lynx mackerel magpie mallard manatee marten meerkat
mink minnow mole monkey moose mosquito mouse mule muskrat nighthawk nightingale
opossum orangutan ostrich otter owl ox oyster panda parrot partridge peacock
peafowl pelican penguin pheasant pig pigeon pike plover polar bear polecat pony
porcupine porpoise possum prairie dog quail rabbit raccoon racoon raptor rat
raven reindeer rhinoceros rook rooster salmon sandpiper sardine scorpion sea
horse sea lion seal shark sheep skunk snail snake snipe sow sparrow spider
squirrel stallion starling stork swallow swan swine swordfish Tasmanian devil
termite tiger toad tortoise toucan trout turkey turtle turtle dove viper
vulture wallaby walrus wasp weasel whale widgeon wild boar wolf wombat
woodchuck woodcock woodpecker worm wren yak zebra );

cmpthese -5, {
    perl => sub {
        my @found_names = grep { /^[a-d]/ } @names;
        my @topfive = @found_names[0..4];
    },
    slice => sub {
        my @topfive = ( grep { /^[a-d]/ } @names )[0..4];
    },
    head => sub {
        my @topfive = head 5, grep { /^[a-d]/ } @names;
    },
};

cmpthese -5, {
    perl => sub {
        my @found_names = grep { /^[a-d]/ } @names;
        my @bottomfive = @found_names[$#found_names-5..$#found_names];
    },
    head => sub {
        my @bottomfive = tail 5, grep { /^[a-d]/ } @names;
    },
};

