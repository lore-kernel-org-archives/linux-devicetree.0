From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v4] ARM: dts: imx6qdl-nitrogen6x: Add SPI NOR partitions
Date: Tue, 28 Nov 2017 16:14:23 -0200
Message-ID: <CAOMZO5CHYXpL-J3tTo_gNwmth7h_2aY-JJnia7tx6gbH==ff_w@mail.gmail.com>
References: <20171128174924.5149-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171128174924.5149-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Gary Bisson <gary.bisson@boundarydevices.com>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 28, 2017 at 3:49 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> This adds the partitions definition for the SPI NOR to provide
> backward compatibility with the documented[1] layout used with
> Boundary Devices BSP.
>
> 1. https://boundarydevices.com/boot-flash-access-linux/
>
> It exports to Linux:
>
>  mtd0: bootloader
>  mtd1: env
>  mtd2: splash
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
