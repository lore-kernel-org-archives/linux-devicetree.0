From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/2] regulator: dt-bindings: Add PM8150x compatibles
Date: Fri, 9 Aug 2019 10:13:45 +0530
Message-ID: <20190809044345.GD12733@vkoul-mobl.Dlink>
References: <20190808093343.5600-1-vkoul@kernel.org>
 <20190809032915.GK26807@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190809032915.GK26807@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08-08-19, 20:29, Bjorn Andersson wrote:
> On Thu 08 Aug 02:33 PDT 2019, Vinod Koul wrote:
> 
> > Add PM8150, PM8150L and PM8009 compatibles for these PMICs found
> > in some Qualcomm platforms.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  .../devicetree/bindings/regulator/qcom,rpmh-regulator.txt | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> > index 14d2eee96b3d..1a9cab50503a 100644
> > --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> > +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> > @@ -25,6 +25,9 @@ Supported regulator node names:
> >  	PM8998:		smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
> >  	PMI8998:	bob
> >  	PM8005:		smps1 - smps4
> > +	PM8150:		smps1 - smps10, ldo1 - ldo18
> > +	PM8150L:	smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
> > +	PM8009:		smps1 - smps2, ld01 - ldo7
> 
> Please maintain the sort order.

Ah yes, Mark has applied the patch, I will send a sort order patch. Even
in previous entries, PM8005 should be the first one..

> 
> Apart from that
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks for the review.

-- 
~Vinod
