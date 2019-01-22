From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 10/13] arm64: dts: qcom: qcs404: Add HFPLL node
Date: Tue, 22 Jan 2019 10:49:01 -0800
Message-ID: <154818294180.20280.13967884067917226851@swboyd.mtv.corp.google.com>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org> <1545039990-19984-11-git-send-email-jorge.ramirez-ortiz@linaro.org> <154507555157.19322.2712807405425817338@swboyd.mtv.corp.google.com> <20190117063804.GJ25498@builder>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117063804.GJ25498@builder>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, jassisinghbrar@gmail.com, jorge.ramirez-ortiz@linaro.org, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com, vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org, georgi.djakov@linaro.org, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2019-01-16 22:38:04)
> On Mon 17 Dec 11:39 PST 2018, Stephen Boyd wrote:
>=20
> > Quoting Jorge Ramirez-Ortiz (2018-12-17 01:46:27)
> > > The high frequency pll functionality is required to enable CPU
> > > frequency scaling operation.
> > >=20
> > > Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> > > Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/qcs404.dtsi | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/d=
ts/qcom/qcs404.dtsi
> > > index 4594fea7..ec3f6c7 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > > @@ -375,6 +375,15 @@
> > >                         #mbox-cells =3D <1>;
> > >                 };
> > > =20
> > > +               apcs_hfpll: clock-controller@0b016000 {
> >=20
> > Drop leading 0 on unit address please.
> >=20
> > > +                       compatible =3D "qcom,hfpll";
> > > +                       reg =3D <0x0b016000 0x30>;
> >=20
> > Wow that is small!
> >=20
>=20
> I double checked and it's actually 0x34, but the last register is
> protected.
>=20

Ok, so then it should be 0x34? I don't think we've left out protected
registers from the size before.
