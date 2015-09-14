From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/7] ARM: brcmstb: mask GIC IRQs on suspend
Date: Mon, 14 Sep 2015 10:43:53 -0700
Message-ID: <55F70759.2070008@gmail.com>
References: <1434672696-13632-1-git-send-email-computersforpeace@gmail.com> <1434672696-13632-7-git-send-email-computersforpeace@gmail.com> <55F482BC.4050202@gmail.com> <20150914174209.GQ11487@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150914174209.GQ11487-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 14/09/15 10:42, Brian Norris wrote:
> One more thing:
>=20
> On Sat, Sep 12, 2015 at 12:53:32PM -0700, Florian Fainelli wrote:
>> Le 06/18/15 17:11, Brian Norris a =C3=A9crit :
>>> Lazily-masked IRQs can cause system suspend problems (e.g., spuriou=
s
>>> wakeups from WFI), so we need to be sure non-wakeup GIC interrupts =
get
>>> masked, not just disabled, during system suspend.
>>>
>>> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Dropped this patch, no longer needed as of 4.3-rc0 with
>> aec89ef72ba6c94420f599dcb684ed66937cdacf ("irqchip/gic: Enable
>> SKIP_SET_WAKE and MASK_ON_SUSPEND")
>=20
> With this patch dropped, then we really don't need
> arch/arm/mach-bcm/brcmstb.c any more, AFAICT. Unless you have more pl=
ans
> for this file, I can send a patch...

I am in the process of cleaning up the BIU control register setup for
the memory controller write-pairing support to get that submitted, and
that needs to be initialized before SMP, so we will still need an entry
point in the machine code to do that.

Thanks!
--=20
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
