Return-Path: <shawnguo@kernel.org>
Date: Tue, 23 Jul 2019 14:32:49 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 0/2] arm64: dts: imx8mq: Add DT node for the Mixel
 MIPI D-PHY
Message-ID: <20190723063248.GD15632@dragon>
References: <cover.1563187253.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1563187253.git.agx@sigxcpu.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Pavel Machek <pavel@ucw.cz>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Carlo Caione <ccaione@baylibre.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 15, 2019 at 12:43:04PM +0200, Guido G�nther wrote:
> Now that the driver is in linux-next as of 20190624 let's have a DT node
> for the i.MX8MQ and enable it on the Librem 5 devkit.
> 
> Changes from v1:
> - Add Acked-by: form Angus, thanks!

You do not need to send a new version for just collecting ack/review
tags.  I did that when applying v1.

Shawn

> 
> Guido G�nther (2):
>   arm64: dts: imx8mq: Add MIPI D-PHY
>   arm64: dts: imx8mq-librem5: Enable MIPI D-PHY
> 
>  .../boot/dts/freescale/imx8mq-librem5-devkit.dts    |  4 ++++
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi           | 13 +++++++++++++
>  2 files changed, 17 insertions(+)
> 
> -- 
> 2.20.1
> 
