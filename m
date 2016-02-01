From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V7 2/8] mfd: max77620: add core driver for
 MAX77620/MAX20024
Date: Mon, 1 Feb 2016 08:25:53 +0000
Message-ID: <20160201082553.GW3368@x1>
References: <201601310157.sKXyINX7%fengguang.wu@intel.com>
 <56ACEEE1.1050800@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56ACEEE1.1050800@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, k.kozlowski@samsung.com, vreddytalla@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Sat, 30 Jan 2016, Laxman Dewangan wrote:

> This depends on patch
> [PATCH V2] mfd: core: add macro for adding mfd cells
>=20
> and due to absence of this patch, it reports the error.

If you have dependencies, why aren't they in this set?

> On Saturday 30 January 2016 10:46 PM, kbuild test robot wrote:
> >Hi Laxman,
> >
> >[auto build test ERROR on pinctrl/for-next]
> >[also build test ERROR on v4.5-rc1 next-20160129]
> >[if your patch is applied to the wrong git tree, please drop us a no=
te to help improving the system]
> >
> >url:    https://github.com/0day-ci/linux/commits/Laxman-Dewangan/Add=
-support-for-MAXIM-MAX77620-MAX20024-PMIC/20160131-005355
> >base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux=
-pinctrl.git for-next
> >config: i386-allmodconfig (attached as .config)
> >reproduce:
> >         # save the attached .config to linux build tree
> >         make ARCH=3Di386
> >
> >All errors (new ones prefixed by >>):
> >
> >>>drivers/mfd/max77620.c:57:2: error: implicit declaration of functi=
on 'DEFINE_MFD_CELL_NAME' [-Werror=3Dimplicit-function-declaration]
> >      DEFINE_MFD_CELL_NAME("max77620-pinctrl"),
> >      ^
> >>>drivers/mfd/max77620.c:57:2: error: initializer element is not con=
stant
> >    drivers/mfd/max77620.c:57:2: note: (near initialization for 'max=
77620_children[0].name')
> >>>drivers/mfd/max77620.c:58:2: error: implicit declaration of functi=
on 'DEFINE_MFD_CELL_NAME_RESOURCE' [-Werror=3Dimplicit-function-declara=
tion]
> >      DEFINE_MFD_CELL_NAME_RESOURCE("max77620-gpio", gpio_resources)=
,
> >      ^
> >    drivers/mfd/max77620.c:58:2: error: initializer element is not c=
onstant
> >    drivers/mfd/max77620.c:58:2: note: (near initialization for 'max=
77620_children[0].id')
> >    drivers/mfd/max77620.c:59:2: error: initializer element is not c=
onstant
> >      DEFINE_MFD_CELL_NAME("max77620-pmic"),
> >      ^
> >    drivers/mfd/max77620.c:59:2: note: (near initialization for 'max=
77620_children[0].usage_count')
> >    drivers/mfd/max77620.c:60:2: error: initializer element is not c=
onstant
> >      DEFINE_MFD_CELL_NAME_RESOURCE("max77620-rtc", rtc_resources),
> >      ^
> >    drivers/mfd/max77620.c:60:2: note: (near initialization for 'max=
77620_children[0].enable')
> >    drivers/mfd/max77620.c:61:2: error: initializer element is not c=
onstant
> >      DEFINE_MFD_CELL_NAME_RESOURCE("max77620-power", power_resource=
s),
> >      ^
> >    drivers/mfd/max77620.c:61:2: note: (near initialization for 'max=
77620_children[0].disable')
> >    drivers/mfd/max77620.c:62:2: error: initializer element is not c=
onstant
> >      DEFINE_MFD_CELL_NAME("max77620-watchdog"),
> >      ^
> >    drivers/mfd/max77620.c:62:2: note: (near initialization for 'max=
77620_children[0].suspend')
> >    drivers/mfd/max77620.c:63:2: error: initializer element is not c=
onstant
> >      DEFINE_MFD_CELL_NAME("max77620-clock"),
> >      ^
> >    drivers/mfd/max77620.c:63:2: note: (near initialization for 'max=
77620_children[0].resume')
> >    drivers/mfd/max77620.c:64:2: error: initializer element is not c=
onstant
> >      DEFINE_MFD_CELL_NAME_RESOURCE("max77620-thermal", thermal_reso=
urces),
> >      ^
> >    drivers/mfd/max77620.c:64:2: note: (near initialization for 'max=
77620_children[0].platform_data')
> >    drivers/mfd/max77620.c:68:2: error: initializer element is not c=
onstant
> >      DEFINE_MFD_CELL_NAME("max20024-pinctrl"),
> >      ^
> >    drivers/mfd/max77620.c:68:2: note: (near initialization for 'max=
20024_children[0].name')
> >    drivers/mfd/max77620.c:69:2: error: initializer element is not c=
onstant
> >      DEFINE_MFD_CELL_NAME_RESOURCE("max20024-gpio", gpio_resources)=
,
> >      ^
> >    drivers/mfd/max77620.c:69:2: note: (near initialization for 'max=
20024_children[0].id')
> >    drivers/mfd/max77620.c:70:2: error: initializer element is not c=
onstant
> >      DEFINE_MFD_CELL_NAME("max20024-pmic"),
> >      ^
> >    drivers/mfd/max77620.c:70:2: note: (near initialization for 'max=
20024_children[0].usage_count')
> >    drivers/mfd/max77620.c:71:2: error: initializer element is not c=
onstant
> >      DEFINE_MFD_CELL_NAME_RESOURCE("max20024-rtc", rtc_resources),
> >      ^
> >    drivers/mfd/max77620.c:71:2: note: (near initialization for 'max=
20024_children[0].enable')
> >    drivers/mfd/max77620.c:72:2: error: initializer element is not c=
onstant
> >      DEFINE_MFD_CELL_NAME_RESOURCE("max20024-power", power_resource=
s),
> >      ^
> >    drivers/mfd/max77620.c:72:2: note: (near initialization for 'max=
20024_children[0].disable')
> >    drivers/mfd/max77620.c:73:2: error: initializer element is not c=
onstant
> >      DEFINE_MFD_CELL_NAME("max20024-watchdog"),
> >      ^
> >    drivers/mfd/max77620.c:73:2: note: (near initialization for 'max=
20024_children[0].suspend')
> >    drivers/mfd/max77620.c:74:2: error: initializer element is not c=
onstant
> >      DEFINE_MFD_CELL_NAME("max20024-clock"),
> >      ^
> >    drivers/mfd/max77620.c:74:2: note: (near initialization for 'max=
20024_children[0].resume')
> >    cc1: some warnings being treated as errors
> >
> >vim +/DEFINE_MFD_CELL_NAME +57 drivers/mfd/max77620.c
> >
> >     51		REGMAP_IRQ_REG(MAX77620_IRQ_LBT_MBATLOW, 1, MAX77620_IRQ_LB=
M_MASK),
> >     52		REGMAP_IRQ_REG(MAX77620_IRQ_LBT_TJALRM1, 1, MAX77620_IRQ_TJ=
ALRM1_MASK),
> >     53		REGMAP_IRQ_REG(MAX77620_IRQ_LBT_TJALRM2, 1, MAX77620_IRQ_TJ=
ALRM2_MASK),
> >     54	};
> >     55=09
> >     56	static struct mfd_cell max77620_children[] =3D {
> >   > 57		DEFINE_MFD_CELL_NAME("max77620-pinctrl"),
> >   > 58		DEFINE_MFD_CELL_NAME_RESOURCE("max77620-gpio", gpio_resourc=
es),
> >     59		DEFINE_MFD_CELL_NAME("max77620-pmic"),
> >     60		DEFINE_MFD_CELL_NAME_RESOURCE("max77620-rtc", rtc_resources=
),
> >     61		DEFINE_MFD_CELL_NAME_RESOURCE("max77620-power", power_resou=
rces),
> >
> >---
> >0-DAY kernel test infrastructure                Open Source Technolo=
gy Center
> >https://lists.01.org/pipermail/kbuild-all                   Intel Co=
rporation
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
