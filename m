From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/5] phy: Add a driver for simple phy
Date: Mon, 18 Apr 2016 16:40:58 +0200
Message-ID: <10235833.eh3J2kCBDh@wuerfel>
References: <1447708924-15076-1-git-send-email-albeu@free.fr> <4848615.OezLJod6Cv@wuerfel> <5714D35B.8000208@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5714D35B.8000208-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 18 April 2016 18:00:19 Kishon Vijay Abraham I wrote:
> Hi Arnd,
> 
> On Sunday 17 April 2016 01:20 AM, Arnd Bergmann wrote:
> > On Thursday 14 April 2016 11:22:58 Kishon Vijay Abraham I wrote:
> >>
> >> IMO simple-phy driver should be an independent driver and shouldn't export
> >> symbols. The dt binding for the simple phy device should be something like
> >> below where all the properties of the simple phy device should be in the
> >> binding documentation.
> >> usbphy {
> >>         compatible = "simple-phy";
> >>         phy-supply = <&supply>;
> >>         clocks = <&clock>;
> >>         reset = <&reset>;
> >> };
> >>
> >> Anything that needs more than this shouldn't be a simple phy.
> > 
> > I think there are two aspects here:
> > 
> > a) I agree that a driver that matches "simple-phy" should only call
> >    the generic functions and not use any other properties.
> > 
> > b) Independent of that, I think that it makes a lot of sense to export
> >    those functions from the generic PHY subsystems so they can be
> >    called from drivers that are a little less generic, or that already
> >    have an established binding but need no other code.
> 
> These export functions can be abused and called directly from the controller
> driver bypassing the phy core.
> 
> Actually lot of generic PHY programming are done in the phy-core itself. (For
> example, the generic PHY regulator binding "phy-supply" can be used for the phy
> core to enable the regulator during power on and disable during power off, phy
> core also invokes pm_runtime API's during power_on and power_off which can be
> used to enable/disable clocks). So drivers which are less generic can just
> populate their specific handling part in their phy ops and leave the rest to be
> done in phy core.
> "simple-phy" should be used to avoid adding new PHY drivers that does simple
> PHY ops.

Having the phy core do everything automatically indeed sounds superior here,
the simple-phy driver can then become a trivial stub without any calls
into the regulator/clk/reset subsystems. If that works (or can be made to
work), that's great.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
