From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx7: add DMA properties for ECSPI
Date: Mon, 11 Feb 2019 19:34:19 -0200
Message-ID: <CAOMZO5BrTLyg7Q51tPcHbN8S2VmA4HAENOVzNhw+Yx7Nniz3Gg@mail.gmail.com>
References: <20190107132226.16216-1-stefan@agner.ch> <20190107132226.16216-2-stefan@agner.ch>
 <1549573243.3075.72.camel@impinj.com> <20190211012305.GA21496@dragon> <1549916056.3075.102.camel@impinj.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549916056.3075.102.camel@impinj.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Trent Piepho <tpiepho@impinj.com>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Trent,

On Mon, Feb 11, 2019 at 6:44 PM Trent Piepho <tpiepho@impinj.com> wrote:

> I've had more time to test.
>
> Without DMA, I can reload my FPGA hundreds of times and get days of
> uptime using linux-next.
>
> With DMA, loading is unreliable.  The higher the SPI speed, the less
> reliable it is.  Unfortunately, it's hard to duplicate the problem with
> a small amount of data, and with a large amount of data I can't examine
> it in depth enough to determine if the problem is related to SPI bus
> timing or IMX sDMA sending the wrong bytes to the spi controller.
>
> Using DMA with SPI causes kernel panics.  Not always immediately, but
> after using DMA it's a smaller of minutes before something crashes.
> The backtraces are all over the place and don't usually point back into
> SPI.  It does seem like they usually hit something has allocated or is
> allocating DMA memory.

Did you test with an external SDMA firmware or with the ROM SDMA firmware?

Just trying to understand if the SDMA firmware plays a role on this
behavior or not.
