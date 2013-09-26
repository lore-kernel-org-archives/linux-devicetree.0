From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] mfd: arizona: Update device tree regulator bindings
Date: Thu, 26 Sep 2013 18:58:43 +0100
Message-ID: <20130926175843.GS19304@sirena.org.uk>
References: <1380131272-16982-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20130925183201.GT3226@sirena.org.uk>
 <20130926152941.GQ3635@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Vy6UCbb9EK60RK4A"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130926152941.GQ3635-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Vy6UCbb9EK60RK4A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2013 at 04:29:41PM +0100, Charles Keepax wrote:

Please include some context in replies...

> I had considered adding something like a recursive regulator get
> that works it's way up the tree but this felt rather invasive and
> most places the user code does the regulator get rather than a
> framework so the issue is only really likely to crop up with
> regards to ASoC.

I don't see why this would only be an issue for ASoC - it happens to
have more helpers for this right now than anything else but I'd hope
that at some point in the future we can get some of the common patterns
for holding regulators into the device framework.  You also have the
potential for this to do the wrong thing if it doesn't happen to be
talking to an MFD which is doing this since it just unconditionally
looks at the parent.

I would suggest that rather than unconditionally doing this on lookup
it'd be easier to do it the other way round and explicitly add mappings
=66rom the parent to the child when registering the device.  That doesn't
have the potential to explode and get the wrong thing like this does.

--Vy6UCbb9EK60RK4A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSRHXPAAoJELSic+t+oim9GoEP/R+kdUKCjpb4NQcWXWLQZr04
UcL3idVMFPFT9nTQiLCYGurt0Rzc+5csSgsDc3GC5LGNKvGuKaSRAYnRKgzCYcZL
yEvOv70+V+bWci9BnzHxPiYyVsdK0eEeKxOX93Ql/sIjHt38xxFBY63cBwVc1HuK
j8gCG3YV1I2iz3BkPkNFSILaYCyhdVKhx4UE+mokU+Cy/xsvnNMY3z3L6uYtNa0C
8GPlYi68ScLG0YjSM8zvlMWPgikoH+WBVMOccf0MZI9cTvyR/mxoSBeoJY5g+ceg
Qk3WslU0g9v6vAaEN9FDtDbJs6CO9j3G/D99rnnNpNgEDTcOGqNiSTLBtBRKKsbG
dm8qcVkBkSoTY+qxf3DiLtI15HvMEB7GNl5v2SCo/lwU+x3hB6pKt1FI6I083Lj/
2kSK/wP0Jw5Z8XOoKpis4oMcfu/UaC+dD1tdhVpStwcSBkXQXk1rTKbMRtSWrUle
IfV0U43ZnTFYCyZ6avdyzYoezm/UTADMAqa3TZaMIvoeK/EWLQDajNR5FZkPqqEP
H3wrJJuKgqqDdgFCsfZpqYquwjNcZ2LQlVaMEK4Jp3ws0WFYKUd/jQYRCzNIi56X
Rn1C2paUpI6ZxTDWUXLp6Si8X8wpYPH/Uq5gAEiUaKTh74Cp9F59Fwbl2DClcumm
AR+sBnKvWbpY5sWsRESL
=apjV
-----END PGP SIGNATURE-----

--Vy6UCbb9EK60RK4A--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
