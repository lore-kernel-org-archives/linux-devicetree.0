From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH v6 2/2] media: V3s: Add support for
 Allwinner CSI.
Date: Wed, 31 Jan 2018 08:42:12 +0100
Message-ID: <20180131074212.7hvb3nqkt22h2chg@flea.lan>
References: <1516695531-23349-1-git-send-email-yong.deng@magewell.com>
 <201801260759.RyNhDZz4%fengguang.wu@intel.com>
 <20180126094658.aa70ed3f890464f6051e21e4@magewell.com>
 <20180126110041.f89848325b9ecfb07df387ca@magewell.com>
 <20180131030807.GA19945@bart.dudau.co.uk>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x2ob3palwahja4lz"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBX7GYXJQKGQEYHJQE7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180131030807.GA19945-hOhETlTuV5niMG9XS5x8Mg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Liviu Dudau <liviu-I3yL/QOVVjH10XsdtD+oqA@public.gmane.org>
Cc: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree
List-Id: devicetree@vger.kernel.org


--x2ob3palwahja4lz
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi Liviu,

On Wed, Jan 31, 2018 at 03:08:08AM +0000, Liviu Dudau wrote:
> On Fri, Jan 26, 2018 at 11:00:41AM +0800, Yong wrote:
> > Hi Maxime,
> > 
> > On Fri, 26 Jan 2018 09:46:58 +0800
> > Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org> wrote:
> > 
> > > Hi Maxime,
> > > 
> > > Do you have any experience in solving this problem?
> > > It seems the PHYS_OFFSET maybe undeclared when the ARCH is not arm.
> > 
> > Got it.
> > Should I add 'depends on ARM' in Kconfig?
> 
> No, I don't think you should do that, you should fix the code.
> 
> The dma_addr_t addr that you've got is ideally coming from dma_alloc_coherent(),
> in which case the addr is already "suitable" for use by the device (because the
> bus where the device is attached to does all the address translations).

Like we're discussing in that other part of the thread with Thierry
and Arnd, things are slightly more complicated than that :)

In our case, the bus where the device is attached will not do the
address translations, and shouldn't.

> If you apply PHYS_OFFSET forcefully to it you might get unexpected
> results.

Out of curiosity, what would be these unexpected results?

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--x2ob3palwahja4lz--
