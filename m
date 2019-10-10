From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v7 2/2] ASoC: codecs: add wsa881x amplifier support
Date: Thu, 10 Oct 2019 10:28:04 +0100
Message-ID: <95637c0a-8373-0eda-47e5-ac6e529019e5@linaro.org>
References: <20191009085108.4950-1-srinivas.kandagatla@linaro.org>
 <20191009085108.4950-3-srinivas.kandagatla@linaro.org>
 <20191009163535.GK2036@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191009163535.GK2036@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: spapothi@codeaurora.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org, pierre-louis.bossart@linux.intel.com
List-Id: devicetree@vger.kernel.org

Thanks Mark for taking time to review this patch.

On 09/10/2019 17:35, Mark Brown wrote:
> On Wed, Oct 09, 2019 at 09:51:08AM +0100, Srinivas Kandagatla wrote:
> 
>> +static const u8 wsa881x_reg_readable[WSA881X_CACHE_SIZE] = {
> 
>> +static bool wsa881x_readable_register(struct device *dev, unsigned int reg)
>> +{
>> +	return wsa881x_reg_readable[reg];
> u
> There's no bounds check and that array size is not...
> 
I converted this now to a proper switch statement as other drivers do.

>> +static struct regmap_config wsa881x_regmap_config = {
>> +	.reg_bits = 32,
>> +	.val_bits = 8,
>> +	.cache_type = REGCACHE_RBTREE,
>> +	.reg_defaults = wsa881x_defaults,
>> +	.num_reg_defaults = ARRAY_SIZE(wsa881x_defaults),
>> +	.max_register = WSA881X_MAX_REGISTER,
> 
> ...what regmap has as max_register.  Uusually you'd render as a
> switch statement (as you did for volatile) and let the compiler
> figure out a sensible way to do the lookup.

Sorry, I did not get your point here.

Are you saying that we can skip max_register in this regmap config ?
Then how would max_register in regmap be set?

> 
>> +static void wsa881x_init(struct wsa881x_priv *wsa881x)
>> +{
>> +	struct regmap *rm = wsa881x->regmap;
>> +	unsigned int val = 0;
>> +
>> +	regmap_read(rm, WSA881X_CHIP_ID1, &wsa881x->version);
>> +	regcache_cache_only(rm, true);
>> +	regmap_multi_reg_write(rm, wsa881x_rev_2_0,
>> +			       ARRAY_SIZE(wsa881x_rev_2_0));
>> +	regcache_cache_only(rm, false);
> 
> This looks broken, what is it supposed to be doing?  It looks
> like it should be a register patch but it's not documented.
> 
Yep, it makes sense to move this to patch, its done in new version.

>> +static const struct snd_kcontrol_new wsa881x_snd_controls[] = {
>> +	SOC_ENUM("Smart Boost Level", smart_boost_lvl_enum),
>> +	WSA881X_PA_GAIN_TLV("PA Gain", WSA881X_SPKR_DRV_GAIN,
>> +			    4, 0xC, 1, pa_gain),
> 
> As covered in control-names.rst all volume controls should end in
> Volume.
> 
Fixed this in next version.

>> +static void wsa881x_clk_ctrl(struct snd_soc_component *comp, bool enable)
>> +{
>> +	struct wsa881x_priv *wsa881x = snd_soc_component_get_drvdata(comp);
>> +
>> +	mutex_lock(&wsa881x->res_lock);
> 
> What is this lock supposed to be protecting?  As far as I can
> tell this function is the only place it is used and this function
> has exactly one caller which itself has only one caller which is
> a DAPM widget and hence needs no locking.  It looks awfully like
> it should just be a widget itself, or inlined into the single
> caller.
> 
This was done for temperature sensor reads which can happen in parallel.
But for now I will remove it and add back once we add tsens support.

>> +static void wsa881x_bandgap_ctrl(struct snd_soc_component *comp, bool enable)
>> +{
>> +	struct wsa881x_priv *wsa881x = snd_soc_component_get_drvdata(comp);
> 
> Similarly here.
> 
This one was over done! its now removed in next version.

>> +static int32_t wsa881x_resource_acquire(struct snd_soc_component *comp,
>> +					bool enable)
>> +{
>> +	wsa881x_clk_ctrl(comp, enable);
>> +	wsa881x_bandgap_ctrl(comp, enable);
>> +
>> +	return 0;
>> +}
> 
> There's no corresponding disables.

both wsa881x_clk_ctrl() and wsa881x_bandgap_ctrl() have corresponding 
disables in that functions.

thanks,
srini
> 
