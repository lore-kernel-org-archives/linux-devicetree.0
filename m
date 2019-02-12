From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/4] Add new device nodes for Spreadtrum SC9860 platform
Date: Tue, 12 Feb 2019 12:20:35 +0000
Message-ID: <20190212122035.GA20635@sirena.org.uk>
References: <cover.1548052878.git.baolin.wang@linaro.org>
 <CAK8P3a3UROFLTtEcNXKtMUN283UQ6auQUOXCR=6e3BdLu5K8Nw@mail.gmail.com>
 <CAMz4kuLotnNom9kx2EmdfVEb+gvWfEbxoh6+hiqk87EjmtYJwA@mail.gmail.com>
 <20190201130519.GH20797@sirena.org.uk>
 <CAMz4kuJdPts31Ak-H=VAivvoqqPtxO5M1RdqrNPwTLT5d1h_7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMz4kuJdPts31Ak-H=VAivvoqqPtxO5M1RdqrNPwTLT5d1h_7w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 12, 2019 at 04:40:10PM +0800, Baolin Wang wrote:
> On Fri, 1 Feb 2019 at 21:05, Mark Brown <broonie@kernel.org> wrote:

> > You can just list all the individual device names in the of_match_table
> > for the MFD and then it can bind to any of them.  You can always map
> > them onto the same behaviour in the MFD driver if they are identical
> > from a software point of view.

> If I understood correctly, as you suggested, we should add new
> mfd_cell groups to list all different PMICs' device names. Something
> like:

I do think this is a good idea (registering the components of the MFD
using mfd_cell), though it wasn't quite the point I was making.  Having
individual device names matters less for Linux-internal names like this.

> But from my point, they are just some meaningless duplication, and
> will waste lots of code there.

I was more thinking of the of_match table that has the IDs that appear
in DT - they're the one that's the ABI.  Look at something like wm8994
where the driver has several IDs listed in the main table then selects
function drivers based on that.

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxiuhAACgkQJNaLcl1U
h9AIrwf/duaHeW8vd49sPs90dsantq17G7uAI3r2j6QKJdcp6vMTcKRvlq0qahnh
ekHZkwL66Xqn+T0Hy58zRp2HKMmXOgTZAomEYQiLeZ1fAulq92j8jUROqQY5bNAh
V8/55At5oa/BmfWu75pwqMahTHThP5F82XXtaE9jCSJmYwg19Fmy69WkoIm2uMUG
2aSSqZI2kmELBUxWoErbVhqq0V0+BrgkLNxBtOZ1vmGqecV7eduAJqVls8jztS0k
N4knC7ebvKAhQ8B/HvbbpCrg65jyZa59y/BdJ0eAGsyiVczLeL2PoO9dz+pG+04E
/tGLg0VNm8KDei4/kDw2P6FtY/uZag==
=QmcW
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
