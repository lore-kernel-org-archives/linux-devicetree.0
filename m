From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] MAINTAINERS: update DT binding doc locations
Date: Thu, 5 Nov 2015 21:04:28 +0000
Message-ID: <20151105210428.GG26383@jhogan-linux.le.imgtec.org>
References: <1446752475-2708-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+sHJum3is6Tsg7/J"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1446752475-2708-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Jianwei Wang <jianwei.wang.chn@gmail.com>, Alison Wang <alison.wang@freescale.com>, Philipp Zabel <p.zabel@pengutronix.de>, Mark Yao <mark.yao@rock-chips.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Hans de Goede <hdegoede@redhat.com>, Vineet Gupta <vgupta@synopsys.com>
List-Id: devicetree@vger.kernel.org

--+sHJum3is6Tsg7/J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2015 at 01:41:15PM -0600, Rob Herring wrote:
> After the recent moving of DT binding documents, some maintainers entries
> are stale. Update them to the new locations.
>=20
> In bindings/fb/, there were only 2 files and I'm assuming the FB
> maintainers don't want to be copied on all of bindings/display/. So I've
> dropped them.
>=20
> Reported-by: Thierry Reding <thierry.reding@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jianwei Wang <jianwei.wang.chn@gmail.com>
> Cc: Alison Wang <alison.wang@freescale.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Mark Yao <mark.yao@rock-chips.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: James Hogan <james.hogan@imgtec.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: James Hogan <james.hogan@imgtec.com> [metag]

Thanks!
James

> @@ -6855,6 +6854,7 @@ S:	Supported
>  F:	arch/metag/
>  F:	Documentation/metag/
>  F:	Documentation/devicetree/bindings/metag/
> +F:	Documentation/devicetree/bindings/interrupt-controller/img,*
>  F:	drivers/clocksource/metag_generic.c
>  F:	drivers/irqchip/irq-metag.c
>  F:	drivers/irqchip/irq-metag-ext.c

--+sHJum3is6Tsg7/J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWO8RcAAoJEGwLaZPeOHZ6M2AP/1XfirFmDJu9VDoqEy8pwpWE
Ows332+EdfSObVg55C/bvs8O0VOu+DO9Qrx1RBL0bIT7JgiM8Kynbcz+SdLZ7Zkv
PfwlZ6F/dTyNPZKJvo5iQJ5cOVxws2NB8VHX5x8CFsxWFBzryDrQnRNp+uRrZRZ+
WZkCfSZXd5lD4JMqBfqULl6y2SpkpN2NLl4K49FrBBUFz63kGgD4xyEuvdBQeL0k
/UkRbmgvpZykkuxEZMPCHNDy0QQZuJ7JiXr0IlyD6tXf37y7R/JcOZHdAKwDu42O
NrGGcvErFdEdBCFncsLc8SAS6HYtXyZkaiGduFnz2Gm8fSdaOZ+i8eVBqbcuVpTV
xqHv7Aba4PHpiU63H62u/Utwky7CAsQ+59PQF7uc+OBL2qIifo/IRa5f3ePmBtxI
Y/fokYDHNLyIMLI7goYw0I4byAu203L2c+27L6wsfj4ick6M+X7orX/tpSjyFH0o
tSDLMPbeS3VpaPQJpBKf6YeuGiB67BY6w04Ur/wgegpvJ8LoO4EbpSdrqgopG8cp
sFEIv8sKTpeQvLGGkperxIckwygZnYFOtIrddsQh/QhhnscE+21BhBe1YZ2FMDDZ
TWGpg/Se+R8jbY/IP2Ax3vJlI5DCQac454pDEA0ZF28TN0iSPFm29a4vEoAtuAcJ
qlyn04+h3wuWw4PXQM8r
=jtPN
-----END PGP SIGNATURE-----

--+sHJum3is6Tsg7/J--
