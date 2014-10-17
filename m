From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESUBMIT PATCH v4 7/8] regulator: sky81452: Add compatible
 string for device binding
Date: Fri, 17 Oct 2014 12:17:34 +0200
Message-ID: <20141017101734.GB1820@sirena.org.uk>
References: <1412657745-7812-1-git-send-email-jack.yoo@skyworksinc.com>
 <1413179262-27636-1-git-send-email-jack.yoo@skyworksinc.com>
 <1413179262-27636-8-git-send-email-jack.yoo@skyworksinc.com>
 <20141013103512.GJ27755@sirena.org.uk>
 <20141014011112.GB2751@jack-ThinkPad-T520>
 <20141014075606.GN27755@sirena.org.uk>
 <20141017091950.GA3233@jack-ThinkPad-T520>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141017091950.GA3233@jack-ThinkPad-T520>
Sender: linux-kernel-owner@vger.kernel.org
To: Gyungoh Yoo <gyungoh@gmail.com>
Cc: sameo@linux.intel.com, lee.jones@linaro.org, jg1.han@samsung.com, cooloney@gmail.com, lgirdwood@gmail.com, jack.yoo@skyworksinc.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, grant.likely@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, pawel.moll@arm.com, heiko@sntech.de, jason@lakedaemon.net, shawn.guo@freescale.com, treding@nvidia.com, florian.vaussard@epfl.ch, trivial@kernel.org, linux@roeck-us.net, andrew@lunn.ch, jic23@kernel.org
List-Id: devicetree@vger.kernel.org


--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2014 at 06:19:50PM +0900, Gyungoh Yoo wrote:

> Wow. I understand.
> I missed .supply_name. I think I need something like
> below, before devm_regulator_register().

> 	config->supply_name =3D init_data->constraints.name;

> I will resubmit it.

No, not supply_name (though you really should be initializing that
anyway) and you definitely don't want to set supply_name to something
=66rom constraints.  The supply_name should be the name of the input pin
that supplies power to the regulator.  I was referring to of_match and
regulators_node.

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUQOy+AAoJECTWi3JdVIfQwDIH/0V5M79k7yEMjvBYqBmQitzK
JdSGk5SMX1gnp9i2GwOTJrHBegdHF9asyfyskW9j7iNeNUL2pKdCm4YgFsxiilhq
NlCdt8CJmB0oxznoHQZ4yKT7vOr1FRI/kFp/JEZAodY885Tqd0cvwcVAlL9L9wgF
IBVnfrmNngxfAQtFn+1BKwB2zJKYivfR2fCwwbmH6qcpRRZPDRahNVQFUdm4tZrv
ecaNLC+gDp86lbF+yEP57ZbOgQK/z+iv5iyLzgLTLUPF4nXCK3Uw0K3bpuZPsFZg
6yMX7cu1lXgzyuf6A1Z3RjHk01XKqjI24RkhfzUyrxoTCTSge+bu+kqXSJe/dfs=
=h7Eo
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--
