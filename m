From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
 better?
Date: Tue, 19 Nov 2013 10:16:05 +0000
Message-ID: <20131119101605.GX2674@sirena.org.uk>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131118122644.GA26046@ulmo.nvidia.com>
 <20131118134022.26EE7C409EC@trevor.secretlab.ca>
 <20131118135727.GD14306@sirena.org.uk>
 <20131118152920.GL26046@ulmo.nvidia.com>
 <20131118155022.GB28334@sirena.org.uk>
 <20131118160626.GN26046@ulmo.nvidia.com>
 <20131118183502.GP2674@sirena.org.uk>
 <20131119091140.GE31504@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mlvFMpb4NrD3AMcD"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131119091140.GE31504-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--mlvFMpb4NrD3AMcD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 19, 2013 at 10:11:42AM +0100, Thierry Reding wrote:

> Isn't that the reason why PSCI and similar have been conceived? Even DT
> is a byproduct of those developments. What we've been doing so far is to

Right, but notice that PSCI is getting introduce along with ARMv8 -
nobody is deploying it on ARMv7 and below.  The new CPU architecture
gave a pressing reason to switch and ate the cost of doing so.

--mlvFMpb4NrD3AMcD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSizpiAAoJELSic+t+oim9q34P/3AcnaAlcHTCilQZdmhdsx75
IhHue/t8zTwmWbWTYk/kmE0TtcPAwr5FnpQcBGJJWxmWNtYmo3qTmOYqjXoixrF9
DkzGJz7cDaB5nu8nyV8xa3sSmgsCVDsV38e+G4wuqQd4PYBOKNw1zsuClme5/DBq
yECqWuiULSgaaehF4rwbGZi/MqWWQbZrvdq5qrb1KAficLQwXwW+eKRpvkbOnXT7
ZuTIb3N7N5glZlLOMfwosYte2NzHA0vsy8mwXKLWnnFLOJM4dpHv2yYpH6vz71bi
k9CFYihz6bKcvhM8/VrjrRkahhC0N9ZKctMzGuV76wZ8oKqSozhK+5mhbQtDx2J5
A3j+QVLSjuiNiT2c/XyS/irPKqkolraNaBBgfZByG9CjKdXmpt0fRsYLTgX1jvRk
DRWnmPW4iRriXjVjUoeCOi1BA13nkiF7sIQ4TrdpYVSiUXUeBu193Qzr9Gf7+GPH
V6Ql9VPSV+yOKoMl6KpLghxxVZttNNL5AuZ8daQqEtRbGrhaYsoW3Fhf5gNtpkdF
oz+kwACUjtXpoDyDRhq29rWT5lMcaVRLc06YEIN9OhTgS4STR8fLAoMmN49gsUbc
LqHgUIH8UUEfry8e9lz7XXDFvADFZf9hzuhYlCsKU0bEepAw1O1jwRmepfnbW69H
Gar4+BxQBhjoEYUPTnZ0
=Qaiv
-----END PGP SIGNATURE-----

--mlvFMpb4NrD3AMcD--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
