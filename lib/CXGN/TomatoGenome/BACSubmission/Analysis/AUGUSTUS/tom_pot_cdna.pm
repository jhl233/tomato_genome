

=head2 AUGUSTUS::tom_pot_cdna

  Secondary input parameters:
    blat_exec       - path to blat executable, defaults to looking for it in path
    augustus_exec   - path to augustus executable, defaults to looking for it in path
    blat2hints_exec - path to blat2hints.pl script, defaults to /usr/share/augustus/scripts/blat2hints.pl
    augustus_tom_pot_cdnas - path to a fasta file containing tomato and potato cDNAs to use as prediction hints,
                             defaults to downloading cxgn-resource://tom_pot_combined_ests

=cut

package CXGN::TomatoGenome::BACSubmission::Analysis::AUGUSTUS::tom_pot_cdna;
use base qw/CXGN::TomatoGenome::BACSubmission::Analysis::AUGUSTUS::Base/;

use CXGN::Tools::Wget qw/wget_filter/;

__PACKAGE__->run_for_new_submission(1);

sub _get_cdna_seqs_file {
  my ($self,$aux) = @_;
  return $aux->{augustus_tom_pot_cdnas} || wget_filter('cxgn-resource://tom_pot_combined_ests');
}


1;

