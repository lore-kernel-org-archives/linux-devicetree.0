Return-Path: <SRS0=ekey=H4=verge.net.au=horms@kernel.org>
Date: Wed, 9 May 2018 20:11:11 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH/RFT v3 1/3] thermal: rcar_thermal: add r8a77995 support
Message-ID: <20180509181110.56ylpjqtefwnau3r@verge.net.au>
References: <1522759385-17661-1-git-send-email-ykaneko0929@gmail.com>
 <1522759385-17661-2-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1522759385-17661-2-git-send-email-ykaneko0929@gmail.com>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 03, 2018 at 09:43:03PM +0900, Yoshihiro Kaneko wrote:
> Add support for R-Car D3 (r8a77995) thermal sensor.
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
>  drivers/thermal/rcar_thermal.c | 154 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 122 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
> index 73e5fee..5ec47a9 100644
> --- a/drivers/thermal/rcar_thermal.c
> +++ b/drivers/thermal/rcar_thermal.c
> @@ -58,10 +58,43 @@ struct rcar_thermal_common {
>  	spinlock_t lock;
>  };
>  
> +struct rcar_thermal_chip {
> +	unsigned int use_of_thermal : 1;
> +	unsigned int has_filonoff : 1;
> +	unsigned int irq_per_ch : 1;
> +	unsigned int needs_suspend_resume : 1;
> +	unsigned int nirqs;
> +};
> +
> +static const struct rcar_thermal_chip rcar_thermal = {
> +	.use_of_thermal = 0,
> +	.has_filonoff = 1,
> +	.irq_per_ch = 0,
> +	.needs_suspend_resume = 0,
> +	.nirqs = 1,
> +};
> +
> +static const struct rcar_thermal_chip rcar_gen2_thermal = {
> +	.use_of_thermal = 1,
> +	.has_filonoff = 1,
> +	.irq_per_ch = 0,
> +	.needs_suspend_resume = 0,
> +	.nirqs = 1,
> +};
> +
> +static const struct rcar_thermal_chip rcar_gen3_thermal = {
> +	.use_of_thermal = 1,
> +	.has_filonoff = 0,
> +	.irq_per_ch = 1,
> +	.needs_suspend_resume = 1,
> +	.nirqs = 2,
> +};

The binding and dts patches in this series describe 3 interrupts
for R-Car D3. But the above specifies two. Am I missing something obvious?
