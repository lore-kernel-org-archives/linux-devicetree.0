From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v3 03/18] dmaengine: dma-jz4780: Avoid hardcoding number
 of channels
Date: Tue, 24 Jul 2018 18:52:59 +0530
Message-ID: <20180724132259.GF3661@vkoul-mobl>
References: <20180721110643.19624-1-paul@crapouillou.net>
 <20180721110643.19624-4-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180721110643.19624-4-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 21-07-18, 13:06, Paul Cercueil wrote:

> +static const struct jz4780_dma_soc_data jz4780_dma_soc_data[] = {
> +	[ID_JZ4780] = { .nb_channels = 32, },

why the array of structs?

> +};
> +
> +static const struct of_device_id jz4780_dma_dt_match[] = {
> +	{ .compatible = "ingenic,jz4780-dma", .data = (void *)ID_JZ4780 },

the data should be jz4780_dma_soc_data? as you would add more data
later.. and not the enum..

> -	jzdma = devm_kzalloc(dev, sizeof(*jzdma), GFP_KERNEL);
> +	version = (enum jz_version)of_id->data;
> +	soc_data = &jz4780_dma_soc_data[version];

this can be simplified if we do:

        soc_data = device_get_match_data(pdev);

with:

static const struct jz4780_dma_soc_data jz4780_dma_soc_data = {
        .nb_channels = 32,
};

and
        { .compatible = "ingenic,jz4780-dma", .data = (void *)jz4780_dma_soc_data },

You add more parameters in future patches and store soc_data in driver
object and use as is..

> +	jzdma = devm_kzalloc(dev, sizeof(*jzdma)
> +				+ sizeof(*jzdma->chan) * soc_data->nb_channels,
> +				GFP_KERNEL);
>  	if (!jzdma)
>  		return -ENOMEM;
>  
> +	jzdma->soc_data = soc_data;
> +	jzdma->version = version;

why do you need to store version, driver should handle values and not
versions..

-- 
~Vinod
