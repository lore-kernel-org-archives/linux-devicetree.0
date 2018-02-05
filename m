From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] ARM: dts: imx25-pinfunc: Use consistent naming
 for eSDHC
Date: Mon, 5 Feb 2018 00:08:53 -0600
Message-ID: <20180205060853.ebqs3sqakpxm22uk@rob-hp-laptop>
References: <20180131213544.4508-1-benoit.thebaudeau.dev@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180131213544.4508-1-benoit.thebaudeau.dev@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Beno=EEt_Th=E9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 31, 2018 at 10:35:43PM +0100, Benoît Thébaudeau wrote:
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
> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Benoît Thébaudeau <benoit.thebaudeau.dev@gmail.com>
> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Changes v2 -> v3:
>  - None.
> Changes v1 -> v2:
>  - New patch (suggested by Uwe).
> ---
>  .../boot/dts/imx25-eukrea-mbimxsd25-baseboard.dts  | 12 ++--
>  arch/arm/boot/dts/imx25-pdk.dts                    | 12 ++--
>  arch/arm/boot/dts/imx25-pinfunc.h                  | 72 ++++++++++++++--------
>  3 files changed, 60 insertions(+), 36 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
