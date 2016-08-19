From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 1/4] mfd: RK808: Add RK818 support
Date: Fri, 19 Aug 2016 09:33:36 +0100
Message-ID: <20160819083336.GI4254@dell>
References: <1470819907-11237-1-git-send-email-w.egorov@phytec.de>
 <1470819907-11237-2-git-send-email-w.egorov@phytec.de>
 <20160818143440.GG4254@dell>
 <57B6A4D1.20108@phytec.de>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <rtc-linux+bncBDA7X7F2WUEBBB4I3O6QKGQEPYKRJAI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <57B6A4D1.20108-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 19 Aug 2016, Wadim Egorov wrote:
> On 18.08.2016 16:34, Lee Jones wrote:
> > On Wed, 10 Aug 2016, Wadim Egorov wrote:
> >
> >> The RK818 chip is a Power Management IC (PMIC) for multimedia and hand=
held
> >> devices. It contains the following components:
> >>
> >> - Regulators
> >> - RTC
> >> - Clocking
> >> - Battery support
> >>
> >> Both RK808 and RK818 chips are using a similar register map,
> >> so we can reuse the RTC and Clocking functionality.
> >>
> >> Signed-off-by: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
> >> Tested-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> ---
> >> Changes since v6:
> >> - Squashed in the patch
> >>   mfd: RK808: Fetch PMIC variant from chip id register
> >>
> >> ---
> >>  drivers/mfd/Kconfig       |   4 +-
> >>  drivers/mfd/rk808.c       | 226 +++++++++++++++++++++++++++++++++++++=
++-------
> >>  include/linux/mfd/rk808.h | 154 +++++++++++++++++++++++++++++--
> >>  3 files changed, 342 insertions(+), 42 deletions(-)

[...]

> >>  struct rk808_reg_data {
> >>  	int addr;
> >> @@ -57,6 +62,14 @@ static bool rk808_is_volatile_reg(struct device *de=
v, unsigned int reg)
> >>  	return false;
> >>  }
> >> =20
> >> +static const struct regmap_config rk818_regmap_config =3D {
> >> +	.reg_bits =3D 8,
> >> +	.val_bits =3D 8,
> >> +	.max_register =3D RK818_USB_CTRL_REG,
> >> +	.cache_type =3D REGCACHE_RBTREE,
> >> +	.volatile_reg =3D rk808_is_volatile_reg,
> >> +};
> >> +
> >>  static const struct regmap_config rk808_regmap_config =3D {
> >>  	.reg_bits =3D 8,
> >>  	.val_bits =3D 8,
> >> @@ -79,11 +92,21 @@ static const struct mfd_cell rk808s[] =3D {
> >>  	{
> >>  		.name =3D "rk808-rtc",
> >>  		.num_resources =3D ARRAY_SIZE(rtc_resources),
> >> -		.resources =3D &rtc_resources[0],
> >> +		.resources =3D rtc_resources,
> > ?
>=20
> you told me to change this

It's an unrelated change that has nothing to do with this patch, which
is why I am confused.

But it's okay, I'll let it sneak in on this occasion, rather than
asking you to send a separate patch.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--=20
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
---=20
You received this message because you are subscribed to the Google Groups "=
rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
