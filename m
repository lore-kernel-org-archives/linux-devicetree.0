From: Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Wed, 3 Jul 2013 13:04:58 +0100
Message-ID: <20130703120458.GJ13924@flint.arm.linux.org.uk>
References: <51D330AC.5060903@gmail.com>
 <CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
 <51D348F5.2080205@gmail.com>
 <00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
 <20130703090242.GM516@pengutronix.de> <51D3EA0E.2090008@gmail.com>
 <00ba01ce77d2$80285f10$80791d30$%dae@samsung.com>
 <20130703095338.GH13924@flint.arm.linux.org.uk> <51D40275.4020806@gmail.com>
 <00cc01ce77e2$844b3a80$8ce1af80$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <00cc01ce77e2$844b3a80$8ce1af80$%dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: 'Jean-Francois Moine' <moinejf-GANU6spQydw@public.gmane.org>, 'Daniel Drake' <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, 'Sascha Hauer' <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, 'Sebastian Hesselbarth' <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 03, 2013 at 08:43:20PM +0900, Inki Dae wrote:
> In case of fbdev, framebuffer driver would use lcd0 or lcd1 driver, or lcd0
> and lcd1 drivers which are placed in drivers/video/backlight/.

No, that's totally wrong.  Framebuffer drivers are not backlights.
Framebuffer drivers go in drivers/video not drivers/video/backlight.

> And let's assume the following:
> 
> On board A
>      Display controller ------------- lcd 0
> On board B
>      Display controller ------------- lcd 1
> On board C
>      Display controller ------------- lcd 0 and lcd 1
> 
> Without the super node, user could configure Linux kernel through menuconfig
> like below;
> 	board A:  enabling lcd 0, and disabling lcd 1,
> 	board B: disabling lcd 0, and enabling lcd 1,
> 	board C: enabling lcd 0 and lcd 1.

I don't think so.  By using menuconfig, you completely miss the point of
using DT - which is to allow us to have a single kernel image which can
support multiple boards with different configurations, even different
SoCs.

> All we have to do is to configure menuconfig to enable only drivers for
> certain board. Why does fbdev need the super node? Please give me comments
> if there is my missing point.

fbdev needs the supernode _OR_ some way to specify that information which
you're putting into menuconfig, because what's correct for the way one
board is physically wired is not correct for how another board is
physically wired.

With that information in menuconfig, you get a kernel image which can
support board A, or board B, or board C but not a single kernel image
which can support board A and board B and board C by loading that very
same kernel image onto all three boards with just a different DT image.

This is the *whole* point of ARM moving over to DT.

If we wanted to use menuconfig to sort these kinds of board specific
details, we wouldn't be investing so much time and effort into moving
over to DT for ARM.  In fact, we used to use menuconfig to sort out
some of these kinds of details, and we've firmly decided that this is
the wrong approach.

Today, there is a very strong push towards having a single kernel image
which runs on every (modern) ARM board with DT describing not only the
board level hardware but also the internal SoC as well.

-- 
Russell King
