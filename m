From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH resend] ARM: dts: sun7i: Add dts file for the lamobo-r1
 board
Date: Wed, 27 Jan 2016 20:47:35 +0100
Message-ID: <20160127194735.GT4317@lukather>
References: <1453920105-7093-1-git-send-email-hdegoede@redhat.com>
 <1453920105-7093-2-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U7F658e60E1K4csu"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453920105-7093-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--U7F658e60E1K4csu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Wed, Jan 27, 2016 at 07:41:45PM +0100, Hans de Goede wrote:
> From: Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
>=20
> The lamobo-r1 board, sometimes called the BPI-R1 but not labelled as such
> on the PCB, is meant as a A20 based router board. As such the board comes
> with a built-in switch chip giving it 5 gigabit ethernet boards, and it
> has a large empty area on the pcb with mounting holes which will fit a
> 2.5 inch harddisk. To complete its networking features it has a
> Realtek RTL8192CU for WiFi 802.11 b/g/n.
>=20
> Signed-off-by: Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Sorry that I missed it :/

It looks mostly fine, I just have a minor question / comment below.

> +&cpu0 {
> +	cpu-supply =3D <&reg_dcdc2>;
> +	operating-points =3D <
> +		/* kHz	  uV */
> +		960000	1400000
> +		912000	1400000
> +		864000	1350000
> +		720000	1250000
> +		528000	1150000
> +		312000	1100000
> +		144000	1050000
> +		>;
> +};

Have you used the default OPPs and it turned out to be unstable, or is
it just some copy / paste from the FEX file?

Thanks!
Maxime=20

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--U7F658e60E1K4csu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWqR7XAAoJEBx+YmzsjxAgRRYQAJgo2//AVSS+ubJapk0Z+Taf
huz8h6VGPvy8nbsJ/y2WwiPB1ffLh7jfmonCeZqFyp0BVWBW+alvuwqrSZzhoHVo
1Cz3kL8anNOlhRHC51ZgNAGLlgYfTWZcJ7FOarxHTLOhuw6Qjke+iEEj94VNopgN
p4zOq1pxuMlhM77WpHmZcDPifdO+n3nvHo47TI8dSb5//PVNH6z7b8ZhbHYnRnp0
nA4hK6x8aKSGfIM/twR3QDQGAG9Ezg2Owj5sAyQAErbRz12ywRXa1VlCXGb/T+Q4
l+7Ls5ID8IppxOIfyiWEqt28qZzMThju3VClt0MCsOicUXoHqtRqlbqi3dNRGDAB
tq33sffxjZTs410tA6AmXVo0lA59bQx/oocn03QxowZYeS0AVATG9L8AGLn2MlDg
Hru5Rtf5Agq0ImJhNd41cp7Z9fN0KfUmisUF2Ls96V3pOJQZIw5TFbR6MOObz3DB
uYk3MmcApWGEdkQo9dTo+7K51kBmx+HqFFXKRDyArb6yPDKxArnRG9irNHBPbnOl
raCQp0VQOaEQLAwlCKaN2fr/WiQ43KJSy923uiZc1FtdfhnafvNs82HKwmKXcQLg
NLLekVIHo1S4TYRWpZJZf+r4RBhOa211HtwrQjKXaJ0yMo9ZEQyKcAN9PmYa9oKG
PJEMqQ5O4sDEvRup8uBr
=kuQE
-----END PGP SIGNATURE-----

--U7F658e60E1K4csu--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
