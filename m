From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: STi: Add DT defines for co-processor reset lines
Date: Tue, 12 Jan 2016 14:26:58 +0000
Message-ID: <20160112142658.GI27358@x1>
References: <1445856969-19424-1-git-send-email-lee.jones@linaro.org>
 <20160112133437.GH27358@x1>
 <1452606099.4292.20.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452606099.4292.20.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 12 Jan 2016, Philipp Zabel wrote:

> Hi Lee,
>=20
> Am Dienstag, den 12.01.2016, 13:34 +0000 schrieb Lee Jones:
> > On Mon, 26 Oct 2015, Lee Jones wrote:
> >=20
> > > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > ---
> > >  include/dt-bindings/reset-controller/stih407-resets.h | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/include/dt-bindings/reset-controller/stih407-resets.=
h b/include/dt-bindings/reset-controller/stih407-resets.h
> > > index 02d4328..4ab3a1c 100644
> > > --- a/include/dt-bindings/reset-controller/stih407-resets.h
> > > +++ b/include/dt-bindings/reset-controller/stih407-resets.h
> > > @@ -52,6 +52,10 @@
> > >  #define STIH407_KEYSCAN_SOFTRESET	26
> > >  #define STIH407_USB2_PORT0_SOFTRESET	27
> > >  #define STIH407_USB2_PORT1_SOFTRESET	28
> > > +#define STIH407_ST231_AUD_SOFTRESET	29
> > > +#define STIH407_ST231_DMU_SOFTRESET	30
> > > +#define STIH407_ST231_GP0_SOFTRESET	31
> > > +#define STIH407_ST231_GP1_SOFTRESET	32
> > > =20
> > >  /* Picophy reset defines */
> > >  #define STIH407_PICOPHY0_RESET		0
> >=20
> > Has anyone seen this patch?
>=20
> c9bfec0032fb, sorry I missed 4.4.

What about v4.5?  The merge window has only just opened.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
