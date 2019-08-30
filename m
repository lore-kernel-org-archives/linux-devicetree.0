From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: Add Qualcomm USB SuperSpeed PHY bindings
Date: Fri, 30 Aug 2019 11:28:33 -0700
Message-ID: <5d696ad2.1c69fb81.977ea.39e5@mx.google.com>
References: <20190207111734.24171-1-jorge.ramirez-ortiz@linaro.org> <20190207111734.24171-4-jorge.ramirez-ortiz@linaro.org> <20190223165218.GB572@tuxbook-pro> <6dc0957d-5806-7643-4454-966015865d38@linaro.org> <5d694878.1c69fb81.5f13b.ec4f@mx.google.com> <20190830164520.GK26807@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830164520.GK26807@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>, robh@kernel.org, andy.gross@linaro.org, shawn.guo@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com, jackp@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2019-08-30 09:45:20)
> On Fri 30 Aug 09:01 PDT 2019, Stephen Boyd wrote:
>=20
> > Quoting Jorge Ramirez (2019-08-29 00:03:48)
> > > On 2/23/19 17:52, Bjorn Andersson wrote:
> > > > On Thu 07 Feb 03:17 PST 2019, Jorge Ramirez-Ortiz wrote:
> > > >> +
> > > >> +Required child nodes:
> > > >> +
> > > >> +- usb connector node as defined in bindings/connector/usb-connect=
or.txt
> > > >> +  containing the property vbus-supply.
> > > >> +
> > > >> +Example:
> > > >> +
> > > >> +usb3_phy: usb3-phy@78000 {
> > > >> +    compatible =3D "qcom,snps-usb-ssphy";
> > > >> +    reg =3D <0x78000 0x400>;
> > > >> +    #phy-cells =3D <0>;
> > > >> +    clocks =3D <&rpmcc RPM_SMD_LN_BB_CLK>,
> > > >> +             <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
> > > >> +             <&gcc GCC_USB3_PHY_PIPE_CLK>;
> > > >> +    clock-names =3D "ref", "phy", "pipe";
> > > >> +    resets =3D <&gcc GCC_USB3_PHY_BCR>,
> > > >> +             <&gcc GCC_USB3PHY_PHY_BCR>;
> > > >> +    reset-names =3D "com", "phy";
> > > >> +    vdd-supply =3D <&vreg_l3_1p05>;
> > > >> +    vdda1p8-supply =3D <&vreg_l5_1p8>;
> > > >> +    usb3_c_connector: usb3-c-connector {
> >=20
> > Node name should be 'connector', not usb3-c-connector.
> >=20
>=20
> It probably has to be usb-c-connector, because we have a
> micro-usb-connector on the same board.

Ok. Or connector@1 and connector@2? Our toplevel node container story is
sort of sad because we have to play tricks with node names. But in the
example, just connector I presume?=20

>=20
> > > >=20
> > > > The USB-C connector is attached both to the HS and SS PHYs, so I th=
ink
> > > > you should represent this external to this node and use of_graph to
> > > > query it.
> > >=20
> > > but AFAICS we wont be able to retrieve the vbux-supply from an extern=
al
> > > node (that interface does not exist).
> > >=20
> > > rob, do you have a suggestion?
> >=20
> > Shouldn't the vbus supply be in the phy? Or is this a situation where
> > the phy itself doesn't have the vbus supply going to it because the PMIC
> > gets in the way and handles the vbus for the connector by having the SoC
> > communicate with the PMIC about when to turn the vbus on and off, etc?
> >=20
>=20
> That's correct, the VBUS comes out of the PMIC and goes directly to the
> connector.
>=20
> The additional complicating factor here is that the connector is wired
> to a USB2 phy as well, so we need to wire up detection and vbus control
> to both of them - but I think this will be fine, if we can only figure
> out a sane way of getting hold of the vbus-supply.
>=20

Does it really matter to describe this situation though? Maybe it's
simpler to throw the vbus supply into the phy and control it from the
phy driver, even if it never really goes there. Or put it into the
toplevel usb controller?
