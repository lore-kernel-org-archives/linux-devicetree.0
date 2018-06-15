Return-Path: <SRS0=GtbV=JB=haabendal.dk=esben@kernel.org>
From: Esben Haabendal <esben@haabendal.dk>
Subject: Re: [PATCH 0/4] i2c: imx: Fix and enable DMA support for LS1021A
References: <20180523095623.3347-1-esben.haabendal@gmail.com>
Date: Fri, 15 Jun 2018 10:22:13 +0200
In-Reply-To: <20180523095623.3347-1-esben.haabendal@gmail.com> (Esben
	Haabendal's message of "Wed, 23 May 2018 11:56:19 +0200")
Message-ID: <87602kpih6.fsf@haabendal.dk>
MIME-Version: 1.0
Content-Type: text/plain
To: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Uwe =?utf-8?Q?Kleine-?= =?utf-8?Q?K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Esben Haabendal <esben.haabendal@gmail.com> writes:

> From: Esben Haabendal <eha@deif.com>
>
> This patch series fixes two race conditions and minor issues with tracking
> the stopped state when something goes wrong.
>
> With that in place, DMA support works with NXP LS1021A, so it is enabled in
> the last patch.
>
> Esben Haabendal (4):
>   i2c: imx: Fix reinit_completion() use
>   i2c: imx: Fix race condition in dma read
>   i2c: imx: Simplify stopped state tracking
>   arm: dts: ls1021a: Enable I2C DMA support
>
>  arch/arm/boot/dts/ls1021a.dtsi |  6 ++++++
>  drivers/i2c/busses/i2c-imx.c   | 23 ++++++++++++-----------
>  2 files changed, 18 insertions(+), 11 deletions(-)

Hi

Is it possible that someone could find time to take a look at these
patches?

Best regards,
Esben Haabendal
