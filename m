From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v9 1/2] regulator: dt-bindings: add QCOM RPMh regulator
 bindings
Date: Tue, 7 Aug 2018 00:55:06 +0100
Message-ID: <20180806235506.GU2414@sirena.org.uk>
References: <cover.1531531808.git.collinsd@codeaurora.org>
 <56b9d5c38cfe46da1228c54f001a49773c3e31dc.1531531808.git.collinsd@codeaurora.org>
 <CAD=FV=VmfqWRGRMEn+0dzZ8x4R5vVaHbkthXAN91Lm-XmP9Gqg@mail.gmail.com>
 <20180724145755.GF13268@sirena.org.uk>
 <CAD=FV=Uo8sT72a0gRitOVoK0SfC-_QixsovW94_LnL6H7QdKvA@mail.gmail.com>
 <20180724152514.GJ13268@sirena.org.uk>
 <CAD=FV=WHJcAoR7Y_uhi7_GbVzy6K8FnovVFVRz8js0REONox=w@mail.gmail.com>
 <20180724165942.GP13268@sirena.org.uk>
 <20180726183922.GA4402@hector.mosconeconnections.com>
 <CAD=FV=VJN4vj9eU7wzPV8=WC_+MgRPYx1smF+FUmfDiP3uuTqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BVQ1RKc6+nLPB5pT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=VJN4vj9eU7wzPV8=WC_+MgRPYx1smF+FUmfDiP3uuTqw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Collins <collinsd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org


--BVQ1RKc6+nLPB5pT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 06, 2018 at 03:55:53PM -0700, Doug Anderson wrote:
> On Thu, Jul 26, 2018 at 11:39 AM, Andy Gross <andy.gross@linaro.org> wrote:

> > The arm-soc guys merged the Qualcomm pull requests.  So you can just use my
> > qcom-drivers-for-4.19 tag.  That won't change at this point.

> > git://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git
> > qcom-drivers-for-4.19

> Did Andy's idea of using the above tag work for you?  It appears that
> there are a few patches you don't need there, but it shouldn't hurt to
> pick them up too I think?  Here's what I see:

It does make my pull request look larger which is hard to get enthused
about.

> a3134fb09e0b drivers: soc: Add LLCC driver

Stuff like this jumped out for example.

> It seems like it's too late to land RPMh-regulator for 4.19, so I
> guess we'll have to aim for 4.20.  I'm not sure if that means you're
> going to want to wait until 4.20-rc1 comes out to use as a base before
> thinking about landing RPMh-regulator?  If so then I guess we've got

If I apply it after the merge window it's going to be based on -rc1.  If
I get to it this week I guess I'll have to pull in the drivers tag.

--BVQ1RKc6+nLPB5pT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlto39oACgkQJNaLcl1U
h9CxiQf+IPeB3+xZzo4H37XGT8YIYrCvtPobLZy5+AR9/Z3eWcjQmZsfv8IXpubA
a8lr2cAVApP+HeqR+X0ZjNPVWsw7m59v7Ug2GHM6YosgF5ULW4YcR650k5/iZ/EF
saAaWKW4YTnHAedaSPa9MnrXQPJgsG2S5h7ORauD42ANsQAytlJrulEcpx00Q1Id
3R25FR+7F1vrpHBRcg/eeNsh6jFv5rdidUSgXpsilMzoeeUbRei8ITyKEWnHQdX6
bHlIDQRTj7A9CX/GwwdHfN5fzo2oZb0aVWFy8pLrGNqmCgw34urXZAR0JJE7Wm/z
YICfllYPZTWTyWwCxnSkteXJq8a2XQ==
=WoXL
-----END PGP SIGNATURE-----

--BVQ1RKc6+nLPB5pT--
