From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: net: add mt76 wireless device binding
Date: Fri, 13 Oct 2017 14:07:49 -0500
Message-ID: <20171013190749.lzzw4zjzt7fkp3hs@rob-hp-laptop>
References: <20171006110249.31013-1-nbd@nbd.name>
 <20171006110249.31013-2-nbd@nbd.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171006110249.31013-2-nbd-Vt+b4OUoWG0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 06, 2017 at 01:02:47PM +0200, Felix Fietkau wrote:
> Add documentation describing how device tree can be used to configure
> wireless chips supported by the mt76 driver.
> 
> Signed-off-by: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
> ---
>  .../bindings/net/wireless/mediatek,mt76.txt        | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
> new file mode 100644
> index 000000000000..19522ab97d62
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
> @@ -0,0 +1,24 @@
> +* MediaTek mt76xx devices
> +
> +This node provides properties for configuring the MediaTek mt76xx wireless
> +device. The node is expected to be specified as a child node of the PCI
> +controller to which the wireless chip is connected.
> +
> +Optional properties:
> +
> +- mac-address: See ethernet.txt in the parent directory
> +- local-mac-address: See ethernet.txt in the parent directory
> +- ieee80211-freq-limit: See ieee80211.txt
> +- mediatek,mtd-eeprom: Specify a MTD partition + offset containing EEPROM data

MTD is a Linuxism. And is an EEPROM the only supported device? I'd 
suggest naming if after what the data contains.

> +
> +&pcie {
> +	status = "okay";

Don't show status in examples.

> +
> +	pcie0 {
> +		wifi@0,0 {

You need a compatible here too.

> +			reg = <0x0000 0 0 0 0>;
> +			ieee80211-freq-limit = <5000000 6000000>;
> +			mediatek,mtd-eeprom = <&factory 0x8000>;
> +		};
> +	};
> +};
> -- 
> 2.14.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
