From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH net-next v2 00/15] ARM: sun8i: r40: Add Ethernet support
Date: Thu, 3 May 2018 15:12:57 +0200
Message-ID: <20180503131257.rlqxetafejikmnji@flea>
References: <20180501161227.2110-1-wens@csie.org>
 <CAGb2v67HFb6eLBS4_9s_wJ5uWFeQdUtwn_NMJnm59UUDFBDJUA@mail.gmail.com>
 <20180502.110617.304411895589508709.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z2nmrjqmglrtqum5"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180502.110617.304411895589508709.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: wens@csie.org, mturquette@baylibre.com, sboyd@kernel.org, peppe.cavallaro@st.com, robh+dt@kernel.org, mark.rutland@arm.com, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, clabbe.montjoie@gmail.com, icenowy@aosc.io
List-Id: devicetree@vger.kernel.org


--z2nmrjqmglrtqum5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Wed, May 02, 2018 at 11:06:17AM -0400, David Miller wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> Date: Wed, 2 May 2018 00:33:45 +0800
>=20
> > I should've mentioned that patches 3 ~ 10, and only these, should go
> > through net-next. sunxi will handle the remaining clk, device tree, and
> > soc driver patches.
>=20
> Ok, I just noticed this.
>=20
> Why don't you just post those patches separately as a series on their
> own then, in order to avoid confusion?
>=20
> Then you can adjust the patch series header posting to explain the
> non-net-next changes, where they got merged, and what they provide
> in order to faciliate the net-next changes.

I now that we usually have some feedback from non-net maintainers that
they actually prefer seeing the full picture (and I also tend to
prefer that as well) and having all the patches relevant to enable a
particular feature, even if it means getting multiple maintainers
involved.

Just to make sure we understood you fully, do you want Chen-Yu to
resend his serie following your comments, or was that just a general
remark for next time?

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--z2nmrjqmglrtqum5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrrCtgACgkQ0rTAlCFN
r3TTEQ//dlT2EwOiGVvfRHfM+IR3gxYAPc31DfabO7YOoQxJx3kr06qAbVdPqfa8
GrI5JDe14O2QFbaqXwJr5Rv7F8HDNIP7ksSUryaI1zWv9NqFYpU6+adEvl6bPPCx
6snbYpCR8o8UbXWaJUm24hWS4WQnLVVBQREfnT+IQHTks+PETa8TU9/Pjo3Gg8j0
zli5KQsPjt9Yh1e9qczPmhKrixX8ZVqHQ0dPU/9uJlcsBXqj/zGX/Hd6WnWxrXfB
OKtbTwpolHfbTT/SF7LDhXo940LCmcyiaM8DmfADUiOrfthCrwes3+1okXC9z5pM
E0H5pDSPShfIWCeHq4Xy2NXOteaMf0YFpCZX+pWTV6IzoXGpYFc4FiCBt/2e4miO
HhUf3WEhr2M7CaTRsqCStytBYfr7h1tyPJnn8laa+bCJMzMS1XRTVvz56qZ2E+Zx
rcoXPIj+Q3AYc+0HfVw9Inf7rVjETmcW2ySx0emlCI1BM5gwoBWCxKH1s48yqW2g
9np9MLHqFtnYJRRTa2BTv2zaL2zg8+yziKtEsdYdk9V1HXLD9DrGkc4RCqBLNdLr
LzcYxtcH4/NFfYcTrJ8f2KpdxtGvL7ilV+Ruya2s8jQus/F9NguI73Mus+VH/7w1
jTHLG3jzAsPAXEpcF6NWxWQrldecDo4oa9UxNI6b3B1tOHzO1gY=
=Sjp5
-----END PGP SIGNATURE-----

--z2nmrjqmglrtqum5--
