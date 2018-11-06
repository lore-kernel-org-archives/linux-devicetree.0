From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 13/17] arm64: dts: qcom: qcs404: Add remoteproc nodes
Date: Tue, 6 Nov 2018 23:17:01 +0530
Message-ID: <20181106174701.GB12092@vkoul-mobl>
References: <20181105154529.7614-1-vkoul@kernel.org>
 <20181105154529.7614-14-vkoul@kernel.org>
 <20181105191035.GR2523@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181105191035.GR2523@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05-11-18, 11:10, Bjorn Andersson wrote:
> On Mon 05 Nov 07:45 PST 2018, Vinod Koul wrote:
> 
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > 
> > Add the TrustZone based remoteproc nodes and their glink edges for
> > adsp, cdsp and wcss.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs404.dtsi | 87 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > index 8e207a25ddf0..b560ab6e49ff 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > @@ -373,4 +373,91 @@
> >  			#interrupt-cells = <2>;
> >  		};
> >  	};
> > +
> > +	remoteproc-adsp {
> > +		compatible = "qcom,qcs404-adsp-pas";
> > +
> > +		interrupts-extended = <&intc GIC_SPI 293 IRQ_TYPE_EDGE_RISING>,
> > +				      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > +				      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > +				      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > +				      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> > +		interrupt-names = "wdog", "fatal", "ready",
> > +				  "handover", "stop-ack";
> > +
> > +		clocks = <&xo_board>;
> > +		clock-names = "xo";
> > +
> 
> As the TZ-backed remoteproc drivers will not be used on all variation of
> products on this platform please add status = "disabled"; to these nodes
> and enable them in the evb.

Sure will update this one

-- 
~Vinod
