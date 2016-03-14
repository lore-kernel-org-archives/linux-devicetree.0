From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5 v10] dt/bindings: Add binding for the DA8xx MUSB driver
Date: Mon, 14 Mar 2016 09:00:49 +0200
Message-ID: <87fuvtbl26.fsf@intel.com>
References: <1457684989-13318-1-git-send-email-petr@barix.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457684989-13318-1-git-send-email-petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b-liu-l0cyMroinI0@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org> writes:
> + - ti,usb2-phy-refclock-hz : Integer. Frequency in Hz of the USB 2.0 PHY=
 reference clock,
> +     either provided by the internal PLL or an external source.
> +     The supported values are: 12MHz, 13MHz, 19.2MHz, 20MHz, 24MHz, 26MH=
z, 38.4MHz, 40MHz, 48MHz.

why isn't this an actual clock phandle ? Driver could, then, use
clk_get_rate() to figure this one out. You could just use a fixed clock
here to satisfy the clock API.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW5mGiAAoJEIaOsuA1yqREhZoP/ArP0vz3cF/V1pE8hY9XiK5t
m2I+c2yPlIANlrmkGJ1Y25+Axk61WUt5PY5qgscT/loC4m2OApiyos4hyZTOnELr
97nYN1q7iq528HUqHFGSlUGSHt2q5XSmzrGaOMzhEVPGrbHXMkBpWzfQgCsUNNlZ
RWMXGQYyBBVwit/dLRxLGnw/rCHJW8lyYF1TFW2Wge70ujFw5HMgJBa8l1yUU5z5
SuiNyWQqJE+oi84qm8d5AdJedhnURK3P1vTChvs6K59MRSr3DeVvtoHPOkeagTKv
HH5AyrCyaaiRlAW6NcL3YeMZnmUHFeRVXdBle7XsDWYWF89wjzRL8g/1+OrShEHz
qYzsHeVljVUegoSkdu/XUyYxHosB/k0LGQbNHzyfmAJMleY+WsqrNgQjsl6rKosz
y7iKuXOEZheQGIy1aUhoEKg7ab99RELB9hcZY6P51cUHYI5MGgaRYmfl4iuYO4Nz
2PV3UHwAdvYiyAteUwUq6H84Ww75EQjClnTsioJza7tmihLovU66dxIvnc0PIZOk
QybPkFC34JGZ+H5ebYFkhuX1HemdkGY0dAS90pZMMCkZXyzQSnlOamS6NNGAOaK9
Tv6XaM1vYLtiDFRt5hzWfeMmd+FwFp0d8mobEcV47ViaFH7ZYwFZWsLTz5ywwkpH
SMUWY7/VeDw267vYTgPr
=hWS9
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
