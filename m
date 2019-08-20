From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 0/8] arm64: dts: qcom: sm8150: Add SM8150 DTS
Date: Tue, 20 Aug 2019 18:09:41 +0530
Message-ID: <20190820123941.GE12733@vkoul-mobl.Dlink>
References: <20190820064216.8629-1-vkoul@kernel.org>
 <20190820122809.GF31261@centauri>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190820122809.GF31261@centauri>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 20-08-19, 14:28, Niklas Cassel wrote:
> On Tue, Aug 20, 2019 at 12:12:08PM +0530, Vinod Koul wrote:
> > This series adds DTS for SM8150, PMIC PM8150, PM8150B, PM8150L and
> > the MTP for SM8150.
> > 
> > Changes in v2:
> >  - Squash patches
> >  - Fix comments given by Stephen namely, lowercase for hext numbers,
> >    making rpmhcc have xo_board as parent, rename pon controller to
> >    power-on controller, make pmic nodes as disabled etc.
> >  - removed the dependency on clk defines and use raw numbers
> > 
> > Vinod Koul (8):
> >   arm64: dts: qcom: sm8150: add base dts file
> >   arm64: dts: qcom: pm8150: Add Base DTS file
> >   arm64: dts: qcom: pm8150b: Add Base DTS file
> >   arm64: dts: qcom: pm8150l: Add Base DTS file
> >   arm64: dts: qcom: sm8150-mtp: add base dts file
> 
> Use consistent naming.

Will do :)

Thanks for the review Niklas

-- 
~Vinod
