From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [GIT PULL] MFD: ARM (IMX & R8): Immutable branch for Dialog
 Semiconductor - vendor prefix consolidation
Date: Mon, 1 Sep 2014 21:27:38 +0800
Message-ID: <20140901132736.GG3135@dragon>
References: <201408221446.s7MEkNVF001775@swsrvapps-01.diasemi.com>
 <20140829091359.GF24579@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140829091359.GF24579@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "Opensource [Steve Twiss]" <stwiss.opensource@diasemi.com>, Andrew Lunn <andrew@lunn.ch>, Arnaud Ebalard <arno@natisbad.org>, DEVICE TREE <devicetree@vger.kernel.org>, Florian Vaussard <florian.vaussard@epfl.ch>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Guenter Roeck <linux@roeck-us.net>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jason Cooper <jason@lakedaemon.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jonathan Cameron <jic23@kernel.org>, Kumar Gala <galak@codeaurora.org>, LINUX ARM KERNEL <linux-arm-kernel@lists.infradead.org>, LINUX KERNEL <linux-kernel@vger.kernel.org>, LINUX SH <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Brown <broonie@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Martin Fuzzey <mfuzzey@parkeon.com>, Pawel Moll <pawel.moll@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Fri, Aug 29, 2014 at 10:13:59AM +0100, Lee Jones wrote:
> IMX and R8 sub-arch Maintainers,
>=20
> The following changes since commit 52addcf9d6669fa439387610bc65c92fa0=
980cef:
>=20
>   Linux 3.17-rc2 (2014-08-25 15:36:20 -0700)
>=20
> are available in the git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-m=
fd-arm-v3.18
>=20
> for you to fetch changes up to bd597f47ca4bf7a522a0298a95c7f9b2f0a75b=
9e:
>=20
>   devicetree: Dialog Semiconductor consolidate existing vendor prefix=
es to standardise on 'dlg' (2014-08-29 09:26:29 +0100)
>=20
> ----------------------------------------------------------------
> Immutable branch between MFD and some ARM sub-arch maintainers.

I assume that I need to pull it into my tree only when it turns out
there are merge conflicts, but otherwise it can just go through your
tree, right?

Shawn

> ----------------------------------------------------------------
> Steve Twiss (1):
>       devicetree: Dialog Semiconductor consolidate existing vendor pr=
efixes to standardise on 'dlg'
>=20
>  .../devicetree/bindings/i2c/trivial-devices.txt    |  2 +-
>  .../devicetree/bindings/regulator/da9210.txt       |  4 ++--
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  arch/arm/boot/dts/imx53-smd.dts                    |  2 +-
>  arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi       |  2 +-
>  arch/arm/boot/dts/r8a7790-lager.dts                |  2 +-
>  arch/arm/boot/dts/r8a7791-koelsch.dts              |  2 +-
>  drivers/mfd/da9055-core.c                          | 26 +++++++++++-=
----------
>  8 files changed, 21 insertions(+), 20 deletions(-)
>=20
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
