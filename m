From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
 better?
Date: Mon, 18 Nov 2013 18:35:02 +0000
Message-ID: <20131118183502.GP2674@sirena.org.uk>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131118122644.GA26046@ulmo.nvidia.com>
 <20131118134022.26EE7C409EC@trevor.secretlab.ca>
 <20131118135727.GD14306@sirena.org.uk>
 <20131118152920.GL26046@ulmo.nvidia.com>
 <20131118155022.GB28334@sirena.org.uk>
 <20131118160626.GN26046@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FRaepaAnLTQkJ4tS"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131118160626.GN26046-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--FRaepaAnLTQkJ4tS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2013 at 05:06:28PM +0100, Thierry Reding wrote:

> Part of my point was that you could possibly still use the same IP with
> only a modified (standard) register interface. That way no licensing of
> third party IP would be needed. You'd only need to rewrite parts of the
> IP to make it look (and behave) like the standard one.

> That's exactly how 16550-compatible UARTs work, isn't it? Or even the
> way that USB (EHCI, ...) work. There's a standardize register interface,
> possibly with a way for vendor-specific extensions, but the interface
> itself doesn't need to be licensed, so there are no additional costs to
> supporting the standard interface. There are only the advantages of
> being able to reuse a well-tested body of code.

My (potentially flawed) understanding here is that the register
interfaces for this sort of thing tend to be very thin - perhaps more
true for SPI which is extremely simple electrically.  Adding a new
interface therefore ends up being more invasive than it could appear
since assumptions in the design and validation tend to appear in the
registers and so changing the register map propagates through.

I do agree that it'd be nice to get some standardisation at some level,
I just fear that it's a bit late.

--FRaepaAnLTQkJ4tS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSil3TAAoJELSic+t+oim9vFwP/3SLqzj4laAextkKD/rwl4O8
j0lGB+z3BtN7/2sI1EgjJKgEZQlRuBd61FZWScuXbeqQAE29qAR2j08bFFA4PGMg
XbOITjMrT9PLALW44d0gmJ6mpxWhHKudFXca9gPz67a+1aS8LOL+Os3moMUz92v+
CnKjxpewmtKChETniveZc9ovsGZf4uj3LyCXeABgG2BjMb6Fau7NqWf7ga6NWDU3
nlKcVzm3dOsOnk3B03PSQ+CYH/r/zkrQBpYLZHCOsd7NjXbYiQ1hGoTeOJC5c/XL
XQcxKO8lxpdKuTo5P1FfgJWIwtwZHewlNV0GSwuYzS/inkXZoyuoJjGmWTwkXSDJ
o4RwqesjAmuLRSeZcPqFEjlGSly+NoTJOTw100T2PnssXhvsJhDO7zFTLF4o8KeR
/oxP/a86aL9vKAa9u1GU8lp1cEXg71Ufqo8h8HiV+75Q5cKwiI3+RP8i3IQO86BH
M3H8HcOMoX348AzwDWB2t8FvYAIHYqDmHKKNYufIKy0Ry2f5Ke9XAIaD9Bvb8tH+
9+qPTmAWq1ySjzH/ypcrrYkonErrm5easwizHhIvN8qBjuVKi8cxcYzOsOlyfiQp
VHBbJwbrrGareqpBodAm5Yy7vnwm0TsdjoQL7AJ9RhpV3JAes6gZ8PRXpQSJ5wGG
QYQ3lmQDjcjDw0CRgP+M
=TVN4
-----END PGP SIGNATURE-----

--FRaepaAnLTQkJ4tS--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
