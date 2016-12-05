From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] Add DT bindings documentation for NS2 USB DRD phy
Date: Mon, 5 Dec 2016 17:09:39 -0600
Message-ID: <20161205230939.j6kmns3oll4eddsv@rob-hp-laptop>
References: <1480485338-23451-1-git-send-email-raviteja.garimella@broadcom.com>
 <1480485338-23451-2-git-send-email-raviteja.garimella@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480485338-23451-2-git-send-email-raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 30, 2016 at 11:25:36AM +0530, Raviteja Garimella wrote:
> This patch adds documentation for NS2 DRD Phy driver DT bindings
> 
> Signed-off-by: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/phy/brcm,ns2-drd-phy.txt   | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.txt b/Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.txt
> new file mode 100644
> index 0000000..5857f99
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.txt
> @@ -0,0 +1,40 @@
> +BROADCOM NORTHSTAR2 USB2 (DUAL ROLE DEVICE) PHY
> +
> +Required properties:
> + - compatible: brcm,ns2-drd-phy
> + - reg: offset and length of the NS2 PHY related registers.
> + - reg-names
> +   The below registers must be provided.
> +   icfg - for DRD ICFG configurations
> +   rst-ctrl - for DRD IDM reset
> +   crmu-ctrl - for CRMU core vdd, PHY and PHY PLL reset
> +   usb2-strap - for port over current polarity reversal
> + - #phy-cells: Must be 0. No args required.
> + - vbus-gpios: vbus gpio binding
> + - id-gpios: id gpio binding
> +
> +Refer to phy/phy-bindings.txt for the generic PHY binding properties
> +
> +Example:
> +	gpio_g: gpio@660a0000 {

You don't really need to show gpio node for the example. Otherwise,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
