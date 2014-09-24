From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 2/3] mfd: document DT bindings for Qualcomm SPMI PMICs
Date: Wed, 24 Sep 2014 10:14:41 +0100
Message-ID: <20140924091441.GA19999@lee--X1>
References: <1406903450-27283-1-git-send-email-svarbanov@mm-sol.com>
 <1406903450-27283-3-git-send-email-svarbanov@mm-sol.com>
 <53DF8FFA.601@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53DF8FFA.601@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Kumar Gala <galak@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, David Collins <collinsd@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Courtney Cavin <courtney.cavin@sonymobile.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Josh Cartwright <joshc@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, 04 Aug 2014, Stanimir Varbanov wrote:
> Kumar, Stephen, David can I have your Acked/Reviewed-by tag for 2/3 a=
nd
> if possible for 3/3. The last patch can wait because currently we don=
't
> have child peripherals. Thanks.

No one seems to have an opinion, negative or otherwise.

Applied, thanks.

> On 08/01/2014 05:30 PM, Stanimir Varbanov wrote:
> > Document DT bindings used to describe the Qualcomm SPMI PMICs.
> >=20
> > Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
> > ---
> >  .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |   64 ++++++++=
++++++++++++
> >  1 files changed, 64 insertions(+), 0 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi=
-pmic.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.t=
xt b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> > new file mode 100644
> > index 0000000..7182b88
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> > @@ -0,0 +1,64 @@
> > +          Qualcomm SPMI PMICs multi-function device bindings
> > +
> > +The Qualcomm SPMI series presently includes PM8941, PM8841 and PMA=
8084
> > +PMICs.  These PMICs use a QPNP scheme through SPMI interface.
> > +QPNP is effectively a partitioning scheme for dividing the SPMI ex=
tended
> > +register space up into logical pieces, and set of fixed register
> > +locations/definitions within these regions, with some of these reg=
ions
> > +specifically used for interrupt handling.
> > +
> > +The QPNP PMICs are used with the Qualcomm Snapdragon series SoCs, =
and are
> > +interfaced to the chip via the SPMI (System Power Management Inter=
face) bus.
> > +Support for multiple independent functions are implemented by spli=
tting the
> > +16-bit SPMI slave address space into 256 smaller fixed-size region=
s, 256 bytes
> > +each. A function can consume one or more of these fixed-size regis=
ter regions.
> > +
> > +Required properties:
> > +- compatible:      Should contain one of:
> > +                     "qcom,pm8941"
> > +                     "qcom,pm8841"
> > +                     "qcom,pma8084"
> > +                     or generalized "qcom,spmi-pmic".
> > +- reg:             Specifies the SPMI USID slave address for this =
device.
> > +                   For more information see:
> > +                   Documentation/devicetree/bindings/spmi/spmi.txt
> > +
> > +Required properties for peripheral child nodes:
> > +- compatible:      Should contain "qcom,xxx", where "xxx" is a per=
ipheral name.
> > +
> > +Optional properties for peripheral child nodes:
> > +- interrupts:      Interrupts are specified as a 4-tuple. For more=
 information
> > +                   see:
> > +                   Documentation/devicetree/bindings/spmi/qcom,spm=
i-pmic-arb.txt
> > +- interrupt-names: Corresponding interrupt name to the interrupts =
property
> > +
> > +Each child node of SPMI slave id represents a function of the PMIC=
=2E In the
> > +example below the rtc device node represents a peripheral of pm894=
1
> > +SID =3D 0. The regulator device node represents a peripheral of pm=
8941 SID =3D 1.
> > +
> > +Example:
> > +
> > +	spmi {
> > +		compatible =3D "qcom,spmi-pmic-arb";
> > +
> > +		pm8941@0 {
> > +			compatible =3D "qcom,pm8941", "qcom,spmi-pmic";
> > +			reg =3D <0x0 SPMI_USID>;
> > +
> > +			rtc {
> > +				compatible =3D "qcom,rtc";
> > +				interrupts =3D <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
> > +				interrupt-names =3D "alarm";
> > +			};
> > +		};
> > +
> > +		pm8941@1 {
> > +			compatible =3D "qcom,pm8941", "qcom,spmi-pmic";
> > +			reg =3D <0x1 SPMI_USID>;
> > +
> > +			regulator {
> > +				compatible =3D "qcom,regulator";
> > +				regulator-name =3D "8941_boost";
> > +			};
> > +		};
> > +	};
> >=20
>=20
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
