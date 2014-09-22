From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 1/2] bcma: register bcma as device tree driver
Date: Mon, 22 Sep 2014 09:26:51 +0200
Message-ID: <4345256.UGZH9SeRYG@wuerfel>
References: <1411339108-22307-1-git-send-email-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411339108-22307-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 22 September 2014 00:38:27 Hauke Mehrtens wrote:
> +
> +- reg : iomem address range of chipcommon core
> +
> +The cores on the AXI bus are automatically detected by bcma with the
> +memory ranges they are using and they get registered afterwards.
> +Automatic detection of the IRQ number is not reliable on
> +BCM47xx/BCM53xx ARM SoCs. To assign IRQ numbers to the cores, provide
> +them manually through device tree. The IRQ number and the device tree
> +child entry will get assigned to the core with the matching reg address.
> +
> +Example:
> +
> +       axi@18000000 {
> +               compatible = "brcm,bus-axi";
> +               reg = <0x18000000 0x1000>;
> +               ranges = <0x00000000 0x18000000 0x00100000>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +
> +               pcie@12000 {
> +                       reg = <0x00012000 0x1000>;
> +                       interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               ethernet@24000 {
> +                       reg = <0x00024000 0x1000>;
> +                       interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               ethernet@25000 {
> +                       reg = <0x00025000 0x1000>;
> +                       interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +       };
> 

While reading through this new version, I had a new idea about how
this could be handled better for any machines that have a unique
number in the interrupt field: If you do the same thing as PCI
and add an interrupt-map property [1], you can translate that
number into a real interrupt specifier for the child nodes.

This can work even if every device lists the local interrupt
as '0', since you can have device-specific lookup entries if you
use the correct interrupt-map-mask property.

	Arnd

[1] http://www.openfirmware.org/1275/practice/imap/imap0_9d.pdf
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
