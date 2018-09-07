From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v10 0/2] Initial Allwinner V3s CSI Support
Date: Fri, 7 Sep 2018 15:23:11 +0200
Message-ID: <20180907132311.g7q3zzziiagqecae@flea>
References: <20180517090224.u3ygdzjr77im2mmp@flea>
 <20180529095757.qkz7jyuxza7movbc@flea.home>
 <20180530091934.tbd6xbyr5s3ipn3v@paasikivi.fi.intel.com>
 <CAGb2v67RP8bjObBJu_1JsREUo64hnEzptG_n-aYMn4Dcd_Zo-g@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="76ixmv7qtsguwevu"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBS7XZHOAKGQEBT36PTY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v67RP8bjObBJu_1JsREUo64hnEzptG_n-aYMn4Dcd_Zo-g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Todor Tomov <todor.tomov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media@vge>
List-Id: devicetree@vger.kernel.org


--76ixmv7qtsguwevu
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi Yong,

On Wed, Jun 20, 2018 at 12:45:03PM +0800, Chen-Yu Tsai wrote:
> On Wed, May 30, 2018 at 5:19 PM, Sakari Ailus
> <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> > On Tue, May 29, 2018 at 11:57:57AM +0200, Maxime Ripard wrote:
> >> On Thu, May 17, 2018 at 11:02:24AM +0200, Maxime Ripard wrote:
> >> > On Fri, May 04, 2018 at 02:44:08PM +0800, Yong Deng wrote:
> >> > > This patchset add initial support for Allwinner V3s CSI.
> >> > >
> >> > > Allwinner V3s SoC features two CSI module. CSI0 is used for MIPI CSI-2
> >> > > interface and CSI1 is used for parallel interface. This is not
> >> > > documented in datasheet but by test and guess.
> >> > >
> >> > > This patchset implement a v4l2 framework driver and add a binding
> >> > > documentation for it.
> >> > >
> >> > > Currently, the driver only support the parallel interface. And has been
> >> > > tested with a BT1120 signal which generating from FPGA. The following
> >> > > fetures are not support with this patchset:
> >> > >   - ISP
> >> > >   - MIPI-CSI2
> >> > >   - Master clock for camera sensor
> >> > >   - Power regulator for the front end IC
> >> >
> >> > I tested it on my H3 with a parallel camera, and it still works. Thanks!
> >> >
> >> > Hans, Sakari, any chance this might land in 4.18?
> >>
> >> Ping?
> >
> > I'll try to look into this soonish but it seems to be too late for 4.18.
> > Sorry about that.
> 
> Can we get this into 4.19?

Did you have some time to make the changes Sakari asked for? That
would be great to have it in 4.20.

Thanks!
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--76ixmv7qtsguwevu--
