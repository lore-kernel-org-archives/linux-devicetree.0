From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Specify dload address for
 msm8916 and msm8996
Date: Wed, 31 May 2017 14:56:54 -0700
Message-ID: <20170531215654.GV12920@tuxbook>
References: <20170527063308.10483-1-bjorn.andersson@linaro.org>
 <20170527063308.10483-3-bjorn.andersson@linaro.org>
 <20170531163024.GB20170@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170531163024.GB20170@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 31 May 09:30 PDT 2017, Stephen Boyd wrote:

> On 05/26, Bjorn Andersson wrote:
> > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > index ab3093995ded..33013835639d 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > @@ -241,6 +241,8 @@
> >  			clocks = <&gcc GCC_CRYPTO_CLK>, <&gcc GCC_CRYPTO_AXI_CLK>, <&gcc GCC_CRYPTO_AHB_CLK>;
> >  			clock-names = "core", "bus", "iface";
> >  			#reset-cells = <1>;
> > +
> > +			qcom,dload-mode-addr = <0x0 0x193d100>;
> 
> This is TCSR, so why not a phandle to a node?
> 

That makes sense, the region is not mentioned in my documentation and I
didn't catch that it's in the middle of &tcsr. I'll update it to
reference the existing syscon.

Regards,
Bjorn
