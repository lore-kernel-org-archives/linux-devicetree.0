From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 05/11] mfd: devicetree: bindings: Add Qualcomm SMD
 based RPM DT binding
Date: Thu, 23 Jul 2015 14:31:33 +0100
Message-ID: <20150723133133.GB3436@x1>
References: <1435355419-23602-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1435355419-23602-6-git-send-email-bjorn.andersson@sonymobile.com>
 <20150707121609.GZ3182@x1>
 <20150713214836.GA15178@usrtlx11787.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150713214836.GA15178@usrtlx11787.corpusers.net>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: bjorn@kryo.se, Andy Gross <agross@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 13 Jul 2015, Bjorn Andersson wrote:

> On Tue 07 Jul 05:16 PDT 2015, Lee Jones wrote:
>=20
> > FAO Mark and DT chaps,
> >=20
> > > From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> > >=20
> > > Add binding documentation for the Qualcomm Resource Power Manager=
 (RPM)
> > > using shared memory (Qualcomm SMD) as transport mechanism. This i=
s found
> > > in 8974 and newer based devices.
> > >=20
> > > The binding currently describes the rpm itself and the regulator
> > > subnodes.
> > >=20
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> > > ---
> > >  .../devicetree/bindings/mfd/qcom-rpm-smd.txt       | 117 +++++++=
++++++++++++++
> > >  include/dt-bindings/mfd/qcom-smd-rpm.h             |  28 +++++
> > >  2 files changed, 145 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/qcom-rp=
m-smd.txt
> > >  create mode 100644 include/dt-bindings/mfd/qcom-smd-rpm.h
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/mfd/qcom-rpm-smd.t=
xt b/Documentation/devicetree/bindings/mfd/qcom-rpm-smd.txt
>=20
> [..]
>=20
> > > +- qcom,smd-channels:
> > > +	Usage: required
> > > +	Value type: <stringlist>
> > > +	Definition: Shared Memory channel used for communication with t=
he RPM
> >=20
> > This is going to require a DT Ack.
> >=20
> > Also, I don't see it being used anywhere.
>=20
> It's a common property of all smd devices, defining the smd channel t=
his
> driver should bind to.

Well it's not in the kernel and I can't find the patch that uses it,
so my points still stand.

> > > +=3D EXAMPLE
> > > +
> > > +	smd {
> > > +		compatible =3D "qcom,smd";
> >=20
> > Is an SMD (Shared Memory Device?) real hardware?
> >=20
>=20
> SMD is a mechanism for using shared memory for point-to-point
> communication channels with remote processors in all Qualcomm platfor=
ms.
>=20
> So it's not hardware, it's the control mechanism for communicating wi=
th
> real hardware.

Then you can't have a node for it.  Virtual nodes which do not
represent real h/w are not allowed in Device Tree.

> > > +		rpm {
> > > +			interrupts =3D <0 168 1>;
> > > +			qcom,ipc =3D <&apcs 8 0>;
> > > +			qcom,smd-edge =3D <15>;
> >=20
> > The child node won't probe without a compatible string.  Shouldn't
> > "qcom,rpm-msm8974" be in here instead?
> >=20
>=20
> These sub-nodes represents a logical grouping of the various channels
> that exist to this remote processor. For the rpm there is only the
> "rpm_requests" channel - used for sending regulator & clock requests.

Again, if it's not real h/w and don't have a proper driver, there
should be no reason for this node to exist.

> > > +			rpm_requests {
> >=20
> > This node appears to be undocumented.
>=20
> This is the actual rpm device node, the smd & rpm nodes above are
> included for completeness of the example.
>=20
> They should perhaps be dropped to make this clearer.
>=20
> > Does it represent real h/w?
> >=20
>=20
> The other end of this smd channel is a micro controller that handles
> regulator and clock requests for the platform - so this is hardware.
>=20
> This is equivalent to the qcom_rpm driver, but instead of a hardware
> like register window this uses the same packet based messaging mechan=
ism
> that's used for other remote peripherals in the Qualcomm platform.

This needs a good review by the DT guys.

> > > +				compatible =3D "qcom,rpm-msm8974";
> > > +				qcom,smd-channels =3D "rpm_requests";
> > > +
> > > +				pm8941-regulators {
> > > +					compatible =3D "qcom,rpm-pm8941-regulators";
> > > +					vdd_l13_l20_l23_l24-supply =3D <&pm8941_boost>;
> >=20
> > I'd like Mark to glance at this.
> >=20
>=20
> Right.
>=20
> > > +					pm8941_s3: s3 {
> > > +						regulator-min-microvolt =3D <1800000>;
> > > +						regulator-max-microvolt =3D <1800000>;
> >=20
> > Aren't these fixed regulators?
> >=20
>=20
> In this system configuration most of the regulators have fixed values=
,
> but the regulators (hw) are not fixed.

I'm not sure that's how it works.  I believe 'max' and 'min' should
describe the upper and lower constraints of the regulator.  The actual
value it runs it is selected elsewhere.

We still need Mark to look at this.

> > > +					};
> > > +
> > > +					pm8941_boost: s4 {
> > > +						regulator-min-microvolt =3D <5000000>;
> > > +						regulator-max-microvolt =3D <5000000>;
> > > +					};
> > > +
> > > +					pm8941_l20: l20 {
> > > +						regulator-min-microvolt =3D <2950000>;
> > > +						regulator-max-microvolt =3D <2950000>;
> > > +					};
> > > +				};
> > > +			};
> > > +		};
> > > +	};
> > > +
>=20
> Thanks,
> Bjorn

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
