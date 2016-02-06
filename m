From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash Controller driver.
Date: Sat, 6 Feb 2016 08:42:38 +0100
Message-ID: <201602060842.38290.marex@denx.de>
References: <1452486886-8049-1-git-send-email-marex@denx.de> <201602041225.11679.marex@denx.de> <56B38AB3.3070801@ti.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B38AB3.3070801-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "R, Vignesh" <vigneshr-l0cyMroinI0@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday, February 04, 2016 at 06:30:27 PM, R, Vignesh wrote:
> On 2/4/2016 4:55 PM, Marek Vasut wrote:
> > On Thursday, February 04, 2016 at 08:38:47 AM, Vignesh R wrote:
> >> On 02/02/2016 02:43 AM, Marek Vasut wrote:
> >>> On Monday, February 01, 2016 at 10:03:35 PM, Brian Norris wrote:
> >>>> On Wed, Jan 13, 2016 at 03:39:17AM +0100, Marek Vasut wrote:
> >>>>> On Wednesday, January 13, 2016 at 03:26:08 AM, Rob Herring wrote:
> >>>>>> On Mon, Jan 11, 2016 at 05:34:45AM +0100, Marek Vasut wrote:
> >> [...]
> >> 
> >>>>> All these SoCs should be capable of tweaking the block to fit their
> >>>>> needs by just the DT properties. I believe they differ only in the
> >>>>> FIFO depth and sometimes someone is greedy and uses 4:16 CS
> >>>>> multiplexer, which is an external passive component, but that's all.
> >>>>> 
> >>>>> Would we need soc-specific compatible strings if this is the case?
> >>>> 
> >>>> It's nice when most things can be supported with a small set of DT
> >>>> properties, as you've done. But IUIC, I think it's usually good
> >>>> practice to define and use SoC-specific (or maybe SoC family)
> >>>> compatible strings in the docs and DTS files, in addition to the
> >>>> generic one, in case there are future quirks that need to be handled.
> >>>> Note that you don't actually have to use these in the driver yet, but
> >>>> it's good to have a definition.
> >>>> 
> >>>> So you can, today, have:
> >>>> 	foo@xxxx {
> >>>> 	
> >>>> 		compatible = "ti,baz-12345", "cdns,qspi-nor";
> >>>> 		...
> >>>> 	
> >>>> 	};
> >>>> 
> >>>> And we have the option to pick up "ti,baz-12345" in the Linux driver
> >>>> *if needed.*
> >> 
> >> The support for TI SoC that has this IP is not in upstream yet. I will
> >> 
> >> add TI-specific compatible later. It will be:
> >> 	foo@xxxx {
> >> 	
> >> 		compatible = "ti,k2g-qspi", "cdns,qspi-nor";
> >> 		
> >>  		...
> >>  	
> >>  	};
> > 
> > Do you expect any specifics which cannot be handled by the current
> > bindings btw?
> 
> > In my socfpga case, the compatible strings will be probably:
> Yeah, there is delay(of few ns) required between writing to
> INDIRECTWR_START bit and actually writing data to flash(i.e writesl()
> call). This is specific to TI K2G SoC and needs to be tied to the new
> binding.

Can't you somehow poll the hardware to check whether or not it's ready instead
of adding some random delay ?

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
