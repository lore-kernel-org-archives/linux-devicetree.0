From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845: Add Coresight support
Date: Thu, 17 Jan 2019 11:50:27 -0800
Message-ID: <20190117195027.GA12955@builder>
References: <cover.1547054308.git.saiprakash.ranjan@codeaurora.org>
 <a13ad49d3ae8d9a5a972027283b7212ab19f97d0.1547054308.git.saiprakash.ranjan@codeaurora.org>
 <20190113072319.GB28907@builder>
 <5724d2d4-39df-a923-5f94-b53c40a84fd3@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5724d2d4-39df-a923-5f94-b53c40a84fd3@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 15 Jan 08:27 PST 2019, Sai Prakash Ranjan wrote:

> Hi Bjorn,
> 
> Thanks for the review. Please find my comments inline.
> 
> On 1/13/2019 12:53 PM, Bjorn Andersson wrote:
> > On Wed 09 Jan 09:46 PST 2019, Sai Prakash Ranjan wrote:
> > 
> > > Add coresight components found on Qualcomm SDM845 SoC.
> > > 
> > > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > 
> > Hi Sai,
> > 
> > The content of this patch looks good, but please fold it into
> > sdm845.dtsi (keep the nodes sorted by address).
> > 
> 
> I had looked at the sample from hi6220 for coresight and
> decided to keep sdm845 coresight dtsi in separate file as it
> would look much cleaner than mixing it with main dtsi file.
> Also I guess it would make coresight topology more understandable
> if we keep it separately (plus there are about 400+ lines of coresight
> dt entries). Is there any reason for wanting coresight entries merged
> into sdm845.dtsi file? If you still prefer it, I can make the
> change in the next version.
> 

There seems to be some variations of this, but we try to keep everything
sorted in sdm845.dtsi to avoid having to jump around between the various
files. So please merge it into sdm845.dtsi (sorted by address).

Regards,
Bjorn

> > And mention below the --- that this depends on my AMBA bus pclk change
> > and include the URL:
> > 
> > https://lore.kernel.org/lkml/20190106080915.4493-7-bjorn.andersson@linaro.org/
> > 
> 
> I had mentioned this dependency in the cover letter. But I suppose
> I can mention it here as well.
> 
> Thanks,
> Sai
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
