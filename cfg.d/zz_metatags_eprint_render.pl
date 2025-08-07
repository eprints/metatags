my $old_eprint_render = $c->{eprint_render};

$c->{eprint_render} = sub {
	my( $eprint, $repository, $preview ) = @_;

	my( $page, $title, $links, $template ) = $old_eprint_render->( $eprint, $repository, $preview );

	if( !$preview ) {
		$links->appendChild( $repository->plugin( "Export::HighwirePress" )->dataobj_to_html_header( $eprint ) );
	}

	return( $page, $title, $links, $template );
}
