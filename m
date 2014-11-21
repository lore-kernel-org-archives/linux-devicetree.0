From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCHv5 04/10] arm: mvebu: move Armada 370/XP pinctrl node definition armada-370-xp.dtsi
Date: Sat, 22 Nov 2014 00:13:27 +0100
Message-ID: <87mw7kb10o.fsf@natisbad.org>
References: <cover.1416598536.git.arno@natisbad.org>
	<2daf170fc0a35852111a3e101df73c789bbbb276.1416598536.git.arno@natisbad.org>
	<20141121201844.GD20238@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141121201844.GD20238-g2DYL2Zd6BY@public.gmane.org> (Andrew Lunn's message of "Fri,
	21 Nov 2014 21:18:44 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> writes:

>> diff --git a/arch/arm/boot/dts/armada-370-xp.dtsi b/arch/arm/boot/dts/armada-370-xp.dtsi
>> index 2be9723bcdf3..8e65abf46fba 100644
>> --- a/arch/arm/boot/dts/armada-370-xp.dtsi
>> +++ b/arch/arm/boot/dts/armada-370-xp.dtsi
>> @@ -103,6 +103,10 @@
>>  			#size-cells = <1>;
>>  			ranges = <0 MBUS_ID(0xf0, 0x01) 0 0x100000>;
>>  
>> +			pinctrl: pin-ctrl@18000 {
>> +				reg = <0x18000 0x38>;
>> +			};
>> +
>>  			rtc@10300 {
>>  				compatible = "marvell,orion-rtc";
>>  				reg = <0x10300 0x20>;
>
> We try to keep entries in these files in numeric address order.
> So this should go after serial@12100

I should have remembered that. I had this comment a long time ago on an
unrelated series.

a+
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
