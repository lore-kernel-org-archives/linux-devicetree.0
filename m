From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/9] clk: sunxi: Add prcm mod0 clock driver
Date: Thu, 27 Nov 2014 08:36:29 +0000
Message-ID: <20141127083629.GA4628@x1>
References: <1416749895-25013-1-git-send-email-hdegoede@redhat.com>
 <1416749895-25013-4-git-send-email-hdegoede@redhat.com>
 <20141125165744.GA17789@x1>
 <547589A9.5060802@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBBE6F3ORQKGQE2KXFMUI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <547589A9.5060802-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 26 Nov 2014, Hans de Goede wrote:

> Hi,
>=20
> On 11/25/2014 05:57 PM, Lee Jones wrote:
> >On Sun, 23 Nov 2014, Hans de Goede wrote:
> >
> >>Add a driver for mod0 clocks found in the prcm. Currently there is only
> >>one mod0 clocks in the prcm, the ir clock.
> >>
> >>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>---
> >>  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
> >>  drivers/clk/sunxi/Makefile                        |  2 +-
> >>  drivers/clk/sunxi/clk-sun6i-prcm-mod0.c           | 63 ++++++++++++++=
+++++++++
> >>  drivers/mfd/sun6i-prcm.c                          | 14 +++++
> >>  4 files changed, 79 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/clk/sunxi/clk-sun6i-prcm-mod0.c
> >
> >[...]
> >
> >>diff --git a/drivers/mfd/sun6i-prcm.c b/drivers/mfd/sun6i-prcm.c
> >>index 283ab8d..ff1254f 100644
> >>--- a/drivers/mfd/sun6i-prcm.c
> >>+++ b/drivers/mfd/sun6i-prcm.c
> >>@@ -41,6 +41,14 @@ static const struct resource sun6i_a31_apb0_gates_cl=
k_res[] =3D {
> >>  	},
> >>  };
> >>
> >>+static const struct resource sun6i_a31_ir_clk_res[] =3D {
> >>+	{
> >>+		.start =3D 0x54,
> >>+		.end =3D 0x57,
> >>+		.flags =3D IORESOURCE_MEM,
> >>+	},
> >>+};
> >
> >I'm not overly keen on these magic numbers (and yes, I'm well aware
> >that I SoB'ed the patch which started them off).
> >
> >It's not a show stopper, although I'd prefer if they were fixed with a
> >subsequent patch.
>=20
> These are offsets of the relevant registers inside the prcm register bloc=
k,
> if not done this way, then how should they be done ?

I like these kinds of things to be defined.  No implementation changes
are necessary.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
