From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Thu, 4 Jul 2013 10:33:07 +0200
Message-ID: <20130704083307.GH10414@pengutronix.de>
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
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20130703095248.GG13924@flint.arm.linux.org.uk>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Russell King <rmk@arm.linux.org.uk>
Cc: 'Jean-Francois Moine' <moinejf@free.fr>, 'Daniel Drake' <dsd@laptop.org>, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 'Sebastian Hesselbarth' <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 03, 2013 at 10:52:49AM +0100, Russell King wrote:
> > > Sorry but I'd like to say that this cannot be used commonly. Shouldn't you
> > > really consider Linux framebuffer or other subsystems? The above dtsi file
> > > is specific to DRM subsystem. And I think the dtsi file has no any
> > > dependency on certain subsystem so board dtsi file should be considered for
> > > all device drivers based on other subsystems: i.e., Linux framebuffer, DRM,
> > > and so no. So I *strongly* object to it. All we have to do is to keep the
> > > dtsi file as is, and to find other better way that can be used commonly in
> > > DRM.
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

A componentized device never completes and it doesn't have to. A
componentized device can start once there is a path from an input
(crtc, i2s unit) to an output (connector, speaker).

Consider what happens with a supernode approach. Your board provides a
devicetree which has a supernode with hdmi and lvds referenced. Now you
build a kernel with the hdmi driver disabled. You would still expect the
lvds port to be working without having the kernel wait for the supernode
being complete.

Without supernode you can just start once you have everything between
the crtc and lvds nodes. If later a hdmi device joins in then you can
either notify the users (provided the DRM/KMS API supports it) or just
ignore it until the DRM device gets reopened.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
