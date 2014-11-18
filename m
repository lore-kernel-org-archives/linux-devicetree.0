From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCHv3 00/12] arm: mvebu: add Synology DS213j and DS414 .dts files
Date: Tue, 18 Nov 2014 19:30:28 +0100
Message-ID: <87zjbobbuj.fsf@natisbad.org>
References: <cover.1416266432.git.arno@natisbad.org>
	<546B22E1.4020507@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <546B22E1.4020507-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Sebastian Hesselbarth's message of
	"Tue, 18 Nov 2014 11:43:45 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On 11/18/2014 12:26 AM, Arnaud Ebalard wrote:
>> This series adds .dts files for Synology DS213j (armada 370 2-bay NAS) and
>> DS414 (armada XP 4-bay NAS) devices. It is based on comments received on
>> a v0 submission of DS213j .dts file [1] and Andrew's comments on a v1 (
>> for both DS213j and DS414 .dts files) [2] and Andrew/Sebastian' comments
>> on v2 regarding pinctrl improvements [3].
>>
>> Cheers,
>>
>> a+
>>
>> [1]: http://thread.gmane.org/gmane.linux.drivers.devicetree/95401
>> [2]: http://thread.gmane.org/gmane.linux.drivers.devicetree/98830
>> [3]: http://thread.gmane.org/gmane.linux.drivers.devicetree/98892
>>
>> Changes since v2:
>>
>> - Added various patches to improve/refactor Armada 370/XP pinctrl
>>    nodes/properties and use sensible defaults when possible.
>
> Arnaud,
>
> sorry I didn't remember earlier, but there has been a similar patch
> set that already deals with Armada-XP pinctrl and ethernet settings
> [1].
>
> [1]
> https://lkml.kernel.org/g/1411157684-6991-1-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>
> It has already been merged by Jason into mvebu/dt for v3.19, so it
> seems you'll have to rebase your patches on top of it. AFAIKS, you
> can drop pinctrl node consolidation for the SoCs (XP at least) and
> RGMII consolidation. The other changes you did for common 370/XP
> dtsi, UART, and SPI are valuable and you should keep them.

I'll rebase the whole series and send a v4.

> If I find some time, I'll have a closer look at both patch sets.
> Sorry again for not remembering earlier!

no problem.

Cheers,

a+
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
