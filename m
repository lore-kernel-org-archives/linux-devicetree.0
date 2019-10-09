From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v7 2/2] ASoC: codecs: add wsa881x amplifier support
Date: Wed, 9 Oct 2019 17:35:35 +0100
Message-ID: <20191009163535.GK2036@sirena.org.uk>
References: <20191009085108.4950-1-srinivas.kandagatla@linaro.org>
 <20191009085108.4950-3-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4+GP5VtpSFAXb8tV"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191009085108.4950-3-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: spapothi@codeaurora.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org, pierre-louis.bossart@linux.intel.com
List-Id: devicetree@vger.kernel.org


--4+GP5VtpSFAXb8tV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 09, 2019 at 09:51:08AM +0100, Srinivas Kandagatla wrote:

> +static const u8 wsa881x_reg_readable[WSA881X_CACHE_SIZE] = {

> +static bool wsa881x_readable_register(struct device *dev, unsigned int reg)
> +{
> +	return wsa881x_reg_readable[reg];
u
There's no bounds check and that array size is not...

> +static struct regmap_config wsa881x_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 8,
> +	.cache_type = REGCACHE_RBTREE,
> +	.reg_defaults = wsa881x_defaults,
> +	.num_reg_defaults = ARRAY_SIZE(wsa881x_defaults),
> +	.max_register = WSA881X_MAX_REGISTER,

...what regmap has as max_register.  Uusually you'd render as a
switch statement (as you did for volatile) and let the compiler
figure out a sensible way to do the lookup.

> +static void wsa881x_init(struct wsa881x_priv *wsa881x)
> +{
> +	struct regmap *rm = wsa881x->regmap;
> +	unsigned int val = 0;
> +
> +	regmap_read(rm, WSA881X_CHIP_ID1, &wsa881x->version);
> +	regcache_cache_only(rm, true);
> +	regmap_multi_reg_write(rm, wsa881x_rev_2_0,
> +			       ARRAY_SIZE(wsa881x_rev_2_0));
> +	regcache_cache_only(rm, false);

This looks broken, what is it supposed to be doing?  It looks
like it should be a register patch but it's not documented.

> +static const struct snd_kcontrol_new wsa881x_snd_controls[] = {
> +	SOC_ENUM("Smart Boost Level", smart_boost_lvl_enum),
> +	WSA881X_PA_GAIN_TLV("PA Gain", WSA881X_SPKR_DRV_GAIN,
> +			    4, 0xC, 1, pa_gain),

As covered in control-names.rst all volume controls should end in
Volume.

> +static void wsa881x_clk_ctrl(struct snd_soc_component *comp, bool enable)
> +{
> +	struct wsa881x_priv *wsa881x = snd_soc_component_get_drvdata(comp);
> +
> +	mutex_lock(&wsa881x->res_lock);

What is this lock supposed to be protecting?  As far as I can
tell this function is the only place it is used and this function
has exactly one caller which itself has only one caller which is
a DAPM widget and hence needs no locking.  It looks awfully like
it should just be a widget itself, or inlined into the single
caller.

> +static void wsa881x_bandgap_ctrl(struct snd_soc_component *comp, bool enable)
> +{
> +	struct wsa881x_priv *wsa881x = snd_soc_component_get_drvdata(comp);

Similarly here.

> +static int32_t wsa881x_resource_acquire(struct snd_soc_component *comp,
> +					bool enable)
> +{
> +	wsa881x_clk_ctrl(comp, enable);
> +	wsa881x_bandgap_ctrl(comp, enable);
> +
> +	return 0;
> +}

There's no corresponding disables.

--4+GP5VtpSFAXb8tV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2eDFYACgkQJNaLcl1U
h9CtLgf8CePH7+ZsY0W4cRF5zvZs+qrkT8EShEl1pRNhR80s4tivFZnFYccKkM1a
NSlUywoTsagGw1dijsM7tCzj82aQ5pxABSezmv0erVwZv9cFqnbfNG/yh3epnLbH
/T/MBashmZA7sR02wH7y3PFvxlWkH3buk6jlwKeCJtZNnX6pGpv5mfwy5p9nkygB
iIgIG6WEd8pB0/pGk4MVArDRhLIGkH2C+cyxEC46zIG6FVrfi1DlNffgYjmbne6N
UO6g0GtmdlI6HyuLCQ4DO56BrExtnjieHzCJgyyFN6vn86S6OFLwFGfj8P8lduk7
GAvcrZSHg8UKdrOLheSE57TbN6KqGQ==
=ijUj
-----END PGP SIGNATURE-----

--4+GP5VtpSFAXb8tV--
