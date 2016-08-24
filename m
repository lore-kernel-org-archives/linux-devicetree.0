From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND] [PATCH v2 2/4] dt-bindings: Add jdi lt070me05000 panel
 bindings
Date: Wed, 24 Aug 2016 13:45:34 +0200
Message-ID: <20160824114534.GA3169@ulmo.ba.sec>
References: <1469978126-925-1-git-send-email-simhavcs@gmail.com>
 <1469978126-925-2-git-send-email-simhavcs@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1204107071=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1469978126-925-2-git-send-email-simhavcs@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Vinay Simha BN <simhavcs@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Archit Taneja <archit.taneja@gmail.com>
List-Id: devicetree@vger.kernel.org


--===============1204107071==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 31, 2016 at 08:45:21PM +0530, Vinay Simha BN wrote:
> Add documentation for lt070me05000 panel
>=20
> Cc: Archit Taneja <archit.taneja@gmail.com>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
>=20
> ---
> v2:
>  * incorporated rob herring and thierry reviews
>    gpio to gpios, gpio to regulator using fixed regulators
>    and pwm backlight is removed, since it is controlled by
>    dcs commands
> ---
>  .../bindings/display/panel/jdi,lt070me05000.txt    | 57 ++++++++++++++++=
++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,l=
t070me05000.txt
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me0=
5000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000=
=2Etxt
> new file mode 100644
> index 0000000..613b76f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
> @@ -0,0 +1,57 @@
> +JDI model LT070ME05000 1200x1920 7" DSI Panel
> +
> +Required properties:
> +- compatible: should be "jdi,lt070me05000"
> +- vddp-supply: phandle of the regulator that provides the supply voltage
> +  Power IC supply (3-5V)
> +- dcdc_en-supply: phandle of the regulator that provides the supply volt=
age
> +  Power IC supply enable, High active
> +- vcc-supply: phandle of the regulator that provides the supply voltage
> +  IOVCC , power supply for LCM (1.8V)

I was just going to apply this and wanted to add some information about
how many lanes the panel uses, so I looked at the datasheet linked to in
patch 4/4:

	http://panelone.net/en/7-0-inch/JDI_LT070ME05000_7.0_inch-datasheet

and noticed that the power supplies in the binding here don't match the
ones listed in the datasheet. Granted, the datasheet is somewhat meager,
but it lists the following three input voltages:

	- IOVCC at 1.8 V
	- VDD at 3.0 V
	- VDDP at 3.0 V

This matches in part what the above binding describes, but it's not
quite right, so I'm wondering if the name for dcdc_en-supply came from
the board schematics and reflects the name of the rail on the board
design that provides this rather than the input voltage on the panel.

I think we should follow the names in the panel datasheet so that people
can more easily reference the correct regulators when using this panel
on a different board. I'd suggest:

	- iovcc-supply: phandle of the regulator that supplies power to
	  the IOVCC voltage input (1.8 V)
	- vdd-supply: phandle of the regulator that supplies power to
	  the VDD voltage input (3.0 V)
	- vddp-supply: phandle of the regulator that supplies power to
	  the VDDP voltage input (3.0 V)

Any objections?

Thierry

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXvYjbAAoJEN0jrNd/PrOhtgAP/2ojaExDyOm7mq1pHw02/sR2
nQ3A8o18gmun86OkK8BmlcVFiQCPvCr9MTYBQ7BfxaqV1FpQ5QcUnso4YtO+V7JJ
OVEdr1LT9yMfH39wh5AzHkBiEQMOFzm36c/UyZ2Tu5v99298QQIReZH8f6DKvKjl
X5iFw9P0GMojOS1jLstlgdJ8GuhL4QVYteIbNOEMr6l7L4JzU1NkUfOTiEd/S/nu
BlALMF+6Po3T/OCqr6DdG4sV43+NPc5/IhQewHoyT3zt+uH3Bt1p1l7Z41KE1elk
g3Z/1UDyk+NOo4XDakVPUQpzX7BpRpcFKaPe7ZHU2bwWfCM9jtoiUmk0/JGMds7d
//fxLk0hMYXF2IPwjTsKqQE7V3wJXCNtFPV4eFU+ldMSH3kkTEIZQQGpoPXzUtsL
fr2aPLxp5qb0LWhHnn8287WPpejnDNj6pmzgo4/ffdbE/KL9gtBCe/LANvwfH+mh
77lEujnm9lydQvRTHMuE4MHPqgV4o8nLe00ERABLT6cj5ChroRJoaEp2LFbbNw1i
NeaATX2PxNvyTc81cDUh3z5Or4Bxr8Bj4b11dJJPpomyTM2dOsQBRDw4S2rYq7OY
uxsfAXId3v1SUyeCguTWdDYFoLgwM7/GUOFzReYS29RwEEsyTJLjh++O2opZQVhc
0UBV4u13Hd+lLk1k2P7R
=lhM/
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--

--===============1204107071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1204107071==--
