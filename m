Return-Path: <SRS0=dsGb=FV=arm.com=kim.phillips@kernel.org>
Date: Tue, 27 Feb 2018 09:49:01 -0600
From: Kim Phillips <kim.phillips@arm.com>
Subject: Re: [PATCH 2/2] hwrng: mxc-rnga - add driver support on boards with
 device tree
Message-Id: <20180227094901.644cff57caadc97f65053d29@arm.com>
In-Reply-To: <20180226183849.11562-3-vz@mleia.com>
References: <20180226183849.11562-1-vz@mleia.com>
	<20180226183849.11562-3-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 26 Feb 2018 20:38:49 +0200
Vladimir Zapolskiy <vz@mleia.com> wrote:

> +#ifdef CONFIG_OF
> +static const struct of_device_id mxc_rnga_of_match[] = {
> +	{ .compatible = "fsl,imx31-rnga", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, mxc_rnga_of_match);
> +#endif
> +
>  static struct platform_driver mxc_rnga_driver = {
>  	.driver = {
> -		   .name = "mxc_rnga",
> -		   },
> +		.name = "mxc_rnga",
> +		.of_match_table = of_match_ptr(mxc_rnga_of_match),

Does this build if CONFIG_OF is not set?

Thanks,

Kim
