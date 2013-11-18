From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
 better?
Date: Mon, 18 Nov 2013 15:50:22 +0000
Message-ID: <20131118155022.GB28334@sirena.org.uk>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131118122644.GA26046@ulmo.nvidia.com>
 <20131118134022.26EE7C409EC@trevor.secretlab.ca>
 <20131118135727.GD14306@sirena.org.uk>
 <20131118152920.GL26046@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131118152920.GL26046-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2013 at 04:29:21PM +0100, Thierry Reding wrote:
> On Mon, Nov 18, 2013 at 01:57:27PM +0000, Mark Brown wrote:

> > You'd need something class based like USB, there's such massive
> > variation in what the hardware is trying to do and the tradeoffs.  A big
> > issue is that especially with I2C many of the devices are primarily
> > analogue devices implemnted in larger processes where the cost of adding
> > additional digital logic can have a noticeable effect on the area and
> > hence cost of the silicon.

> My comments were mostly regarding the interface controllers. Those which
> generate the same bus transactions but need different drivers on every
> SoC. I suspect that the same costs don't apply (or at least not to the
> same extent) to SoCs.

Oh, right.  In that space I suspect you'd face apathy on the part of
vendors for switching away from their existing validated and deployed
IPs - probably the best shot would be a freely licensed reference
implementation that people could pick up if they wanted.  It's plausible
that some of the vendors might do so for SPI where there are a bunch of
chips that don't have DMA/FIFOs yet and so could possibly benefit from
performance and feature gains but without that sort of benefit it's hard
to see what would be persuasive for the vendors.

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSijc7AAoJELSic+t+oim9OyoP/Rk5qwy7em/XMCJwdxaz0bHr
BtMsTtexzXbQsWABIbV2CirkbegoY/f6MVsOV3aISy6htZqdK8aX19IjRPXrwFdA
1/IA93UIU+RyS4bhJ59wcf+pr5e3iAlg3vTrlL8PZ6zBJSumqiEZmuryd3UpBtQa
L8+M30RkvQHbdRCANQStaf2B02sIfXLa2llFB0W45pa9VkhOftpMr0MwXELT/JKE
5BOqgTplTGBGFQyzNhKFmOBt1w3SlaXwp+YGE2ZxN19Lh6fCTJibDu98dviMLCqz
BMO9ruCtgDEbVSt/3O1v0C/6rqLbQZ3EUBMhscBjXHYTKg2e5BDIIXbYjrmyZ7Wt
ziiqmK2VB6oY2S5Z5yAqk4yItJ1MwmCbwz1jNiNEajAsJo3rBsInRP1y3AgJ29zZ
FDyzC5LFA1YrMHtKf8ARs/Onxb072af6oHkVutzLWA6YoRyzLlDY+mCPozxz8EtF
i45Pah68D+lIJ2CDVTD+WBCkK20GSVBHcw/ABit6smIfVMP2XjPzQMhghHbiHpqi
qr6i1aIUMX2SoQGkw2Rd1+obz+dvm5RptAvvvt7bvlxes8p49zs33tyRwa24VYsP
ZExyzHD/bJGEpLSbQhkG9R0U/AcHop4CzWz/EUD0+kLldR5pUe7XVcApkm2RZN6z
ZhHYL5EnTBAzoK78w8/1
=bpOV
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
