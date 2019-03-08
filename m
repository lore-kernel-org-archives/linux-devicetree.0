From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v6 4/4] arm64: dts: imx8mq-evk: Enable audio codec wm8952
Date: Fri, 8 Mar 2019 09:06:37 -0300
Message-ID: <CAOMZO5CXyV9PEbyW7Z0yxsTOk94Qu=PqQC4ijiUXOAPDR2nvgA@mail.gmail.com>
References: <20190308120141.3698-1-daniel.baluta@nxp.com> <20190308120141.3698-5-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190308120141.3698-5-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, "angus@akkea.ca" <angus@akkea.ca>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Aisheng
List-Id: devicetree@vger.kernel.org

On Fri, Mar 8, 2019 at 9:02 AM Daniel Baluta <daniel.baluta@nxp.com> wrote:
>
> The main Audio DAC used on the EVK board is wm8952.
> The EVK provides the MCLK to wm8952.
>
> Digital interface is SAI2 which includes three signals:
> SYNC_CLK, BCLK and DACDAT.
>
> This patch sets:
>         * SAI2 pinctrl configuration
>         * clock hierarchy
>         * wm8960 codec
>
> Then uses simple-card machine driver to connect them
> into a sound card.
>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
