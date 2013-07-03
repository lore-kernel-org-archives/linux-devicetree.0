From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: Best practice device tree design for display subsystems/DRM
Date: Wed, 03 Jul 2013 20:43:20 +0900
Message-ID: <00cc01ce77e2$844b3a80$8ce1af80$%dae@samsung.com>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702204255.2044c01b@armhf>
 <20130702191923.GD13924@flint.arm.linux.org.uk> <51D330AC.5060903@gmail.com>
 <CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
 <51D348F5.2080205@gmail.com> <00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
 <20130703090242.GM516@pengutronix.de> <51D3EA0E.2090008@gmail.com>
 <00ba01ce77d2$80285f10$80791d30$%dae@samsung.com>
 <20130703095338.GH13924@flint.arm.linux.org.uk> <51D40275.4020806@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <51D40275.4020806-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-language: ko
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
To: 'Sebastian Hesselbarth' <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Russell King' <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, 'Jean-Francois Moine' <moinejf-GANU6spQydw@public.gmane.org>, 'Sascha Hauer' <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, 'Daniel Drake' <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Sebastian Hesselbarth [mailto:sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> Sent: Wednesday, July 03, 2013 7:53 PM
> To: Russell King
> Cc: Inki Dae; 'Sascha Hauer'; 'Daniel Drake'; 'Jean-Francois Moine';
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Subject: Re: Best practice device tree design for display subsystems/DRM
> 
> On 07/03/13 11:53, Russell King wrote:
> > On Wed, Jul 03, 2013 at 06:48:41PM +0900, Inki Dae wrote:
> >> That's not whether we can write device driver or not. dtsi is common
> spot in
> >> other subsystems. Do you think the cardX node is meaningful to other
> >> subsystems?
> >
> > Yes, because fbdev could also use it to solve the same problem which
> we're
> > having with DRM.
> 
> Inki,
> 
> I do not understand why you keep referring to the SoC dtsi. Im my
> example, I said that it is made up and joined from both SoC dtsi and
> board dts.
> 
> So, of course, lcd controller nodes and dcon are part of dove.dtsi
> because they are physically available on every Dove SoC.
> 
> Also, the connection from lcd0 to the external HDMI encoder node
> is in the board dts because you can happily build a Dove SoC board
> with a different HDMI encoder or with no encoder at all.
> 
> The video-card super node is not in any way specific to DRM and

In case of fbdev, framebuffer driver would use lcd0 or lcd1 driver, or lcd0
and lcd1 drivers which are placed in drivers/video/backlight/.

And let's assume the following:

On board A
     Display controller ------------- lcd 0
On board B
     Display controller ------------- lcd 1
On board C
     Display controller ------------- lcd 0 and lcd 1

Without the super node, user could configure Linux kernel through menuconfig
like below;
	board A:  enabling lcd 0, and disabling lcd 1,
	board B: disabling lcd 0, and enabling lcd 1,
	board C: enabling lcd 0 and lcd 1.

All we have to do is to configure menuconfig to enable only drivers for
certain board. Why does fbdev need the super node? Please give me comments
if there is my missing point.

Thanks,
Inki Dae

> describes a virtual graphics card comprising both SoC and board
> components (on a per-board basis). You can have both DRM or fbdev
> use that virtual video card node to register your subsystem drivers
> required to provide video output.
> 
> I agree to what Sascha said, the decision to put one or two
> virtual graphics card in the device tree depending on the use
> case is sketchy. You can have one card/two card on the same
> board, so at this point device tree is not describing HW but
> use case.
> 
> But honestly, I see no way around it and it is the only way
> to allow to even have the decision for one or two cards at all.
> There is no way for auto-probing the users intention...
> 
> Sebastian
