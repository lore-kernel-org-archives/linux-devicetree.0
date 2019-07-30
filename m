From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 15/22] ARM: dts: apalis-imx6: Add some optional I2C devices
Date: Tue, 30 Jul 2019 17:43:12 -0300
Message-ID: <CAOMZO5BqbUzBi5nR33TOpgnR4CFAwxF34m+oKtRZ6rtMaMVu9g@mail.gmail.com>
References: <20190730144649.19022-1-dev@pschenker.ch> <20190730144649.19022-16-dev@pschenker.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730144649.19022-16-dev@pschenker.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <dev@pschenker.ch>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, Stefan Agner <stefan@agner.ch>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Philippe Schenker <philippe.schenker@toradex.com>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Philippe,

On Tue, Jul 30, 2019 at 11:57 AM Philippe Schenker <dev@pschenker.ch> wrote:

> +&mipi_csi {
> +       ipu_id = <0>;
> +       csi_id = <1>;
> +       v_channel = <0>;
> +       lanes = <2>;

None of these properties are valid upstream.
