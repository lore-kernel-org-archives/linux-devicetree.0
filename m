From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 00/15] musb: Add support for the Allwinner sunxi musb controller
Date: Mon, 09 Mar 2015 22:44:58 +0100
Message-ID: <2227491.z0aBeXi5ZG@wuerfel>
References: <1425933628-9672-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425933628-9672-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 09 March 2015 21:40:13 Hans de Goede wrote:
> Hi All,
> 
> This patch set has been a while in the making, so I'm very happy to present
> the end result here, and I hope everyone likes it.

Awesome work!

> Before talking about merging this there are 2 things which I would like to
> point out:
> 
> a) The musb controller in the sunxi SoCs uses some SRAM which needs to be
> mapped to the musb controller by poking some bits in the SRAM controller,
> just like the EMAC patches which were send a while back I've chosen to use
> syscon for this, actually 2 of the patches in this set come directly from the
> SRAM mapping patchset for the EMAC.
> 
> I know that Maxime is not 100% in favor of using syscon:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/320221.html
> 
> But I disagree with his arguments for writing a special driver for the SRAM
> controller:
> 1) syscon was specifically designed for global system control registers like
> this and is fine to use as long as there are no conflicts where 1 bit is of
> interest to multiple drivers, and there is no such conflict here
> 2) Maxime's other arguments seem to boil down to it would be nice / prettier
> to have a specific driver for this, without really proving a hard need for
> such a driver. But writing such a driver is going to be a lot of work, and
> we've a ton of other work to do, and as said there is no real need for a
> separate driver, syscon works fine for this.
> 3) I actually believe that having a specific driver for this is a bad idea,
> because that means inventing a whole new cross driver API for this, and
> getting those right is, hard, a lot of work, and even then one is still likely
> to get it wrong. We can avoid all this by going with the proven syscon solution.
> 
> Maxime, can we please have your ack for moving forward with this using syscon?
> (see above for my arguments why)

I'd like to understand here why we can't use the existing SRAM DT binding
instead of the syscon binding.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
