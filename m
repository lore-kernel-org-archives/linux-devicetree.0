From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] ARM: dts: r7s72100: fix sdhi clock define
Date: Mon, 16 Jan 2017 12:40:23 +0100
Message-ID: <20170116114023.GA3029@katana>
References: <20170112181149.29035-1-chris.brandt@renesas.com>
 <CAMuHMdUz6nb-STMQK39hDqwHRt4R5t+Lndj150Lkg7prN=HQZQ@mail.gmail.com>
 <PS1PR06MB116243F531726538252C2BAE8A780@PS1PR06MB1162.apcprd06.prod.outlook.com>
 <CAMuHMdVkTS21UnZA9OyEZ=mR5+GtAEbiLwpe=uKB_O6deXBPyw@mail.gmail.com>
 <SG2PR06MB1165D0D67AD68A12030C961D8A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdUVnUS-iOM8cbXNP7jMLNFb5+hgnMp3edkCzpbEpAePzw@mail.gmail.com>
 <SG2PR06MB11659339E4A08373D3626BB28A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdX=cNuBSMqvPKYa7J5g7T4dSfHhSjcGdmuOPw_as=6RQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdX=cNuBSMqvPKYa7J5g7T4dSfHhSjcGdmuOPw_as=6RQQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: devicetree@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > and then in the code do:
> >
> >         struct *cd_clk;
> >         cd_clk =3D devm_clk_get(&pdev->dev, "cd");
> >         if (cd_clk) {
> >                 clk_prepare_enable(cd_clk);
> >         }
> >
> >   (this simple 1-line fix patch is getting a lot more complicated)
>=20
> Disclaimer: I don't know how/if the SDHI core manages clocks, and may
> interfere. Adding Wolfram.

Thanks for the heads up.

We have special callbacks for en-/disabling clocks:
sh_mobile_sdhi_clk_enable() and sh_mobile_sdhi_clk_disable().

I think those functions should get the above if-blocks (without curly
braces) to ensure we always have consistent 00 or 11 settings.


--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYfLEnAAoJEBQN5MwUoCm2YbYP/0KDZ+Fxf9rOxb9hK9sUwLK6
EPMelGAgQ37zRHHNtWT/BMYVQTZ01kr0jumYMaF4Di2DVDWAwRBOKGyZOrDXFErL
LOujJFTnx3/hJjHu7eTTe8yPL2pYuqmzPOOPkmsqvbhVry6P/mBdsd1gcd9a1Pa1
3ByKNghHsm8OXRw+3zN9FvZ/sFKTCh7XU8/uc9siWH1Se1tpTK5nvwRSQDrZ3Mkc
vZMcIzmZRm9o2eFZjX8D6sdZkpNOGGB7JJrGxF29KnlHTGPXlCpXAwSKDFd93LkD
LiSvZtYMzXqwUld3Wve0swrzlGwd/wFLM9OLTIYJ+WkNW/63ikt647vgU/8F5Xg7
bbdmtn+i2nN+RoUTfSE0QiqoFc17qWuANouis8P/3zk6OAbl/hwNKpG4fGVfMoCt
xvXM9bK8usapxoZ1Kic3MpoxuvVz16T0FBXZB4KNR452CTGyDzVq8kXd2UKPX59a
UHHfq4JSYhLmQ32p0NPAqstsZzQIRRNFRIky0JvLgHkR/nGPetT558lIEeIp0MJV
d+ywY+5Yfxdy99BVumHgUbA4DdBHYoq+X+k+XJOM8W43FrP+3Mc45/UfGCcCv5cr
rZJ3/9tCCppdKbGmILGOw7V1LWY7bIzygR7qFdoZrkhbrL8EX0wwQwFY40fsHTrW
oT69PsWmYcpgFGKn8P5b
=5fuE
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
