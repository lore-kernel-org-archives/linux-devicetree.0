From: =?utf-8?B?Q2zDqW1lbnQgQsWTc2No?= <u@pkh.me>
Subject: Re: [PATCH 2/2] arm64: dts: hi6220: add acpu_sctrl
Date: Tue, 15 Aug 2017 17:01:39 +0200
Message-ID: <20170815150138.GL22218@golem.pkh.me>
References: <1492478242-16146-1-git-send-email-zhangfei.gao@linaro.org>
 <1492478242-16146-2-git-send-email-zhangfei.gao@linaro.org>
 <5992F7FB.9080709@hisilicon.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6691829617428978133=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5992F7FB.9080709@hisilicon.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wei Xu <xuwei5@hisilicon.com>
Cc: devicetree@vger.kernel.org, guodong Xu <guodong.xu@linaro.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Li Pengcheng <lipengcheng8@huawei.com>, Zhangfei Gao <zhangfei.gao@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============6691829617428978133==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8CNmCRe8Sh4keFKJ"
Content-Disposition: inline


--8CNmCRe8Sh4keFKJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 15, 2017 at 02:32:43PM +0100, Wei Xu wrote:
> Hi Zhangfei,
>=20
> On 2017/4/18 2:17, Zhangfei Gao wrote:
> > Add acpu_sctrl clock node
> >=20
> > Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> > Signed-off-by: Li Pengcheng <lipengcheng8@huawei.com>
> > ---
> >  arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boo=
t/dts/hisilicon/hi6220.dtsi
> > index 470461d..710cc34 100644
> > --- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> > +++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> > @@ -262,6 +262,12 @@
> >  			#clock-cells =3D <1>;
> >  		};
> > =20
> > +		acpu_sctrl: acpu_sctrl@f7032000 {

I think the unit address is incorrect here (this value has been copied
=66rom the pm controller while it should match the 1st one the reg).

> > +			compatible =3D "hisilicon,hi6220-acpu-sctrl", "syscon";
> > +			reg =3D <0x0 0xf6504000 0x0 0x1000>;
> > +			#clock-cells =3D <1>;
> > +		};
> > +
> >  		medianoc_ade: medianoc_ade@f4520000 {
> >  			compatible =3D "syscon";
> >  			reg =3D <0x0 0xf4520000 0x0 0x4000>;
> >=20

Also I'm sorry I'm going to ask stupid questions:

- why 's' in "sctrl" while all the other node controllers declared around
  seems to use "ctrl"?

- is it possible to have access to the specs where those addresses can be
  found? The only public doc I could find is the "Hi6220V100 Multi-Mode
  Application Processor" one where this information doesn't seem present.

- is there any work pending adding the pmu counters node (interrupt
  GCI_SPI 99) ? AFAIK the ACPU controller added here can be used to enable
  the counters.

>=20
> Thanks!
> Applied to the hisilicon dt tree since the driver part is in the mainline=
 now.
>=20

Is this refering to https://github.com/hisilicon/linux-hisi/commits/next/dt=
64 ?

[...]

--=20
Cl=C3=A9ment B.

--8CNmCRe8Sh4keFKJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUtA6gtRF8ZTbiysWh+4suPS4/PkFAlmTDNIACgkQh+4suPS4
/PnfJAf9GVHFGUbD54Hdfl//0+sdJuWCQAHDMEDOVogoLKExgplCObDtTqsvY+5W
U8JaQN1x+Luboj4kOv10znKF6ka5mNlVRX4ne1tA9+KpLwOyEKnmtautb8E/yY+6
qqHmyjfSSSFU7KbZ1+Fy71ViYZG770i1PUbmW4Je+XLy0LRSieFC9homQyeSRca3
vS360aXt69B80t/z+w+i2avyheYiPk36o9Co+XBZf6cEVuuJBZLixnQhf9krcCZB
IBnakuIplxLLZuRfSw50T4WxNWFVRLhUYmguLiPZwgv54YsJkunZQekrrM6TxnAP
WuXVNKxQ5tSTfBFkVeugxzk7UPkinw==
=46Eg
-----END PGP SIGNATURE-----

--8CNmCRe8Sh4keFKJ--


--===============6691829617428978133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6691829617428978133==--
