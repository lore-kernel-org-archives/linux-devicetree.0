Return-Path: <robherring2@gmail.com>
Date: Wed, 27 Mar 2019 18:28:02 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: usb: renesas_usb3: add extcon support
Message-ID: <20190327232802.GA28701@bogus>
References: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
 <1551863246-11656-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551863246-11656-3-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 06, 2019 at 09:07:19AM +0000, Biju Das wrote:
> Add support for renesas_usb3 to receive connect and disconnect notification
> using extcon framework.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas_usb3.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> index d366555..ae35674 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> @@ -21,6 +21,8 @@ Required properties:
>  Optional properties:
>    - phys: phandle + phy specifier pair
>    - phy-names: must be "usb"
> +  - extcon: phandle for the extcon device renesas usb3 uses to detect
> +	    connect/disconnect events.

Please don't use extcon and use usb-connector binding instead.

>  
>  Example of R-Car H3 ES1.x:
>  	usb3_peri0: usb@ee020000 {
> -- 
> 2.7.4
> 
