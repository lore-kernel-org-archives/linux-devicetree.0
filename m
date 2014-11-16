From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCHv1 3/3] arm: mvebu: add .dts file for Synology DS414
Date: Sun, 16 Nov 2014 14:17:07 +0100
Message-ID: <878ujbb7zg.fsf@natisbad.org>
References: <cover.1416095841.git.arno@natisbad.org>
	<909a6be242eeafa2cb5f096f3f2fc244f1b0880a.1416095841.git.arno@natisbad.org>
	<20141116021521.GD15870@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141116021521.GD15870-g2DYL2Zd6BY@public.gmane.org> (Andrew Lunn's message of "Sun,
	16 Nov 2014 03:15:21 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> writes:

>> +		internal-regs {
>> +
>> +			pinctrl {
>> +				pmx_ge0: pmx-ge0 {
>> +					marvell,pins = "mpp0", "mpp1", "mpp2", "mpp3",
>> +						       "mpp4", "mpp5", "mpp6", "mpp7",
>> +						       "mpp8", "mpp9", "mpp10", "mpp11";
>> +					marvell,function = "ge0";
>> +				};
>> +
>> +				pmx_ge1: pmx-ge1 {
>> +					marvell,pins = "mpp12", "mpp13", "mpp14", "mpp15",
>> +						       "mpp16", "mpp17", "mpp18", "mpp19",
>> +						       "mpp20", "mpp21", "mpp22", "mpp23";
>> +					marvell,function = "ge1";
>> +				};
>> +
>> +				pmx_spi: pmx-spi {
>> +					marvell,pins = "mpp36", "mpp37",
>> +						       "mpp38", "mpp39";
>> +					marvell,function = "spi";
>> +				};
>
> It would be good to move these to armada-xp-mv78230.dtsi. I would
> suggest following the naming convention used by the 370.

Will do.


>> +			spi0: spi@10600 {
>> +				status = "okay";
>> +				pinctrl-0 = <&pmx_spi>;
>> +				pinctrl-names = "default";
>> +
>> +				spi-flash@0 {
>> +					#address-cells = <1>;
>> +					#size-cells = <1>;
>> +					compatible = "micron,n25q064";
>> +					reg = <0>; /* Chip select 0 */
>> +					spi-max-frequency = <20000000>;
>> +
>> +					/*
>> +					 * Warning!
>> +					 *
>> +					 * Synology u-boot uses its compiled-in environment
>> +					 * and it seems Synology did not care to change u-boot
>> +					 * default configuration in order to allow saving a
>> +					 * modified environment at a sensible location. So,
>> +					 * if you do a 'saveenv' under u-boot, your modified
>> +					 * environment be saved will at 1MB after the start
>> +					 * of the flash, i.e. in the middle of the uImage.
>> +					 * For that reason, it is strongly advised not to
>> +					 * change default environment, unless you know what
>> +					 * you are doing.
>> +					 */
>
> Seems to be a cut/paste of the 370 text. So same comments.

Will correct typos.


>> +			i2c@11000 {
>> +				clock-frequency = <400000>;
>> +				status = "okay";
>> +
>> +				s35390a: s35390a@30 {
>> +					 compatible = "ssi,s35390a";
>
> sii
>
> Ah! It is also wrong in kirkwood-synology.dtsi

Good catch anyway ;-)

Cheers,

a+
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
