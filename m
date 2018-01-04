From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH v4 0/2] Initial Allwinner V3s CSI Support
Date: Thu, 4 Jan 2018 16:27:41 +0100
Message-ID: <20180104152741.m6bsno4vdh65ouw3@core.my.home>
References: <1513935138-35223-1-git-send-email-yong.deng@magewell.com>
 <1513950408.841.81.camel@megous.com>
 <20171225111526.4663f997f5d6bfc6cf157f10@magewell.com>
 <20171225085802.lfyk4blmbqxq6r2m@core.my.home>
 <20180104140625.5gbeaj5vgetusjlf@flea.lan>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDXLF6FR5INBB7EPXHJAKGQER6V4VNI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180104140625.5gbeaj5vgetusjlf-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunx
List-Id: devicetree@vger.kernel.org

On Thu, Jan 04, 2018 at 03:06:25PM +0100, Maxime Ripard wrote:
> On Mon, Dec 25, 2017 at 09:58:02AM +0100, Ond=C5=99ej Jirman wrote:
> > Hello,
> >=20
> > On Mon, Dec 25, 2017 at 11:15:26AM +0800, Yong wrote:
> > > Hi,
> > >=20
> > > On Fri, 22 Dec 2017 14:46:48 +0100
> > > Ond=C5=99ej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wrote:
> > >=20
> > > > Hello,
> > > >=20
> > > > Yong Deng p=C3=AD=C5=A1e v P=C3=A1 22. 12. 2017 v 17:32 +0800:
> > > > >=20
> > > > > Test input 0:
> > > > >=20
> > > > >         Control ioctls:
> > > > >                 test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Sup=
ported)
> > > > >                 test VIDIOC_QUERYCTRL: OK (Not Supported)
> > > > >                 test VIDIOC_G/S_CTRL: OK (Not Supported)
> > > > >                 test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > > > >                 test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not =
Supported)
> > > > >                 test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > > >                 Standard Controls: 0 Private Controls: 0
> > > >=20
> > > > I'm not sure if your driver passes control queries to the subdev. I=
t
> > > > did not originally, and I'm not sure you picked up the change from =
my
> > > > version of the driver. "Not supported" here seems to indicate that =
it
> > > > does not.
> > > >=20
> > > > I'd be interested what's the recommended practice here. It sure hel=
ps
> > > > with some apps that expect to be able to modify various input contr=
ols
> > > > directly on the /dev/video# device. These are then supported out of=
 the
> > > > box.
> > > >=20
> > > > It's a one-line change. See:
> > > >=20
> > > > https://www.kernel.org/doc/html/latest/media/kapi/v4l2-controls.htm=
l#in
> > > > heriting-controls
> > >=20
> > > I think this is a feature and not affect the driver's main function.
> > > I just focused on making the CSI main function to work properly in=20
> > > the initial version. Is this feature mandatory or most commonly used?
> >=20
> > I grepped the platform/ code and it seems, that inheriting controls
> > from subdevs is pretty common for input drivers. (there are varying
> > approaches though, some inherit by hand in the link function, some
> > just register and empty ctrl_handler on the v4l2_dev and leave the
> > rest to the core).
> >=20
> > Practically, I haven't found a common app that would allow me to enter
> > both /dev/video0 and /dev/v4l-subdevX. I'm sure anyone can write one
> > themselves, but it would be better if current controls were available
> > at the /dev/video0 device automatically.
> >=20
> > It's much simpler for the userspace apps than the alternative, which
> > is trying to identify the correct subdev that is currently
> > associated with the CSI driver at runtime, which is not exactly
> > straightforward and requires much more code, than a few lines in
> > the kernel, that are required to inherit controls:
>=20
> And it becomes much more complicated once you have the same controls
> on the v4l2 device and subdevice, which is not that uncommon.

Hi Maxime,

I don't think you understand the issue. In your hypothetical situation, if =
the
CSI device will have any controls in the future, the merging of controls fr=
om
subdev will be done automatically anyway, it's not some optional feature.

Also userspace will not get any more complicated than without my proposed c=
hange
to the driver. It will be at most the same as without the change if any sub=
dev
controls are masked by the CSI device controls.

This CSI driver has no controls anyway. All my change does is create an emp=
ty
handler for future controls of the CSI driver, so that apps can depend on t=
his
merging behavior right now, and not wait until someone adds the first contr=
ol
to the CSI driver.

regards,
  o.j.

>=20
> Maxime
>=20
>=20
>=20
> --=20
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com


--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
