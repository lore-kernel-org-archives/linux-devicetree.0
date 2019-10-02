From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 4/7] iio: adc: max1027: Prepare the introduction of
 different resolutions
Date: Wed, 2 Oct 2019 14:52:46 +0200
Message-ID: <20191002145246.491e2760@xps13>
References: <20191002123025.21413-1-miquel.raynal@bootlin.com>
        <20191002123025.21413-5-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002123025.21413-5-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hello,

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Wed,  2 Oct 2019
14:30:22 +0200:

> Maxim's max1027/29/31 series returns the measured voltages with a
> resolution of 10 bits. There is a very similar series, max1227/29/31
> which works very similarly but uses a resolution of 12 bits. Prepare
> the support for these chips by turning the 'depth' into a macro
> parameter instead of hardcoding it everywhere. Also reorganize just a
> bit the macros at the top to avoid repeating tens of lines when adding
> support for a new chip.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/iio/adc/max1027.c | 81 +++++++++++++++++++--------------------
>  1 file changed, 39 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/iio/adc/max1027.c b/drivers/iio/adc/max1027.c
> index f9b473ee6711..fc75764a6fd7 100644
> --- a/drivers/iio/adc/max1027.c
> +++ b/drivers/iio/adc/max1027.c
> @@ -78,12 +78,15 @@ static const struct of_device_id max1027_adc_dt_ids[] = {
>  	{ .compatible = "maxim,max1027" },
>  	{ .compatible = "maxim,max1029" },
>  	{ .compatible = "maxim,max1031" },
> +	{ .compatible = "maxim,max1227" },
> +	{ .compatible = "maxim,max1229" },
> +	{ .compatible = "maxim,max1231" },

Just spotted a mistake here: the addition of these three lines, while
harmless, should have come in patch 5/7.

Let me respin the series with this corrected.

Thanks and sorry for the noise,
Miquèl
