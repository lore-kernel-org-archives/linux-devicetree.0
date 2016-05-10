From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 0/5] clk: bcm2835: add flags for mash and parent clocks
Date: Mon, 09 May 2016 18:05:41 -0700
Message-ID: <87h9e6yb6i.fsf@eliezer.anholt.net>
References: <1462463608-22940-1-git-send-email-kernel@martin.sperl.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462463608-22940-1-git-send-email-kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org writes:

> From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
>
> Allow flags to be set on a per clock index basis, which control:
> * the parent clocks selected when not setting clocks explicitly

I don't think we need this other than avoiding PLLC.  What else do you
want to filter, and why?

> * the clock mode with regards to integer only or higher order mash

Please provide justification in the commit message explaining why there
is no obvious mash setting to just implement in clk-bcm2835.c, but that
that a better policy can be encoded in the DT.

Overall, I'm skeptical of this series.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXMTPmAAoJELXWKTbR/J7oxKgP/0xD2f60vjRKnNaDmmIunYGF
Pb3ViIdWgEL3A3t9vzAkmap8DS29wBiX7rTB4h0zVy2Ps5y1T+1KChJQb662vk+q
7CqWfdx4WIkSk0fQ/HBB6wKmOWmZvzo/3z9tZN99syvhYWHCqkhdnQC6xkQ7WMBz
avZMSB9JPRKjR55tbTToqLCv+/4g7zkChnnV83RvedsiOvxHGlZyZgEy5mD1B2OY
c6coqZPIIDpcl77WpYCY+uALwvNuVRPGdh3/9nZJeyRsDn9UCFa70E9Z7PHOM1PG
V6iuuHZuLvpgJqM6zPSFtX+ALZCj1+T3Y4NIN7vxc0Au1AO+MOiuLUurMvq3Nz9D
VJ9GgKXddAOFwHGF2L+C0ovFNBx97CRx9c+yydtdr4RTZaZgy8YsYnBmHa2sNTPY
K7jk6ROMTxhIXrmLEkP3PwiIVQOAy+AzrSBKT7nGuJi4K5RYS9rDYeRH3sBfdVmX
AzgouCpWHzxNV/Rn1qksM/t8EXvr0JYkkW5XTxVdDajznvU03sUNQKkwvOEBdaT0
aVn7Nfusq+lZjra8EyE+IsQ/JsA8RuIjo1ulZ0NAusM/rmsKgWSBnZ5d7WQfbOP+
Al/SqO5GeqMdYRb5modiylkTKdOKL7whc4keUrLOXqOc6ngXa1W4rpUWUljebqgG
NdsfvNW+LEoLAjnMxFvE
=/GE5
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
