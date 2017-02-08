From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 3/5] drm: convert drivers to use of_graph_get_remote_node
Date: Wed, 08 Feb 2017 12:44:38 -0800
Message-ID: <87tw842z0p.fsf@eliezer.anholt.net>
References: <20170204033635.10250-1-robh@kernel.org> <20170204033635.10250-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170204033635.10250-4-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <seanpaul@chromium.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja <architt@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@freescale.com>, Xinliang Liu <z.liuxinliang@hisilicon.com>, Rongrong Zou <zourongrong@gmail.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Chen Feng <puc>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Rob Herring <robh@kernel.org> writes:

> Convert drivers to use the new of_graph_get_remote_node() helper
> instead of parsing the endpoint node and then getting the remote device
> node. Now drivers can just specify the device node and which
> port/endpoint and get back the connected remote device node. The details
> of the graph binding are nicely abstracted into the core OF graph code.
>
> This changes some error messages to debug messages (in the graph core).
> Graph connections are often "no connects" depending on the particular
> board, so we want to avoid spurious messages. Plus the kernel is not a
> DT validator.

For vc4,

Tested-by: Eric Anholt <eric@anholt.net>

Thanks for making this easier.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlibgzYACgkQtdYpNtH8
nujjdg//WjzkJ8qehKZ2uZcYqG8IfvoLU8RutKA7/YjlV5cH3i10/PfOR4sYXozv
Ld7RZeyA2RCbF2xcBVXDb1qc4o49h4zlcK5zAOKw/qB9VL3rSoeKJ1lPIw554lSx
ZU1WgW+PWmxyoBRB01dPQPk8p9fnDq2Iz0Sjdls4ZIODoqEZE86x3yce/GVRPM9x
Ti51ILhgdJRADiYO5aYtEiWh1oB5CddIwHEHrItw1uViHA3wpMeieF9sxlNFLgq/
Ehp7CNx7MKrnPUsPNsgciSkOiuXJMIyJdgZRlzsEjIr/qEsaeMbauu+fu+6US1eT
kAi5BBP/ksLJ9ECulDDH9p91tIDCMWuPeO/+kzJ4lNn1Asp4X6O1NndxEpN3A7t/
Yn0lVwuCib0dDKAvLOSEc1bsgvZpHpEszbjhBN8oKAow4lK54tk434alv/DUbMgv
UKBOxauNZobjzPizaRU9Ku6nPcAnaxwqaZXe30VE1WK22eHS0bSi0bf6LdVCZvmo
ifxS2COjNW97OhuDguRptkiTHzLMQOyJnVYEha5Iw1ZNvRMPYO9iwRWiTUbxrpJP
QxzRaFHu+kH6jeA0fnSOP7qkauB5il0KSAwHiQPIhfJgPcmOeuEMqq5CujmrJ13S
ectJ9za5nCKvgWKQvlHLuPh8jnPyzTJurQAqHas1TqXy/oLD3ac=
=qpe0
-----END PGP SIGNATURE-----
--=-=-=--
