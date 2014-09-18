From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: add devicetree bindings for st-pwm
 regulator
Date: Thu, 18 Sep 2014 15:22:30 -0700
Message-ID: <20140918222230.GG7960@sirena.org.uk>
References: <1411025505-21628-1-git-send-email-zyw@rock-chips.com>
 <1411025505-21628-3-git-send-email-zyw@rock-chips.com>
 <CAD=FV=UdSQZqGqY5XvLwKpkSbEWvtXG0s1vuk3xfdX0AJ27TBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0za9BfvgN4c4+/Ah"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=UdSQZqGqY5XvLwKpkSbEWvtXG0s1vuk3xfdX0AJ27TBg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--0za9BfvgN4c4+/Ah
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 18, 2014 at 02:27:59PM -0700, Doug Anderson wrote:
> On Thu, Sep 18, 2014 at 12:31 AM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:

> I would be tempted to say that you should add a few required properties:

> * regulator-boot-on
> * regulator-always-on
> * regulator-initial-microvolts

> From my understanding of how PWM-based regulators work there is no way
> to "disable" them.  If you drive them low then they get their biggest
> voltage.  If you drive them high then they get their smallest voltage.
> If you make them floating then it's equivalent to 50% duty cycle
> (right?)

No, if there is no disable operation then there is no point in
specifying any properties to do with enabling and disabling as they
won't do anything.  This is only relevant if the operation is there.

--0za9BfvgN4c4+/Ah
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUG1sjAAoJECTWi3JdVIfQ90cH/3AAZKacvouTl2ZFS5tSIJL9
+iqPwnjD98RRl5mSKgV8EVf37P5x6awgoVX/F5IPWHdPJk9pbVKZQLT3xucFCXtm
YLLsqDTZljKGUfPUpq7OjCk2qfuxGK7IDTTHPn+WYXaUCWWJaB7eduwPU0VgTWq9
/z/nKy5kRBH8EktvnbSkRj3Hj6fkdiOUBnSzPiZjTKcbUlS+WxxWBzJrgzLlJWWf
aucCqKGKhtpz/7gBruPfqsV1eI6h/A1zCFQFbbnQHevwW47bJPLZrj9wJ1ciR44g
93eNkehYCoTpFnGoTt54CKaWlPwResNwmapjvvo1MFjH+G587XCf66MbyJwHHuE=
=VlF1
-----END PGP SIGNATURE-----

--0za9BfvgN4c4+/Ah--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
