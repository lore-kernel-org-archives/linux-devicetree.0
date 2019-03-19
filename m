From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3] arm64: dts: fsl: imx8mq: enable the multi sensor TMU
Date: Tue, 19 Mar 2019 13:18:23 -0300
Message-ID: <CAOMZO5CziDOiA+eVdO-pztw_+PAex9neHRwXAdNLFdgYxr1qNQ@mail.gmail.com>
References: <20190311213124.29325-1-angus@akkea.ca> <20190319151009.7603-1-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319151009.7603-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Carlo Caione <ccaione@baylibre.com>, Abel Vesa <abel.vesa@nxp.com>, Baruch Siach <baruch@tkos.co.il>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 19, 2019 at 12:10 PM Angus Ainslie (Purism) <angus@akkea.ca> wrote:
>
> Add the imx8mq TMU (Thermal management unit) nodes for CPU,
> GPU, and VPU.
>
> Changes since v2:
>
> Updated alert and critical temps for commercial parts.
> Fixed node names.
>
> Changes since v1:
>
> Removed references to multi sensor patch.

Please put the change history below the --- line, so that it does not
appear in the commit log text.
