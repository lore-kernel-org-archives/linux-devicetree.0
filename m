From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 05/13] clk: qcom: apcs-msm8916: get parent clock names from DT
Date: Fri, 28 Dec 2018 14:28:54 -0800
Message-ID: <154603613437.179992.1170701312259011363@swboyd.mtv.corp.google.com>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org> <1545039990-19984-6-git-send-email-jorge.ramirez-ortiz@linaro.org> <154508986359.19322.1555129141976726505@swboyd.mtv.corp.google.com> <20181218143503.GA32562@centauri.ideon.se> <72bc192f-b60a-1209-7818-78a2fed07831@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <72bc192f-b60a-1209-7818-78a2fed07831@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, jassisinghbrar@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com, bjorn.andersson@linaro.org, vkoul@kernel.org, sibis@codeaurora.org, georgi.djakov@linaro.org, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Jorge Ramirez (2018-12-26 01:20:07)
> On 12/18/18 15:35, Niklas Cassel wrote:
> > On Mon, Dec 17, 2018 at 03:37:43PM -0800, Stephen Boyd wrote:
> >> Quoting Jorge Ramirez-Ortiz (2018-12-17 01:46:22)
> >>> Allow accessing the parent clock names required for the driver
> >>> operation by using the device tree node.
> >>>
> >>> This permits extending the driver to other platforms without having to
> >>> modify its source code.
> >>>
> >>> For backwards compatibility leave previous values as default.
> >>
> >> Why do we need to maintain backwards compatibility? Isn't is required
> >> that the nodes have clocks properties?
> >>
> >=20
> > Hello Stephen,
> >=20
> >=20
> > This is the existing DT nodes for msm8916:
> >=20
> >                 a53pll: clock@b016000 {
> >                          compatible =3D "qcom,msm8916-a53pll";
> >                          reg =3D <0xb016000 0x40>;
> >                          #clock-cells =3D <0>;
> >                  };
> >=20
> >                  apcs: mailbox@b011000 {
> >                          compatible =3D "qcom,msm8916-apcs-kpss-global"=
, "syscon";
> >                          reg =3D <0xb011000 0x1000>;
> >                          #mbox-cells =3D <1>;
> >                          clocks =3D <&a53pll>;
> >                          #clock-cells =3D <0>;
> >                  };
> >=20
> >=20
> > This is the (suggested) DT nodes for qcs404:
> >=20
> >                  apcs_hfpll: clock-controller@0b016000 {
> >                          compatible =3D "qcom,hfpll";
> >                          reg =3D <0x0b016000 0x30>;
> >                          #clock-cells =3D <0>;
> >                          clock-output-names =3D "apcs_hfpll";
> >                          clocks =3D <&xo_board>;
> >                          clock-names =3D "xo";
> >                  };
> >=20
> >                  apcs_glb: mailbox@b011000 {
> >                          compatible =3D "qcom,qcs404-apcs-apps-global",=
 "syscon";
> >                          reg =3D <0x0b011000 0x1000>;
> >                          #mbox-cells =3D <1>;
> >                          clocks =3D <&gcc GCC_GPLL0_AO_OUT_MAIN>, <&apc=
s_hfpll>;
> >                          clock-names =3D "aux", "pll";
> >                          #clock-cells =3D <0>;
> >                  };
> >=20
> > qcs404 specifies two clocks, with an accompanied clock-name for each cl=
ock.
> >=20
> > msm8916 specifies a single clock, without an accompanied clock-name.
> >=20
> > It is possible to append clock-names =3D "pll" for the existing clock,
> > as well as to define the aux clock in the apcs node in the msm8916 DT:
> > clocks =3D <&gcc GPLL0_VOTE>;
> > clock-names =3D "aux";
> >=20
> > However, since the DT is treated as an ABI, the existing DT for msm8916=
 must
> > still work, so I don't think that it is possible to ignore having backw=
ards
> > compability in the apcs clock driver.
>=20
>=20
> so where are we with this?
>=20
> do we remove backwards compatibility (see below] for v2 or is the DT=20
> really an ABI and therefore the patch under review is good as is?
>=20

Breaking compatibility is up to the platform maintainers. If anything, I
would make the DTS and driver changes in parallel and then remove the
driver's backwards compatibility logic later on.
