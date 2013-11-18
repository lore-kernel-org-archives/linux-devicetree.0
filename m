From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
 better?
Date: Mon, 18 Nov 2013 17:06:28 +0100
Message-ID: <20131118160626.GN26046@ulmo.nvidia.com>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131118122644.GA26046@ulmo.nvidia.com>
 <20131118134022.26EE7C409EC@trevor.secretlab.ca>
 <20131118135727.GD14306@sirena.org.uk>
 <20131118152920.GL26046@ulmo.nvidia.com>
 <20131118155022.GB28334@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GEn4szYucjS2InE7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131118155022.GB28334-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--GEn4szYucjS2InE7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2013 at 03:50:22PM +0000, Mark Brown wrote:
> On Mon, Nov 18, 2013 at 04:29:21PM +0100, Thierry Reding wrote:
> > On Mon, Nov 18, 2013 at 01:57:27PM +0000, Mark Brown wrote:
>=20
> > > You'd need something class based like USB, there's such massive
> > > variation in what the hardware is trying to do and the tradeoffs.  A =
big
> > > issue is that especially with I2C many of the devices are primarily
> > > analogue devices implemnted in larger processes where the cost of add=
ing
> > > additional digital logic can have a noticeable effect on the area and
> > > hence cost of the silicon.
>=20
> > My comments were mostly regarding the interface controllers. Those which
> > generate the same bus transactions but need different drivers on every
> > SoC. I suspect that the same costs don't apply (or at least not to the
> > same extent) to SoCs.
>=20
> Oh, right.  In that space I suspect you'd face apathy on the part of
> vendors for switching away from their existing validated and deployed
> IPs - probably the best shot would be a freely licensed reference
> implementation that people could pick up if they wanted.  It's plausible
> that some of the vendors might do so for SPI where there are a bunch of
> chips that don't have DMA/FIFOs yet and so could possibly benefit from
> performance and feature gains but without that sort of benefit it's hard
> to see what would be persuasive for the vendors.

Part of my point was that you could possibly still use the same IP with
only a modified (standard) register interface. That way no licensing of
third party IP would be needed. You'd only need to rewrite parts of the
IP to make it look (and behave) like the standard one.

That's exactly how 16550-compatible UARTs work, isn't it? Or even the
way that USB (EHCI, ...) work. There's a standardize register interface,
possibly with a way for vendor-specific extensions, but the interface
itself doesn't need to be licensed, so there are no additional costs to
supporting the standard interface. There are only the advantages of
being able to reuse a well-tested body of code.

Thierry

--GEn4szYucjS2InE7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSijsBAAoJEN0jrNd/PrOh3RUP/jvbkCm4NPn4LJP8UJd+qZmj
u8+d43tdrS2Lf9qc6C4V9o/zt3amQ1B24dF+PWWh/wwjOEH1jTqj7cveq0QLuycP
SjgO+r04lvw40Ih5jJ8CsEJ/Qkj1e0I/x46OJ1DH0QrebgoRIs41tpAIEGHGxiKo
n1FW3LTg/mOgUiQZ/w0TPd4Ya45JsThzO8ovp85Flq9lm9EuImNVDLnEoJf5m0lV
DA7m7G3To2yad/aFkZ1/lcQGLoueKQ8hwdRfF3M/LQhgFlfas2D7pMJDzbUKWu3D
n58oymVzlYbzhjSDBQ+KLWZBc1bm8ca4/u4ZxtMqiZxz0Hiee6myzNpgMuebbNkO
kr+Lkh/yBLqDxp7OWCF8yFfl5DPVcrYB6HsZ12WgMWLzuTAWBidYuty4C5+RHqvY
PAzwzCuZNJh9wSkUAfv1UIb/TXjCR0sVEbCdypl6X5B5no8cgda43kJN1aYy9nFG
cs+6OySrl8PrpzpPKnsqlZqBGByVdIWXFVR/cF49BpcTBaYFauN+9laVO3tC929v
l0u1ZTlImf+fpKt4mGjJaAn17YlKzcewPBux88sFC4MmizC9mrNOsaTsZGQK5aAh
C9NkQSPtWSbyilva23MMZ/O4AU/Pc9gDaS3HRralD4JzSC38adQuXYmUoDYC9AxR
TeuV51Pcmw7i57XeqobP
=SVX6
-----END PGP SIGNATURE-----

--GEn4szYucjS2InE7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
