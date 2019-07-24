From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sdm845: Add unit name to soc node
Date: Wed, 24 Jul 2019 09:37:43 +0530
Message-ID: <20190724040743.GB12733@vkoul-mobl.Dlink>
References: <20190722123422.4571-1-vkoul@kernel.org>
 <20190722123422.4571-2-vkoul@kernel.org>
 <5d371e9d.1c69fb81.8d9f4.1ac0@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5d371e9d.1c69fb81.8d9f4.1ac0@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 23-07-19, 07:50, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-07-22 05:34:18)
> > We get a warning about missing unit name for soc node, so add it.
> > 
> > arch/arm64/boot/dts/qcom/sdm845.dtsi:623.11-2814.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Thanks for the review
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index 601cfb078bd5..e81f4a6d08ce 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -620,7 +620,7 @@
> >                 method = "smc";
> >         };
> >  
> > -       soc: soc {
> > +       soc: soc@0 {
> 
> This is kinda sad, but ok. Maybe you can apply this fix to at least all
> the qcom boards then.

Yeah that is the idea, start with sdm845 and 'reduce' the warns on all
qcom dts files

-- 
~Vinod
