From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v1 4/6] reset: hi6220: Add support for AO reset
 controller
Date: Wed, 20 Mar 2019 11:46:20 +0100
Message-ID: <1553078780.7071.8.camel@pengutronix.de>
References: <1552937931-23050-1-git-send-email-peter.griffin@linaro.org>
         <1552937931-23050-5-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552937931-23050-5-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, mturquette@baylibre.com, sboyd@kernel.org
Cc: john.stultz@linaro.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, yuq825@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Peter,

On Mon, 2019-03-18 at 19:38 +0000, Peter Griffin wrote:
> This is required to bring Mali450 gpu out of reset.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/reset/hisilicon/hi6220_reset.c | 51 +++++++++++++++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/hisilicon/hi6220_reset.c b/drivers/reset/hisilicon/hi6220_reset.c
> index d5e5229..0cd5f92 100644
> --- a/drivers/reset/hisilicon/hi6220_reset.c
> +++ b/drivers/reset/hisilicon/hi6220_reset.c
> @@ -36,6 +36,7 @@
>  enum hi6220_reset_ctrl_type {
>  	PERIPHERAL,
>  	MEDIA,
> +	AO,
>  };
>  
>  struct hi6220_reset_data {
> @@ -95,6 +96,47 @@ static const struct reset_control_ops hi6220_media_reset_ops = {
>  	.deassert = hi6220_media_deassert,
>  };
>  
> +#define AO_SCTRL_SC_PW_CLKEN0     0x800
> +#define AO_SCTRL_SC_PW_CLKDIS0    0x804
> +
> +#define AO_SCTRL_SC_PW_RSTEN0     0x810
> +#define AO_SCTRL_SC_PW_RSTDIS0    0x814
> +
> +#define AO_SCTRL_SC_PW_ISOEN0     0x820
> +#define AO_SCTRL_SC_PW_ISODIS0    0x824
> +#define AO_MAX_INDEX              12
> +
> +static int hi6220_ao_assert(struct reset_controller_dev *rc_dev,
> +			       unsigned long idx)
> +{
> +	struct hi6220_reset_data *data = to_reset_data(rc_dev);
> +	struct regmap *regmap = data->regmap;
> +	int ret;
> +
> +	ret = regmap_write(regmap, AO_SCTRL_SC_PW_RSTEN0, BIT(idx));
> +	ret |= regmap_write(regmap, AO_SCTRL_SC_PW_ISOEN0, BIT(idx));
> +	ret |= regmap_write(regmap, AO_SCTRL_SC_PW_CLKDIS0, BIT(idx));

What if two regmap_writes return a different error code? Better check
for ret and return individually. Also, no need to issue two more writes
if the first one failed.

> +	return ret;
> +}
> +
> +static int hi6220_ao_deassert(struct reset_controller_dev *rc_dev,
> +				 unsigned long idx)
> +{
> +	struct hi6220_reset_data *data = to_reset_data(rc_dev);
> +	struct regmap *regmap = data->regmap;
> +	int ret;
> +
> +	ret = regmap_write(regmap, AO_SCTRL_SC_PW_RSTDIS0, BIT(idx));
> +	ret |= regmap_write(regmap, AO_SCTRL_SC_PW_ISODIS0, BIT(idx));
> +	ret |= regmap_write(regmap, AO_SCTRL_SC_PW_CLKEN0, BIT(idx));

Same as above. Otherwise this looks fine. With this fixed, I could pick
up patches 2, 4, and 5.

regards
Philipp
