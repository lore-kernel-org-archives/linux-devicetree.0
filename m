From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] PWM: PXA: add device tree support to PWM driver
Date: Fri, 20 Sep 2013 09:58:20 +0200
Message-ID: <20130920075819.GC8575@ulmo>
References: <1379519982-7618-1-git-send-email-mikedunn@newsguy.com>
 <20130919122807.GH10852@ulmo>
 <523B2C0B.4050204@newsguy.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <523B2C0B.4050204-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Dunn <mikedunn-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org>
Cc: linux-pwm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chao Xie <chao.xie-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2013 at 09:53:31AM -0700, Mike Dunn wrote:
> On 09/19/2013 05:28 AM, Thierry Reding wrote:
> > On Wed, Sep 18, 2013 at 08:59:42AM -0700, Mike Dunn wrote:
> > [...]
> >> Only an OF match table is added;
> > [...]
> >=20
> > That's no longer true. You also add a custom .of_xlate() function.
>=20
>=20
> Is it acceptable to re-word the commit message in susbequent versions?

Yes, of course. The commit message should be an accurate description of
the patch. If as a result of review the patch changes in ways that make
the commit message wrong, then it must be updated as well.

> >> diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.=
dtsi
> >=20
> > I think this belongs in a separate patch so it can go through the
> > arm-soc tree.
>=20
>=20
> Is there anyone else or another list that should be CC'd in this case?  T=
hanks.

Well, the PXA maintainers would be the most likely to take the dtsi
change through their tree. Usually the mach trees are merged into
arm-soc, which then goes into Linus' tree.

> >> +{
> >> +	struct pwm_device *pwm;
> >> +
> >=20
> > You probably want to check that pc->of_pwm_n_cells at least 1 here.
>=20
>=20
> Well OK, but I didn't bother because it's explicitly set to one elsewhere=
 in
> this source file.

Okay, nevermind. It's probably fine as is.

Thierry

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSPAAbAAoJEN0jrNd/PrOhAqIQAJ4D+83aWBs7hzIHEvrBBV5b
QdBw0wWlT53bEbieV7+9TbHdd8V0m3eX2xGKR5YLIj7Un+Huq00NzQG95TNeeuv5
an0hCPrxScVtZsYL1R+ZTb1qj5VwqF2SXEzqNWo3iJXvNTbzyclp1MRhJy85oq8Z
GzHgeTqjAMTsFaehq/V3KnoNHadgSyJteMiMzF/jipjfMmGVIjnW0RPKgLE0Cq0n
HkLEn/t2rhDY+8e/Ko9lc0TJ4eC8FIooujtLwyHJDGdCR0wzSSkBjP9VQbB2+r9+
vXUQMYyBr3k37ZMeX/BVtyF1dcGJNw+DnxKvJEFRPeqsAuTxHT2fRM829uI5Hqco
HG4yYHoSgaz1WCo1nBW2B2UlE04djObgEQZvappwHQtlsU7YYvhLm9dwEZPc8WAY
57Oqk8xGu2VeLsK6etKaFb+btogSU+fYsfOcXIv3x4acZpXKypOrPECLcC/PxgXk
LMeCyXUWX9flmGhM9ifblvNxMKrp05EvUb5m+XRKCGE7iKkNpoHt7dwbvI1vBfSM
4CeQUvWlPbknylFcYgCW1QjxxfM2b6fL0mKn8X2wxbxqVLuQZqcksoj06Z3yGZjq
P7Zu42/ptp/I/sEzxWPRzGVWsEwfDRHKlPEnZGmVaRlm4CyXoDywCiW4kTjkM0nk
3wneaCtaHEVZOJJWCPGz
=MRM1
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
