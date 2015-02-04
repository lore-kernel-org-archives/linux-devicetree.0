From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 2/5] ARM: shmobile: r8a7740: Migrate to generic l2c OF initialization
Date: Wed, 04 Feb 2015 19:33:31 +0100
Message-ID: <2328848.sGW6KXzxun@wuerfel>
References: <1423059315-28519-1-git-send-email-geert+renesas@glider.be> <3598552.qKIyokxIlF@wuerfel> <CAMuHMdU-GahSaQj6v2Yhmxsj8gmt1sbwrPfqm=ydMCc=uDcenA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdU-GahSaQj6v2Yhmxsj8gmt1sbwrPfqm=ydMCc=uDcenA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 04 February 2015 18:04:57 Geert Uytterhoeven wrote:
> On Wed, Feb 4, 2015 at 5:36 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Wednesday 04 February 2015 15:43:43 Geert Uytterhoeven wrote:
> >>
> >> Indeed. Note that I only try to preserve the register value before and after
> >> migrating to generic l2c OF initialization. I did read (part of) the pl310
> >> documentation, but it's still not clear to me if we really need
> >> L2C_AUX_CTRL_SHARED_OVERRIDE. Perhaps this was just copied from
> >> somewhere else without much afterthought?
> >
> > Have you checked what the hardware/bootloader actually sets in that bit?
> 
> Yes, it boots with 0x02040000, i.e. L2C_AUX_CTRL_SHARED_OVERRIDE
> (bit 22) is not set.
> 
> After the l2c driver is finished with it, it contains 0x46440001.

I see. I guess someone understand the effect of this flag.
Does it make a difference on the machine you are looking at?

I've read the spec at http://infocenter.arm.com/help/topic/com.arm.doc.ddi0246a/DDI0246A_l2cc_pl310_r0p0_trm.pdf
on the topic but couldn't make sense of it to understand whether a
particular setting might be required for specific hardware or might
be a performance optimization.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
