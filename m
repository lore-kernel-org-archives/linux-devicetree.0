From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v3 5/7] dt-bindings: power: Add qcom rpmh power domain
 driver bindings
Date: Tue, 19 Jun 2018 15:29:35 +0530
Message-ID: <20180619095935.ppcotralnwe3bb7p@vireshk-i7>
References: <20180612044052.4402-1-rnayak@codeaurora.org>
 <20180612044052.4402-6-rnayak@codeaurora.org>
 <ca7fd33a-5ecd-203e-4a83-09c4f1074c2e@codeaurora.org>
 <383ec081-d03b-5d71-3f28-9be31a3356d9@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <383ec081-d03b-5d71-3f28-9be31a3356d9@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: David Collins <collinsd@codeaurora.org>, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14-06-18, 11:56, Rajendra Nayak wrote:
> On 06/14/2018 03:42 AM, David Collins wrote:
> > Could you please add an example consumer DT node as well which uses
> > "SDM845 Power Domain Indexes" from qcom-rpmhpd.h?  It isn't clear how a
> > specific power domain (e.g. SDM845_CX) is specified from the consumer
> > side.  It also isn't clear how the consumer specifies a mapping for the
> > power domain levels that it will be using.
> 
> I can add an example consumer with a power-domains property pointing to
> the phandle and index (as is general practice)
> 
> For specifying the power domain levels, I am not quite sure what the approach
> we would use. One way is for consumers to use OPP bindings, but that wasn't
> liked by some and we now have plans to stuff it all within the clock driver code.

Even in that case the information should come from DT somehow. So the consumer
doesn't need an OPP table for itself, but it can/should have the "required-opps"
property which points to an entry in the genpd OPP table.

> In which case I expect we would just maintain internal mapping tables for clock
> frequencies/power domain levels so nothing comes in from DT, or maybe it will
> come in from DT, i just don't know.
> 
> I can certainly describe the OPP way a consumer could map to a power domain level,
> but I am not sure how the clock bindings if any would be at this point to handle this.

-- 
viresh
