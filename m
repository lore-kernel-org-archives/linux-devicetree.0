Return-Path: <SRS0=vVIs=VT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:41008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729765AbfGVNt4 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 22 Jul 2019 09:49:56 -0400
Date: Mon, 22 Jul 2019 19:18:43 +0530
From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sdm845: remove macro from unit name
Message-ID: <20190722134843.GR12733@vkoul-mobl.Dlink>
References: <20190722123422.4571-1-vkoul@kernel.org>
 <20190722123422.4571-5-vkoul@kernel.org>
 <a100cb6e-78d0-8fde-131a-2b10f9f0819d@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a100cb6e-78d0-8fde-131a-2b10f9f0819d@free.fr>
Sender: devicetree-owner@vger.kernel.org
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 22-07-19, 15:18, Marc Gonzalez wrote:
> On 22/07/2019 14:34, Vinod Koul wrote:
> 
> > Unit name is supposed to be a number, using a macro with hex value is
> > not recommended, so add the value in unit name.
> > 
> > arch/arm64/boot/dts/qcom/pm8998.dtsi:81.18-84.6: Warning (unit_address_format): /soc/spmi@c440000/pmic@0/adc@3100/adc-chan@0x06: unit name should not have leading "0x"
> > arch/arm64/boot/dts/qcom/pm8998.dtsi:81.18-84.6: Warning (unit_address_format): /soc/spmi@c440000/pmic@0/adc@3100/adc-chan@0x06: unit name should not have leading 0s
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/pm8998.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> > index 051a52df80f9..d76c8377c224 100644
> > --- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> > @@ -78,7 +78,7 @@
> >  			#size-cells = <0>;
> >  			#io-channel-cells = <1>;
> >  
> > -			adc-chan@ADC5_DIE_TEMP {
> > +			adc-chan@6{
> 
> You dropped the space before the {

Oops, will fix it up, thanks for pointing!

-- 
~Vinod
