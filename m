From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCHv0 0/2] arm: mvebu: fixes for previous DS213j/DS414 series
Date: Wed, 26 Nov 2014 19:10:28 +0100
Message-ID: <87vbm1bzor.fsf@natisbad.org>
References: <cover.1416670812.git.arno@natisbad.org>
	<20141126041251.GL22670@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141126041251.GL22670-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org> (Jason Cooper's
	message of "Tue, 25 Nov 2014 23:12:51 -0500")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> writes:

>>   arm: mvebu: fix wrongly named DS414 pinctrl entries
>>   arm: mvebu: normalize pinctrl entries for Armada SoCs
>> 
>>  arch/arm/boot/dts/armada-xp-axpwifiap.dts       | 12 ++++++------
>>  arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts |  4 ++--
>>  arch/arm/boot/dts/armada-xp-synology-ds414.dts  | 10 +++++-----
>>  arch/arm/boot/dts/armada-xp.dtsi                |  6 +++---
>>  4 files changed, 16 insertions(+), 16 deletions(-)
>
> Thanks for taking care of this.  Applied to mvebu/dt

I was the one screwing the series in the first place. So that was the
least I could do. Next time you see sth no kosher in one of my series,
do not hesitate to ask for a vN+1.

Cheers,

a+
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
