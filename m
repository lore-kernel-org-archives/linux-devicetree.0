From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH/RFC 02/10] phy: rcar-gen3-usb2: Add phy-supply
 description in device tree doc
Date: Wed, 3 Feb 2016 14:45:20 -0600
Message-ID: <20160203204520.GA30531@rob-hp-laptop>
References: <1454408338-4612-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1454408338-4612-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454408338-4612-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: horms@verge.net.au, magnus.damm@gmail.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 02, 2016 at 07:18:50PM +0900, Yoshihiro Shimoda wrote:
> To handle the VBUS on/off by a regulator driver, this patch adds
> description about phy-supply in the rcar-gen3-phy-usb2.txt.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index eaf7e9b..48b33a9 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -15,6 +15,8 @@ To use a USB channel where USB 2.0 Host and HSUSB (USB 2.0 Peripheral) are
>  combined, the device tree node should set interrupt properties to use the
>  channel as USB OTG:
>  - interrupts: interrupt specifier for the PHY.
> +- phy-supply: Phandle to a regulator that provides power to the VBUS. This
> +	      regulator will be managed during the PHY power on/off sequence.

Is "phy" the actual name of the input supply to the phy?

>  
>  Example (R-Car H3):
>  
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
