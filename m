From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH 1/2] mfd: pm8x41: add support for Qualcomm 8x41 PMICs
Date: Mon, 28 Apr 2014 10:11:00 +0300
Message-ID: <1398669060.5214.8.camel@iivanov-dev>
References: <1398213110-28135-1-git-send-email-courtney.cavin@sonymobile.com>
	 <1398259168.4724.217.camel@iivanov-dev> <535AFD96.90505@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <535AFD96.90505@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: Courtney Cavin <courtney.cavin@sonymobile.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Josh Cartwright <joshc@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Hi Frank,

On Fri, 2014-04-25 at 17:28 -0700, Frank Rowand wrote:
> On 4/23/2014 6:19 AM, Ivan T. Ivanov wrote:

<snip>

> > spmi {
> > 	compatible = "qcom,spmi-pmic-arb";
> > 	reg-names = "core", "intr", "cnfg";
> > 	reg = <0xfc4cf000 0x1000>,
> > 	      <0xfc4cb000 0x1000>,
> > 	      <0xfc4ca000 0x1000>;
> > 
> > 	interrupt-names = "periph_irq";
> > 	interrupts = <0 190 0>;
> > 
> > 	qcom,ee = <0>;
> > 	qcom,channel = <0>;
> > 
> > 	#address-cells = <2>;
> > 	#size-cells = <0>;
> > 
> > 	interrupt-controller;
> > 	#interrupt-cells = <4>;
> > 
> > 	pm8941@0 {
> > 		compatible = "qcom,pm8941";
> > 		reg = <0x0 SPMI_USID>;
> > 
> > 		#address-cells = <1>;
> > 		#size-cells = <0>;
> > 
> > 		revid@100 {
> > 			compatible = "qcom,qpnp-revid";
> > 			reg = <0x100 0x100>;

This should be just reg = <0x100>;

> > 		};
> > 	};
> > 
> > 	pm8841@4 {
> 
>         ^^^^^^^^  typo nit - that should be pm8941@4.
>                   The nit does not change what you reported though.
> 
> > 		compatible = "qcom,pm8941";

Actually this one is incorrect, it should be "qcom,pm8841", 
but as you say it doesn't make difference in the end result.

> > 		reg = <0x4 SPMI_USID>;
> > 
> > 		#address-cells = <1>;
> > 		#size-cells = <0>;
> > 
> > 		revid@100 {
> > 			compatible = "qcom,qpnp-revid";
> > 			reg = <0x100 0x100>;

also here.

Regards,
Ivan
