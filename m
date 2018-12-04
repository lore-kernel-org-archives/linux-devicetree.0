Return-Path: <SRS0=jrs2=ON=verge.net.au=horms@kernel.org>
Date: Tue, 4 Dec 2018 06:15:28 -0800
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 00/21] Add support for iWave G20D-Q7 board based on
 RZ/G1N
Message-ID: <20181204141527.34dnmyprqcdgp3r3@verge.net.au>
References: <1543593251-15322-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1543593251-15322-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Nov 30, 2018 at 03:54:11PM +0000, Biju Das wrote:
> This patch series aims to add support for iWave G20D-Q7 board based on RZ/G1N.
> 
> This patch series is tested against renesas-dev
> 
> V1-->V2
>     * r8a7744: Initial SoC device tree: Fixed pfc register size, GIC_CPU_MASK_SIMPLE in gic/timer nodes
>     * r8a7744: Add SMP support: Fixed GIC_CPU_MASK_SIMPLE in gic/timer nodes
>     * r8a7744: Add I2C and IIC support: Dropped i2c aliases, removed generic compatible from iic3.
>     * r8a7744-iwg20m: Enable SDHI0 controller: Fixed subject line
>     * r8a7744: Add RWDT node: Moved rwdt node just before gpio.

Thanks, applied for v4.21.
