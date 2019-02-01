From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/4] Add new device nodes for Spreadtrum SC9860 platform
Date: Fri, 1 Feb 2019 13:05:19 +0000
Message-ID: <20190201130519.GH20797@sirena.org.uk>
References: <cover.1548052878.git.baolin.wang@linaro.org>
 <CAK8P3a3UROFLTtEcNXKtMUN283UQ6auQUOXCR=6e3BdLu5K8Nw@mail.gmail.com>
 <CAMz4kuLotnNom9kx2EmdfVEb+gvWfEbxoh6+hiqk87EjmtYJwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J/zg8ciPNcraoWb6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMz4kuLotnNom9kx2EmdfVEb+gvWfEbxoh6+hiqk87EjmtYJwA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--J/zg8ciPNcraoWb6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 01, 2019 at 08:05:30PM +0800, Baolin Wang wrote:

> On Spreadtrum platform, we use one mfd driver [1] to populate the
> SC27XX series PMICs including SC2731, SC2721, SC2720 and SC2730. So we
> use sc27xx to be compatible with different PMICs' devices, otherwise
> it will be difficult to define the mfd cell arrays in mfd driver. Do
> you have any good suggestion? Thanks.

You can just list all the individual device names in the of_match_table
for the MFD and then it can bind to any of them.  You can always map
them onto the same behaviour in the MFD driver if they are identical
=66rom a software point of view.

--J/zg8ciPNcraoWb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxURA4ACgkQJNaLcl1U
h9CmfQf/YnVOFQBR/ZdKkjt44v9jtogltQorJrsUP4SjfNU6eEDwFekGutld//0B
ymGkp7vX9jhWfoLvSl/U8R8iHdhuiI9n/0nE5ryQAPoPc9/CFTpDi+V3F5eR0OR4
CvahpdUXfPJ81Z5NjIFfpeAw086b1kzrceNnPLk9+r6L1jZSu6g4i5r+b8nLGUih
2I3PngIQvW+RKpXm8cpQLnIbyuec7nsQM2yoZi2Lsf4MM3u5saLEVakirb5vND7c
M/Y8uhtiKXQIzeOvi3LtZWMorRulBycpDIT9FjQLvUMDFVQrbtrCIGcaBGnWyq19
bV2dEgsE4ucI6gbuDOn9xMxpO7tUgA==
=zaWr
-----END PGP SIGNATURE-----

--J/zg8ciPNcraoWb6--
