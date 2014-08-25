From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH v3 3/6] pinctrl: Add documentation for SPMI PMIC pinctrl
 driver bindings
Date: Mon, 25 Aug 2014 17:07:47 +0300
Message-ID: <1408975667.5256.45.camel@iivanov-dev>
References: <1407771634-14946-1-git-send-email-iivanov@mm-sol.com>
	 <1407771634-14946-4-git-send-email-iivanov@mm-sol.com>
	 <20140813143247.GE32301@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20140813143247.GE32301@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2014-08-13 at 07:32 -0700, Stephen Boyd wrote:
> On 08/11, Ivan T. Ivanov wrote:
> > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
> > new file mode 100644
> > index 0000000..0a64567
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
> > @@ -0,0 +1,179 @@
> > +Qualcomm PMIC Multi-Purpose Pin (MPP) block
> > +
> > +This binding describes the MPP block(s) found in the 8xxx series of pmics from
> > +Qualcomm.
> > +
> > +- compatible:
> > +	Usage: required
> > +	Value type: <string>
> > +	Definition: must be one of:
> > +		    "qcom,pm8841-mpp"
> > +		    "qcom,pm8941-mpp"
> > +		    "qcom,pma8084-mpp"
> > +
> > +- reg:
> > +	Usage: required
> > +	Value type: <u32>
> > +	Definition: Register base of the gpio block
> 
> MPP?
> 
> > +
> > +- interrupts:
> > +	Usage: required
> > +	Value type: <prop-encoded-array>
> > +	Definition: Must contain an array of encoded interrupt specifiers for
> > +		    each available gpio
> 
> MPP? Maybe gpio makes sense.

Thank you Stephen. Will fix them in next version.

regards,
Ivan
