From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: sm8150-mtp: Add regulators
Date: Tue, 20 Aug 2019 18:07:38 +0530
Message-ID: <20190820123738.GD12733@vkoul-mobl.Dlink>
References: <20190820064216.8629-1-vkoul@kernel.org>
 <20190820064216.8629-7-vkoul@kernel.org>
 <20190820122604.GA31261@centauri>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190820122604.GA31261@centauri>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 20-08-19, 14:26, Niklas Cassel wrote:
> On Tue, Aug 20, 2019 at 12:12:14PM +0530, Vinod Koul wrote:
> > Add the regulators found in the mtp platform. This platform consists of
> > pmic PM8150, PM8150L and PM8009.
> 
> Is there a reason not to squash this this patch 5/8 ?

I typically like big chunks to split logically so that is the reason why
I still kept this off from base dts one

-- 
~Vinod
