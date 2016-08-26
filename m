From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: dts: sun4i: Disable ohci1 on ba10-tv-box
Date: Sat, 27 Aug 2016 00:32:10 +0200
Message-ID: <20160826223210.GJ3165@lukather>
References: <20160826144226.29969-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7AwgMNpd3VkAVXjS"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160826144226.29969-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--7AwgMNpd3VkAVXjS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2016 at 04:42:23PM +0200, Hans de Goede wrote:
> The ehci1/ohci1 pair on the ba10-tv-box is connected to an USB-2 wifi
> module soldered on the PCB, so there enabling ohci1 is not necessary.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7AwgMNpd3VkAVXjS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXwMNqAAoJEBx+YmzsjxAg1mQP/00AM32Tz+cStE5IsmH8bbrW
OPhJGVCyEJhd/guL3uCSe+ed4Yv4wza8VUAWSuB+NVhlgJdzx75aIMN+B9ErIojA
g3UYGIOy5BsMkAGIDGRoKXMF+0cd/U5ma+7JiTl2TNAa+KhmCQATt/aPnoLkf0/7
tw3J1apR3vPLZxX0ceMfElGg1I2y6OMGQbDlmqNNmA5URdQjRS6RRLwfMzfo4RZX
Zp8QtQO7u7T75W+w2lh9D2hiPEVSxufnThm9Jz1iS9194VA+nLAQYpAlNGjmsx1Y
yYyDlnVYcRwVS5WDweJaiKgBytjYGrgqrqN0TEg+QFFCNXPn842Q6XpU3wWRiPm0
PkinHrkSnjM8Kaw/I5b7jppOKM57wdTAONjiKyXN1iJS7M5oc+agfjBk7CHsrDao
rsLRQlbIwyXqzdZaPxoZFfORljUhW1478Vpu2cKyuEYCL8ZnzXTS6IRj5L+qcu2y
XsWrC7S62r7FZgKZ0fW3iCC30CZ0baMP9vCy2lJx8Ge68Rr99uCS4p3Ig4kDSDVH
8n2g+C7I4CENrYvCVmrCF5x4+DPztoeoX/n1hEfho3jte41rUFa12ZQde/WwhLHg
JP/d+XvgbpaEthNzzhWbmFdDmg//o81Z1x7n83iStQS2CI0J3v3bL94ghbeB98OL
YcxyDvipn8RgMlA60ziJ
=URp+
-----END PGP SIGNATURE-----

--7AwgMNpd3VkAVXjS--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
