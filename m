From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH v2 05/11] mfd: devicetree: bindings: Add Qualcomm SMD
 based RPM DT binding
Date: Thu, 23 Jul 2015 09:41:28 -0700
Message-ID: <20150723164128.GD4753@usrtlx11787.corpusers.net>
References: <1435355419-23602-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1435355419-23602-6-git-send-email-bjorn.andersson@sonymobile.com>
 <20150707121609.GZ3182@x1>
 <20150713214836.GA15178@usrtlx11787.corpusers.net>
 <20150723133133.GB3436@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150723133133.GB3436@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "bjorn-UYDU3/A3LUY@public.gmane.org" <bjorn-UYDU3/A3LUY@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu 23 Jul 06:31 PDT 2015, Lee Jones wrote:

> On Mon, 13 Jul 2015, Bjorn Andersson wrote:
> 
> > On Tue 07 Jul 05:16 PDT 2015, Lee Jones wrote:
> > 
> > > FAO Mark and DT chaps,
> > > 
> > > > From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> > > > 
> > > > Add binding documentation for the Qualcomm Resource Power Manager (RPM)
> > > > using shared memory (Qualcomm SMD) as transport mechanism. This is found
> > > > in 8974 and newer based devices.
> > > > 
> > > > The binding currently describes the rpm itself and the regulator
> > > > subnodes.
> > > > 
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> > > > ---
> > > >  .../devicetree/bindings/mfd/qcom-rpm-smd.txt       | 117 +++++++++++++++++++++
> > > >  include/dt-bindings/mfd/qcom-smd-rpm.h             |  28 +++++
> > > >  2 files changed, 145 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/mfd/qcom-rpm-smd.txt
> > > >  create mode 100644 include/dt-bindings/mfd/qcom-smd-rpm.h
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/mfd/qcom-rpm-smd.txt b/Documentation/devicetree/bindings/mfd/qcom-rpm-smd.txt
> > 
> > [..]
> > 
> > > > +- qcom,smd-channels:
> > > > +	Usage: required
> > > > +	Value type: <stringlist>
> > > > +	Definition: Shared Memory channel used for communication with the RPM
> > > 
> > > This is going to require a DT Ack.
> > > 
> > > Also, I don't see it being used anywhere.
> > 
> > It's a common property of all smd devices, defining the smd channel this
> > driver should bind to.
> 
> Well it's not in the kernel and I can't find the patch that uses it,
> so my points still stand.
> 

Patch 3 in this series defines the binding and patch 4 is an
implementation of this binding.

> > > > += EXAMPLE
> > > > +
> > > > +	smd {
> > > > +		compatible = "qcom,smd";
> > > 
> > > Is an SMD (Shared Memory Device?) real hardware?
> > > 
> > 
> > SMD is a mechanism for using shared memory for point-to-point
> > communication channels with remote processors in all Qualcomm platforms.
> > 
> > So it's not hardware, it's the control mechanism for communicating with
> > real hardware.
> 
> Then you can't have a node for it.  Virtual nodes which do not
> represent real h/w are not allowed in Device Tree.
> 

It represent the structure of a Qualcomm platform, but there's not a 1:1
mapping between this node and a discrete component. And without the
information it carries there's no way for us to reach e.g. the RPM -
which is a discrete physical component.

But I understand that this discussion should be held on patch 3 and with
the DT maintainers.

> > > > +		rpm {
> > > > +			interrupts = <0 168 1>;
> > > > +			qcom,ipc = <&apcs 8 0>;
> > > > +			qcom,smd-edge = <15>;
> > > 
> > > The child node won't probe without a compatible string.  Shouldn't
> > > "qcom,rpm-msm8974" be in here instead?
> > > 
> > 
> > These sub-nodes represents a logical grouping of the various channels
> > that exist to this remote processor. For the rpm there is only the
> > "rpm_requests" channel - used for sending regulator & clock requests.
> 
> Again, if it's not real h/w and don't have a proper driver, there
> should be no reason for this node to exist.
> 

We need to get hold of the interrupts and that regmap to be able to
communicate with the RPM. If this information is not in DT there will be
no communication - further we can not move it into the RPM node as with
all other remote processors (WiFi, DSP etc) these resources are shared
between a number of drivers.

> > > > +			rpm_requests {
> > > 
> > > This node appears to be undocumented.
> > 
> > This is the actual rpm device node, the smd & rpm nodes above are
> > included for completeness of the example.
> > 
> > They should perhaps be dropped to make this clearer.
> > 
> > > Does it represent real h/w?
> > > 
> > 
> > The other end of this smd channel is a micro controller that handles
> > regulator and clock requests for the platform - so this is hardware.
> > 
> > This is equivalent to the qcom_rpm driver, but instead of a hardware
> > like register window this uses the same packet based messaging mechanism
> > that's used for other remote peripherals in the Qualcomm platform.
> 
> This needs a good review by the DT guys.
> 

Sure

> > > > +				compatible = "qcom,rpm-msm8974";
> > > > +				qcom,smd-channels = "rpm_requests";
> > > > +
> > > > +				pm8941-regulators {
> > > > +					compatible = "qcom,rpm-pm8941-regulators";
> > > > +					vdd_l13_l20_l23_l24-supply = <&pm8941_boost>;
> > > 
> > > I'd like Mark to glance at this.
> > > 
> > 
> > Right.
> > 
> > > > +					pm8941_s3: s3 {
> > > > +						regulator-min-microvolt = <1800000>;
> > > > +						regulator-max-microvolt = <1800000>;
> > > 
> > > Aren't these fixed regulators?
> > > 
> > 
> > In this system configuration most of the regulators have fixed values,
> > but the regulators (hw) are not fixed.
> 
> I'm not sure that's how it works.  I believe 'max' and 'min' should
> describe the upper and lower constraints of the regulator.  The actual
> value it runs it is selected elsewhere.
> 

The specified range of the regulator is 1.75-1.85V and this is handled
by the implementation, however the board designers have stated that it
is only allowed to be configured to 1.8V.

So DT is used to narrow the capabilities of the individual component to
something that's suitable for this particular system.

> We still need Mark to look at this.
> 

Mark, would you mind giving us a statement on the regulator subnode of
this binding?

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
