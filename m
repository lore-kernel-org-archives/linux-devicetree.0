From: =?UTF-8?B?Tm9yYWxmIFRyw7hubmVz?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 2/3 v8] mailbox: Enable BCM2835 mailbox support
Date: Fri, 08 May 2015 22:38:09 +0200
Message-ID: <554D1EB1.4070404@tronnes.org>
References: <1430857666-18877-1-git-send-email-eric@anholt.net> <554BA0B7.8040600@tronnes.org> <87mw1grwnn.fsf@eliezer.anholt.net> <2464203.68HkYCAlx7@kongar>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2464203.68HkYCAlx7@kongar>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Den 08.05.2015 10:33, skrev Alexander Stein:
> On Thursday 07 May 2015, 12:54:20 wrote Eric Anholt:
>> Noralf Tr=C3=B8nnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org> writes:
>>
>>> Den 05.05.2015 22:27, skrev Eric Anholt:
>>>> From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>>>>
>>>> This mailbox driver provides a single mailbox channel to write 32-=
bit
>>>> values to the VPU and get a 32-bit response.  The Raspberry Pi
>>>> firmware uses this mailbox channel to implement firmware calls, wh=
ile
>>>> Roku 2 (despite being derived from the same firmware tree) doesn't=
=2E
>>>>
>>>> The driver was originally submitted by Lubomir, based on the
>>>> out-of-tree 2708 mailbox driver.  Eric Anholt fixed it up for
>>>> upstreaming, with the major functional change being that it now ha=
s no
>>>> notion of multiple channels (since that is a firmware-dependent
>>>> concept) and instead the raspberrypi-firmware driver will do that
>>>> bit-twiddling in its own messages.
>>> ...
>>>> +static struct platform_driver bcm2835_mbox_driver =3D {
>>>> +	.driver =3D {
>>>> +		.name =3D "bcm2835-mbox",
>>>> +		.owner =3D THIS_MODULE,
>>>> +		.of_match_table =3D bcm2835_mbox_of_match,
>>>> +	},
>>>> +	.probe		=3D bcm2835_mbox_probe,
>>>> +	.remove		=3D bcm2835_mbox_remove,
>>>> +};
>>>> +module_platform_driver(bcm2835_mbox_driver);
>>> I have tested this driver and the firmware driver booting directly
>>> from the VideoCore bootloader (no uboot).
>>> The mailbox driver loads too late to turn on USB power:
>> Yeah, I have a patch on my branches that returns -EPROBE_DEFER when
>> trying to get a power domain and not finding the provider.  It was
>> rejected by the maintainers in favor of a proposed solution whose
>> description I didn't quite follow.
> Do you have a link for this thread?
>
>>> This silences the warning:
>>> struct raspberrypi_power_domain raspberrypi_power_domain_usb =3D {
>>>       .base =3D {
>>>           .power_on_latency_ns =3D 600000000,
>> Oh, nice.  Thanks!
> Well, Using a timeout for dependencies seems odd to me.

I can only find one place where power_on_latency_ns is set,
arch/arm/mach-imx/gpc.c:
static struct pu_domain imx6q_pu_domain =3D {
     .base =3D {
         .name =3D "PU",
         .power_off =3D imx6q_pm_pu_power_off,
         .power_on =3D imx6q_pm_pu_power_on,
         .power_off_latency_ns =3D 25000,
         .power_on_latency_ns =3D 2000000,
     },
};

power_on_latency_ns is not set by the core, so it defaults to zero.
So in the default case, genpd_power_on() will always issue a warning on
the first power on.

I would say that power_on_latency_ns is a characteristic of the power
domain, like enable_time for regulators.


Noralf.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
