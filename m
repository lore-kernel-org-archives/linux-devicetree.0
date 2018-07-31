Return-Path: <robherring2@gmail.com>
Date: Tue, 31 Jul 2018 15:53:10 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] spi: pl022: Add OF binding to disable DMA usage
Message-ID: <20180731215310.GA24997@rob-hp-laptop>
References: <20180724112753.6020-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180724112753.6020-1-alexander.sverdlin@nokia.com>
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 24, 2018 at 01:27:53PM +0200, Alexander Sverdlin wrote:
> Legacy platform instantiation of PL022 had an ability to configure DMA
> usage on controller level. If PL022 is being instantiated from DT it still
> claims couple of DMA channels capable of DMA_SLAVE unconditionally even if
> there are no DMA channels specified in the DT.

How does that work without specifying the channels in DT? Perhaps the 
driver should stop doing that. We can whitelist any platforms that need 
current behavior if someone complains.

> 
> Depending on the slave devices' configuration this might be waste of DMA
> channels or this might even claim some precious DMA channels if there are
> only few of them in the system.
> 
> Add a new boolean property to disable DMA usage on the controller level:
> 	"pl022,dma-disable"
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  Documentation/devicetree/bindings/spi/spi_pl022.txt | 1 +
>  drivers/spi/spi-pl022.c                             | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
