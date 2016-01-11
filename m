From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/6] mfd: max77620: add core driver for MAX77620/MAX20024
Date: Mon, 11 Jan 2016 05:48:35 +0000
Message-ID: <20160111054835.GC3331@x1>
References: <1452177524-23192-3-git-send-email-ldewangan@nvidia.com>
 <201601072308.7XP0yi7D%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201601072308.7XP0yi7D%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, kbuild-all@01.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, Chaitanya Bandi <bandik@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Thu, 07 Jan 2016, kbuild test robot wrote:

> Hi Laxman,
>=20
> [auto build test WARNING on pinctrl/for-next]
> [also build test WARNING on v4.4-rc8 next-20160107]
> [if your patch is applied to the wrong git tree, please drop us a not=
e to help improving the system]
>=20
> url:    https://github.com/0day-ci/linux/commits/Laxman-Dewangan/Add-=
support-for-MAXIM-MAX77620-MAX20024-PMIC/20160107-225450
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-=
pinctrl.git for-next
>=20
>=20
> coccinelle warnings: (new ones prefixed by >>)
>=20
> >> drivers/mfd/max77620.c:900:3-8: No need to set .owner here. The co=
re will do it.

I can't accept this patch until this has been taken care of.

> Please review and possibly fold the followup patch.
>=20
> ---
> 0-DAY kernel test infrastructure                Open Source Technolog=
y Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Cor=
poration

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
