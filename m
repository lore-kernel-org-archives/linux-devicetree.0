From: Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Thu, 4 Jul 2013 09:40:52 +0100
Message-ID: <20130704084052.GP13924@flint.arm.linux.org.uk>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702204255.2044c01b@armhf>
 <20130702191923.GD13924@flint.arm.linux.org.uk> <51D330AC.5060903@gmail.com>
 <CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
 <51D348F5.2080205@gmail.com>
 <00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
 <20130703090242.GM516@pengutronix.de>
 <20130703095248.GG13924@flint.arm.linux.org.uk>
 <20130704083307.GH10414@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130704083307.GH10414-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: 'Jean-Francois Moine' <moinejf-GANU6spQydw@public.gmane.org>, 'Daniel Drake' <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Sebastian Hesselbarth' <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 04, 2013 at 10:33:07AM +0200, Sascha Hauer wrote:
> On Wed, Jul 03, 2013 at 10:52:49AM +0100, Russell King wrote:
> > > > Sorry but I'd like to say that this cannot be used commonly. Shouldn't you
> > > > really consider Linux framebuffer or other subsystems? The above dtsi file
> > > > is specific to DRM subsystem. And I think the dtsi file has no any
> > > > dependency on certain subsystem so board dtsi file should be considered for
> > > > all device drivers based on other subsystems: i.e., Linux framebuffer, DRM,
> > > > and so no. So I *strongly* object to it. All we have to do is to keep the
> > > > dtsi file as is, and to find other better way that can be used commonly in
> > > > DRM.
> > > 
> > > +1 for not encoding the projected usecase of the graphics subsystem into
> > > the devicetree. Whether the two LCD controllers shall be used together
> > > or separately should not affect the devicetree. devicetree is about
> > > hardware description, not configuration.
> > 
> > And if we listen to that argument, then this problem is basically
> > impossible to solve sanely.
> > 
> > Are we really saying that we have no acceptable way to represent
> > componentized devices in DT?  If that's true, then DT fails to represent
> > quite a lot of ARM hardware, and frankly we shouldn't be using it.  I
> > can't believe that's true though.
> > 
> > The problem is that even with an ASoC like approach, that doesn't work
> > here because there's no way to know how many "components" to expect.
> > That's what the "supernode" is doing - telling us what components group
> > together to form a device.
> 
> A componentized device never completes and it doesn't have to. A
> componentized device can start once there is a path from an input
> (crtc, i2s unit) to an output (connector, speaker).

Wrong.  Please read the example with the diagrams I gave.  Consider
what happens if you have two display devices connected to a single
output, one which fixes the allowable mode and one which _can_
reformat the selected mode.

If you go down that path, you risk driving the LCD panel with
inappropriate timings which may damage it.

-- 
Russell King
