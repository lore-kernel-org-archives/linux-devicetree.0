From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/3] Documentation: dt: net: add mt76 wireless device
 binding
Date: Tue, 7 Feb 2017 12:43:56 -0600
Message-ID: <20170207184356.hujknabzd7plrj6w@rob-hp-laptop>
References: <20170202115208.8614-1-nbd@nbd.name>
 <20170202115208.8614-2-nbd@nbd.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170202115208.8614-2-nbd-Vt+b4OUoWG0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 02, 2017 at 12:52:06PM +0100, Felix Fietkau wrote:
> Signed-off-by: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
> ---
>  .../bindings/net/wireless/mediatek,mt76.txt        | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
> new file mode 100644
> index 000000000000..2be480c0eab8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
> @@ -0,0 +1,25 @@
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
> +
> +&pcie {
> +	status = "okay";
> +
> +	pcie0 {
> +		mt76@0,0 {

wifi@0,0

> +			reg = <0x0000 0 0 0 0>;
> +			device_type = "pci";

This only applies to PCI bridge nodes, so drop.

> +			ieee80211-freq-limit = <5000000 6000000>;
> +			mediatek,mtd-eeprom = <&factory 0x8000>;
> +		};
> +	};
> +};
> -- 
> 2.11.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
