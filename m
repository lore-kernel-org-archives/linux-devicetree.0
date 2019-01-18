From: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH 2/4] memory: Kconfig: Drop dependency on MACH_JZ4780 for
 jz4780
Date: Fri, 18 Jan 2019 09:09:38 +0100
Message-ID: <20190118090938.13fe7375@bbrezillon>
References: <20190117224550.18043-1-paul@crapouillou.net>
        <20190117224550.18043-2-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117224550.18043-2-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 17 Jan 2019 19:45:48 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> Depending on MACH_JZ4780 prevent us from creating a generic kernel that
> works on more than one MIPS board. Instead, we just depend on MIPS being
> set.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> ---
>  drivers/memory/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
> index 2d91b00e3591..3d411575fcb6 100644
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -122,7 +122,7 @@ config FSL_IFC
>  config JZ4780_NEMC
>  	bool "Ingenic JZ4780 SoC NEMC driver"
>  	default y
> -	depends on MACH_JZ4780 || COMPILE_TEST
> +	depends on MIPS || COMPILE_TEST
>  	depends on HAS_IOMEM && OF
>  	help
>  	  This driver is for the NAND/External Memory Controller (NEMC) in
