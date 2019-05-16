Return-Path: <SRS0=/ydb=TQ=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
References: <20190509155834.22838-1-m.felsch@pengutronix.de> <20190509155834.22838-12-m.felsch@pengutronix.de>
In-Reply-To: <20190509155834.22838-12-m.felsch@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 16 May 2019 08:43:40 -0300
Message-ID: <CAOMZO5CqbA6VaGhjgTnmmO=VJw1rUz=oReBqJ3HFHmL78vva2w@mail.gmail.com>
Subject: Re: [PATCH 11/17] ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC
 SPI1 interface
Content-Type: text/plain; charset="UTF-8"
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Stefan.Nickl@kontron.com, Gilles.Buloz@kontron.com, Michael.Brunner@kontron.com, thomas.schaefer@kontron.com, frieder.schrempf@kontron.de, Sascha Hauer <kernel@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, May 9, 2019 at 12:59 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> +/* SPI1 */
> +&ecspi2 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_ecspi2>;
> +       fsl,spi-num-chipselects = <2>;
> +       cs-gpios = <&gpio2 26 0>, <&gpio2 27 0>;

Same comment as in the other patch.
