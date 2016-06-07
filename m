From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: sun4i: The blue led on the Mele A1000 is a
 power led
Date: Tue, 7 Jun 2016 23:24:19 +0200
Message-ID: <20160607212419.GE14179@lukather>
References: <1465129393-22379-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IU5/I01NYhRvwH70"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465129393-22379-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--IU5/I01NYhRvwH70
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 05, 2016 at 02:23:11PM +0200, Hans de Goede wrote:
> The blue led on the Mele A1000 is wired to light up as soon as the board
> has powered (it will be on while the gpio is still in input / floating
> mode), also its location on the top-set box clearly signals "power led".
>=20
> Until now we've been treating this as a generic usr function led, which
> means that when you plug power into the top-set box, the power-led lights
> and then turns off as soon as the kernel loads, which looks wrong.

I'm not sure I understand the relationship between usr vs pwr led and
the fact that it's disabled.

> This renames the led from a1000:blue:usr to a1000:blue:pwr and marks
> it as default on, fixing this.

however, the default on might. Is it just a confusing commit log, or
am I overlooking something?

thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--IU5/I01NYhRvwH70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXVzuDAAoJEBx+YmzsjxAg1RUP/0f4pLc1bLRT0N8t6VdYiBxy
VZsBmH5KirAdTzMeUlWfQiltrD70cppOTWh/AELuG7xbNnikChWU/oTRBoEyQeSj
1BkZixnDGgxHr00hfrejsb/V4aJdhnlopJoZ2WFhPbsnrqwGOnReP7bACJKh4E2m
il99jZRPZ1+It+nalgrzAu6wjCZpITEIPaHCijRA01T3t4u4FCy8o+BnG1+y4NIk
y3jXctCpg223CMAbD2ndJ4KcdkxOSjWqqp8XtZ5HX4MutLUR9ox27VcJo+kv/jdG
Ooajyl6AcujiHoDBKnfqbU8ZSEVxjvxd1TTp9zVqoda0AcfMUoZyedbA7kmHU2Sl
PFnKQ400Lxg6xcBxyWwl1ICu1ddMrkuK8YSgytjbmIw2XICCZEFQECjlnMZMFCJi
UVCm0B6co1Brjgnr8+x2fxGwEQ14rEvg5hZ8nNMKbazOpbcpT4pg1jMKfUIlxD5W
ZawbClPN5pXOfh80pBYD5mCc5/wo7d71/lPyq38at5dS9w8Sl8n3HH4EnGReYC7h
5Eg5RLrT/Il3yFrFKr5uGbsRfZhylcAtgKMoh3XRFsgL7f5cazHPnzCjt3iDUMqd
GumPJmHLg/vk99TfdqNpLTqh0LIbL6vw90S9/N2V7BN2KUmBakrBoHAKb156FDKJ
29FxAgAuREJ14f/nzBWW
=JlPa
-----END PGP SIGNATURE-----

--IU5/I01NYhRvwH70--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
