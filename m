From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 4/9] pinctrl: sunxi: Deal with configless pins
Date: Wed, 19 Oct 2016 14:16:14 +0200
Message-ID: <20161019121614.3crr76qyexhamjiy@lukather>
References: <cover.7edc6c25be8a5e2efdda6a82e102dbf7ece6aa64.1476200742.git-series.maxime.ripard@free-electrons.com>
 <d707c657502b87a7f8e70c7b44492bc95939f9f6.1476200742.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v64gBi71W=+Tu2vz94xFDtuRNHUyVWK3ken8CSOWvK5t0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6832654095309314143=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGb2v64gBi71W=+Tu2vz94xFDtuRNHUyVWK3ken8CSOWvK5t0g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--===============6832654095309314143==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2556onq4pmzpow7e"
Content-Disposition: inline


--2556onq4pmzpow7e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2016 at 03:47:03PM +0800, Chen-Yu Tsai wrote:
> > @@ -342,6 +365,8 @@ static void sunxi_pctrl_dt_free_map(struct pinctrl_=
dev *pctldev,
> >                                     struct pinctrl_map *map,
> >                                     unsigned num_maps)
> >  {
> > +       unsigned long *pinconfig;
>=20
> This looks out of place and context?

Yeah, sorry, it's just a leftover from the previous version. This has
been removed.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2556onq4pmzpow7e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYB2QJAAoJEBx+YmzsjxAgtyIP/iY0W6eJa/97OCT7TR7+qtKZ
CM3dR7WswN60XWi2bhkb4Z5evpKPHJ3C5JupSD9qVPKdEicl1M1gEIm2TMUy+R/I
SkX9di5s6EvZH7J+y6EhaURd2DkS/kP/O3nsl4020fOUau7xoY7cwTRHdE0EIqmL
195jTr7a7LBHFruJbkqYVEHKV04PN6OxTHr8fR05Xl+egy9H9cOW+I+v+jNtT/tc
qFGjUj9KvWK70RTCmLKd4dz7Rd+q4EjcbRQZTOYHJLZFYSZXCenpwrD8vXNOtfl9
sTfC5WTJwPgGwMBjnt9Og5IOVnVaJBQ87IC4arsSPlr2lAK0vjTjQcnVLsj98GzG
c7+egysx56WJVBUw0wrGIwDSFAa7u6a3Iw33X8c+2WlKMNf51Sv3vSyLSWwoxYC5
O6qsg+BEVTBEhfV80SxAyKP9aCnBROxyEGkfzfQLiEzRGmfaHKzD61Kqmw57uzqU
RtMddLF3eVgHd/PKyDb+nCkgtUyXEabFAeXGPleMVNHSNDkLx2BYAa6OsuY58KAk
X96mFN8/TQ8Y6qDIhKdEX9aTJJoDTL8jEsHWj8woWsedHCLBVROkzlwtq1Qnwvl6
GZhZm+UpVULfr1tY2+wzaN+cm1pCYa/seGzbjImuz9cuqOm5NAb1/1RNbwQJGX4p
2ROPyAiINGCDdnuZsgLV
=Rt36
-----END PGP SIGNATURE-----

--2556onq4pmzpow7e--


--===============6832654095309314143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6832654095309314143==--
