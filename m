From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] drivers: regulator: qcom: add PMS405 SPMI regulator
Date: Fri, 3 May 2019 15:26:26 +0900
Message-ID: <20190503062626.GE14916@sirena.org.uk>
References: <a3c281d5-d30e-294f-71ab-957decde2ba0@linaro.org>
 <20190502023316.GS14916@sirena.org.uk>
 <dd15d784-f2a1-78c6-3543-69bbcc1143c4@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3rxX7Uty8SZY8iU1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dd15d784-f2a1-78c6-3543-69bbcc1143c4@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, bjorn.andersson@linaro.org, vinod.koul@linaro.org, niklas.cassel@linaro.org, khasim.mohammed@linaro.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--3rxX7Uty8SZY8iU1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 02, 2019 at 01:30:48PM +0200, Jorge Ramirez wrote:
> On 5/2/19 04:33, Mark Brown wrote:

> > I'm not sure I follow here, sorry - I can see that the driver needs a
> > custom get/set selector operation but shouldn't it be able to use the
> > standard list and map operations for linear ranges?

> I agree it should, but unfortunately that is not the case; when I first
> posted the patch I was concerned that for a regulator to be supported by
> this driver it should obey to the driver's internals (ie: comply with
> all of the spmi_common_regulator_registers definitions).

That's not a requirement that I'd particularly expect - it's not unusual
for devices to have multiple different styles of regulators in a single
chip (eg, DCDCs often have quite different register maps to LDOs).

> However, since there was just a single range to support, the
> modifications I had to do to support this SPMI regulator were minimal -
> hence why I opted for the changes under discussion instead of writing a
> new driver (which IMO it is an overkill).

> what do you think?

It seems a bit of a jump to add a new driver - it's just another
descriptor and ops structure isn't it?  Though as ever with the Qualcomm
stuff this driver is pretty baroque which doesn't entirely help though I
think it's just another regulator type which there's already some
handling for.

--3rxX7Uty8SZY8iU1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzL3xIACgkQJNaLcl1U
h9CKXQf/Qvobc1RebHM+jpqmN1w+403J3a8AYm+cJYEEi5WdT9/tMTuFx1gdj6XZ
K9nnzqV9352C2R/rWD3otwlV3u+HHMTQVZA5nx021V52khQJs9mNQQKxBcAO1bUp
kou03On7TG8RlPQrCmiHr1YLb63L3WiN/m4ekWUzFwYMbe8IlqV9gNzajRg34IO2
mh9MwIIevGkndKkrk5JTA7oJw7DGWS8lAIc/nS6m85L7K3z9QdRQKyL6gR5kTYMG
uczLsAwmPcdyV5faFjd9Q+hFycqeE+SU5iU9yND7diDPq6p2C4NKyKDl2IFElVgA
xfiLvU4z9kaJrlzB/K+/GBc2IB0wsQ==
=jNk7
-----END PGP SIGNATURE-----

--3rxX7Uty8SZY8iU1--
