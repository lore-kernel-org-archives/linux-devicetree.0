From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 5/8] ARM: l2x0: add marvell,ecc-enable property for
 aurora
Date: Tue, 30 Oct 2018 14:31:37 -0500
Message-ID: <20181030193137.GA28258@bogus>
References: <20181029072535.31667-1-chris.packham@alliedtelesis.co.nz>
 <20181029072535.31667-6-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181029072535.31667-6-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux@armlinux.org.uk, u.kleine-koenig@pengutronix.de, jlu@pengutronix.de, bp@alien8.de, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 29 Oct 2018 20:25:32 +1300, Chris Packham wrote:
> The aurora cache on the Marvell Armada-XP SoC supports ECC protection
> for the L2 data arrays. Add a "marvell,ecc-enable" device tree property
> which can be used to enable this.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> [jlu@pengutronix.de: use aurora specific define AURORA_ACR_ECC_EN]
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/l2c2x0.txt | 2 ++
>  arch/arm/mm/cache-l2x0.c                         | 7 +++++++
>  2 files changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
