From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH v2 05/11] mfd: devicetree: bindings: Add Qualcomm SMD
 based RPM DT binding
Date: Mon, 13 Jul 2015 14:48:36 -0700
Message-ID: <20150713214836.GA15178@usrtlx11787.corpusers.net>
References: <1435355419-23602-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1435355419-23602-6-git-send-email-bjorn.andersson@sonymobile.com>
 <20150707121609.GZ3182@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150707121609.GZ3182@x1>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: bjorn@kryo.se, Andy Gross <agross@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 07 Jul 05:16 PDT 2015, Lee Jones wrote:

> FAO Mark and DT chaps,
> 
> > From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> > 
> > Add binding documentation for the Qualcomm Resource Power Manager (RPM)
> > using shared memory (Qualcomm SMD) as transport mechanism. This is found
> > in 8974 and newer based devices.
> > 
> > The binding currently describes the rpm itself and the regulator
> > subnodes.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> > ---
> >  .../devicetree/bindings/mfd/qcom-rpm-smd.txt       | 117 +++++++++++++++++++++
> >  include/dt-bindings/mfd/qcom-smd-rpm.h             |  28 +++++
> >  2 files changed, 145 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/qcom-rpm-smd.txt
> >  create mode 100644 include/dt-bindings/mfd/qcom-smd-rpm.h
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom-rpm-smd.txt b/Documentation/devicetree/bindings/mfd/qcom-rpm-smd.txt

[..]

> > +- qcom,smd-channels:
> > +	Usage: required
> > +	Value type: <stringlist>
> > +	Definition: Shared Memory channel used for communication with the RPM
> 
> This is going to require a DT Ack.
> 
> Also, I don't see it being used anywhere.
> 

It's a common property of all smd devices, defining the smd channel this
driver should bind to.

> > += SUBDEVICES
> > +
> > +The RPM exposes resources to its subnodes. The below bindings specify the set
> > +of valid subnodes that can operate on these resources.
> > +
> > +== Regulators
> > +

[..]

> > +The content of each sub-node is defined by the standard binding for regulators -
> > +see regulator.txt.
> 
> s-regulator.txt-../regulator/regulator.txt-
> 

Right.

> > +
> > += EXAMPLE
> > +
> > +	smd {
> > +		compatible = "qcom,smd";
> 
> Is an SMD (Shared Memory Device?) real hardware?
> 

SMD is a mechanism for using shared memory for point-to-point
communication channels with remote processors in all Qualcomm platforms.

So it's not hardware, it's the control mechanism for communicating with
real hardware.

> > +		rpm {
> > +			interrupts = <0 168 1>;
> > +			qcom,ipc = <&apcs 8 0>;
> > +			qcom,smd-edge = <15>;
> 
> The child node won't probe without a compatible string.  Shouldn't
> "qcom,rpm-msm8974" be in here instead?
> 

These sub-nodes represents a logical grouping of the various channels
that exist to this remote processor. For the rpm there is only the
"rpm_requests" channel - used for sending regulator & clock requests.

> > +			rpm_requests {
> 
> This node appears to be undocumented.
> 

This is the actual rpm device node, the smd & rpm nodes above are
included for completeness of the example.

They should perhaps be dropped to make this clearer.

> Does it represent real h/w?
> 

The other end of this smd channel is a micro controller that handles
regulator and clock requests for the platform - so this is hardware.

This is equivalent to the qcom_rpm driver, but instead of a hardware
like register window this uses the same packet based messaging mechanism
that's used for other remote peripherals in the Qualcomm platform.

> > +				compatible = "qcom,rpm-msm8974";
> > +				qcom,smd-channels = "rpm_requests";
> > +
> > +				pm8941-regulators {
> > +					compatible = "qcom,rpm-pm8941-regulators";
> > +					vdd_l13_l20_l23_l24-supply = <&pm8941_boost>;
> 
> I'd like Mark to glance at this.
> 

Right.

> > +					pm8941_s3: s3 {
> > +						regulator-min-microvolt = <1800000>;
> > +						regulator-max-microvolt = <1800000>;
> 
> Aren't these fixed regulators?
> 

In this system configuration most of the regulators have fixed values,
but the regulators (hw) are not fixed.

> > +					};
> > +
> > +					pm8941_boost: s4 {
> > +						regulator-min-microvolt = <5000000>;
> > +						regulator-max-microvolt = <5000000>;
> > +					};
> > +
> > +					pm8941_l20: l20 {
> > +						regulator-min-microvolt = <2950000>;
> > +						regulator-max-microvolt = <2950000>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +	};
> > +

Thanks,
Bjorn
