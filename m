From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 4/7] dma: of: introduce of_dma_is_coherent() helper
Date: Fri, 28 Feb 2014 16:24:56 +0100
Message-ID: <5773663.p5fEFmy536@wuerfel>
References: <1393535872-20915-1-git-send-email-santosh.shilimkar@ti.com> <10040083.PbPEQQPCjl@wuerfel> <CAL_JsqL6-hoD4F7+adPhsOJXeM5f+wpEuBWg_6AWqj3k2v0NEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqL6-hoD4F7+adPhsOJXeM5f+wpEuBWg_6AWqj3k2v0NEw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 28 February 2014 09:14:19 Rob Herring wrote:
> 
> I know Will D was not a fan of this property. Primarily I believe
> because you may need to describe more than just a boolean in more
> complex bus topologies.

I can't think of any example where it's not per-device. Do you
think we can end up with a device that has multiple bus master
ports, only some of which are coherent, or is there a different
concern?

> Effectively, highbank is always coherent. It was only PCI that is
> non-coherent, but I can safely say PCI will never be enabled at this
> point. There are no designs with PCI beyond 1 or 2 validation boards
> (total boards, not designs), and getting PCI to work was quite hacky
> due to only a 1MB window. The other masters are programmable, but only
> the coherent path is used as the non-coherent path actually has some
> issues. I had expected the opposite believing the ACP port would
> actually have issues which is also why I made it configurable.

Ok, I see. I still expect that we will see systems that are only
partially coherent in the future, but it's good to know we don't really
have to deal with backwards-compatibility as long as we can just
hardcode highbank to be always coherent.

I'm especially thankful we don't have to deal with the PCI implementation.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
