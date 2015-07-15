From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 11/20] dm: serial: Update binding for PL01x serial UART
Date: Wed, 15 Jul 2015 11:00:59 +0200
Message-ID: <CACRpkdb=t21=qpqar5VXd4mtqTWrq6MvoX1OsVgmWpkyFqhj3w@mail.gmail.com>
References: <1436324032-17931-1-git-send-email-sjg@chromium.org>
	<1436324032-17931-12-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436324032-17931-12-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Masahiro Yamada <yamada.m-NAum8xwdG0+S7A1Ibl2khg@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Albert Aribaud <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Vikas Manocha <vikas.manocha-qxv4g6HH51o@public.gmane.org>, Pavel Herrmann <morpheus.ibis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 8, 2015 at 4:53 AM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:

> This binding differs from that of Linux. Update it and change existing
> users.
>
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

I'm confused by this. Isn't devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org the place to discuss
device tree bindings? This is sent only to the U-Boot list, does this mean
that there will now be *two* ontologies for DT bindings? That sounds like
a recepie for ... something not good.

> +- clock-frequency:
> +          Input clock frequency for UART.

This is the real trick is it not?

Is the real commit blurb for this patch something like:

"we want a simple way to look up the clock frequency for our serial
ports during early boot, and following clocks = <&...> phandles
is too much trouble and might imply having to implement a whole
clock framework in U-Boot so we just see a lot of trouble, instead
provide a default frequency here"

I suggest in that case, instead do this:

- boot-frequency:
    input clock frequency at boot time, to be used by boot loaders
    and other early access.

This would be good for early Linux stuff as well I believe and I
do not think it's very controversial.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
