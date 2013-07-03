From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Wed, 3 Jul 2013 09:33:34 +0200
Message-ID: <20130703073334.GK516@pengutronix.de>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702204255.2044c01b@armhf>
 <20130702191923.GD13924@flint.arm.linux.org.uk>
 <51D330AC.5060903@gmail.com>
 <20130702202548.GE13924@flint.arm.linux.org.uk>
 <20130702215048.GI516@pengutronix.de>
 <CAPM=9ty8W7wEewLpcKjNV-RXzVnReKVrPu_MGN80=Y-xPr-f+w@mail.gmail.com>
 <20130702221445.GF13924@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130702221445.GF13924-f404yB8NqCZvn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 02, 2013 at 11:14:45PM +0100, Russell King wrote:
> On Wed, Jul 03, 2013 at 08:02:05AM +1000, Dave Airlie wrote:
> > Have you also considered how suspend/resume works in such a place,
> > where every driver is independent? The ChromeOS guys have bitched
> > before about the exynos driver which is has lots of sub-drivers, how
> > do you control the s/r ordering in a crazy system like that? I'd
> > prefer a central driver, otherwise there is too many moving parts.
> 
> From earlier in the evolution of Armada DRM, that has also been my
> preferred idea - though probably not quite how people think.
> 
> My idea was to have a separate "driver" assemble all the constituent
> parts, and then register the "armada-drm" platform device providing
> via platform resources and/or platform data all the necessary
> information (maybe not even bothering to decode the OF nodes but just
> provide a collection of nodes for each consituent part.)

This sounds similar to what ASoC does. There a sound device is a
devicenode which only has phandles to the various components which
are still registered by the regular device model.

What I'm currently missing in DRM is a place where I can register the
various components (analog to snd_soc_register_codec /
snd_soc_register_component)  until some upper layer DRM driver collects
the pieces and registers a DRM device (as said, no need for real
hotplug).

If we had this component, there would be no need for i2c encoder helpers
which insist on registering their own i2c devices instead of using the
devices which are found in the devicetree.

> 
> Such a thing could be turned into a generic solution for all the
> multi-part drivers.  If we use Sebastian's idea of using phandles
> (it seems there's a precident for it with the direction v4l2 is
> going to solve a similar problem) then we likely have a standard
> way of describing component-ized display setups in DT.

What the v4l2 guys are currently doing is definitely worth looking
at before we come up with a different approach for DRM. v4l2 has the
same problems, it would be a shame if we come up with a totally
different solution.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
