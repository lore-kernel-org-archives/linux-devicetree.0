From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 4/9] pinctrl: sunxi: Deal with configless pins
Date: Thu, 20 Oct 2016 15:46:30 +0200
Message-ID: <20161020134630.xzkqvm7rokqiecg6@lukather>
References: <cover.7edc6c25be8a5e2efdda6a82e102dbf7ece6aa64.1476200742.git-series.maxime.ripard@free-electrons.com>
 <d707c657502b87a7f8e70c7b44492bc95939f9f6.1476200742.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v64gBi71W=+Tu2vz94xFDtuRNHUyVWK3ken8CSOWvK5t0g@mail.gmail.com>
 <20161019121614.3crr76qyexhamjiy@lukather>
 <CACRpkdY3+OnQ6Oo_nx+BrWebeTa=kYhHWSzirk1MxfWWJ--0Sg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b4egem5rihojcdpj"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdY3+OnQ6Oo_nx+BrWebeTa=kYhHWSzirk1MxfWWJ--0Sg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--b4egem5rihojcdpj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, Oct 20, 2016 at 02:52:54PM +0200, Linus Walleij wrote:
> On Wed, Oct 19, 2016 at 2:16 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Tue, Oct 18, 2016 at 03:47:03PM +0800, Chen-Yu Tsai wrote:
> >> > @@ -342,6 +365,8 @@ static void sunxi_pctrl_dt_free_map(struct pinct=
rl_dev *pctldev,
> >> >                                     struct pinctrl_map *map,
> >> >                                     unsigned num_maps)
> >> >  {
> >> > +       unsigned long *pinconfig;
> >>
> >> This looks out of place and context?
> >
> > Yeah, sorry, it's just a leftover from the previous version. This has
> > been removed.
>=20
> Do you mean you will send a v3 of this series?

Yes, I was waiting for your input to do that, but I guess you're ok
with it :)

> OK stopping to apply then.
>
> But I have already applied patches 1, 2 and 3 so just resend the rest :)

Ack, I'll send it in a moment.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--b4egem5rihojcdpj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYCMqxAAoJEBx+YmzsjxAgHUQQAKo6VQf+kpksR9WudHhP6u4/
5bwnqTcGNQer9tir3Mk/35gxpaRPcWAmPYpxIoJEZlckM4hBudO/vIAUEJZVoOZM
wS5ugQlbFehBY+mT/Wo4xv886CvjYbi3rFHCyA1wpsLUp6w4QsALsOe/FQEhUWEe
mpNuD6fEFTj88TTfcASAr+gku1uhHNKzK9+uR+flabNrlWBA4rogBNJMkvjoh+v4
T5mc/3/aaEgTv3sa2QRa+MNjobuo1cOlG/nfsfpKI5abhQEsRXTsatUx3AcFhVlq
GAqQK8pZwpUrL8tJzJZs/NEmidl+su46OvGvGSb1aG2Q/7fk7Y+F8tVq5cU8gQCN
iKwi/+eE5W5HtHAWfedoxfGMNcnksdj4mLQiqptV9n/7wIkdxVtuIj27ICBu6qbn
KYN3gx4wkajARq7IQvlgL5ztOj9cFNBLA1qOwdCcg1Vd70PJnZUu9EgLPOf27mzq
f73xFUCZ89x8YogGlB3w6+XGJN3gaKgUUvUw8yVqMrzsVVJxMlusUWjxeCgDYro+
9dOTckXT9YBXD1vAOpuNs8bbbt4cJ6JRV67NvyGc3AS+SwUAMYdme7Xg5vdoFnsg
b0w/mPQ1fDLk0sGSIFoAGjBV0yAGjqm2BsLN1asZixO3yogWnzR7AtJa64nW+ohU
JUXmlqfWb6++GoVLzFuo
=4AFk
-----END PGP SIGNATURE-----

--b4egem5rihojcdpj--
