#use Net::Twitter;
use Twitter::API;
use Scalar::Util 'blessed';
use JSON;
use Data::Dumper;
use LWP::Simple;


our $consumer_key    = '1Cu8f23ZglPF6U3n1Xn2YxZdl';
our $consumer_secret = 'SBbwylxccQFPJvzvUtTTkywyAwapaG4e1s6KGF4cALQ5Csdxai';
our $access_token = q(8988702-LfT0Fi9OmGjbuGDeiFwqoomLPm22JpWH6zpZTDj9Ci);
our $access_token_secret = q(QWV7OOkcEAU0lk12xlHe2Hug1Ij8JdO6ryY0RlP40yy2s);

#my $nt = Net::Twitter->new(
#        traits              => [qw/API::RESTv1_1/],
#        consumer_key        => $consumer_key,
#        consumer_secret     => $consumer_secret,
#        access_token        => $access_token,
#        access_token_secret => $access_token_secret,
#    );



my $nt = Twitter::API->new_with_traits(
        traits => 'Enchilada',
        consumer_key        => $consumer_key,
        consumer_secret     => $consumer_secret,
        access_token        => $access_token,
        access_token_secret => $access_token_secret,
);
while (1) {
 # my $tweets = $nt->search('@Archillect', {count=>1, result_type=>'recent' });
my $tweets = $nt->user_timeline  ('@Archillect', {count=>1, trim_user=>1});

my $img = $tweets->[0]{'extended_entities'}{'media'}[0]{'media_url'};
my $filetype = $tweets->[0]{'extended_entities'}{'media'}[0]{'type'};
print "$filetype\n";


my $data = get $img;
my $filename = "C:\\Temp\\image.jpg";
open (FH, ">$filename");
binmode (FH);
print FH $data;
close (FH);
	
#print Dumper $tweets;

print $img;

my $filename2 = "C:\\Temp\\tweet.json";
open (FH, ">$filename2");
print FH Dumper $tweets;
close (FH);

if ($filetype != 'photo'){
    exit(0);
}else{
    sleep(600);
}

}
#