From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH_V3 0/2] mtd: nand: jz4780: Add nand and bch driver
Date: Wed, 1 Apr 2015 10:30:07 +0100
Message-ID: <551BBA9F.1010809@imgtec.com>
References: <1427821181-40843-1-git-send-email-Zubair.Kakakhel@imgtec.com> <20150331172030.GE19571@brian-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150331172030.GE19571@brian-ubuntu>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 31/03/15 18:20, Brian Norris wrote:
> On Tue, Mar 31, 2015 at 05:59:39PM +0100, Zubair Lutfullah Kakakhel wrote:
>> Hi,
> 
> Hi!
> 
> Nit: can you drop the underscore in your 'PATCH_Vx' subjects? It'd make
> my filtering a bit easier. I usually expect 'PATCH v3'. Thanks!

Sure. Will do that for v4 if we get there.

Responses below.

> 
>> Two patches based on 4.0-rc6 that add NAND and BCH controller
>> drivers for the Ingenic JZ4780 SoC.
>>
>> Hope these can make it in time for 4.1.
>>
>> Tested on the MIPS Creator CI20.
>>
>> Core JZ4780 support is still in-flight.
> 
> Sorry, I can't even compile test your patches, since I don't have the
> dependencies. So I can't accept your patches yet, and they most likely
> won't make it to 4.1. Or if you can point me to the right place, perhaps
> we can work something out between the tree(s) that will contain the
> dependencies.
> 
> Note that I'm not worried about the missing MACH_JZ4780 sybmol and your
> core platform support, as much as the missing JZ4780_NEMC support.

I understand. Just trying to spread the load and sending everywhere
via separate subsystems.

NEMC is going via greg-kh. They went through greg's char-misc-testing and
just got applied here.

https://git.kernel.org/cgit/linux/kernel/git/gregkh/char-misc.git/log/?h=char-misc-next

Do you think that can work for compile testing? It is the upstream tree with nemc.

I could point our github ones for the ci20 board.
But it has quite a bit of other code too for jz4780 support.

> 
>> Review and feedback welcome.
>>
>> V2 - > V3
>> Rebase to 4.0-rc6
>> Binding changes and fixes based on feedback by Brian Norris (Thank-you)
> 
> I had a few questions on the driver that you didn't answer, I believe.
> It looks like maybe you silently answered them in this v3 code?
> 

I apologize for the confusion. Rushing cause of 4.0-rc6

Yes. I followed all changes accordingly except one.

>> +static int jz4780_nand_init_chips(struct jz4780_nand *nand, struct device *dev)
>> +{
>> +	struct jz4780_nand_chip *chip;
>> +	const __be32 *prop;
>> +	u64 addr, size;
>> +	int i = 0;
>> +
>> +	/*
>> +	 * Iterate over each bank assigned to this device and request resources.
>> +	 * The bank numbers may not be consecutive, but nand_scan_ident()
>> +	 * expects chip numbers to be, so fill out a consecutive array of chips
>> +	 * which map chip number to actual bank number.
>> +	 */
>> +	while ((prop = of_get_address(dev->of_node, i, &size, NULL))) {
>> +		chip = &nand->chips[i];
>> +		chip->bank = of_read_number(prop, 1);
>> +
>> +		jz47xx_nemc_set_type(nand->dev, chip->bank,
>> +				     JZ47XX_NEMC_BANK_NAND);
>> +
>> +		addr = of_translate_address(dev->of_node, prop);
>> +		if (addr == OF_BAD_ADDR)
>> +			return -EINVAL;
> 
> Is it not possible to use platform_get_resource() here? I'm not real
> sure about the platform and resource APIs vs. of_* APIs here, so I'm not
> sure.

I don't think so.

of_translate_address traverses the DT nodes tree to get the addresses.
platform_get_resource would just give the sub-address.

the DT node in the SoC file for nemc is

		nemc: nemc@13410000 {
			compatible = "ingenic,jz4780-nemc";
			reg = <0x13410000 0x10000>;
			#address-cells = <2>;
			#size-cells = <1>;
			ranges = <1 0 0x1b000000 0x1000000
			          2 0 0x1a000000 0x1000000
			          3 0 0x19000000 0x1000000
			          4 0 0x18000000 0x1000000
			          5 0 0x17000000 0x1000000
			          6 0 0x16000000 0x1000000>;

			clocks = <&cgu JZ4780_CLK_NEMC>;
		};

Then the DT node in the board file is

&nemc {
	/*
	 * Only CLE/ALE are needed for the devices that are connected, rather
	 * than the full address line set.
	 */
	pinctrl-names = "default";
	pinctrl-0 = <&pins_nemc_data &pins_nemc_cle_ale &pins_nemc_frd_fwe>;

	nand: nand@1 {
		compatible = "ingenic,jz4780-nand";
		reg = <1 0 0x1000000>;

		ingenic,nemc-tAS = <10>;
		ingenic,nemc-tAH = <5>;
		ingenic,nemc-tBP = <10>;
		ingenic,nemc-tAW = <15>;
		ingenic,nemc-tSTRV = <100>;

		ingenic,bch-device = <&bch>;
		nand-ecc-step-size = <1024>;
		nand-ecc-strength = <24>;

		rb-gpios = <&gpa 20 GPIO_ACTIVE_LOW>;
		wp-gpios = <&gpf 22 GPIO_ACTIVE_LOW>;

		pinctrl-names = "default";
		pinctrl-0 = <&pins_nemc_cs1>;

		#address-cells = <2>;
		#size-cells = <2>;

		partition@0 {
			label = "u-boot-spl";
			reg = <0x0 0x0 0x0 0x800000>;
		};

		partition@0x800000 {
			label = "u-boot";
			reg = <0x0 0x800000 0x0 0x200000>;
		};

		partition@0xa00000 {
			label = "u-boot-env";
			reg = <0x0 0xa00000 0x0 0x200000>;
		};

		partition@0xc00000 {
			label = "system";
			reg = <0x0 0xc00000 0x1 0xff400000>;
		};
	};

	dm9000@6 {
		compatible = "davicom,dm9000";
		davicom,no-eeprom;

		reg = <6 0x0 1   /* addr */
		       6 0x2 1>; /* data */

		ingenic,nemc-tAS = <15>;
		ingenic,nemc-tAH = <10>;
		ingenic,nemc-tBP = <20>;
		ingenic,nemc-tAW = <50>;
		ingenic,nemc-tSTRV = <100>;

		reset-gpios = <&gpf 12 GPIO_ACTIVE_HIGH>;
		vcc-supply = <&eth0_power>;

		interrupt-parent = <&gpe>;
		interrupts = <19 0x4>;
	};
};

Hope this clears the use of of_translate_address

Regards,
ZubairLK

>> V1 - > V2
>> Fixed module license macros
>> Rebase to 4.0-rc3
>>
>> Thanks,
>> ZubairLK
>>
>> Alex Smith (2):
>>   dt-bindings: binding for jz4780-{nand,bch}
>>   mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs
>>
>>  .../bindings/mtd/ingenic,jz4780-nand.txt           |  57 ++++
>>  drivers/mtd/nand/Kconfig                           |   7 +
>>  drivers/mtd/nand/Makefile                          |   1 +
>>  drivers/mtd/nand/jz4780_bch.c                      | 353 +++++++++++++++++++
>>  drivers/mtd/nand/jz4780_bch.h                      |  42 +++
>>  drivers/mtd/nand/jz4780_nand.c                     | 376 +++++++++++++++++++++
>>  6 files changed, 836 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  create mode 100644 drivers/mtd/nand/jz4780_bch.c
>>  create mode 100644 drivers/mtd/nand/jz4780_bch.h
>>  create mode 100644 drivers/mtd/nand/jz4780_nand.c
>>
> 
> Brian
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
