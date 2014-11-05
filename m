From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v1 3/3] usb: phy: add device-tree support for gpio-vbus
Date: Wed, 5 Nov 2014 13:31:26 -0600
Message-ID: <20141105193126.GN6548@saruman>
References: <1414951910-16075-1-git-send-email-robert.jarzmik@free.fr>
 <1414951910-16075-3-git-send-email-robert.jarzmik@free.fr>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XLsjFikA86nwwlhe"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1414951910-16075-3-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--XLsjFikA86nwwlhe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 02, 2014 at 07:11:50PM +0100, Robert Jarzmik wrote:
> Add device-tree support for the generic gpio-vbus driver.
>=20
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---

I would rather see you converting to a fixed-regulator with phy-generic.

--=20
balbi

--XLsjFikA86nwwlhe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUWnsOAAoJEIaOsuA1yqREYwAP/1U4D5soJdJY/jy5w+c/nUvr
Nja+uVRUWtG7Zh2SSLpu85pgPxbqVe7/snKlEqq3fSYJL6sfCTI48MOs082cRCjh
pSDxMWYXHsQNDHtJZde9+sTSntqRfItjuoqjY4OhWS14/gv7jOiTS0aFrHlJNwR5
UIkcHwJ3QcvkedIVbrAi0QqEy8GMnYD98EVp+pTivPp5DQT7ZUXMR3mMAX4TizBP
0LU5FQL85r6l1Cu/zGiWo5FcLbK5kIgacvCUrczv6yuyRtf0WAIe4KmOxH1ASdsF
4JpG8uN0CJXkmrJdmi57nI4DIt7tTmVowYMXO6yJCPGYtF7aKcNXBDv7/+m5wMhD
1QRW+MMmBiWwc1o8k2+x0FA2EY0vCDZbIn4kyhF6KgSKMwvpWe5MFWHpo56dGN4j
aYLrNqcRMkqg5H3UMpT23Ps5Ic57gMbDnjJfEGG8E5JvaIJTCcQPN6n8k3m3DFkY
ytjtZ1bxZ1xDpIc/1WyIIpcK1lymRpm5GdNAWGzVKMUwUCzAk+V/bm9kFw5I3P6W
psbrQgCFux9DJjNaszoT6a7f/LcYkEbBDKeQ+9xjVik9k6sO+giWWpJ8eAIs8fxT
z9Q1D3OlORqRPPqL5YSpKRh5fXMu3fASAmCkouyWTry8K4oxMOhnHoORQaDD6aN0
IvwRVoLs4MjcvUG24s+h
=p61d
-----END PGP SIGNATURE-----

--XLsjFikA86nwwlhe--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
