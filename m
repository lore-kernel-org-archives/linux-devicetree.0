From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 5/5] ARM: dts: imx50: Fix the numbering of the I2C
 controllers
Date: Fri, 22 Mar 2019 09:46:06 +0800
Message-ID: <20190322014605.GT12513@dragon>
References: <20190319152421.16179-1-j.neuschaefer@gmx.net>
 <20190319152421.16179-6-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190319152421.16179-6-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Alexander Kurz <akurz@blala.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, Jagan Teki <jagan@amarulasolutions.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 19, 2019 at 04:24:20PM +0100, Jonathan Neuschäfer wrote:
> Ensure that the i2c buses are reported to userspace (for example to
> i2cdetect) in the same order as they are numbered in the SoC's
> documentation by adding aliases to the devicetree.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Alexander already sent a patch [1] covering i2c.  But I'm not sure why
i2c3 is missing there.

Shawn

[1] https://www.spinics.net/lists/devicetree/msg278684.html

> ---
>  arch/arm/boot/dts/imx50.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx50.dtsi b/arch/arm/boot/dts/imx50.dtsi
> index e5632ce24ba0..8cab0ab3bd4e 100644
> --- a/arch/arm/boot/dts/imx50.dtsi
> +++ b/arch/arm/boot/dts/imx50.dtsi
> @@ -26,6 +26,9 @@
>  		gpio3 = &gpio4;
>  		gpio4 = &gpio5;
>  		gpio5 = &gpio6;
> +		i2c0 = &i2c1;
> +		i2c1 = &i2c2;
> +		i2c2 = &i2c3;
>  		serial0 = &uart1;
>  		serial1 = &uart2;
>  		serial2 = &uart3;
> --
> 2.20.1
> 
