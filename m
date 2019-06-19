Return-Path: <SRS0=fzon=US=ragnatech.se=niklas.soderlund+renesas@kernel.org>
Date: Wed, 19 Jun 2019 13:03:14 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 0/2] dt-bindings: usb: renease_{usbhs,gen3} Rename
 bindings documentation files
Message-ID: <20190619110314.GC18708@bigcity.dyn.berto.se>
References: <20190617090603.8449-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190617090603.8449-1-horms+renesas@verge.net.au>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

Thanks for your work.

On 2019-06-17 11:06:01 +0200, Simon Horman wrote:
> Hi,
> 
> For consistency with the naming of (most) other documentation files for DT
> bindings for Renesas IP blocks rename the Renesas USBHS and USB 3.0
> peripheral documentation files.

With Shimoda-sans comment on 2/2 fixed for the whole series,

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Simon Horman (2):
>   dt-bindings: usb: renesas_usbhs: Rename bindings documentation file
>   dt-bindings: usb: renesas_gen3: Rename bindings documentation file
> 
>  .../devicetree/bindings/usb/{renesas_usb3.txt => renesas,usb3.txt}        | 0
>  .../devicetree/bindings/usb/{renesas_usbhs.txt => renesas,usbhs.txt}      | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/usb/{renesas_usb3.txt => renesas,usb3.txt} (100%)
>  rename Documentation/devicetree/bindings/usb/{renesas_usbhs.txt => renesas,usbhs.txt} (100%)
> 
> -- 
> 2.11.0

-- 
Regards,
Niklas S�derlund
