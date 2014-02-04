From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] clocksource: sunxi: Add new compatibles
Date: Tue, 4 Feb 2014 09:45:21 +0100
Message-ID: <20140204084521.GH25625@lukather>
References: <1391348280-9484-1-git-send-email-maxime.ripard@free-electrons.com>
 <52EFC573.2050302@linaro.org>
 <20140203194505.GF25625@lukather>
 <52EFF96A.1020302@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QDd5rp1wjxlDmy9q"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52EFF96A.1020302-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--QDd5rp1wjxlDmy9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 03, 2014 at 09:17:46PM +0100, Daniel Lezcano wrote:
> On 02/03/2014 08:45 PM, Maxime Ripard wrote:
> >Hi Daniel,
> >
> >(Adding DT mailing-list in CC)
> >
> >On Mon, Feb 03, 2014 at 05:36:03PM +0100, Daniel Lezcano wrote:
> >>On 02/02/2014 02:37 PM, Maxime Ripard wrote:
> >>>The Allwinner A10 compatibles were following a slightly different comp=
atible
> >>>patterns than the rest of the SoCs for historical reasons. Add compati=
bles
> >>>matching the other pattern to the timer driver for consistency, and ke=
ep the
> >>>older one for backward compatibility.
> >>
> >>Hi Maxime,
> >>
> >>is it really needed to keep the old pattern ?
> >
> >We agreed during the ARM Kernel Summit to consider the DT as a stable
> >ABI.
> >
> >While I'd be ok with removing the older ones, that also means that we
> >would break the boot of newer kernels with older DT, so yes, we
> >actually need to keep the old compatibles.
>=20
> Thanks for the clarification.
>=20
> So these old compatibles will stay there 'ad vitam aeternam', right ?

Except for what Rob told, yep, that was my feeling, but Gregory and I
seem to have a different interpretation of this rule :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--QDd5rp1wjxlDmy9q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJS8KihAAoJEBx+YmzsjxAgTckQAIhIFkrzsjEw7ozksj4pMYmk
EwwfKhqGZ+mes9QCrVonbvDguetTNZBz9kvs4fZKTlv07Kv0HqLbLIN2nh5LYQRQ
uZ+IrVkNBnuc5nx/Dop4f6IiIQjicdZkCSOUqTlZuwx/m0XvWCQq0l9g8Z30HxNa
UYijKnJmlbhNIxl0py9PfaPNi7kZ2Znz9nDlvLdT+uTEu0SPPMu+Ds9Zy+/clXLv
iKJAFdXoKEqV/pFbCaHJ9LjqN2IiWbp9P96AXTRCRkKMGqmtXcSsxq2KDQZKXKL/
kPQ/sVBoQIZd1M3I5oazsFFkR4IJmaCsTMA+9yw7YTdYbqZf0cTdUjiixdWFzgbZ
eRbTSvUuWfPmNh6IOq+MhKWYcZvIQPA4PrLn9FTguQs/8dt352V32uKFuZ+A6TBm
Yyf/W4EmW1mQw3jEkae8Sx0kWqF2X65JaxTyR4U8eSTcyojXRBZGHlqgAqm0oxPY
nbIuPEeXvs36PtEtq1RLaGeffbTEivW8NTE6oDOYOav2HzUu1OhYJXua2F3Dy1Rr
RLQv6woI021/XvoPGAB2f+70Fy9kbVlQil/E5Xm2RucEivA1KV1ZhIoIL5Gf2/Ap
Vz8bhsV3i+Wt8zUUotHjK1okQH3a+SKA/OLq3k1OQOlBd6/AiBHglrBwF5fGN2ka
xEvINXUKr0skKki4QqUa
=PnWA
-----END PGP SIGNATURE-----

--QDd5rp1wjxlDmy9q--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
