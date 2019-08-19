Return-Path: <SRS0=rFFT=WP=verge.net.au=horms@kernel.org>
Date: Mon, 19 Aug 2019 16:15:31 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: iio: light: isl29501: Rename bindings
 documentation file
Message-ID: <20190819141531.daj5gfpcb2sco5fq@verge.net.au>
References: <20190819140105.18800-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819140105.18800-1-horms+renesas@verge.net.au>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Aug 19, 2019 at 04:01:05PM +0200, Simon Horman wrote:
> Rename the bindings documentation file for Renesas ISL29501 Time-of-flight
> sensor from isl29501.txt to renesas,isl29501.txt.
> 
> This is part of an ongoing effort to name bindings documentation files for
> Renesas IP blocks consistently, in line with the compat strings they
> document.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Based on v5.3-rc1
> ---
>  .../bindings/iio/light/{isl29501.txt => renesas,isl29501.txt}         | 0
>  Makefile                                                              | 4 ++--

Sorry, I seem to have messed this up a bit: the Makefile portion should not
be there.  I'll shake things out and repost.
