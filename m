From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 9/9] sunxi_defconfig: add new crypto options
Date: Sat, 7 Sep 2019 07:03:53 +0300
Message-ID: <20190907040353.hrz7gmqgzpfpo4xj@flea>
References: <20190906184551.17858-1-clabbe.montjoie@gmail.com>
 <20190906184551.17858-10-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190906184551.17858-10-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: davem@davemloft.net, herbert@gondor.apana.org.au, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Fri, Sep 06, 2019 at 08:45:51PM +0200, Corentin Labbe wrote:
> This patch adds the new allwinner crypto configs to sunxi_defconfig
>
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> ---
>  arch/arm/configs/sunxi_defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Can you also enable it in arm64's defconfig as a module?

>
> diff --git a/arch/arm/configs/sunxi_defconfig b/arch/arm/configs/sunxi_defconfig
> index df433abfcb02..d0ab8ba7710a 100644
> --- a/arch/arm/configs/sunxi_defconfig
> +++ b/arch/arm/configs/sunxi_defconfig
> @@ -150,4 +150,6 @@ CONFIG_NLS_CODEPAGE_437=y
>  CONFIG_NLS_ISO8859_1=y
>  CONFIG_PRINTK_TIME=y
>  CONFIG_DEBUG_FS=y
> +CONFIG_CRYPTO_DEV_ALLWINNER=y
> +CONFIG_CRYPTO_DEV_SUN8I_CE=y
>  CONFIG_CRYPTO_DEV_SUN4I_SS=y
> --
> 2.21.0
>

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
