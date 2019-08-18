From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: clock: Add Bitmain BM1880 SoC clock controller binding
Date: Sat, 17 Aug 2019 18:16:22 -0700
Message-ID: <20190818011623.B78062173B@mail.kernel.org>
References: <20190705151440.20844-1-manivannan.sadhasivam@linaro.org> <20190705151440.20844-2-manivannan.sadhasivam@linaro.org> <20190808050128.E3DA52186A@mail.kernel.org> <20190817033422.GB14652@Mani-XPS-13-9360> <20190817034612.6DA7E21721@mail.kernel.org> <20190817035845.GD14652@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190817035845.GD14652@Mani-XPS-13-9360>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, fisher.cheng@bitmain.com, alec.lin@bitmain.com
List-Id: devicetree@vger.kernel.org

Quoting Manivannan Sadhasivam (2019-08-16 20:58:45)
> On Fri, Aug 16, 2019 at 08:46:11PM -0700, Stephen Boyd wrote:
> > Quoting Manivannan Sadhasivam (2019-08-16 20:34:22)
> > > On Wed, Aug 07, 2019 at 10:01:28PM -0700, Stephen Boyd wrote:
> > > > Quoting Manivannan Sadhasivam (2019-07-05 08:14:36)
> > > > > +It is expected that it is defined using standard clock bindings =
as "osc".
> > > > > +
> > > > > +Example:=20
> > > > > +
> > > > > +        clk: clock-controller@800 {
> > > > > +                compatible =3D "bitmain,bm1880-clk";
> > > > > +                reg =3D <0xe8 0x0c>,<0x800 0xb0>;
> > > >=20
> > > > It looks weird still. What hardware module is this actually part of?
> > > > Some larger power manager block?
> > > >=20
> > >=20
> > > These are all part of the sysctrl block (clock + pinctrl + reset) and=
 the
> > > register domains got split between system and pll.
> > >=20
> >=20
> > And that can't be one node that probes the clk, pinctrl, and reset
> > drivers from C code?
>=20
> It is not a MFD for sure. It's just grouping of the register domains toge=
ther.
>=20

Are there datasheets? I'm not saying it's an "MFD", just saying that
it's one hardware IP block delivered by the SoC integrator. It's
already odd that there are two register properties.
