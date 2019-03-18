From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] arm64: dts: fsl: imx8mq: enable the multi sensor TMU
Date: Mon, 18 Mar 2019 13:52:21 -0300
Message-ID: <CAOMZO5CEc88UM+cBd6pv2=xc7mVdyuNawWMX02iGvMXS+BZcbA@mail.gmail.com>
References: <20190311213124.29325-1-angus@akkea.ca> <20190318160448.28964-1-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190318160448.28964-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Carlo Caione <ccaione@baylibre.com>, Abel Vesa <abel.vesa@nxp.com>, Baruch Siach <baruch@tkos.co.il>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 18, 2019 at 1:05 PM Angus Ainslie (Purism) <angus@akkea.ca> wrote:
>
> Add the imx8mq TMU (Thermal mannagement unit) nodes for CPU,
> GPU, and VPU.
>
> This patch requires that the multi sensor patch is already applied
>
> https://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal.git/patch/?id=7797ff424818c975b59c35880dbc90fe08350204

Please remove the reference to this commit. It is already present in 5.1-rc1.
