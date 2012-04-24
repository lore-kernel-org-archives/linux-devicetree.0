From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] ARM: imx6q: switch to use pinctrl driver
Date: Tue, 24 Apr 2012 10:56:43 +0200
Message-ID: <CACRpkdbbdkhN-hVF6vP4j6bP-Nsdft5UjjpAVhcKn6KSpEbcuQ@mail.gmail.com>
References: <1334933916-12971-1-git-send-email-b29396@freescale.com>
	<1334933916-12971-3-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1334933916-12971-3-git-send-email-b29396@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <b29396@freescale.com>, Wolfram Sang <w.sang@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Chris Ball <cjb@laptop.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 20, 2012 at 4:58 PM, Dong Aisheng <b29396@freescale.com> wr=
ote:

> From: Dong Aisheng <dong.aisheng@linaro.org>
>
> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
>
> ---
> This is not a formal patch and is only used for test
> since before the pinctrl core handle dummy state is in,
> enable pinctrl in driver will break other platforms.
>
> ChangeLog v1->v2:
> * using updated binding
> ---
> =A0arch/arm/boot/dts/imx6q-arm2.dts =A0 | =A0 =A02 ++
> =A0arch/arm/boot/dts/imx6q.dtsi =A0 =A0 =A0 | =A0 17 ++++++++++++++++=
+
> =A0arch/arm/mach-imx/Kconfig =A0 =A0 =A0 =A0 =A0| =A0 =A02 ++
> =A0drivers/mmc/host/sdhci-esdhc-imx.c | =A0 12 ++++++++++++
> =A04 files changed, 33 insertions(+), 0 deletions(-)

Since this touches the MMC driver I'd like an ACK from the
maintainer, but no maintainer is set for this subdriver, still
it feels like Sascha and/or Wolfram should be involved.

Yours,
Linus Walleij
