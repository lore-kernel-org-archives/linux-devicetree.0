From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [RFC] ARM: BCM5301X: add NAND flash chip description
Date: Thu, 28 May 2015 00:04:20 +0200
Message-ID: <55663F64.9070502@hauke-m.de>
References: <1432492349-18517-1-git-send-email-hauke@hauke-m.de> <20150527004144.GC27753@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150527004144.GC27753@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/27/2015 02:41 AM, Brian Norris wrote:
> On Sun, May 24, 2015 at 08:32:29PM +0200, Hauke Mehrtens wrote:
>> This adds the NAND flash chip description for a standard chip found
>> connected to this SoC. This makes use of generic Broadcom NAND driver
>> with the iProc interface.
>>
>> Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
>> ---
>>
>> This would be the patch when we completely change to device tree only 
>> for the nand flash controller.
>>
>>  arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts        |  4 +++
>>  arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts        |  4 +++
>>  arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts  |  4 +++
>>  arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts       |  8 ++---
>>  arch/arm/boot/dts/bcm4708-netgear-r6250.dts        |  4 +++
>>  arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts     |  4 +++
>>  arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts      |  4 +++
>>  arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts        |  4 +++
>>  arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts |  4 +++
>>  arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts  |  4 +++
>>  arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts  |  4 +++
>>  arch/arm/boot/dts/bcm4709-netgear-r8000.dts        |  4 +++
>>  arch/arm/boot/dts/bcm5301x.dtsi                    | 38 +++++++++++++++-------
> 
> I'm curious: what tree are you looking at? I don't see most of these
> board DTS files. Or are they not intended for upstream, and you're just
> using them as examples? (Edit: found them in linux-next. And I see
> you're using unreviewed DT snippets, partly by virtue of not using a
> 'compatible' string for BCMA peripherals.)

This should go through Florian's Broadcom device tree tree and is based
on that. These additional device are in his tree.

> 
>>  13 files changed, 74 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts
>> index 71cff8d..f9e187f 100644
>> --- a/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts
>> +++ b/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts
>> @@ -23,6 +23,10 @@
>>  		reg = <0x00000000 0x08000000>;
>>  	};
>>  
>> +	nand: nand@18028000 {
>> +		status = "ok";
>> +	};
> 
> Are there any chips that don't have NAND enabled? I would expect the
> presence of the NAND controller to be determined at the chip level, not
> the board level. (I alluded to this in my comments to Rafal [1].) So
> maybe migrate this to bcm4708.dtsi or bcm5301x.dtsi, depending on
> whether there are any bcm5301x variants that have NAND disabled. Or
> maybe better: just put the 'status = "ok"' part alongside wherever you
> put the chip-select node, so you both enable the controller and a
> particular chip-select at the same time.

To my knowledge all supported SoCs have a NAND controller, but some are
not using it. There are some device with only serial flash, but I do not
have one with only serial flash. If it is save we can activate it on all
SoCs and boards.

> 
>> +
>>  	leds {
>>  		compatible = "gpio-leds";
>>  
> [...]
>> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
>> index 78aec62..cb86748 100644
>> --- a/arch/arm/boot/dts/bcm5301x.dtsi
>> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
> ...
>> @@ -143,4 +133,30 @@
>>  			#gpio-cells = <2>;
>>  		};
>>  	};
>> +
>> +	nand: nand@18028000 {
>> +		compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1", "brcm,brcmnand";
>> +		reg = <0x18028000 0x600>, <0x1811a408 0x600>, <0x18028f00 0x20>;
>> +		reg-names = "nand", "iproc-idm", "iproc-ext";
>> +		interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +		status = "disabled";
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		brcm,nand-has-wp;
>> +
>> +		nandcs@0 {
>> +			compatible = "brcm,nandcs";
>> +			reg = <0>;
> 
> So every board that uses a BCM5301x chips must use chip-select 0? What
> if the board has NAND wired up on CS1? (I see this all the time on
> BCM7xxx boards.)
> 
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			nand-ecc-strength = <8>;
>> +			nand-ecc-step-size = <512>;
> 
> So, every board using the BCM5301x family must use BCH-8? What happens
> if there are boards that use a less reliable flash that needs, e.g.,
> BCH-16?
> 
> IOW, none of the nandcs@0 node belongs in the top-level chip
> description. This all belongs in the board description. If it really is
> repeated on tons of boards, then maybe you just need a separate
> 'nand-cs0-bch8.dtsi' or something like that.

Ok, I can change it that way. The nand-cs0-bch8.dtsi sonds good.
Currently I do not have a complete overview, but I think at least the
vendor driver only supports Chip select 0 as far as I think and the ecc
values are auto detected and calculated by some strange algorithm I
haven't fully understood.

> 
>> +
>> +			linux,part-probe = "ofpart", "bcm47xxpart";
> 
> ^ NAK to this line. You still haven't documented any semantics for this
> property. And I gave you several comments on your previous patch about
> what would need to change before I'd accept this property.

We should talk about this in the patch adding the binding, I will adapt
this depending on the result of the discussion.

> 
>> +		};
>> +	};
>>  };
> 
> Brian
> 
> [1] http://lists.infradead.org/pipermail/linux-mtd/2015-May/059419.html
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
