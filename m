Return-Path: <jic23@kernel.org>
Date: Sun, 25 Aug 2019 19:11:09 +0100
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: iio: light: isl29501: Rename bindings
 documentation file
Message-ID: <20190825191109.510e91b5@archlinux>
In-Reply-To: <20190819141708.20456-1-horms+renesas@verge.net.au>
References: <20190819141708.20456-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 19 Aug 2019 16:17:08 +0200
Simon Horman <horms+renesas@verge.net.au> wrote:

> Rename the bindings documentation file for Renesas ISL29501 Time-of-flight
> sensor from isl29501.txt to renesas,isl29501.txt.
> 
> This is part of an ongoing effort to name bindings documentation files for
> Renesas IP blocks consistently, in line with the compat strings they
> document.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Applied,

Thanks,

Jonathan

> ---
> Based on v5.3-rc1
> 
> v2
> * Drop spurious top-level Makefile hunk
> ---
>  .../devicetree/bindings/iio/light/{isl29501.txt => renesas,isl29501.txt}  | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/iio/light/{isl29501.txt => renesas,isl29501.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/iio/light/isl29501.txt b/Documentation/devicetree/bindings/iio/light/renesas,isl29501.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/iio/light/isl29501.txt
> rename to Documentation/devicetree/bindings/iio/light/renesas,isl29501.txt
