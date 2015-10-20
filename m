From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH RFT] ARM: bcm2835: dt: fix memory of Raspberry Pi B+
Date: Tue, 20 Oct 2015 01:53:38 -0700
Message-ID: <8737x5ncod.fsf@eliezer.anholt.net>
References: <1444942124-23122-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444942124-23122-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> Since the Raspberry Pi models differ in memory amount we
> better define it at board level. After that we are able
> to fix the memory node of the Raspberry Pi B+ .
>
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
>  arch/arm/boot/dts/bcm2835-rpi-a-plus.dts |    4 ++++
>  arch/arm/boot/dts/bcm2835-rpi-b-plus.dts |    4 ++++
>  arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts |    4 ++++
>  arch/arm/boot/dts/bcm2835-rpi-b.dts      |    4 ++++
>  arch/arm/boot/dts/bcm2835-rpi.dtsi       |    4 ----
>  5 files changed, 16 insertions(+), 4 deletions(-)
>
> This patch is only compile-tested.
>
> diff --git a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts b/arch/arm/boot/dts=
/bcm2835-rpi-a-plus.dts
> index b2bff43..c08dff2 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
> +++ b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
> @@ -5,6 +5,10 @@
>  	compatible =3D "raspberrypi,model-a-plus", "brcm,bcm2835";
>  	model =3D "Raspberry Pi Model A+";
>=20=20
> +	memory {
> +		reg =3D <0 0x10000000>; /* 256 MB */
> +	};
> +
>  	leds {
>  		act {
>  			gpios =3D <&gpio 47 0>;
> diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts b/arch/arm/boot/dts=
/bcm2835-rpi-b-plus.dts
> index 668442b..b4a1e56 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
> +++ b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
> @@ -5,6 +5,10 @@
>  	compatible =3D "raspberrypi,model-b-plus", "brcm,bcm2835";
>  	model =3D "Raspberry Pi Model B+";
>=20=20
> +	memory {
> +		reg =3D <0 0x20000000>; /* 512 MB */
> +	};
> +
>  	leds {
>  		act {
>  			gpios =3D <&gpio 47 0>;
> diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts b/arch/arm/boot/dts=
/bcm2835-rpi-b-rev2.dts
> index eab8b591..e6ccfab 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
> +++ b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
> @@ -5,6 +5,10 @@
>  	compatible =3D "raspberrypi,model-b-rev2", "brcm,bcm2835";
>  	model =3D "Raspberry Pi Model B rev2";
>=20=20
> +	memory {
> +		reg =3D <0 0x10000000>; /* 256 MB */
> +	};
> +
>  	leds {
>  		act {
>  			gpios =3D <&gpio 16 1>;
> diff --git a/arch/arm/boot/dts/bcm2835-rpi-b.dts b/arch/arm/boot/dts/bcm2=
835-rpi-b.dts
> index ff6b2d1..bfd917c 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi-b.dts
> +++ b/arch/arm/boot/dts/bcm2835-rpi-b.dts
> @@ -5,6 +5,10 @@
>  	compatible =3D "raspberrypi,model-b", "brcm,bcm2835";
>  	model =3D "Raspberry Pi Model B";
>=20=20
> +	memory {
> +		reg =3D <0 0x10000000>; /* 256 MB */
> +	};
> +
>  	leds {
>  		act {
>  			gpios =3D <&gpio 16 1>;

Seems like a good idea.  The closed firmware passes us an edited
devicetree with good memory fields, but I don't think U-Boot is up to it
if you chainload it.

However, isn't the rpi-b-rev2 the 512MB variant of the rpi-b?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWJgETAAoJELXWKTbR/J7o0KsQAK0sVOPabqxtXOzLpufRUJQ7
ipLoOobM41VBrFhSk8QbcfmAXIWhNeRKfZTXRyQSlfqZgOpeeUHQTwiPcvB8P6p0
MVX+jDG7t0Zm9beTZ5YBuwwUlA6d+jNVXZlGOqR5NtFuRdkDX9uUa2r/hImVjWw7
DwC6wOj5rxEwiDrODf1xIFdnQ/SitmB7R+mrE3mz5UsULyuo3LxNEWjJnvJ8EFsR
hSdlum2iSkXivKACqljDmc9QitfB425+HUxnnZX7A4zzOi8UfzIfX36dmaZjuM5l
d+XHnJuU76Ai5F5GNZK+StKRJYaPtZZgtyV+jhXVn/gG7GfykKs+KFU8e1V1/TIj
cxKo8P8bOYiN+TMfR3mQB2bpvKleC1zZNbAXNzws4gTcU62H19WcOWRJOjSDvtpS
2uHjWTVaFxWQfJfUN8qrBwMUgFs2mDD2mq+sYphio0NeWn+5dat3B16fyaIMgA1B
X6n4jJz8a9rPUQO91nuG9+H8za+x/MUz9We+DgiIjeQU3DyozZxoD0+GLPktheEw
M11EofecKCnFkUrGbgaVu7TLADWFI2iagxjECR1ohjMWpJhmU1iobPL64b49XdFv
bDs95YVwNpSJ1bpBsMVJBuVG+7I1DWzcr6ZHmzJUf8ntBLt4x+kngIwEEFy1L/+q
0pmPl0qQNSMimBnaD+Ci
=nFEy
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
