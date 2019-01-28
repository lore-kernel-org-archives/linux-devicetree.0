Return-Path: <vkoul@kernel.org>
Date: Mon, 28 Jan 2019 09:42:38 +0530
From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs404: Add AR8035 Phy node
Message-ID: <20190128041238.GT4635@vkoul-mobl>
References: <20190123174839.5321-1-vkoul@kernel.org>
 <20190123174839.5321-3-vkoul@kernel.org>
 <20190124220629.GA23971@centauri.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190124220629.GA23971@centauri.lan>
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Hi Niklas,

On 24-01-19, 23:06, Niklas Cassel wrote:
> On Wed, Jan 23, 2019 at 11:18:39PM +0530, Vinod Koul wrote:
> > EVB-4000 has ethernet port with AR8035 Phy, so add phy node
> > 
> > Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> > Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
> > index 5c02e874be12..ec85647cfed1 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
> > @@ -21,6 +21,17 @@
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&ethernet_defaults>;
> >  
> > +	phy-handle = <&phy1>;
> > +	phy-mode = "rgmii";
> > +	mdio {
> > +		#address-cells = <0x1>;
> > +		#size-cells = <0x0>;
> > +		compatible = "snps,dwmac-mdio";
> > +		phy1: phy@4 {
> 
> Hello Vinod,
> 
> The AR8035 PHY is compliant with IEEE802.3u clause 22, so please add:
> compatible = "ethernet-phy-ieee802.3-c22";

OKay will test and add..

> 
> Also, please squash this commit with PATCH 2/3.
> The previous patch sets status = "ok" without having a PHY defined,
> but I also don't see any reason to keep 2/3 and 3/3 as separate patches.

Yeah agree, in orignal scheme of things it made sense but not anymore so
will do that..

Thanks
-- 
~Vinod
