From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 3/4] regulator: tps65086: Add regulator driver for the
 TPS65086 PMIC
Date: Sun, 22 Nov 2015 13:13:21 +0000
Message-ID: <20151122131321.GM26072@sirena.org.uk>
References: <1447974102-24938-1-git-send-email-afd@ti.com>
 <1447974102-24938-4-git-send-email-afd@ti.com>
 <20151121133739.GG26072@sirena.org.uk>
 <5650D6D2.5060108@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g6DVDhPhk1bqxDrC"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5650D6D2.5060108@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--g6DVDhPhk1bqxDrC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 21, 2015 at 02:40:50PM -0600, Andrew F. Davis wrote:
> On 11/21/2015 07:37 AM, Mark Brown wrote:

> >An earlier version of this patch has already been applied, please don't
> >resend already applied patches but send incremental patches with any
> >changes.

> Odd, I didn't seem to get any message for this getting applied. Looks
> like only a couple lines difference from the version in the regulators
> branch, I don't imagine you are able to rebase that with these changes?

As a matter of policy I try to avoid rewriting history unless it is
really required.

> Anyway the reason that line needed changed is over a confusion in
> what the 'of_node' does in 'struct regulator_config'. The description
> seems to make it seem like it is the node that gets checked for
> init data.

The current behaviour is the intended behaviour.

> >* @of_node: OpenFirmware node to parse for device tree bindings (may be
> >*           NULL).

> But the 'of_node' that is actually searched is the one given in
> regulator_config->dev->of_node. Is this intended behavior (drivers
> assume it is so it probably has to be now) and if so, the above
> description might need to be clarified as too what that 'of_node'
> pointer really does?

Please submit a patch with any clarification you think is needed.
of_node is the name of the container subnode of the main node for the
device where we look for init data - both are used.

--g6DVDhPhk1bqxDrC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWUb9wAAoJECTWi3JdVIfQf0EH/iDVkhnWLMgG7vkZAvTlX9CI
jxuuwUV4ZlkFO9lEbGpkaasgUyCUZghthsh/G6jBTYGH97FYP/a/jxt0WPInR+3s
Lz7MfnJo410TZcCwnDty5LNaPdYU4jaAQddwfxN7Uw2alY7+A3/m6TBnAob/bSLg
coLDvrBwR1OBAKsMxOcgHSW/R2NcnhC2MJp+yI/AQN+iKq/MRxe0aqFqojoihf6g
YqftSImrciux1+Eb+8zuk9Yi+1LxmM9BG4ElhRzSmZcesPOBLM0FBOAT7gy1Ru1f
kxNqBgyVRSKnwpPNCnFn8f5z8SLSuI2AVrw5XygTP8y/Vh3F6y3S4gPcKCZVRrY=
=O5l9
-----END PGP SIGNATURE-----

--g6DVDhPhk1bqxDrC--
