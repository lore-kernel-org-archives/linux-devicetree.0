From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ARM: dts: fix imx7d boot spi dma setup error
Date: Tue, 23 Oct 2018 12:13:03 +0200
Message-ID: <20181023101302.ttniiewnouyrufdg@pengutronix.de>
References: <20181023083356.17579-1-xiaoning.wang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181023083356.17579-1-xiaoning.wang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Clark Wang <xiaoning.wang@nxp.com>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Gavin Schenk <g.schenk@eckelmann.de>, Oleksij Rempel <ore@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 23, 2018 at 08:36:17AM +0000, Clark Wang wrote:
> Add dmas and dma-names for ecspi1~4 to fix kernel boot error:
> "spi_imx 30840000.ecspi: dma setup error -19, use pio".

Actually this should not be an error and the message is supposed to say:

	Unable to setup DMA, falling back to PIO

So IMHO this should be downgraded from dev_err to dev_info and reworded.
Maybe even try DMA-setup on devices where it is known to fail and don't
emit a message on -ENODEV at all.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
