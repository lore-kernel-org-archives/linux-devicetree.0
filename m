From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: Re: [PATCH v2 00/18] Allwinner R40 HDMI refactoring
Date: Wed, 11 Jul 2018 11:34:58 +0200
Message-ID: <5673885.I9ZBC4zXdg@jernej-laptop>
References: <20180710203511.18454-1-jernej.skrabec@siol.net> <2406320.TaIT7vHipu@jernej-laptop> <20180711093016.bcnsnogbj26azoo7@flea>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBRM6S7NAKGQEZDNNPFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180711093016.bcnsnogbj26azoo7@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne sreda, 11. julij 2018 ob 11:30:16 CEST je Maxime Ripard napisal(a):
> On Wed, Jul 11, 2018 at 10:41:54AM +0200, Jernej =C5=A0krabec wrote:
> > Dne sreda, 11. julij 2018 ob 10:30:36 CEST je Maxime Ripard napisal(a):
> > > On Tue, Jul 10, 2018 at 10:34:53PM +0200, Jernej Skrabec wrote:
> > > > This series fixes several issues found in R40 HDMI patch series aft=
er
> > > > it was applied. Conversation can be found here:
> > > > http://lists.infradead.org/pipermail/linux-arm-kernel/2018-June/586=
011
> > > > .htm
> > > > l
> > > >=20
> > > > Patches are based on latest linux-next (next-20180710) and are orde=
red
> > > > in such way that they don't break R40 HDMI at any time. Because of
> > > > that
> > > > I suggest that whole series goes through drm-misc to preserve that
> > > > order.
> > > >=20
> > > > I also tested those patches on H3 to make sure it doesn't break oth=
er
> > > > platforms. However, it would be nice to test for regressions also o=
n
> > > > older SoCs (with DE1).
> > > >=20
> > > > Best regards,
> > > > Jernej
> > >=20
> > > Applied all patches but the patch 10, thanks!
> > > Maxime
> >=20
> > Ok, I'll send patch 10 separately. However,  patch 4 needs a fix accord=
ing
> > to test build robot:
> >=20
> > if (IS_ERR_VALUE(index))
> > should be:
> > if (index < 0)
>=20
> Yeah, sorry, I forgot to say it, but I fixed it locally (and the
> return below as well).
>=20
> > Additionally, due to Arnds patch merged (drm/sun4i: fix build failure w=
ith
> > CONFIG_DRM_SUN8I_MIXER=3Dm), sun4i_tcon.c needs additional handling if
> > TCON_TOP driver is not build.
>=20
> I'll drop it then, I haven't pushed it yet.

Which one? This series or patch from Arnd?

Best regards,
Jernej



--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
