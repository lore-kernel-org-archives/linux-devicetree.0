From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv3 2/2] dt-bindings: regulator: Add regulator suspend
 state for PM state
Date: Fri, 15 Aug 2014 11:56:15 +0100
Message-ID: <20140815105615.GI17528@sirena.org.uk>
References: <1407976814-21882-1-git-send-email-cw00.choi@samsung.com>
 <1407976814-21882-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oLKz6on1ikc6itwj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1407976814-21882-3-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--oLKz6on1ikc6itwj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 14, 2014 at 09:40:14AM +0900, Chanwoo Choi wrote:

> +- regulator-initial-state: initial state for suspend state, cnd set initial
> +  state among following defined suspend states:
> +  <2>: PM_SUSPEND_STANDBY - Setup regulator according to regulator-state-standby
> +  <3>: PM_SUSPEND_MEM - Setup regulator according to regulator-state-mem
> +  <4>: PM_SUSPEND_MAX - Setup regulator according to regulator-state-disk
> +- regulator-state-standby sub-root node for Standby mode
> +  : the device is in a power-saving state, but can also receive certain events,
> +  specific behavior depends on the specific device.

These are all Linux internal descriptions of the states but the device
tree is supposed to be OS neutral.  For suspend to memory and suspend to
disk that's probably adequately clear but _STANDBY is really unclear.
I would suggest just dropping this without a clearer defintion, it's
something that I'd expect to emerge organically from low power modes
rather than having a specific definition anyway.

> +- regulator-state-[standby/mem/disk] node has following common properties:
> +	- regulator-volt: voltage consumers may set in suspend state.
> +	- regulator-mode: voltage mode in suspend state, can set mode among
> +	following defined regulator modes:
> +	0x1: REGULATOR_MODE_FAST, Regulator can handle fast changes.
> +	0x2: REGULATOR_MODE_NORMAL, Normal regulator power supply mode.
> +	0x4: REGULATOR_MODE_IDLE, Regulator runs in a more efficient mode.
> +	0x8: REGULATOR_MODE_STANDBY, Regulator runs in the most efficient mode.
> +	- regulator-on-in-suspend: regulator should be on in suspend state.
> +	- regulator-off-in-suspend: regulator should be off in suspend state.
> +	If node don't include regulator-[on/off]-in-suspend, can't change
> +	regulator state in suspend mode and only should sustain the regulator
> +	state of normal state.

Modes are a similarly problematic thing - their definition is really
unclear even within Linux and we don't support them at all at present.
I'd just drop them initially and then add them in as a part of adding
mode support in general.

--oLKz6on1ikc6itwj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT7edMAAoJELSic+t+oim9T+IP/iLnR6bd3bWVgVMzAJnECkxt
H0G/XqyZJQph8/xd57HPJvKoPgZ43RsSPOaQ6tmbmpFmK52OgCgh9fskFiClNBgL
Q9dumqL7RE+GUXmGZKA7LclC1aRYLQovnzpk4BuDK89rC55wYRfR2ckFJwZPzwgS
uCOPM2eKrKhN4ah4AFQrbHwkSIf7bJchJoAkRyvOCtUJKV1RHqcIg0Y3b7EX/6ao
JUpSTZEzmp4JLqpIK2NUh/1L+MLtH7/aRI1+l1bVSz6skbuWabOy/BqWKEXCVP/j
9c8R6oNo0nBAN23ovDgVPKtPu3u1xy8D9Hq1ZObY4dFnL9U4ONt8QF/kODINPAhJ
tp27ghMOmbO6b59IT7XoKxqNUkZ8/oiieLJdotvynQa0sSvowu15Nbecp49Y5SFa
w/wdaS5XKsd9uPg1dIo4ODHNR5vpUJP1l6ZO4lJ0sfKZO6w42jlqcqSJ67k9xcGe
LR9TZsrjFZedcYW48uExMurIhR7akI0eR54FcDkpJhi5qLKq/6lwnQnfu74VX9QR
F7o6a0snJET7U0rqqHQpjAnG241oUqqmGC0ukafWjJvydEK+gLV+DLJAzxZ8BHEY
KeOyWvK2MtgkExME+SVX/9qJGASHU4U8tUpB3VrumKr0I+O7bWCD5t6V7kk+LDvT
v7i25OXSHSIu8BqhaQXX
=Fmil
-----END PGP SIGNATURE-----

--oLKz6on1ikc6itwj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
