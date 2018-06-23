Return-Path: <vkoul@kernel.org>
Date: Sat, 23 Jun 2018 09:59:50 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: power: reset: Add qcom pon binding
Message-ID: <20180623042950.GS27187@vkoul-mobl>
References: <20180618143548.29900-1-vkoul@kernel.org>
 <20180618143548.29900-2-vkoul@kernel.org>
 <20180622205816.GF3402@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180622205816.GF3402@tuxbook-pro>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 22-06-18, 13:58, Bjorn Andersson wrote:
> On Mon 18 Jun 07:35 PDT 2018, Vinod Koul wrote:
> 
> > +The Power On driver for Qualcomm PM8xxx is MFD supporting pwrkey and
> > +resin along with the Android reboot-mode.
> > +
> > +This DT node has pwrkey and resin as sub nodes.
> > +
> > +Required Properties:
> > +-compatible: "qcom,pm8916-pon"
> > +-reg: Specifies the physical address of the pon register
> > +
> > +Optional property:
> 
> Better call these "Optional subnodes".

Yes will do..

> > +-prwrkey: Specifies the subnode pwrkey and should follow the
> > + qcom,pm8xxx-pwrkey.txt description.
> > +-resin: Specifies the subnode resin and should follow the
> > + qcom,pm8xxx-pwrkey.txt description.
> > +
> > +The rest of the properties should follow the generic reboot-mode description
> > +found in reboot-mode.txt
> > +
> > +Example:
> > +
> > +	pon@800 {
> > +		compatible = "qcom,pm8916-pon";
> > +
> > +		reg = <0x800>;
> > +		mode-bootloader = <0x2>;
> > +		mode-recovery = <0x1>;
> > +
> > +		pwrkey {
> > +			compatible = "qcom,pm8941-pwrkey";
> > +			reg = <0x800>;
> 
> Didn't we conclude that you could drop the "reg" of the children?

Sloppy me, fixed the code & DTS but not the binding, thanks for pointing

> Apart from that this looks good.

Thanks :)

-- 
~Vinod
