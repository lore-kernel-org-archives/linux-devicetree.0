From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 2/2] reset: meson-audio-arb: add sm1 support
Date: Tue, 20 Aug 2019 17:58:01 +0200
Message-ID: <1jlfvnomly.fsf@starbuckisacylon.baylibre.com>
References: <20190820094625.13455-1-jbrunet@baylibre.com> <20190820094625.13455-3-jbrunet@baylibre.com> <1566315581.3030.18.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566315581.3030.18.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 20 Aug 2019 at 17:39, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Hi Jerome,
>
> thank you for the patch. Just one nitpick and one real issue below:
>
> On Tue, 2019-08-20 at 11:46 +0200, Jerome Brunet wrote:
>> Add the new arb reset lines of the SM1 SoC family
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/reset/reset-meson-audio-arb.c | 28 ++++++++++++++++++++++++---
>>  1 file changed, 25 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/reset/reset-meson-audio-arb.c b/drivers/reset/reset-meson-audio-arb.c
>> index c53a2185a039..72d29dbca45a 100644
>> --- a/drivers/reset/reset-meson-audio-arb.c
>> +++ b/drivers/reset/reset-meson-audio-arb.c
>> @@ -30,6 +30,17 @@ static const unsigned int axg_audio_arb_reset_bits[] = {
>>  	[AXG_ARB_FRDDR_C]	= 6,
>>  };
>>  
>> +static const unsigned int sm1_audio_arb_reset_bits[] = {
>> +	[AXG_ARB_TODDR_A]	= 0,
>> +	[AXG_ARB_TODDR_B]	= 1,
>> +	[AXG_ARB_TODDR_C]	= 2,
>> +	[AXG_ARB_FRDDR_A]	= 4,
>> +	[AXG_ARB_FRDDR_B]	= 5,
>> +	[AXG_ARB_FRDDR_C]	= 6,
>> +	[AXG_ARB_TODDR_D]	= 3,
>> +	[AXG_ARB_FRDDR_D]	= 7,
>> +};
>> +
>>  static int meson_audio_arb_update(struct reset_controller_dev *rcdev,
>>  				  unsigned long id, bool assert)
>>  {
>> @@ -82,8 +93,14 @@ static const struct reset_control_ops meson_audio_arb_rstc_ops = {
>>  };
>>  
>>  static const struct of_device_id meson_audio_arb_of_match[] = {
>> -	{ .compatible = "amlogic,meson-axg-audio-arb", },
>> -	{}
>> +	{
>> +		.compatible = "amlogic,meson-axg-audio-arb",
>> +		.data = axg_audio_arb_reset_bits,
>> +	},
>> +	{
>> +		.compatible = "amlogic,meson-sm1-audio-arb",
>> +		.data = sm1_audio_arb_reset_bits
>> +	}, {}
>
> Only slight preference, I would keep the sentinel on a separate line.
> Your choice.

Agreed.

>
>>  };
>>  MODULE_DEVICE_TABLE(of, meson_audio_arb_of_match);
>>  
>> @@ -104,10 +121,15 @@ static int meson_audio_arb_remove(struct platform_device *pdev)
>>  static int meson_audio_arb_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> +	const unsigned int *data;
>>  	struct meson_audio_arb_data *arb;
>>  	struct resource *res;
>>  	int ret;
>>  
>> +	data = of_device_get_match_data(dev);
>> +	if (!data)
>> +		return -EINVAL;
>> +
>>  	arb = devm_kzalloc(dev, sizeof(*arb), GFP_KERNEL);
>>  	if (!arb)
>>  		return -ENOMEM;
>> @@ -126,7 +148,7 @@ static int meson_audio_arb_probe(struct platform_device *pdev)
>>  		return PTR_ERR(arb->regs);
>>  
>>  	spin_lock_init(&arb->lock);
>> -	arb->reset_bits = axg_audio_arb_reset_bits;
>> +	arb->reset_bits = data;
>>  	arb->rstc.nr_resets = ARRAY_SIZE(axg_audio_arb_reset_bits);
>
> Since SM1 has two more resets, this needs to come from device match data
> as well, or the last two resets will be unusable.

Absolutely. Sorry about that.
We are still a bit early in process of adding the support for this SoC.

I'll wait until I can do more complete tests to send a v2.

>
>>  	arb->rstc.ops = &meson_audio_arb_rstc_ops;
>>  	arb->rstc.of_node = dev->of_node;
>
> regards
> Philipp
