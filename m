MIME-Version: 1.0
Date: Mon, 6 May 2019 20:05:56 -0500
References: <20190506234631.113226-1-chris.brandt@renesas.com>
	<20190506234631.113226-3-chris.brandt@renesas.com>
In-Reply-To: <20190506234631.113226-3-chris.brandt@renesas.com>
Message-ID: <CAL_Jsq+LkTXMv+YpHyLcGh4ztUMmz2dSfnzcHXymHi-_VMi_KA@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: rcar-gen3-phy-usb2: Document uses_usb_x1
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Linux USB List <linux-usb@vger.kernel.org>, devicetree@vger.kernel.org, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, May 6, 2019 at 6:47 PM Chris Brandt <chris.brandt@renesas.com> wrote:
>
> Document the optional renesas,uses_usb_x1 property.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index d46188f450bf..26bf377102d3 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -46,6 +46,8 @@ channel as USB OTG:
>                regulator will be managed during the PHY power on/off sequence.
>  - renesas,no-otg-pins: boolean, specify when a board does not provide proper
>                        otg pins.
> +- renesas,use_usb_x1: boolean, the dedicated 48MHz crystal inputs USB_X1 are
> +                      used for the PLL source

s/_/-/
