From: Jonathan Austin <jonathan.austin-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: new platform for Energy Micro's EFM32 Cortex-M3
 SoCs
Date: Tue, 01 Oct 2013 11:38:16 +0100
Message-ID: <524AA618.20307@arm.com>
References: <1379447884-14025-1-git-send-email-u.kleine-koenig@pengutronix.de> <201309172245.25367.arnd@arndb.de> <20130926094251.GK16106@pengutronix.de> <201309272344.01386.arnd@arndb.de> <20130928191511.GA2548@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130928191511.GA2548-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 28/09/13 20:15, Uwe Kleine-K=C3=B6nig wrote:
> Hi Arnd,
>
> On Fri, Sep 27, 2013 at 11:44:01PM +0200, Arnd Bergmann wrote:
>> On Thursday 26 September 2013, Uwe Kleine-K=C3=B6nig wrote:
[...]
>> * An ARMv7-M kernel cannot run on either ARMv4/v5 nor ARMv6/v7-A, ri=
ght?

> The entry convention is different (ARMv7-M doesn't support the ARM
> instruction set but you need to jump into the kernel in ARM mode for
> v4-v7). Other that that I don't know if there is a problem. Maybe
> Jonathan can say anything here?

There's a more fundamental difference between V7M and other things=20
before it - V7M uses a different exception model (We don't have the ide=
a=20
of SVC, USR, IRQ, FIQ etc, instead it is Thread/Process/Handler modes).

So no, V7M is V7M, I'm afraid.

> Or alternatively if you want an efm32
> devboard, just tell me.

They're cool, I can recommend one ;)

>
>> Do you prevent building such a kernel in Kconfig?
> I'm sure my Kconfig magic isn't waterproof. It took me a few tries to
> expand the multiarch architecture selection to make v7-m selectable a=
t
> all.

There's a patch series I posted in the past for !MMU with Vexpress that=
=20
was a way to have a !MMU without changing the ARCH_MULTIPLATFORM=20
configuration:

http://lists.infradead.org/pipermail/linux-arm-kernel/2013-May/168106.h=
tml

You could take a look at that as an alternative approach, but the other=
=20
series you've sent looks reasonable from a !MMU/Multiplatform point of=20
view, I'm just not sure about the XIP stuff.

Jonny



--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
