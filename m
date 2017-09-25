From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: bcm283x: Fix console path on RPi3
Date: Mon, 25 Sep 2017 14:48:45 -0700
Message-ID: <87o9pymoua.fsf@anholt.net>
References: <1506064554-4991-1-git-send-email-loic.poulain@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506064554-4991-1-git-send-email-loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan.wahren-eS4NqCHxEME@public.gmane.org, marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Contrary to other RPi devices, RPi3 uses uart0 to communicate with
> the BCM43438 bluetooth controller. uart1 is then used for the console.
> Today, the console configuration is inherited from the bcm283x dtsi
> (bootargs) which is not the correct one for the RPi3. This leads to
> routing issue and confuses the Bluetooth controller with unexpected
> data.
>
> This patch introduces chosen/stdout path to configure console to uart0
> on bcm283x family and overwrite it to uart1 in the RPi3 dts.
>
> Create serial0/1 aliases referring to uart0 ant uart1 paths.

s/ant/and/

> Remove unneeded earlyprintk.
>
> Fixes: 4188ea2aeb6d ("ARM: bcm283x: Define UART pinmuxing on board level")
> Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  v2: remove serial aliases redefinition in bcm2835-rpi-zero-w.dts
>
>  arch/arm/boot/dts/bcm2835-rpi-zero-w.dts | 2 --
>  arch/arm/boot/dts/bcm2837-rpi-3-b.dts    | 5 +++++
>  arch/arm/boot/dts/bcm283x.dtsi           | 7 ++++++-
>  3 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts b/arch/arm/boot/dts=
/bcm2835-rpi-zero-w.dts
> index 82651c3..35ace1b 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
> +++ b/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
> @@ -22,8 +22,6 @@
>  	aliases {
>  		uart0 =3D "/soc/serial@7e201000";
>  		uart1 =3D "/soc/serial@7e215040";
> -		serial0 =3D "/soc/serial@7e201000";
> -		serial1 =3D "/soc/serial@7e215040";
>  	};

I think these lines you're removing are what would have got us serial
output on the mini-uart on this platform (which wants the same serial
setup as pi3).  Instead of removing these lines, shouldn't we either:

1) Replace this entire aliases block with the same chosen {} block as
   pi3

2) Replicate this block on pi3 as well, for consistency?

>=20=20
>  	leds {
> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bc=
m2837-rpi-3-b.dts
> index 20725ca..f1c0811 100644
> --- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> @@ -8,6 +8,11 @@
>  	compatible =3D "raspberrypi,3-model-b", "brcm,bcm2837";
>  	model =3D "Raspberry Pi 3 Model B";
>=20=20
> +	chosen {
> +		/* 8250 auxiliar UART instead of pl011 */

"auxiliary"

Thanks for your perseverence on this series.  I just want to make sure
we don't break the new pi0w stuff with this change, or I would have PRed
it to -fixes today.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlnJeb4ACgkQtdYpNtH8
nuhAyRAAjQRnhXwbx6t12HAFxOcKUXnzei6wG3zsbLyZ0CvvnmufChFSv8Ljm7xk
vU66S+PZQ3e6up2CK64xyDnJ8W7vLVtQmGlOznlFRwQwc+Y0osOue5eugLJzVK0T
gzuWqHSJVIu5Pg09F+z0XE0hxAS+wNVXmKBWwvax/nY9g4C3U1w3l6iKWDGtAR6W
M3JgGtvVnvkng27P022hWKi67NjofrSy1X/GNz8CXgDG4xROHOCJfdvIZYApW040
uz6OVObXwoO9KWT1O4nHROD39w8syHqEonO5Zw386xIGDWEmmKHSKmgmw+pW0O9G
AGC7oxQJBcUdDXp7phssBruXuQQwGZJmPekSgtKr3Wnj8b+0/E/6ncvHFfcKID+3
GlSGRoCrLMZjvnLcQwgE6TldhamXEYwFWVXLvSEhjgRBfrztMc+S+EoPkcPfg3O7
/9kVMtUZqigmScJ7tvYo3yRcyINwFblZzRfmsoTrWUOr5kCh1rnOl6OM/nx+tM2v
84Ev/pRx0mtrS1oQga33ZMyzYxu2UPiq/0wMVP21Agk0qsQk98IQIMYPsXIYy+d5
EmfgYQjQGtjCwCyJnZ++gFxoMwKmSi7HxID67EYafFtb13O5yD0zqd79a14i+cem
RDh00sdJ5Y9rk54gF/XGjfzVyiNVeyOjBvOKKkI7Q+HLwo5aiVA=
=ZyyX
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
