From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 6/6] phy: renesas: rcar-gen3-usb2: add gpio handling
Date: Sat, 16 Dec 2017 12:05:10 -0600
Message-ID: <20171216180510.qh5uiu5kwz5mx7zi@rob-hp-laptop>
References: <1513316726-14387-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1513316726-14387-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513316726-14387-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: kishon@ti.com, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 15, 2017 at 02:45:26PM +0900, Yoshihiro Shimoda wrote:
> Some R-Car SoCs (e.g. R-Car D3) doesn't have dedicated pins of VBUS
> and ID. So, they may be connected to gpio pins. To handle the gpio
> pins, this patch adds the handling of VBUS and ID pins instead of
> dedicated pins.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  2 +
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 77 ++++++++++++++++++++--
>  2 files changed, 72 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index 99b651b..999a6ef 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -27,6 +27,8 @@ channel as USB OTG:
>  - interrupts: interrupt specifier for the PHY.
>  - vbus-supply: Phandle to a regulator that provides power to the VBUS. This
>  	       regulator will be managed during the PHY power on/off sequence.
> +- vbus-gpios: use gpio to control vbus instead of dedicated pin.

How does this relate to vbus-supply? A gpio-regulator doesn't work here?

> +- id-gpios: use gpio to detect id instead of dedicated pin.

These aren't part of the phy, but really belong in a connector node.

Rob
