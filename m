From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] irqchip: irq-mvebu-odmi: new driver
Date: Mon, 22 Feb 2016 13:16:12 -0600
Message-ID: <CAL_JsqJGoUW0jZKShosF_WskaDOj6aQnG=RbN+BQvTzAYjmB_Q@mail.gmail.com>
References: <1455522162-16425-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160222025353.GD15973@rob-hp-laptop> <20160222091055.524c60a9@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160222091055.524c60a9-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 22, 2016 at 2:10 AM, Thomas Petazzoni
<thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hello,
>
> FWIW, you're replying to the v1 of this patch, while v2 and v3 have
> already been posted, and v3 has already been merged by the irqchip
> maintainers:
>
>   http://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/commit/?id=c27f29bbbf02168c9b1e8ba0fe7a8cb917e5a50f

Well, that's what you get when I'm working offline for a bit. :)

> On Sun, 21 Feb 2016 20:53:53 -0600, Rob Herring wrote:
>
>> > +- compatible              : The value here should contain "marvell,odmi-controller".
>>
>> SoC specific compatible too please.
>
> I can add that in a follow-up patch.

Please do.

>
>> > +- marvell,spi-base     : List of GIC base SPI interrupts, one for each
>> > +                         ODMI frame.
>>
>> Why not "interrupts" property?
>
> This has already been discussed with Arnd in a more recent iteration of
> the patch:
>
>   http://lists.infradead.org/pipermail/linux-arm-kernel/2016-February/409411.html
>   http://lists.infradead.org/pipermail/linux-arm-kernel/2016-February/409415.html
>   http://lists.infradead.org/pipermail/linux-arm-kernel/2016-February/409430.html

Okay, it's fine.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
