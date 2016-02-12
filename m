From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 00/10] mfd: axp20x: Add support for RSB
 based AXP223
Date: Fri, 12 Feb 2016 09:01:39 +0000
Message-ID: <20160212090139.GO20693@x1>
References: <1455242567-17880-1-git-send-email-wens@csie.org>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBB6N6622QKGQESPKBBRA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455242567-17880-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 12 Feb 2016, Chen-Yu Tsai wrote:

[...]

> Chen-Yu Tsai (10):
>   mfd: axp20x: Add AXP223 to list of supported PMICs in DT bindings
>   mfd: axp20x: Remove second struct device * parameter for
>     axp20x_match_device()
>   mfd: axp20x: use dev->driver->of_match_table in axp20x_match_device()
>   mfd: axp20x: Add missing copyright notice
>   mfd: axp20x: Split the driver into core and i2c bits
>   mfd: axp20x: Whitespace, open parenthesis alignment code style fixes
>   mfd: axp20x: Add support for RSB based AXP223 PMIC
>   regulator: axp20x: Support new AXP223 PMIC
>   ARM: dts: sun8i: sinlinx-sina33: Add AXP223 PMIC device and regulator
>     nodes
>   ARM: dts: sun8i: q8-common: Add AXP223 PMIC device and regulator nodes
>=20
>  Documentation/devicetree/bindings/mfd/axp20x.txt |   7 +-
>  arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts   |  76 +++++++++++++++-
>  arch/arm/boot/dts/sun8i-q8-common.dtsi           |  83 +++++++++++++++++=
-
>  drivers/mfd/Kconfig                              |  25 ++++--
>  drivers/mfd/Makefile                             |   2 +
>  drivers/mfd/axp20x-i2c.c                         | 104 +++++++++++++++++=
+++++
>  drivers/mfd/axp20x-rsb.c                         |  80 +++++++++++++++++
>  drivers/mfd/axp20x.c                             | 105 ++++++-----------=
------
>  drivers/regulator/axp20x-regulator.c             |   3 +
>  include/linux/mfd/axp20x.h                       |  34 +++++++-
>  10 files changed, 425 insertions(+), 94 deletions(-)
>  create mode 100644 drivers/mfd/axp20x-i2c.c
>  create mode 100644 drivers/mfd/axp20x-rsb.c

Right, I've applied the MFD and Regulator patches and sent out the
required pull-request.  You just need to have the arch/arm/ patches
taken care off and you're all set.

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
