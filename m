From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: shmobile: koelsch dts: Drop console= bootargs parameter
Date: Thu, 30 Oct 2014 12:03:22 +0100
Message-ID: <CAMuHMdUOX845FFaNkEan9c+fRrsSk4q0gXUeknTn-MK5JAYWGg@mail.gmail.com>
References: <1414592918-25138-1-git-send-email-geert+renesas@glider.be>
	<1414592918-25138-4-git-send-email-geert+renesas@glider.be>
	<42870768.kOpZNjp1qs@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <42870768.kOpZNjp1qs@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 30, 2014 at 11:44 AM, Laurent Pinchart
<laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
> On Wednesday 29 October 2014 15:28:38 Geert Uytterhoeven wrote:
>> Since commit 595c6a4bb77f0096 ("ARM: shmobile: koelsch: Remove legacy C
>> board code"), koelsch is restricted to booting from DT, so
>> chosen/stdout-path is always used, and we can drop the "console="
>> parameter from chosen/bootargs.
>
> I'm curious, how is the baud rate now selected ?

>From an earlier response for kzm9d:

"I forgot emev is the only supported SoC not using sh-sci.
 drivers/tty/serial/sh-sci.c:serial_console_setup() defaults to 115200 baud,
 while serial8250_console_setup() defaults to 9600 baud."

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
