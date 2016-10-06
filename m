From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 0/4] libfdt: Add support for device tree overlays
Date: Thu, 6 Oct 2016 20:47:56 +1100
Message-ID: <20161006094756.GR18733@umbus.fritz.box>
References: <20160930135717.16511-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="phbq2bkSb+hZnunM"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160930135717.16511-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--phbq2bkSb+hZnunM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2016 at 03:57:13PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> The device tree overlays are a great solution to the issue raised by
> the bunch expandable boards we find everywhere these days, like the
> Beaglebone, Raspberry Pi or CHIP.
>=20
> Although for now Linux is the only available tool that can deal with
> overlays, some other components like bootloaders or user-space tools
> might need to apply these overlays on top of a base device tree.
>=20
> To address these use cases, we introduce a new function to the libfdt,
> fdt_overlay_apply, that does just that.
>=20
> You can find a test program here: http://code.bulix.org/792zum-99476?raw
>=20
> This is the last patches sent to U-boot, with the modifications
> suggested by David, and the additional test cases.
>=20
> Let me know what you think!
> Maxime

Looking pretty good.  There's a minor error in 3/4 which I've pointed
out, it can be fixed in a followup.

An error in the conditionals means it's trying to run some of the
tests which require an overlay-aware dtc on even when that's not
available - I adjusted 4/4 to correct that.

It also hit build failures on Travis, because the compiler version
there complains about local variables named 'index' shadowing the
standard library function.  I've corrected that with a followup patch.

With that done, the whole lot has been committed to master.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--phbq2bkSb+hZnunM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX9h3JAAoJEGw4ysog2bOSDEQP+wZ+Kod4heAX5xd5yVxu/wDC
htc03+thnHdBLXGRMTFt9edy1NKiHBCIvCdW846B9cT/Y3X7K6IkhDuIJydrFn/G
dSWjzmHaBEZlZYvQtJ3LKxYMrpJUXtusE81cWl7anky2uFjVokAWjQgARXoK2YGZ
Q0lUTtWR2B5FL0ejZDJIpCCG1Ng8aCzudrABH9i/v8Dh5moRjvmKZGKIskBxVs2T
aiyRGPByXyyQLyBzAHpL3NLne6musN5VFkaI9m1kWExrdf444Ot5eexkrvBQZLjc
g270bWYDmx//I+EH61klEvnqU04qWzOZQbQsqjBji3hf3z7F+AX092dz/rGP2UUl
/ttwnckifymfCZtAuMP1ud6HQFslSNKIMkQPzIEBelCHnaDPXCDX5E5R+I83LXCH
inglDwaPCUWUX6UdyncrKp9e7kjeexp4TUonfHLaHtJuDU695r+ZOZ2DwdSim4YJ
hpMINmpv+5PH3GEedGXMCpDWrKOHKexMnt8yjhD3HZTbaAt4yPPiXjbcFSw3Sbww
OCWfomeuh8HTB9yFp9b1HhkSJumWATnNLoae7aE439TiBo7nryis0IG/i4cQ/saT
aDeyL5fHapdi6lcVEgMxdVlNPa0anVRM6Uy2jnDyjn3Jnq4glTyRryFwVKYJ4XKW
ymSBGcuimi6sq9wMQJC3
=mig8
-----END PGP SIGNATURE-----

--phbq2bkSb+hZnunM--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
