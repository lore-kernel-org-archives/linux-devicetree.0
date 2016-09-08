From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 1/3] Documentation: dt: net: add mt76 wireless device binding
Date: Thu, 08 Sep 2016 13:54:24 +0300
Message-ID: <87eg4uu0f3.fsf@kamboji.qca.qualcomm.com>
References: <20160905095128.80560-1-nbd@nbd.name>
        <20160905095128.80560-2-nbd@nbd.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160905095128.80560-2-nbd-Vt+b4OUoWG0@public.gmane.org> (Felix Fietkau's message of
        "Mon, 5 Sep 2016 11:51:26 +0200")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org> writes:

> Signed-off-by: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
> ---
>  .../bindings/net/wireless/mediatek,mt76.txt        | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
>
> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
> new file mode 100644
> index 0000000..d51c35f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
> @@ -0,0 +1,26 @@
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
> +- mediatek,2ghz: Override the 2.4 GHz band capability from EEPROM
> +- mediatek,5ghz: Override the 5 GHz band capability from EEPROM
> +- mediatek,mtd-eeprom: Specify a MTD partition + offset containing EEPROM data
> +
> +&pcie {
> +	status = "okay";
> +
> +	pcie0 {
> +		mt76@0,0 {
> +			reg = <0x0000 0 0 0 0>;
> +			device_type = "pci";
> +			mediatek,mtd-eeprom = <&factory 0x8000>;
> +			mediatek,2ghz = <0>;
> +		};
> +	};
> +};

I need an ack from device tree maintainers, CCing the devicetree list.
Do we need to resend or this ok?

Patchwork link:

https://patchwork.kernel.org/patch/9313309/

-- 
Kalle Valo
