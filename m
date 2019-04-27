From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: pms405: increase s3 max voltage
Date: Fri, 26 Apr 2019 21:55:43 -0700
Message-ID: <20190427045543.GG3137@builder>
References: <20190425113429.14321-1-niklas.cassel@linaro.org>
 <20190425121805.GA17362@centauri>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190425121805.GA17362@centauri>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 25 Apr 05:18 PDT 2019, Niklas Cassel wrote:

> The commit description should be: arm64: dts: qcom: qcs404-evb:
> 
> (The s3 regulator node moved during upstreaming.)
> 
> Andy/Bjorn, could you please fix this before applying?
> 

Picked up with the subject change.

Thanks,
Bjorn

> Kind regards,
> Niklas
> 
> On Thu, Apr 25, 2019 at 01:34:29PM +0200, Niklas Cassel wrote:
> > Increase s3 max voltage in accordance to QCS404 CPR Fusing Guide Rev 6.0
> > 
> > Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> > index 2c3127167e3c..6910fc663fe1 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> > @@ -64,7 +64,7 @@
> >  		regulator-boot-on;
> >  		regulator-name = "vdd_apc";
> >  		regulator-min-microvolt = <1048000>;
> > -		regulator-max-microvolt = <1352000>;
> > +		regulator-max-microvolt = <1384000>;
> >  	};
> >  };
> >  
> > -- 
> > 2.20.1
> > 
