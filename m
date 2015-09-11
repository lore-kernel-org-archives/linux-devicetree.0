From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 7/9] ARM: STi: DT: STiH407: Add FDMA driver dt nodes.
Date: Fri, 11 Sep 2015 20:33:45 +0100
Message-ID: <20150911193345.GR18779@x1>
References: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org>
 <1441980871-24475-8-git-send-email-peter.griffin@linaro.org>
 <20150911162749.GD18779@x1>
 <20150911164822.GA1150@griffinp-ThinkPad-X1-Carbon-2nd>
 <20150911175555.GF18779@x1>
 <20150911180635.GA15803@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150911180635.GA15803@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com, robh+dt@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Peter Griffin wrote:
> On Fri, 11 Sep 2015, Lee Jones wrote:
> > On Fri, 11 Sep 2015, Peter Griffin wrote:
> > > On Fri, 11 Sep 2015, Lee Jones wrote:
> > > > On Fri, 11 Sep 2015, Peter Griffin wrote:
> > > >=20
> > > > > These nodes are required to get the fdma driver working
> > > > > on STiH407 based silicon.
> > > > >=20
> > > > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > > > ---
> > > > >  arch/arm/boot/dts/stih407-family.dtsi | 51 +++++++++++++++++=
++++++++++++++++++
> > > > >  1 file changed, 51 insertions(+)
> > > > >=20
> > > > > diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm=
/boot/dts/stih407-family.dtsi
> > > > > index 838b812..da07474b 100644
> > > > > --- a/arch/arm/boot/dts/stih407-family.dtsi
> > > > > +++ b/arch/arm/boot/dts/stih407-family.dtsi
> > > > > @@ -565,5 +565,56 @@
> > > > >  						  <&phy_port2 PHY_TYPE_USB3>;
> > > > >  			};
> > > > >  		};
> > > > > +
> > > > > +		fdma0: fdma0-audio@8e20000 {
> > > >=20
> > > > I'm not familiar with the FDMA driver, so can't comment knowled=
geably,
> > > > but the <dev> part of <dev>@<base_address> should only describe=
 the
> > > > type of hardware.  I believe in this case it should just be
> > > > dma@08e20000.  Also notice the leading zero in the address, whi=
ch I
> > > > believe mitigates possible confusion.  Then you be more specifi=
c with
> > > > the label, so something like 'fdma-audio' seems appropriate her=
e.
> > >=20
> > > Ok, can change to that format in v3.
> > >=20
> > > >=20
> > > > > +			compatible =3D "st,stih407-fdma-mpe31";
> > > > > +			reg =3D <0x8e20000 0x20000>;
> > > >=20
> > > > I personally find padding up to 32bits helpful in the addresses=
=2E
> > >=20
> > > None of the stih407-family nodes I can see have this padding, inc=
luding
> > > the ones merged by you.
> >=20
> > Nither of these two facts mean it's correct.
>=20
> I thought it was a 'personal' thing. If it is mandated by the spec, t=
hen that
> is different.
>=20
> >=20
> > I'm happy to write a patch to correct them all.
>=20
> Are you sure your actually correcting anything? Where does it say you
> should have a leading zero?
>=20
> >=20
> > Bear in mind that this isn't a hard and fast rule.  Both work and a=
re
> > legal.  I just think the padding is more consistent.
>=20
> Surely adding a patch with how the nodes are currently formatted, is =
more consistent
> than adding a patch with padding?
=20
I did mean consistent with the majority of DTS files, rather than just
ours.  There are examples of non-padded values and it's perfectly
legal, but the vast majority of examples do in fact pad their
addresses [see below].  The change is more of a nit than a blocker.

git grep '@0[0-9|a-f]\{7\}' -- arch/arm/boot/dts/
892

git grep '@[0-9|a-f]\{7\} ' -- arch/arm/boot/dts/ | grep -vi sti | \
  grep -vi partition | grep -vi data
140

I'll probably still fix them up and resubmit some patches to bring us
into line with the vast majority.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
