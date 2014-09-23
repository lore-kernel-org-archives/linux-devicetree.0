From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v4 1/2] bcma: register bcma as device tree driver
Date: Wed, 24 Sep 2014 00:04:18 +0200
Message-ID: <5421EE62.2080701@hauke-m.de>
References: <1411339108-22307-1-git-send-email-hauke@hauke-m.de> <4345256.UGZH9SeRYG@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4345256.UGZH9SeRYG@wuerfel>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/22/2014 09:26 AM, Arnd Bergmann wrote:
> On Monday 22 September 2014 00:38:27 Hauke Mehrtens wrote:
>> +
>> +- reg : iomem address range of chipcommon core
>> +
>> +The cores on the AXI bus are automatically detected by bcma with the
>> +memory ranges they are using and they get registered afterwards.
>> +Automatic detection of the IRQ number is not reliable on
>> +BCM47xx/BCM53xx ARM SoCs. To assign IRQ numbers to the cores, provide
>> +them manually through device tree. The IRQ number and the device tree
>> +child entry will get assigned to the core with the matching reg address.
>> +
>> +Example:
>> +
>> +       axi@18000000 {
>> +               compatible = "brcm,bus-axi";
>> +               reg = <0x18000000 0x1000>;
>> +               ranges = <0x00000000 0x18000000 0x00100000>;
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +
>> +               pcie@12000 {
>> +                       reg = <0x00012000 0x1000>;
>> +                       interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
>> +               };
>> +
>> +               ethernet@24000 {
>> +                       reg = <0x00024000 0x1000>;
>> +                       interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
>> +               };
>> +
>> +               ethernet@25000 {
>> +                       reg = <0x00025000 0x1000>;
>> +                       interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
>> +               };
>> +       };
>>
> 
> While reading through this new version, I had a new idea about how
> this could be handled better for any machines that have a unique
> number in the interrupt field: If you do the same thing as PCI
> and add an interrupt-map property [1], you can translate that
> number into a real interrupt specifier for the child nodes.
> 
> This can work even if every device lists the local interrupt
> as '0', since you can have device-specific lookup entries if you
> use the correct interrupt-map-mask property.
> 
> 	Arnd
> 
> [1] http://www.openfirmware.org/1275/practice/imap/imap0_9d.pdf
> 

I assume this should then look somehow like this:

axi@18000000 {
	compatible = "brcm,bus-axi";
	reg = <0x18000000 0x1000>;
	ranges = <0x00000000 0x18000000 0x00100000>;
	#address-cells = <1>;
	#size-cells = <1>;

	#interrupt-cells = <1>;
	interrupt-map = <
		/* ChipCommon */
		0x00000000 0 &gic  GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH

		/* PCIe Controller 0 */
		0x00012000 0 &gic GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH
		0x00012000 1 &gic GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH
		0x00012000 2 &gic GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH
		0x00012000 3 &gic GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH
		0x00012000 4 &gic GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH
		0x00012000 5 &gic GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH

		/* USB 2.0 Controller */
		0x00021000 0 &gic GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH
		>;
	};

How does the mapping of these interrupts to the devices work?

Do I have to add a device tree entry for every device after all?

Do you have some example code where this is handled in code, I could not
find the code doing this for PCI.

Hauke
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
