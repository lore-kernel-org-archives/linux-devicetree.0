From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 1/4] regulator: Add set_voltage_time op
Date: Tue, 13 Sep 2016 00:57:58 +0100
Message-ID: <20160912235758.GO27946@sirena.org.uk>
References: <20160906190315.GC92391@google.com>
 <20160912183230.GF27946@sirena.org.uk>
 <20160912231851.GA62872@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gIhrS3Q23Nl70UJ5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160912231851.GA62872@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: lgirdwood@gmail.com, Douglas Anderson <dianders@chromium.org>, briannorris@chromium.org, javier@dowhile0.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--gIhrS3Q23Nl70UJ5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 12, 2016 at 04:18:51PM -0700, Matthias Kaehlcke wrote:
> El Mon, Sep 12, 2016 at 07:32:30PM +0100 Mark Brown ha dit:
> > On Tue, Sep 06, 2016 at 12:03:15PM -0700, Matthias Kaehlcke wrote:

> > > -	/* Call set_voltage_time_sel if successfully obtained old_selector */
> > > -	if (ret == 0 && !rdev->constraints->ramp_disable && old_selector >= 0
> > > -		&& old_selector != selector) {
> > > +	if (ret != 0 || rdev->constraints->ramp_disable)
> > > +		goto no_delay;

> > You probably want to do the refactoring for splitting out decisions
> > about old_selector separately, it'll make the diff clearer.

> The old_selector conditions could be moved into the "else if
> (rdev->desc->ops->set_voltage_sel)" branch above, is that you mean?

No, what I mean is this change is doing a bunch of moving code around as
well as adding new things which makes it hard to spot where the new
things are.  Moving the code around separately (that is, in a separate
patch) would make the review easier.

> > > +	/* Insert any necessary delays */
> > > +	if (delay >= 1000) {
> > > +		mdelay(delay / 1000);
> > > +		udelay(delay % 1000);
> > > +	} else if (delay) {
> > > +		udelay(delay);
> > > +	}

> > > +no_delay:

> > Why were the gotos there?

> Not sure how to interpret your question. Would you prefer no to use
> gotos, should the notification be skipped in case the voltage is not
> changed, do you expect a comment, ...?

I mean I couldn't tell why a goto was a good idea for what seemed like
perfectly normal conditional logic.  Either I couldn't tell because it's
not a good idea or it is a good idea but should be clearer in some way
but since I didn't really understand what the purpose of doing the gotos
was I can't say for sure either way.

> > The diff and I expect the resulting code would be a lot clearer if we
> > just left most of the function indented as it is and simply directly
> > returned set_voltage_time().  Which is what we do anyway so no need to
> > reindent the rest of the code.

> Ok, with your comment below on a default implementation this would
> become something like:

> if (ops->set_voltage_time) {
> 	return ops->set_voltage_time(...);
> } else if (!ops->set_voltage_time_sel) {
> 	return _regulator_set_voltage_time(..);
> }

I suspect you'll end up with more refactoring than that around
_set_voltage_time() and this'll be inside that function but I've lost
context here so ICBW.

--gIhrS3Q23Nl70UJ5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX10EFAAoJECTWi3JdVIfQFgwH/RETMB3876FkTFLs4beTbuje
HtC19YNJ25UxHB8LHf7dHWmyT9JezPXs4PTroY8OwXqlt2Wp5nENfXB+Y7AivWUQ
PQt5iRT6OTtBr1t7Ve0yyN0eZ0ucpIZewiYTCaquP4nfZnzHmfdiGsNkeQcgd62G
fx5bGB/XOfsLB3ssr64iUtTYuicP5rjy71oQQ7Uapu3wErepEI3hxp3zCFW2eV27
tynvzid9kohmFj4KxDzRL8Xr797CnePbZAqgp7CQYoKtPh1beyAkyFJRz3BMklnd
ljIg1q/oaBz4Jz216brH7K+FAPCGwTgu3a1I84DdLO4ciwa3R2kT9CIwP8lEkNQ=
=aUvg
-----END PGP SIGNATURE-----

--gIhrS3Q23Nl70UJ5--
