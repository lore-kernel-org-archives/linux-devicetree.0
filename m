From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v7 2/2] ASoC: codecs: add wsa881x amplifier support
Date: Thu, 10 Oct 2019 14:23:14 +0100
Message-ID: <20191010132314.GQ2036@sirena.org.uk>
References: <20191009085108.4950-1-srinivas.kandagatla@linaro.org>
 <20191009085108.4950-3-srinivas.kandagatla@linaro.org>
 <20191009163535.GK2036@sirena.org.uk>
 <95637c0a-8373-0eda-47e5-ac6e529019e5@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8Km4OLyaxUtVIPha"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <95637c0a-8373-0eda-47e5-ac6e529019e5@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: spapothi@codeaurora.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org, pierre-louis.bossart@linux.intel.com
List-Id: devicetree@vger.kernel.org


--8Km4OLyaxUtVIPha
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 10, 2019 at 10:28:04AM +0100, Srinivas Kandagatla wrote:
> On 09/10/2019 17:35, Mark Brown wrote:
> > On Wed, Oct 09, 2019 at 09:51:08AM +0100, Srinivas Kandagatla wrote:
> > > +static const u8 wsa881x_reg_readable[WSA881X_CACHE_SIZE] = {

> > > +static bool wsa881x_readable_register(struct device *dev, unsigned int reg)
> > > +{
> > > +	return wsa881x_reg_readable[reg];

> > There's no bounds check and that array size is not...

> I converted this now to a proper switch statement as other drivers do.

> > > +static struct regmap_config wsa881x_regmap_config = {
> > > +	.reg_bits = 32,
> > > +	.val_bits = 8,
> > > +	.cache_type = REGCACHE_RBTREE,
> > > +	.reg_defaults = wsa881x_defaults,
> > > +	.num_reg_defaults = ARRAY_SIZE(wsa881x_defaults),
> > > +	.max_register = WSA881X_MAX_REGISTER,

> > ...what regmap has as max_register.  Uusually you'd render as a
> > switch statement (as you did for volatile) and let the compiler
> > figure out a sensible way to do the lookup.

> Sorry, I did not get your point here.

> Are you saying that we can skip max_register in this regmap config ?
> Then how would max_register in regmap be set?

I'm saying that you appear to be relying on max_register to
verify that you're not overflowing the array bounds but you
max_register is not set to the same thing as the array size.

--8Km4OLyaxUtVIPha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2fMMIACgkQJNaLcl1U
h9A3/Qf6Ar7ffTTO6fQ9eEU2xlK6kaCO7YSeWXTP1fKzuKvQy6Fd/XOsax1HiBF/
8/H4lV/CNqnW88GwSAgBm7acHnRQwDrq1UkVlImEMNkslEr9q5ANt5CHrUb0DNcW
TI6RkEi4gJj0nfkBozu9aRww71xEYNR+DPcmb/1rugVUdh1WYmFop9sAImmdn+5d
zGGIdGTWdDu71UTPmx272j1zd6226SeJw7ONW4lmacud+HlEnAFRV3OBBc+ftGFD
G6kIhnTS0mnSuzhmGEkyzCTHHuG6Sjv1Co/qRKrV+PdqRPhxPln10rw8N9/Wv55n
5CXKfA5YtlVQjpfqaSr2fmE3YCtiew==
=ZHzM
-----END PGP SIGNATURE-----

--8Km4OLyaxUtVIPha--
