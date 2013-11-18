From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
 better?
Date: Mon, 18 Nov 2013 13:57:27 +0000
Message-ID: <20131118135727.GD14306@sirena.org.uk>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131118122644.GA26046@ulmo.nvidia.com>
 <20131118134022.26EE7C409EC@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+B+y8wtTXqdUj1xM"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131118134022.26EE7C409EC-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--+B+y8wtTXqdUj1xM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2013 at 01:40:22PM +0000, Grant Likely wrote:

> Some hardware does that. That's what OHCI, EHCI, UHCI, XHCI, SDHCI, and
> similar are all about. It always helps when well understood hardware
> follows a register interface. It doesn't work for everything, but I
> agree it would be good to have preferred hw interfaces for SPI & I2C.

You'd need something class based like USB, there's such massive
variation in what the hardware is trying to do and the tradeoffs.  A big
issue is that especially with I2C many of the devices are primarily
analogue devices implemnted in larger processes where the cost of adding
additional digital logic can have a noticeable effect on the area and
hence cost of the silicon.

--+B+y8wtTXqdUj1xM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSihzDAAoJELSic+t+oim9UXUP/0zmvkLU6wek4M4FxEv+pecH
7NRnORW5wgLq2mJ7NRnRv//z6LijS2yGjjO4v+8Pe8/LcZ+lxQgvl4pqyfAvDC2C
/J8QdspVLe9kMctqflnNc0oJhDtep8FQRUccF2t95GUw2BBqVXyWjX/AAoPnV2p0
3BuC1BGHDR7Oqa5fgoXgRnMLUwvQ6KwTrTGXwIKVES0VkK1qhjMk/uOBdaRbt2mH
AJZpJqd41I00n71TtN0XzVxPUk3eoWGNkBvSX7mHHlTfVSkeDG90W56zVklYUGiZ
U2tiDNmdGIO7vbzT1N5VlalT7mnvXMLzrMJhmo3GP2sZ/SI7+jH9eYTxCZbOCtrk
r4yij8Jf3O/M1g65Died4vZIlVXsEdNyHbr9jagZ5BuhOUbilr0RTSsDcji7U33W
HvYuNypauwkpiAoRl+s1jIJ1aJ7gvguEnmPXQOewjhfbkMmIXxcLA2LLbiEAp0y6
9FiyRkyES2gAU7Iv70ktq7bax1lj5/nl6lWoaetZfyl71O3QCA49eKO2oL4NEzvT
Yo0jfPbq+s54ucwY9l7+8hrudOXxt9OKduuQSlqnKQXSMNwTfsz63jYnYToAO8FY
vrJaI9A0fYE9p51ViBn2LcfIlRi4Qx0SarjYh2ErWmvzBb2KBEuugMlVdno2Iv+v
mmoiXUs5F0ferkrn2V2s
=aMS6
-----END PGP SIGNATURE-----

--+B+y8wtTXqdUj1xM--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
