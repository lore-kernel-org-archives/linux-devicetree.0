From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v2 4/5] dmaengine: mv_xor: Allow selecting mv_xor for
 mvebu only compatible SoC
Date: Tue, 12 Apr 2016 18:35:36 +0000
Message-ID: <20160412183536.GJ27057@io.lakedaemon.net>
References: <1460485158-32122-1-git-send-email-gregory.clement@free-electrons.com>
 <1460485158-32122-5-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460485158-32122-5-git-send-email-gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Romain Perier <romain.perier@free-electrons.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 12, 2016 at 08:19:17PM +0200, Gregory CLEMENT wrote:
> Armada 3700 SoC uses the mv_xor driver but don't select anymore the
> PLAT_ORION symbol. This commit extends the dependency of the mv_xor
> driver to the more modern SoCs only compatible with ARCH_MVEBU, which
> allows using it with the Armada 3700 SoC.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
>  drivers/dma/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index d96d87c56f2e..cdc50c2c172f 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -332,7 +332,7 @@ config MPC512X_DMA
>  
>  config MV_XOR
>  	bool "Marvell XOR engine support"
> -	depends on PLAT_ORION
> +	depends on PLAT_ORION || ARCH_MVEBU

|| COMPILE_TEST ?

thx,

Jason.
