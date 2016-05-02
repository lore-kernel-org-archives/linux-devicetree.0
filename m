From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V17 2/3] dmaengine: qcom_hidma: add debugfs hooks
Date: Mon, 2 May 2016 11:40:49 +0100
Message-ID: <20160502104049.GB6292@sirena.org.uk>
References: <1460384473-5775-1-git-send-email-okaya@codeaurora.org>
 <1460384473-5775-3-git-send-email-okaya@codeaurora.org>
 <20160426033029.GB2274@localhost>
 <b068ead6474f2ffee5acef9ea799aba3@codeaurora.org>
 <20160426162529.GK2274@localhost>
 <571F9D76.2060809@codeaurora.org>
 <20160427081501.GV2274@localhost>
 <2c7ac0732fb16f952db24b7c70065318@codeaurora.org>
 <57258799.70803@codeaurora.org>
 <20160502092552.GC2274@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160502092552.GC2274@localhost>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Sinan Kaya <okaya@codeaurora.org>, dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com, shankerd@codeaurora.org, vikrams@codeaurora.org, marc.zyngier@arm.com, mark.rutland@arm.com, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2016 at 02:55:52PM +0530, Vinod Koul wrote:
> On Sun, May 01, 2016 at 12:35:37AM -0400, Sinan Kaya wrote:

> > My evaluation turned out negative. The regmap code is nice for bus like=
 peripherals
> > like I2C and SPI where everything is bitwise accessed. This is not the =
case
> > in this code.=20

> I do not entirely agree with the statements here, it does give big benefit
> on our systems with MMIO. I am going to ask Mark to comment on this, he
> know better and understands ARM.

> I am probably going to be okay with this not using regmap and it is debug
> but you should give that a try in future for better performance and ofcou=
rse
> you can add to regmap to get a better model for your device

I've no idea what "this" is, sorry.  All I've got here is an enormous
backtrace with a bunch of the messages not even word wrapped.

Please be aware that I get CCed on so much irrelevant crap that copying
me into the middle of a thread about some other subsystem is likely to
get missed - almost always it's review of some patch I've got no
interest in.

> > Barriers are really expensive on ARM. I paid very special attention in =
the=20
> > code to decide when to use relaxed version vs. the readl version. I los=
e=20
> > all of this optimization.=20

Drivers should not be using the relaxed accessors, they are there for
the generic code to build on not for drivers and they really need the
cache flush operations.  Getting the cache flush operations right,
especially on ARM, isn't easy and needs detailed review.

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXJy6wAAoJECTWi3JdVIfQ3CgH/iNZEm4o5yzJeCR1mhG2n4Zj
JMqhiCtj5M+LQpRmUNaF00Uyd+jIbbSVO7XF3C9aU0tJ1tvJfEVpAgcf45pahy/Q
uAF6lHSccheJcxpTJSiC7qtOEslqlLURIdFPwPN3jDWDv3MUqXxGXn/kc6RFAHo5
laD2Qv/OPcwoP9+1/pUYXj88khM+luu7p3eIuu8RdpZJNyRplKi6vCHHbnxrU938
AlfAv3FImjFDLRmczHp79MSE3RqKkaeh1qYFW05YZLTQYpXlnTi+d10YiJtZeQsv
l5FFnvlNMJLq5W8rbxG+1BcUzO9cX+0YY5bQxXsM1Fr6WedyXcMzz6C0SrscPNg=
=QYGD
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
