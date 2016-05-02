From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v5] ARM: bcm2835: dt: Add the ethernet to the device trees
Date: Mon, 02 May 2016 08:34:28 -0700
Message-ID: <8737q0iid7.fsf@eliezer.anholt.net>
References: <1462172811-24206-1-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462172811-24206-1-git-send-email-lkundrak-NGH9Lh4a5iE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, Olivier Blin <dev-RZzICDNEOQ/YtjvyW6yDsg@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org> writes:

> The hub and the ethernet in its port 1 are hardwired on the board.
>
> Compared to the adapters that can be plugged into the USB ports, this
> one has no serial EEPROM to store its MAC. Nevertheless, the Raspberry Pi
> has the MAC address for this adapter in its ROM, accessible from its
> firmware.
>
> U-Boot can read out the address and set the local-mac-address property of the
> node with "ethernet" alias. Let's add the node so that U-Boot can do its
> business.
>
> Model B rev2 and Model B+ entries were verified by me, the hierarchy and
> pid/vid pair for the Version 2 was provided by Peter Chen. Original
> Model B is a blind shot, though very likely correct.
>
> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---

Applied to bcm2835-dt-next locally.  We've already sent out pull
requests for 4.7, so I'll push it once 4.7-rc1 happens.

Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXJ3OFAAoJELXWKTbR/J7oHqQQALI9nEmmuDzvHe4hIibYrm2G
8UwtqQdv0pUz43/Du4gHKg/5LQNC6dxx0w1mjEPuRJKJJ5LZ4Dc9RkP/Kw09X6N7
y59lM1AnFnPvhKFftHJkHkEQsmeQWWtxRdi/oYtk1rWVXuvR2RyPGk2cVJREbWkl
X1Mo6BQBylQnvnC2s2LL+C++WkSl+iNHjpyK0MgnzijLWSFk5f4duAXNI/gbrhTE
WfqWqEqQkPxm+BufJtXkHJzuwhYuCM02S9qpS3ulnxwzGR84ACEw5G8QrPoVH9fn
wVi3vaSvHMUth0Zt3P9FCJKdNtxjIC51jg7AYZvMulXmWDBEaNMrJlPc8W//YRA5
ExLkA0InvDDJHBwWD3jlLml8kE1nUgOFMam2k6wyHjhoiZiwcrOiKYSu78B9X8Qg
vIoDRiG5lAjrP5CS5SNkFhg/oRc435ZDOJIJPDlAWLdUrMzSIgykqVYiUS1XZ7+9
4VzH5WyoBD/IlicHy4pzaGLj4LNaJ9bw/c/1JcyX9uWoPem1lj6zWbCQ2WFdC4Ad
sbaJvQk7mB7frihrnUCJokFgsfHcH0CQ6blkj/mOG2Clnyat+Q7+B6aMPJ6tBMwL
SKmFrofPZ15+RqEXV3/jtH6XGGbFqq7ONe0SHWdO0ey/MOsBZD2ey+buMdv/Ko3M
Ss+udq6+Zmg+tgvSJaKd
=yaGz
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
