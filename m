From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1] of/irq: do irq resolution in platform_get_irq_byname()
Date: Mon, 02 Jun 2014 07:48:59 -0700
Message-ID: <7h7g4zz7s4.fsf@paris.lan>
References: <1400582523-22684-1-git-send-email-grygorii.strashko@ti.com>
	<20140523080333.66720C4176E@trevor.secretlab.ca>
	<CAGa+x85mOHtNAj-UHgK2_z8zWAF=qwFcRcUgHTR-byNiX7heHA@mail.gmail.com>
	<CAL_JsqLm3wfVS+au+JUbhBhxz=LuVpepH6GxabCQhPowhbw77g@mail.gmail.com>
	<20140528071855.GJ4227@lee--X1>
	<CACRpkdYgkEOjLamYu5uKSgs3iTNJ-w5XkbeygKjRdR-bNdETfg@mail.gmail.com>
	<CAGb2v64f8Wju6dtVuVN2x=9YVGA-=RXozzhpJZNspKZ05f=jtA@mail.gmail.com>
	<CACxGe6ts-TcSKk2F0-XSxAxeTxVCiyDHgh-O12v+F2OjHUsPyg@mail.gmail.com>
	<5385B566.2050600@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5385B566.2050600-l0cyMroinI0@public.gmane.org> (Grygorii Strashko's message of "Wed,
	28 May 2014 13:07:34 +0300")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org> writes:

> Hi All,
>
> On 05/28/2014 12:03 PM, Grant Likely wrote:

[...]

>> The bisected patch causes platform_get_irq() to always parse the
>> devicetree to obtain the irq instead of using a precalculated value in
>> the platform_device. There are two possible scenarios for this problem
>> that I can think of:
>> 1) Platform_get_irq() is getting called multiple times (which would
>> happen on a deferred probe) but the setup code isn't handling it
>> properly, like trying to request the GPIO more than once
>> 2) the platform_device was preloaded with an irq number that differs
>> from what is determined when parsing the tree. This would happen if a
>> platform_device was created manually.
>>
>
> Could anyone try attached patch? It has to improve situation, but it
> might not fix all problems (see my previous e-mail).

I can confirm it makes the STE Snowball boot again on top of next-20150602.

> From 4a41912dba648c935982274966426fa430fd5aa4 Mon Sep 17 00:00:00 2001
> From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> Date: Wed, 28 May 2014 12:53:34 +0300
> Subject: [PATCH] mfd: ab8500: fix dt irq mapping
>
> The AD8500 defines itself as interrupt-controller in DT,
> but it doesn't assign DT node to IRQ domain when creates it.
> As result, of_irq_xx() helpers don't work because they can't
> find necessary IRQ domain.
>
> Hence, fix it by assigning AD8500 core device DT node to IRQ
> domain when it's created.
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>

Tested-by: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
