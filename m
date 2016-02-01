From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH resend] ARM: dts: sun7i: Add dts file for the lamobo-r1
 board
Date: Mon, 1 Feb 2016 07:33:59 +0100
Message-ID: <20160201063359.GF32462@lukather>
References: <1453920105-7093-1-git-send-email-hdegoede@redhat.com>
 <1453920105-7093-2-git-send-email-hdegoede@redhat.com>
 <20160127194735.GT4317@lukather>
 <56A9C804.9080503@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3yNHWXBV/QO9xKNm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56A9C804.9080503-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--3yNHWXBV/QO9xKNm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jan 28, 2016 at 08:49:24AM +0100, Hans de Goede wrote:
> Hi,
>=20
> On 27-01-16 20:47, Maxime Ripard wrote:
> >Hi Hans,
> >
> >On Wed, Jan 27, 2016 at 07:41:45PM +0100, Hans de Goede wrote:
> >>From: Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
> >>
> >>The lamobo-r1 board, sometimes called the BPI-R1 but not labelled as su=
ch
> >>on the PCB, is meant as a A20 based router board. As such the board com=
es
> >>with a built-in switch chip giving it 5 gigabit ethernet boards, and it
> >>has a large empty area on the pcb with mounting holes which will fit a
> >>2.5 inch harddisk. To complete its networking features it has a
> >>Realtek RTL8192CU for WiFi 802.11 b/g/n.
> >>
> >>Signed-off-by: Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
> >>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> >Sorry that I missed it :/
> >
> >It looks mostly fine, I just have a minor question / comment below.
> >
> >>+&cpu0 {
> >>+	cpu-supply =3D <&reg_dcdc2>;
> >>+	operating-points =3D <
> >>+		/* kHz	  uV */
> >>+		960000	1400000
> >>+		912000	1400000
> >>+		864000	1350000
> >>+		720000	1250000
> >>+		528000	1150000
> >>+		312000	1100000
> >>+		144000	1050000
> >>+		>;
> >>+};
> >
> >Have you used the default OPPs and it turned out to be unstable, or is
> >it just some copy / paste from the FEX file?
>=20
> Just copy paste from the fex file, let me know if you want a new version =
with
> the opp-s removed.

Yeah, if it works, please do so.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--3yNHWXBV/QO9xKNm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWrvxXAAoJEBx+YmzsjxAg65EP/RFJEhh5v1/LBI+cZnJn6XN0
jMCSYN/V/dObd/OWeANyHFvAZI8jRR5HBh2b2gsu07Z8KCrLje2fbdX08yOF3aGb
mp3EKDIpSDCobL9q41NNu5idqY3tnlx6G4p/nE0pG40y5NEah+xFOWcY6LrCwDKZ
ADkA9TBdjWL6yIzYGRYl76odHOfaiK/JBTw2i8shOmpTndwd9yEhV7tV7zj+mI4a
5IV1Y/hkfYmLmFhOYGVv6tJ6X2CA/7oPLs/VfzP9vMUDhvoC3T4EtHZiWUSqiKWj
njYd0fdVbSNZCUmFxWe/JZKrFnxfLAPFwHuemVf1pn9jzQzN07Wjvqsh+nJkTv7o
3+ZWVE3NPAblxvEJu7ueMOOByucNekIvGYoA+G8eS7JNtDEO7X4R5R0MrliEE2gc
0ARgDdeI6qc5VcVp7z6LhLItK5qalDaAV8a+JvmjwQRf0gHR2pvM9dzvSmfnapcB
6WkVsJwsrmrQ+5K2WgUUK1aCsuF0NNOw3r2W6YcsaFKjSVnoHvFYL1tTV5HfRL2V
3AnYKsLfSSR5X6W7JFxiNPP0Up7B+KWukrCZuVl1ERCZx+5H0oS6LyYxR3/eHzUo
1aA2Z9ovi7pEQszpj3zycwZK0PHg4OvDGPxhCD010BkY2MaRIq0io0cmXC3dh0/i
6UbveQvnejcRNNBmJsDc
=0PuC
-----END PGP SIGNATURE-----

--3yNHWXBV/QO9xKNm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
