From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 2/5] mfd: add bcm590xx pmu driver
Date: Wed, 12 Mar 2014 09:46:21 +0000
Message-ID: <20140312094621.GH5672@lee--X1>
References: <1394580837-8331-1-git-send-email-mporter@linaro.org>
 <1394580837-8331-3-git-send-email-mporter@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1394580837-8331-3-git-send-email-mporter@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matt Porter <mporter@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Christian Daudt <bcm@fixthebug.org>, Devicetree List <devicetree@vger.kernel.org>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> Add a driver for the BCM590xx PMU multi-function devices. The driver
> initially supports regmap initialization and instantiation of the
> voltage regulator device function of the PMU.
>=20
> Signed-off-by: Matt Porter <mporter@linaro.org>
> Reviewed-by: Tim Kryger <tim.kryger@linaro.org>
> Reviewed-by: Markus Mayer <markus.mayer@linaro.org>
> ---
>  drivers/mfd/Kconfig          |  8 ++++
>  drivers/mfd/Makefile         |  1 +
>  drivers/mfd/bcm590xx.c       | 93 ++++++++++++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/bcm590xx.h | 31 +++++++++++++++
>  4 files changed, 133 insertions(+)
>  create mode 100644 drivers/mfd/bcm590xx.c
>  create mode 100644 include/linux/mfd/bcm590xx.h

Ah, you fixed the nit.

Applied this one instead then.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
