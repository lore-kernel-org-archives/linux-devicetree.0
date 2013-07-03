From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Wed, 3 Jul 2013 13:29:47 +0200
Message-ID: <20130703112947.GO516@pengutronix.de>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702204255.2044c01b@armhf>
 <20130702191923.GD13924@flint.arm.linux.org.uk>
 <51D330AC.5060903@gmail.com>
 <CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
 <51D348F5.2080205@gmail.com>
 <00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
 <20130703090242.GM516@pengutronix.de>
 <20130703095248.GG13924@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130703095248.GG13924-f404yB8NqCZvn6HldHNs0ANdhmdF6hFW@public.gmane.org>
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
Cc: 'Jean-Francois Moine' <moinejf-GANU6spQydw@public.gmane.org>, 'Daniel Drake' <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Sebastian Hesselbarth' <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 03, 2013 at 10:52:49AM +0100, Russell King wrote:
> On Wed, Jul 03, 2013 at 11:02:42AM +0200, Sascha Hauer wrote:
> > 
> > +1 for not encoding the projected usecase of the graphics subsystem into
> > the devicetree. Whether the two LCD controllers shall be used together
> > or separately should not affect the devicetree. devicetree is about
> > hardware description, not configuration.
> 
> And if we listen to that argument, then this problem is basically
> impossible to solve sanely.
> 
> Are we really saying that we have no acceptable way to represent
> componentized devices in DT?  If that's true, then DT fails to represent
> quite a lot of ARM hardware, and frankly we shouldn't be using it.  I
> can't believe that's true though.
> 
> The problem is that even with an ASoC like approach, that doesn't work
> here because there's no way to know how many "components" to expect.
> That's what the "supernode" is doing - telling us what components group
> together to form a device.
> 
> Moreover, if you pay attention to my proposal, what you will realise is
> that it isn't DRM specific - it's totally subsystem agnostic.  All it's
> doing is collecting a set of other devices together and only then
> publishing a device representing the full set of sub-devices.
> 
> Now think about that: what is DRM specific about that solution?  What
> is the DRM specific about "collecting a set of devices together and
> publishing a new device" ?
> 
> How is this not "describing the hardware"?  If I attach a HDMI transceiver
> to the DCON which is then connected to LCD0, is it not "describing the
> hardware" to put into DT that LCD0, DCON, and the HDMI transceiver are
> all connected together and therefore are required?  One of the points of
> DT after all is that it can and should be used to represent the
> relationship between devices.
> 
> No - using the tree approach doesn't work, because LCD0, LCD1 and DCON
> are all on the same physical bus, but are themselves connected together.
> If you like, there are multiple heirarchies here - there's the bus
> heirarchy, and then there's the device heirarchy.  Both of these
> heirarchies need to be represented in DT, otherwise you're not describing
> the hardware properly.

And I think with these multiple hierarchies there is some confusion in
this thread.

The devicetree is structured by the bus hierarchy and we shouldn't
change that. The bus hierarchy doesn't necessarily match the device
hierarchy though.

The supernode has to describe the device hierarchy instead. If it does
so by referencing the physical devices by using phandles I'm
perfectly fine with this approach. If this even leads to subsystem
agnostic code which can be used to compose v4l2, ASoC or DRM devices
I'd really love it.

The only thing we shouldn't do is to describe a whole virtual device
directly under a single node in the devicetree as this breaks when bus
hierarchy and device hierarchy differ.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
