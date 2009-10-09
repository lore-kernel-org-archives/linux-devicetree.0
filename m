From: Joe Perches <joe@perches.com>
Subject: Re: [RFC] scripts/get_maintainer: add emails based on keywords in
 the patch
Date: Fri, 09 Oct 2009 04:23:26 -0700
Message-ID: <1255087406.16347.108.camel@Joe-Laptop.home>
References: <1255084379-12954-1-git-send-email-w.sang@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760466AbZJILYG@vger.kernel.org>
In-Reply-To: <1255084379-12954-1-git-send-email-w.sang@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Anton Vorontsov <avorontsov@ru.mvista.com>
List-Id: devicetree@vger.kernel.org

On Fri, 2009-10-09 at 12:32 +0200, Wolfram Sang wrote:

> +my %keywords_to_mail = (
> +	'of_get_property' => 'L: devicetree-discuss@lists.ozlabs.org',

maybe: '\bof_get_property\b'

> +	    # Check the lines which a patch modifies for keywords; add mail if found.
> +	    } elsif (m/^[+-].*($keywords_to_mail_match)/o) {
> +		(my $keyword_mail = $keywords_to_mail{$1}) =~ s/^([LM]): //;
> +		push( @{ ($1 eq 'L') ? \@list_to : \@email_to }, $keyword_mail );
> +	   }

If this facility is desired by many others, it might be
better to have a separate file of 'regex generates email'
read at initialization.
