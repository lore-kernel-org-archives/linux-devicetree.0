From: Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Wed, 3 Jul 2013 12:32:24 +0100
Message-ID: <20130703113224.GI13924@flint.arm.linux.org.uk>
References: <20130702191923.GD13924@flint.arm.linux.org.uk>
 <51D330AC.5060903@gmail.com>
 <CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
 <51D348F5.2080205@gmail.com>
 <00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
 <20130703090242.GM516@pengutronix.de> <51D3EA0E.2090008@gmail.com>
 <00ba01ce77d2$80285f10$80791d30$%dae@samsung.com>
 <20130703095338.GH13924@flint.arm.linux.org.uk> <51D40275.4020806@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51D40275.4020806-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: 'Jean-Francois Moine' <moinejf-GANU6spQydw@public.gmane.org>, 'Daniel Drake' <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, 'Sascha Hauer' <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 03, 2013 at 12:52:37PM +0200, Sebastian Hesselbarth wrote:
> But honestly, I see no way around it and it is the only way
> to allow to even have the decision for one or two cards at all.
> There is no way for auto-probing the users intention...

It's not _just_ about the users intention - for get that, because really
it's to do with solving a much bigger question, and that question is:

	How do we know when all the components are present?

In other words, how do we know that we have LCD0 and LCD1 connected to
the DCON, which is connected to a LCD and/or a HDMI tranceiver.  How
do we know that the on-board VGA DACs are wired up and to be used?
How do we know which I2C bus the VGA port is connected to, and whether
to expect an I2C bus?

Let's look at the Cubox setup (sorry, but you _will_ have to use a
fixed-width font for this):

CPU bus
|
+-I2C -------------TDA998X --(HDMI)--> Display
|                    |
|               (RGB888+clock+sync)
+-LCD0 ---------.   /
+--------------DCON ---(VGA)---> not wired
+-LCD1 (unused)-'

DCON can allegedly route the data from LCD0 or LCD1 to the parallel
interface which the TDA998x sits on, and/or the VGA interface.  In
the case of other setups, the TDA998x may be a LCD panel.

The OLPC setup (which seems to be the more common case in terms of the
on-SoC device structure):

CPU bus
|
+-LCD ---(RGB666+clock+sync)----> LCD panel

and I believe an HDMI tranceiver somewhere.

In the above diagrams, "LCD" and "LCD0"/"LCD1" are essentially all the
same basic IP block, so they should use the same driver code.  Moreover,
each named element is a separate platform device.

In the first, to drive that correctly, you need the following before
"loading" the display system:
1. LCD0, and optionally LCD1 and DCON to be found and known to display driver.
2. I2C driver to be probed and available for use.
3. TDA998x to be found and known to display driver.
Only once you have all those components can you allow display to "load".

Now consider the case where the TDA998x is not present but the parallel
interface is connected directly to a LCD panel.  This then becomes:
1. LCD0, and optionally LCD1 and DCON to be found and known to display driver.
2. LCD panel details known to display driver.

If the VGA port is being used, then both of these cases need to be
supplemented with:
N. I2C bus for VGA DDC to be probed and available for use.
N+1. DCON must be known to the display driver.
N+2. LCD1 required if different display modes on the devices are required.

In the OLPC case, it's just:
1. LCD to be found and known to display driver.
2. LCD panel details known to display driver.

What you should be getting from the above is that the platform devices
which are required for any kind of display subsystem driver to initialize
is not really a function of the "software" use case, but how (a) the
board hardware has been designed and put together, and (b) the internal
structure of the SoC.

Moreover, the problem which we're facing is this: how does a display
driver know which platform devices to expect from a DT description to
make the decision that all parts required for the physical wiring of
the board are now present.

Consider this too: what if you have a LCD panel on your RGB888 interface
which is also connected to a HDMI transceiver which can do scaling and
re-syncing (basically format conversion - the TDA998x appears to have
this capability), and you drive it with a mode suitable for HDMI but not
the LCD panel because the driver doesn't know that there's a LCD panel
also connected?  This is why I feel that the hotplug idea is actually
rather unsafe, and if we go down that path we're building in that risk.

(And I think the OLPC guys may be have exactly that kind of setup...)

-- 
Russell King
