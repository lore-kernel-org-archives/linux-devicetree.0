From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/8] drm/sun4i: Make both display pipeline work together
Date: Sat, 9 Sep 2017 17:41:40 +0200
Message-ID: <20170909154140.wmuh46kxamumyspz@flea.lan>
References: <20170908075016.18657-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="kfqkuj2vp7zlwfpe"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170908075016.18657-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--kfqkuj2vp7zlwfpe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 08, 2017 at 03:50:08PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
>=20
> Previously I added support for two display pipelines for the sun4i-drm
> driver. At the time we did not have support for downstream encoders to
> actually test the second pipeline, nor having both pipelines active at
> the same time.
>=20
> With HDMI encoder support now merged and support for it on sun6i in
> progress, we are now able to test both pipelines being active at the
> same time, with LCD output from one and HDMI from the other. Testing
> has revealed some more issues, such as component probing order. Also,
> we found out that muxing between the display backend and TCON was
> possible, and required for the second pipeline to work as intended.
> Last, the number of CRTCs provided to drm_vblank_init needs to be
> increased for vblanks to work properly.
>=20
> This patch series does a few things:
>=20
>   - Fix endpoint IDs so they conform to what the DT binding stipulates.
>=20
>   - Change the order the individual components are queued up.
>=20
>   - Fix how the TCON gets its ID when the backend-TCON mux is present.
>=20
>   - Support the input mux in the TCON (which selects which backend to
>     use on the A31/A31s).
>=20
>   - Fix the drm_vblank_init call and pass the correct number of crtcs.
>=20
>   - Add the cross pipeline connections between the DRCs and TCONs on
>     the A31, conforming to the DT binding and what the hardware is
>     capable of.
>=20
> More details are available in each individual commit. Please have a look.

I've applied all the commits, with:
patch 1 in our arm-soc fixes branch
patch 2-7 in drm-misc-next
patch 8 in sunxi/dt-for-4.15.

I have a minor comment on one patch that can be fixed in a followup
patch, so please have a look at my other mail.

Thanks for this great work,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kfqkuj2vp7zlwfpe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZtAu0AAoJEBx+YmzsjxAgglgP/0yWOo5Nay/2pXap4IklR1Z+
sBhkBRTO+Rnn0PujSmHE6CFOGLXKe6II3293UfquDmVRoIbszo7oyEn9aMIXxOuN
egne3dweEISSGMzUOlZqpT0nKltD+VGNMwkz/giUVI6EXfl5wLb0fumu9m9K7ZmM
b1o7jt4xx0mGuVWWcbPFtbl2UW0vMvlIzqaP4dhu/ZiydYVNUSHgzsAIyHw9JZpK
/8JIMnrRn1ZlxKbxO4RAbVjeBmCya36b5lM4fDA2sZzyB+Ouhf6nSabbUf5ITjs3
IFeL6hhB5Hgk8P2Oc7/juK5D7o6kIEkStXCiYJjmTkQ+uRr8mNQbB9rz36AhLqWo
VyitbVI/T2kKbLGhYvhg+W/R7H0L+IHQmtB6uWbKRD7SgGrePiTyrnCEHmWlDdFl
LncQdfvxiH48pKVvc+CavPkHnZvw/DPDd0m+Vd+On5MKTdQ26hRKeUOgeV7Om0Fs
QQwp4TPa1E+kZdGMmmCbtSxQsgDd9g6xgQ/x3A1vnA4bzaJ0Y1KkSKIp/SSXF1kD
o8yWNxoYdTKi6jKBjF4hm2QqamEhjnQWdG2kzBmZttCA7SwTTgAWY7o4fnjQhfjU
NM2+n4tfECiHLbj6TO0h4SYZstnJ1s03YrHgDM28C8/GyqhpadjKU5s0MTNSsWmX
HO869qiRUoe9QQUqyIeU
=Jsm0
-----END PGP SIGNATURE-----

--kfqkuj2vp7zlwfpe--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
