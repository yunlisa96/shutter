###################################################
#
#  Copyright (C) 2008, 2009, 2010 Mario Kemper <mario.kemper@googlemail.com> and Shutter Team
#
#  This file is part of Shutter.
#
#  Shutter is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your option) any later version.
#
#  Shutter is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with Shutter; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
###################################################

package Shutter::Screenshot::History;

#modules
#--------------------------------------
use utf8;
use strict;
use warnings;

#Glib
use Glib qw/TRUE FALSE/; 

#--------------------------------------

sub new {
	my $class = shift;
	
	my $self = { _sc  => shift };

	#last capture
	$self->{_drawable} 	= shift;	
	$self->{_x}			= shift;
	$self->{_y}			= shift;
	$self->{_w}			= shift;
	$self->{_h}			= shift;
	$self->{_region}	= shift;	

	bless $self, $class;
	return $self;
}

sub get_last_capture {
	my $self = shift;
	return ($self->{_drawable}, $self->{_x}, $self->{_y}, $self->{_w}, $self->{_h}, $self->{_region});
}

sub set_last_capture {
	my $self = shift;
	if (scalar @_ >= 5) {
		$self->{_drawable} 	= shift;	
		$self->{_x}			= shift;
		$self->{_y}			= shift;
		$self->{_w}			= shift;
		$self->{_h}			= shift;
		$self->{_region}	= shift;	
	}else{
		warn "WARNING: Wrong number of arguments in Shutter::Screenshot::History::set_last_capture\n";
	}
	return ($self->{_drawable}, $self->{_x}, $self->{_y}, $self->{_w}, $self->{_h}, $self->{_region});
}

1;