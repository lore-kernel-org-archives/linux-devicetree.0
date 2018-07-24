From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v2 00/18] Allwinner R40 HDMI refactoring
Date: Wed, 25 Jul 2018 00:04:49 +0800
Message-ID: <f77bcb551d60e9d5332dad20c1ef1a1e83ddcc5b.camel@aosc.io>
References: <20180710203511.18454-1-jernej.skrabec@siol.net>
	 <20180711083036.7attjq4hm5ay5gmn@flea> <2309112.TTVI9Fv1ar@jernej-laptop>
	 <20180724123741.bbkjgy2uwmzsj45k@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBQE43XNAKGQE2RVQYRI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180724123741.bbkjgy2uwmzsj45k@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Jernej =?gb2312?Q?=810=947krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2018-07-24=E4=BA=8C=E7=9A=84 14:37 +0200=EF=BC=8CMaxime Ripard=E5=
=86=99=E9=81=93=EF=BC=9A
> On Sun, Jul 22, 2018 at 04:43:56PM +0200, Jernej =C5=A0krabec wrote:
> > Hi Maxime,
> >=20
> > Dne sreda, 11. julij 2018 ob 10:30:36 CEST je Maxime Ripard
> > napisal(a):
> > > On Tue, Jul 10, 2018 at 10:34:53PM +0200, Jernej Skrabec wrote:
> > > > This series fixes several issues found in R40 HDMI patch series
> > > > after
> > > > it was applied. Conversation can be found here:
> > > >=20
http://lists.infradead.org/pipermail/linux-arm-kernel/2018-June/586011.htm
> > > > l
> > > >=20
> > > > Patches are based on latest linux-next (next-20180710) and are
> > > > ordered
> > > > in such way that they don't break R40 HDMI at any time. Because
> > > > of that
> > > > I suggest that whole series goes through drm-misc to preserve
> > > > that order.
> > > >=20
> > > > I also tested those patches on H3 to make sure it doesn't break
> > > > other
> > > > platforms. However, it would be nice to test for regressions
> > > > also on
> > > > older SoCs (with DE1).
> > > >=20
> > > > Best regards,
> > > > Jernej
> > >=20
> > > Applied all patches but the patch 10, thanks!
> > > Maxime
> >=20
> > It seems that you forgot to merge some patches:
> >=20
> > [PATCH v2 12/18] drm/sun4i: tcon: Add another way for matching
> > mixers with=20
> > tcon
> > [PATCH v2 13/18] drm/sun4i: tcon: Add support for R40 TCON
> >=20
> > Without them, R40 display pipeline can't work.
> >=20
> > Maybe they are in your spam folder?
>=20
> Thanks for telling me, I'm not quite sure what happened.
>=20
> I've applied them.

BTW without them the board cannot boot because of dead loop in
sun4i_drv_probe().

>=20
> Sorry,
> Maxime
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
