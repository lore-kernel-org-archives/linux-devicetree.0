From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 4/4] arm: pxa: add non device-tree timer link to clocksource
Date: Sat, 05 Jul 2014 20:29:40 +0200
Message-ID: <5284586.j08GjTMeo6@wuerfel>
References: <1404558781-9537-1-git-send-email-robert.jarzmik@free.fr> <1404558781-9537-4-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404558781-9537-4-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Saturday 05 July 2014 13:13:01 Robert Jarzmik wrote:
>  EXPORT_SYMBOL(get_clock_tick_rate);
>  
>  /*
> + * For non device-tree builds, keep legacy timer init
> + */
> +extern void pxa_timer_nodt_init(int irq, void __iomem *base,
> +                          unsigned long clock_tick_rate);
> +void pxa_timer_init(void)
> +{
> +       pxa_timer_nodt_init(IRQ_OST0, io_p2v(0x40a00000),
> +                           get_clock_tick_rate());
> +}
> +

I think it would be better to move the extern declaration into 
a new header file, e.g. include/clocksource/pxa.h.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
