From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mtd: part: add generic parsing of linux,part-probe
Date: Wed, 20 May 2015 00:07:26 +0200
Message-ID: <CACna6ryBiOsuSGTwJ9_v-=JK5y_v_mZ5xhsV2kQSXCT8PXxWNw@mail.gmail.com>
References: <1431884112-28236-1-git-send-email-hauke@hauke-m.de>
	<20150518224910.GU11598@ld-irv-0074>
	<CAOiHx=k9SuwEYZ10P8kmHF25P2O2r6+9gaBTSQ6kXFxfDnzL=w@mail.gmail.com>
	<555BB252.9080200@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555BB252.9080200-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 19 May 2015 at 23:59, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org> wrote:
>> So my first Idea would be having something like this:
>>
>> mtdevice@foo {
>>         ...
>>         bootloader: partition@0 {
>>                 reg =3D <0 0x10000>;
>>                 device_type =3D "flash-partition";
>>                 read-only;
>>         };
>>
>>         firmware: partition@10000 {
>>                 reg =3D <0x1000 0x7e0000>;
>>                 device_type =3D "flash-partition";
>>                 compatible =3D "brcm,trx";
>>         };
>>
>>         calibration: partition@7f0000 {
>>                 reg =3D < >;
>>                 device_type =3D "flash-partition";
>>                 read-only;
>>         };
>> };
>>
>> Then the ofpart parsing could be integrated into the core, and
>> partition parsers get run according to their compatibles on the
>> individual partitions.
>>
>> Of course this also might be total overengineering and completely th=
e
>> wrong place for devicetree as it's essentially configuration data, b=
ut
>> since the now described partitions are now more or less "static", IM=
HO
>> this would be a-okay.
>
> This sounds like the problem Rafa=C5=82 wanted to solve in his patch =
"mtd:
> add support for typed parsers splitting partitions"
>
> This would also solve my problem and would make the bcm47xx part pars=
er
> a lot simpler and more secure for targets using device tree.
> I still think we should add a alternative for the people that do not
> want to rewrite their partition parser. Specifying the list of availa=
ble
> partition parser in the flash driver is a bad idea because it is the
> wrong place.

This is what I hoped for all the time. To get both patches accepted
(linux,part-probe & typed parsers). That would give us a really nice
way to handle partitioning on every device.


> I am in favor of both concepts, because there is already one driver
> reading the partition parser list from device tree and it is implemen=
ted
> pretty easy. Jonas Approach sounds nice because it really solves two
> more problems.
> Jonas approach would work on bcm47xx and bcm53xx targets, because the=
re
> the header is located after the boot loader and does not contain all
> partitions. This could also be used to divide the partition containin=
g
> the kernel and the read only root fs in OpenWrt. Are there any more
> users which could use this extended approach?

I got a bit lost with above. The patch adding typed parsers I sent
will allow us to write both: TRX parser (splitter) and SquashFS parser
(splitter). This is all we need in OpenWrt and I my patch is highly
based on OpenWrt version obviously too.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
