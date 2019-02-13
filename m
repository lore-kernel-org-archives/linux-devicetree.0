From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx7: add DMA properties for ECSPI
Date: Tue, 12 Feb 2019 22:57:23 -0200
Message-ID: <CAOMZO5Ctp_p=j1G1DCaPxsyjWTK8dtKR9Ov59XGxYdiqE+1c2g@mail.gmail.com>
References: <20190107132226.16216-1-stefan@agner.ch> <20190107132226.16216-2-stefan@agner.ch>
 <1549573243.3075.72.camel@impinj.com> <20190211012305.GA21496@dragon>
 <1549916056.3075.102.camel@impinj.com> <CAOMZO5BrTLyg7Q51tPcHbN8S2VmA4HAENOVzNhw+Yx7Nniz3Gg@mail.gmail.com>
 <1549923727.3075.103.camel@impinj.com> <CAOMZO5Ccovx2hMU0SmPm9ToZDNXOdLWkoQ8QT7EOhLocL7GAEQ@mail.gmail.com>
 <1550016436.3075.127.camel@impinj.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550016436.3075.127.camel@impinj.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Trent Piepho <tpiepho@impinj.com>
Cc: "linux-imx@nxp.com" <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 12, 2019 at 10:07 PM Trent Piepho <tpiepho@impinj.com> wrote:

> Tried SDMA firmware 4.2.  Still broken.  No apparent change.
>
> Get 4 cycle pause after each byte.
>
> And crash while/after using DMA.  Clearly some sort of memory
> corruption going on.  Fortunately, it's very reliable that using DMA
> almost immediately causes a problem and this is easy to reproduce.  I
> think that indicates it's either clobbers a lot of RAM, or consistently
> manages to hit a very important location for kernel memory allocators.
>
> I've got an idea of where that might be happening that I'm looking
> into.

Ok, thanks for investigating this issue.

>
> I think it's reasonable to add the dma attributes, but put a check in
> the spi-imx driver to disable DMA on imx7d at least.

Something like this?
http://dark-code.bulix.org/urfoh8-580174
