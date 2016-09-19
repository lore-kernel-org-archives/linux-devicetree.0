From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 4/7] phy: meson: add USB2 PHY support for Meson8b and GXBB
Date: Mon, 19 Sep 2016 09:37:06 +0200
Message-ID: <19026966.I9xoTaRrZa@wuerfel>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com> <CAFBinCC5fhbtkNdc6MJs7veD+xVGC6Qb-jgX_pwvraP1x2JrhQ@mail.gmail.com> <57DF70AF.4050002@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57DF70AF.4050002-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday, September 19, 2016 10:29:27 AM CEST Kishon Vijay Abraham I wrote:
> On Monday 19 September 2016 01:26 AM, Martin Blumenstingl wrote:
> > On Fri, Sep 16, 2016 at 10:19 AM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:

> >> This way the driver will be probed only once (the reset can be done during
> >> probe). The phy driver should scan the dt node and for every sub-node it
> >> invokes phy_create?
> > I'll recap what we have discussed so far (so you don't have to re-read
> > the whole thread):
> > The reference driver treats both USB PHYs as separate devices (the
> > datasheet has no information about the PHYs though). The only
> > "special" thing is the shared reset line -> together with Philipp
> > Zabel (the reset framework maintainer) we decided to make
> > reset_control_reset work for shared reset lines.
> > 
> > That means we can keep the two PHYs as separate devices inside the
> > .dts, while keeping everything else separate (just like the reference
> > driver)
> > Is this fine for you and Arnd?
> 
> yeah.. I'm fine with that.
> 

Agreed, if we don't need to have a device modeled around both
instance, that's ideal.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
