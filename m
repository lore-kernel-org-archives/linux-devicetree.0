From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/8] drm/sun4i: add support for sun8i DE2
 mixers and display engines
Date: Thu, 23 Feb 2017 16:46:28 -0800
Message-ID: <20170224004628.xkjrpmbomomgbd24@lukather>
References: <20170222151854.3280-1-icenowy@aosc.xyz>
 <20170222151854.3280-5-icenowy@aosc.xyz>
 <CACvgo5117BB+o429cH=X0t3xz_5=XZ65YCEdE=ro+895a9e=RA@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gbdh35hmqoiikprm"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB2EEX3CQKGQEGKM66WA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CACvgo5117BB+o429cH=X0t3xz_5=XZ65YCEdE=ro+895a9e=RA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--gbdh35hmqoiikprm
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Emil,

On Thu, Feb 23, 2017 at 05:44:54PM +0000, Emil Velikov wrote:
> On 22 February 2017 at 15:18, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
> > Allwinner have a new "Display Engine 2.0" in there new SoCs, which comes
> > in a new "Display Engine" (mixers instead of old backends and
> > frontends).
> >
> > Add support for the mixer on Allwinner V3s SoC; it's the simplest one.
> >
> > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> > ---
> >  drivers/gpu/drm/sun4i/Kconfig       |   8 +
> >  drivers/gpu/drm/sun4i/Makefile      |   1 +
> >  drivers/gpu/drm/sun4i/sun4i_crtc.c  |   6 +-
> >  drivers/gpu/drm/sun4i/sun4i_drv.c   |  38 +++-
> >  drivers/gpu/drm/sun4i/sun4i_drv.h   |   1 +
> >  drivers/gpu/drm/sun4i/sun4i_layer.c |  92 ++++++--
> >  drivers/gpu/drm/sun4i/sun4i_layer.h |   1 +
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c | 417 ++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/sun4i/sun8i_mixer.h | 133 ++++++++++++
> >  9 files changed, 674 insertions(+), 23 deletions(-)
> Silly question:
> 
> Does this series cover the same functionality/hardware as the separate
> sun8i driver proposed a few months back ?
> The diff stat looks quite different (~1.6k vs ~0.6k), although that
> could be due to reusing the existing sun4i code.

Since those aren't feature equivalent, this is a bit complicated to
answer, but most of the changes introduced by the old driver was
duplication of code that was already existing (Allwinner TCON, TV
Encoder, Designware HDMI, etc).

This patchset superseeds it by using what is already supported without
the duplication. It also has a bit less features (for example the HDMI
support is missing for now), but it's a much better code base to base
our future work on.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--gbdh35hmqoiikprm--
