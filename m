Return-Path: <SRS0=OnMb=WG=ragnatech.se=niklas.soderlund+renesas@kernel.org>
Date: Sat, 10 Aug 2019 02:02:49 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file to reflect IP block
Message-ID: <20190810000249.GB28494@bigcity.dyn.berto.se>
References: <20190809213710.31783-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190809213710.31783-1-horms+renesas@verge.net.au>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

Thanks for your work.

On 2019-08-09 14:37:10 -0700, Simon Horman wrote:
> For consistency with the naming of (most) other documentation files for DT
> bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> documentation file from renesas,usb3.txt to renesas,usb3-peri.txt
> 
> This refines a recent rename from renesas_usb3.txt to renesas-usb3.txt.
> The motivation is to more accurately reflect the IP block documented in
> this file.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> * Based on v5.3-rc1
> 
> v2
> * Add review tag
> * Correct changelog
> ---
>  .../devicetree/bindings/usb/{renesas,usb3.txt => renesas,usb3-peri.txt}   | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/usb/{renesas,usb3.txt => renesas,usb3-peri.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3.txt b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/usb/renesas,usb3.txt
> rename to Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas S�derlund
