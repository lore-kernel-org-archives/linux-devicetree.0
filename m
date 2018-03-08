From: <ilialin@codeaurora.org>
Subject: RE: [PATCH 2/2] dt-bindings: Add support for SAW documentation
Date: Thu, 8 Mar 2018 14:14:12 +0200
Message-ID: <09f301d3b6d6$fa79cfe0$ef6d6fa0$@codeaurora.org>
References: <1520166709-554-1-git-send-email-ilialin@codeaurora.org> <1520166709-554-3-git-send-email-ilialin@codeaurora.org> <20180307204115.mugm7m3egrc73og2@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180307204115.mugm7m3egrc73og2@rob-hp-laptop>
Content-Language: en-us
Sender: linux-kernel-owner@vger.kernel.org
To: 'Rob Herring' <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, mark.rutland@arm.com, amit.kucheria@linaro.org, nicolas.dechesne@linaro.org, celster@codeaurora.org, tfinkel@codeaurora.org
List-Id: devicetree@vger.kernel.org

Thanks for the review, Rob.

I used existing drivers as reference and defined in the same way. Could you
point me to a reference that is correct from your point of view?

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Wednesday, March 7, 2018 22:41
> To: Ilia Lin <ilialin@codeaurora.org>
> Cc: linux-kernel@vger.kernel.org; devicetree@vger.kernel.org;
> lgirdwood@gmail.com; broonie@kernel.org; mark.rutland@arm.com;
> amit.kucheria@linaro.org; nicolas.dechesne@linaro.org;
> celster@codeaurora.org; tfinkel@codeaurora.org
> Subject: Re: [PATCH 2/2] dt-bindings: Add support for SAW documentation
> 
> On Sun, Mar 04, 2018 at 02:31:49PM +0200, Ilia Lin wrote:
> > Add support for SAW controlled regulators in 8x96.
> > Document it.
> >
> > Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> > ---
> >  .../bindings/regulator/qcom,spmi-regulator.txt     | 45
> ++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> > b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> > index 57d2c65..406f2e5 100644
> > ---
> > a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> > +++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-
> regulator.
> > +++ txt
> > @@ -110,6 +110,11 @@ Qualcomm SPMI Regulators
> >  	Definition: Reference to regulator supplying the input pin, as
> >  		    described in the data sheet.
> >
> > +- qcom,saw-reg:
> > +	Usage: optional
> > +	Value type: <phandle>
> > +	Description: Reference to syscon node defining the SAW registers.
> > +
> >
> >  The regulator node houses sub-nodes for each regulator within the
> > device. Each  sub-node is identified using the node's name, with valid
> > values listed for each @@ -201,6 +206,17 @@ see regulator.txt - with
> additional custom properties described below:
> >  			2 = 0.55 uA
> >  			3 = 0.75 uA
> >
> > +- qcom,saw-slave:
> > +	Usage: optional
> > +	Value type: <boo>
> > +	Description: SAW controlled gang slave. Will not be configured.
> > +
> > +- qcom,saw-leader:
> > +	Usage: optional
> > +	Value type: <boo>
> > +	Description: SAW controlled gang leader. Will be configured as
> > +		     SAW regulator.
> > +
> >  Example:
> >
> >  	regulators {
> > @@ -221,3 +237,32 @@ Example:
> >
> >  		....
> >  	};
> > +
> > +Example 2:
> > +
> > +	saw3: syscon@9A10000 {
> > +		compatible = "syscon";
> 
> syscon should not be used alone. It should have a specific compatible too.
> 
> > +		reg = <0x9A10000 0x1000>;
> > +	};
> > +
> > +	...
> > +
> > +	spm-regulators {
> > +		compatible = "qcom,pm8994-regulators";
> > +		qcom,saw-reg = <&saw3>;
> 
> Why not just a child of the syscon?
> 
> > +		s8 {
> > +			qcom,saw-slave;
> > +		};
> > +		s9 {
> > +			qcom,saw-slave;
> > +		};
> > +		s10 {
> > +			qcom,saw-slave;
> > +		};
> > +		pm8994_s11_saw: s11 {
> > +			qcom,saw-leader;
> > +			regulator-always-on;
> > +			regulator-min-microvolt = <900000>;
> > +			regulator-max-microvolt = <1140000>;
> > +		};
> > +	};
> > --
> > Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> >
