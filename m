From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/7] regulator: qcom_spmi: Add support for PM8005
Date: Mon, 17 Jun 2019 19:37:57 +0100
Message-ID: <20190617183757.GH5316@sirena.org.uk>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
 <20190613212553.10541-1-jeffrey.l.hugo@gmail.com>
 <20190613212553.10541-2-jeffrey.l.hugo@gmail.com>
 <20190617150502.GU5316@sirena.org.uk>
 <CAOCk7NrwYezbVyLKOZdxgGRVemKtBmHKP+fSO0a2p3bCPNdW3w@mail.gmail.com>
 <20190617160358.GC5316@sirena.org.uk>
 <CAOCk7Nrnd7yJQ=0pO64iT+RfmsKfJW0x0RhrmSLkO_brFqZ2+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qZLFzaLf2KECwqmh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOCk7Nrnd7yJQ=0pO64iT+RfmsKfJW0x0RhrmSLkO_brFqZ2+Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: lgirdwood@gmail.com, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--qZLFzaLf2KECwqmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 11:07:18AM -0600, Jeffrey Hugo wrote:
> On Mon, Jun 17, 2019 at 10:04 AM Mark Brown <broonie@kernel.org> wrote:
> > On Mon, Jun 17, 2019 at 09:17:21AM -0600, Jeffrey Hugo wrote:

Something really weird is going on with the word wrapping in your mail,
it looks like you're writing lines longer than 80 characters (120?) and
they're getting a newline added in the middle of the line to wrap them
without reflowing the paragraph.

> > > This is a set_voltage_sel() in spmi_ftsmps426_ops.  Is the issue beca=
use this
> > > function is "spmi_regulator_ftsmps426_set_voltage" and not
> > > "spmi_regulator_ftsmps426_set_voltage_sel"?

> > Well, that's certainly confusing naming and there's some confusion in
> > the code about what a selector is - it's supposed to be a raw register
> > value so if you're having to convert it into a voltage something is
> > going wrong.  Just implement a set_voltage() operation?

> No.

> Is what a selector is documented anywhere?  I just looked again and I
> haven't found
> documentation explaining that a selector is the raw register value.

Well, it doesn't *have* to be the raw register value, more accurately
it's some token which is useful for passing to and from the hardware;=20
The documentation such as it
is is in the documentation of the list_voltage() operation (which is
what defines the selector values for a given driver). =20

> Now I understand why this driver has the hardware to software selector
> translation.
> The selector being the raw register value seems to be a very limited
> assumption that
> I don't see working for more than very basic implementations.

Your idea of very basic implementations is how the overwhelming majority
of hardware is implemented.  Regulators with register maps will tend to
just have a bitfield where you set the voltage with each valid value in
that bitfield mapped to a single voltage, the exceptions tend to use
direct voltage values instead (and not support enumeration at all).

Looking at the driver I think it's got what the helpers are terming
pickable linear ranges (naming is hard) and could use those helpers.

> We've already figured out a virtualized selector mapping, I don't want
> to reimplement
> the complicated math to correctly map a requested voltage range to
> what the regulator
> can provide, and possibly get it wrong, or at the very least have two dup=
licate
> implementations.

I don't know what a "virtualized selector mapping" is...  We do have an
extensive range of helper implementations which cover the majority of
cases, are you sure that none of these cover what the hardware is doing?

> The naming is consistent with the rest of the driver, and the name
> seems long enough
> already.  Lets just keep this.

I appreciate that the existing code is a bit of a mess but as you can
see it's making it difficult to maintain so I'd rather push towards
making it cleaner, it looks like we're getting more and more devices
added to the driver so it's actually an issue. =20

> Again, it would be nice if the documentation for regulator_ops
> indicated that a driver
> should only implement the voltage operations or the selector
> operations, not mix and
> match if that is your expectation.

Please add whatever documentation you're looking for here.  I genuinely
don't know where people would look for that and TBH I'm having a hard
time figuring out why you'd implement the operations asymmetrically.
It's not an issue that ever comes up.

--qZLFzaLf2KECwqmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0H3gQACgkQJNaLcl1U
h9BJnQf8CXT/E6Fx677cC/jcClq6MlGwaUxZji61Mf3yxWImQeQ2YuY5pCmTd/LH
naNqj4LoVKP8WB2P1hmL/b19JPuKVzq39mDG9B2zSpFWFUr8i9S1IABNss45hzeg
UABKzHTCY1wmQISzs+h1TsAzaANi9EzsfwF/wFuT8LREqyCTg7CoXw3KSFiDR3jx
AJdvbuCDOl54UAFWNvPcHSdFXQJb9eYJ1ZmDTS2bckShoviUemoSBTQ/vmO93iPY
yS3ExNWGMSNzq1wCAVZgBln7fVEms0NMPiRcIDF1hRO6GFa7fU4ceql5ZjrV2xDc
JJ3fpo+faqKg7fDGbWJZ5GwafClP5A==
=a6W+
-----END PGP SIGNATURE-----

--qZLFzaLf2KECwqmh--
