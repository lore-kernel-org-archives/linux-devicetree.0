From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V7 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Mon, 17 Aug 2015 19:47:35 -0700
Message-ID: <20150818024735.GA15907@localhost>
References: <1439522892-7524-1-git-send-email-marex@denx.de>
 <1439522892-7524-2-git-send-email-marex@denx.de>
 <201508140532.34935.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201508140532.34935.marex-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Vikas MANOCHA <vikas.manocha-qxv4g6HH51o@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Huang Shijie <shijie.huang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 14, 2015 at 05:32:34AM +0200, Marek Vasut wrote:
> On Friday, August 14, 2015 at 05:28:12 AM, Marek Vasut wrote:
> 
> > +	/* Get flash device data */
> > +	for_each_available_child_of_node(dev->of_node, np) {
...
> --->8---
> 
> > +		/*
> > +		 * Here is a 'nasty hack' from Marek Vasut to pick
> > +		 * up OF properties from flash device subnode.
> > +		 */
> > +		nor->dev->of_node = np;
> > +
> > +		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> > +		if (ret)
> > +			goto probe_failed;
> 
> The only bizzare thing is this stuff above ^ . If I want to pass for example 
> "m25p,fast-read" to the SPI NOR connected to this controller, I have to set

Do we really want to extend m25p80 properties like 'm25p,fast-read' to
all SPI NOR controllers? Are they necessary? It seems that there has
been some attempt to do so, but I'm not sure if that's by good design or
just by accident.

> up the nor->dev->of_node, otherwise the of_node would point to the controller.
> I am positive this is wrong, but I'm not quite sure how to repair this.
> Brian, can you please comment on this one bit ?

The problem is that spi_nor_scan() is assuming that nor->dev represents
a flash device, not a flash controller (to which we might connect
multiple flash). So we need to provide a way for spi_nor_scan() to find
the flash device_node, not the controller device_node. Easy option:

 (a) add a field to struct spi_nor, like I did to nand_chip [1]; e.g.,
     spi_nor::dn.

In doing that, we might then reevaluate what spi_nor::dev is supposed to
mean (and clarify the doc comments in include/linux/mtd/spi-nor.h
accordingly). Currently, it's used to shoe-horn in DT support (badly),
as well as to provide mostly auxiliary info, like naming, debug info
(dev_{dbg,info,err,etc...}()), and simliar. The latter half can actually
be problematic too, since they start to become less useful once you have
more than one flash connected to a single controller. e.g., you'll get
colliding MTD names (via dev_name(nor->dev)) and debug info is suddenly
less obvious (which flash chip is the log message from?).

So, we might want to do something in the long run to avoid the mixing of
layers that looks more like:

 (b) remove 'dev' from struct spi_nor entirely

We can do debug prints and such with spi-nor-specific printk()
formatters (e.g., snor_{info,dbg,err,etc...}()) and stop assuming that
dev_name(nor->dev) is actually a good name for an MTD.

While we're at it... we may also want a larger rework to allow spi-nor.c
to better support a notion of controllers (using the existing platform
device) and flash devices (mostly without the use of struct device, and
mostly using struct spi_nor as-is). You'll notice that controllers that
want to support multiple flash are starting to develop much of the same
initialization boiler-plate code.

Anyway, that's my rambling thoughts for now. I think (a) is pretty
straightforward, correct, and quickly attainable, so you can ignore the
remaining bits in the context of upstreaming this driver.

Brian

[1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=5844feeaa4154d1c46d3462c7a4653d22356d8b4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
