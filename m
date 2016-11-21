From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v6 0/5] drm: sun8i: Add DE2 HDMI video support
Date: Mon, 21 Nov 2016 19:14:16 +0100
Message-ID: <20161121191416.706b80c25d476fa002a001b1@free.fr>
References: <cover.1479641523.git.moinejf@free.fr>
	<1c9a02ff-ce6c-7ad7-36fa-8a2ea0b7675e@megous.com>
Reply-To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBB7HSZTAQKGQEYXCJISQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1c9a02ff-ce6c-7ad7-36fa-8a2ea0b7675e-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?B?T25kxZllag==?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Cc: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 21 Nov 2016 01:54:53 +0100
Ond=C5=99ej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wrote:

> Dne 20.11.2016 v 12:32 Jean-Francois Moine napsal(a):
> > This patchset series adds HDMI video support to the Allwinner
> > sun8i SoCs which include the display engine 2 (DE2).
> > The driver contains the code for the A83T and H3, but it could be
> > used/extended for other SoCs as the A64, H2 and H5.
>=20
> Hi,
>=20
> I'm trying to test your patches on Orange Pi PC, and I've run into a few
> issues: (I'm using sunxi-ng with the same patches as last time, to make
> it work with your driver)
>=20
> 1] I just get pink output on the monitor - there's some signal, but it's
> pink (or more like magenta).
>=20
> dmesg ouput indicates no error:
>=20
> [    1.887823] [drm] Initialized
> [    1.888503] sun8i-de2 1000000.de-controller: bound
> 1c0c000.lcd-controller (ops 0xc0a63894)
> [    2.057298] sun8i-de2 1000000.de-controller: bound 1ee0000.hdmi (ops
> 0xc0a63b54)
> [    2.057304] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013)=
.
> [    2.057307] [drm] No driver support for vblank timestamp query.
> [    2.690862] Console: switching to colour frame buffer device 240x67
> [    2.723059] sun8i-de2 1000000.de-controller: fb0:  frame buffer device
	[snip]

My H3 boards work correctly, except the Orange PI 2 when it cannot read
the EDID (but it is OK after reboot).

Did you check if the EDID was correctly read?
Which resolution do you expect?

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
