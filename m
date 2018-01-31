From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 1/2] ARM: dts: imx25-pinfunc: Use consistent naming for eSDHC
Date: Wed, 31 Jan 2018 20:22:16 -0200
Message-ID: <CAOMZO5C_cV+w_xQg4F2=RqeMEOW8hANB_Td-memf08mPLvtr8g@mail.gmail.com>
References: <20180131213544.4508-1-benoit.thebaudeau.dev@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180131213544.4508-1-benoit.thebaudeau.dev@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 31, 2018 at 7:35 PM, Beno=C3=AEt Th=C3=A9baudeau
<benoit.thebaudeau.dev@gmail.com> wrote:
> This file had several naming inconsistencies for eSDHC:
>  - the instances were named sometimes SDn, sometimes SDHCn, whereas they
>    are named ESDHCn in the reference manual, e.g.:
>      MX25_PAD_SD1_CMD__SD1_CMD
>      MX25_PAD_D15__SDHC1_DAT7
>  - the data ports were named sometimes DATAn, sometimes DATn like in the
>    reference manual, e.g.:
>      MX25_PAD_SD1_DATA0__SD1_DATA0
>      MX25_PAD_D15__SDHC1_DAT7
>  - in one case, the clock port was named DAT_CLK instead of CLK:
>      MX25_PAD_CSI_D7__SDHC2_DAT_CLK
>
> This change:
>  - introduces new definitions using the naming from the reference
>    manual,
>  - keeps definitions using the legacy naming in order not to break
>    compatibility for out-of-tree users (they can be removed later),
>  - updates the in-tree files that were using the legacy naming.
>
> Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Beno=C3=AEt Th=C3=A9baudeau <benoit.thebaudeau.dev@gmail.c=
om>
> Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
