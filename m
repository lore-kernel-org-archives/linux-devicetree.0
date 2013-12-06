From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] of: Add simple panel device tree binding
Date: Fri, 6 Dec 2013 15:54:28 +0100
Message-ID: <20131206145428.GG24559@pengutronix.de>
References: <1385145714-3022-1-git-send-email-treding@nvidia.com>
 <2120855.5UlavpPp2J@avalon>
 <20131126085911.GA27752@ulmo.nvidia.com>
 <2124722.FKim1X37Up@avalon>
 <20131206135759.GD30960@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131206135759.GD30960-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 06, 2013 at 02:58:00PM +0100, Thierry Reding wrote:
> On Thu, Dec 05, 2013 at 12:45:17AM +0100, Laurent Pinchart wrote:
> > Hi Thierry,
> > 
> > On Tuesday 26 November 2013 09:59:12 Thierry Reding wrote:
> > > On Tue, Nov 26, 2013 at 02:54:41AM +0100, Laurent Pinchart wrote:
> > > > On Friday 22 November 2013 19:41:54 Thierry Reding wrote:
> > > > > This binding specifies a set of common properties for display panels. It
> > > > > can be used as a basis by bindings for specific panels.
> > > > > 
> > > > > Bindings for three specific panels are provided to show how the simple
> > > > > panel binding can be used.
> > > > > 
> > > > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > > ---
> > > > > This binding has already been discussed earlier. Both Laurent and Tomi
> > > > > seemed to be generally fine with this.
> > > > 
> > > > That's correct, I'm generally fine with your approach, but there's still
> > > > one point I'd like to see addressed.
> > > > 
> > > > As I mentioned previously, I would like to avoid adding zillions of
> > > > compatible properties to the driver, when we could use a single property
> > > > in the DT bindings that would specify the timings instead. This would
> > > > lower the amount of changes made to the simple panel driver, while
> > > > keeping DT simple enough (at least in my opinion).
> > > > 
> > > > Specifying the full timings in every DT source file would be pretty
> > > > verbose and could be error-prone. However, using a single property to
> > > > specify one of the standard display timings, as orinally proposed by Hans
> > > > de Goede (CC'ed) during a chat at the kernel summit would in my opinion be
> > > > a good middle-ground solution.
> > > > 
> > > > Would you consider adding such a property to the simple panel bindings,
> > > > and define a common compatible string ? Each panel should of course list
> > > > its own compatibility string in addition to the common compatible string
> > > > in case the need for extensions arises in the future.
> > > 
> > > My gripe with this is that it duplicates information. By definition a simple
> > > panel supports a limited number of display modes (typically only a single
> > > one), so once you know the compatible value (which needs to be there anyway)
> > > you can derive the mode from it. Adding a property that specifies the
> > > display mode is redundant.
> > 
> > But that could be said of pretty much every device :-) Let's take an example I 
> > came across today. The SPI DT bindings have a maximum clock speed property for 
> > every device. This is usually a property of the hardware, which could have 
> > been stored in the device drivers.
> 
> No it isn't. It's a board-specific property. It depends on all sorts of
> factors such as how long the connections are between SPI master and
> slave as well as what other electrical components happen to be in that
> path.
> 
> > I don't particularly like expressing detailed device information in DT when 
> > the information is static for a given device and easily stored in the drivers. 
> > However, in this case, I believe the overhead of adding one mode property to 
> > DT is worth it, as there are zillion panel models in the wild. Going back to 
> > the SPI analogy, let's consider the m25p80 SPI flash memory driver. It 
> > supports many models, each of them implemented by a large number of 
> > manufacturers. The driver stores information for each model (such as the flash 
> > size), but the maximum SPI clock frequency is specified in DT as we don't want 
> > to have a list of all device models for all manufacturers in the driver 
> > (granted, one of the reasons to specify the max frequency in DT is that it can 
> > also be limited by the board, not only by the chip, but I believe my point 
> > remains valid).
> 
> On the contrary, it completely invalidates your point.
> 
> And in fact m25p80 is another perfect example to prove my point. Having
> display modes encoded within the panel driver and selected depending on
> the compatible string isn't anything other than the m25p_ids table.
> 
> When you want to support a new type of device, you need to add a new
> entry into the m25p_ids table, just like you would add a new display
> mode to the panel driver.
> 
> > > Dave Airlie proposed something else, namely to keep a list of common
> > > modes within the driver and have each device reference that mode
> > > instead. I think that could work similarily well. It still requires the
> > > driver to be touched for each new panel, but the changes will be very
> > > small. They'll be more of the "add a new table entry" sort of change
> > > that we have in drivers like the 8250/16550-compatible serial. Most of
> > > that could probably be wrapped into a macro to make it concise.
> > 
> > That would be better, but not perfect :-) Given the very large number of panel
> > models I would like to have a simple panel driver that doesn't need to be
> > patched for every model. The odd cases can of course be handled in C, but the
> > common case would really benefit from being handled in DT.
> 
> I really don't think the number of panels supported in mainline will be
> overly big.

I for once have hardly seen a display twice in different projects.

> Even if, I will gladly take patches that add them to the
> driver. And it isn't even a lot of work, you really just need to copy
> this stuff from the datasheet. And the larger the number of panels the
> kernel supports, the easier it will get to add new support because you
> may either just be able to reuse the compatible string because somebody
> else already added support for it, or you may be able to reuse an
> existing mode because your panel happens to match that mode.
> 
> > Imagine how annoying it would be to update the USB mass storage driver
> > with the VID:PID of every new USB flash device.
> 
> The electrical interface of USB is well defined and it is further well
> specified what USB mass storage means. In addition, USB has very good
> support for probing capabilities and characteristics. The equivalent for
> panels would be something like EDID. If the panel provided EDID, then of
> course you don't need to specify the mode, neither in DT nor in the
> driver.

What makes EDID useful is that it contains the modes. We don't have to
maintain a database of all monitors available out there in the kernel.
Still EDID data contains a vendor/model string which makes it possible
to add quirks for a specific monitor should we have to.

So I really vote for putting the mode data into dt for the 98% case and
an exact vendor/model for the remaining quirks. This is simple anyway
since we already have a binding for display modelines. Supporting this
in the panel driver is trivial.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
