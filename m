From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: clk-rpmh: Add support for SM8150
Date: Fri, 16 Aug 2019 09:54:40 +0530
Message-ID: <20190816042440.GY12733@vkoul-mobl.Dlink>
References: <20190814122958.4981-1-vkoul@kernel.org>
 <20190814122958.4981-2-vkoul@kernel.org>
 <20190814171946.E9E8D20665@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814171946.E9E8D20665@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14-08-19, 10:19, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-08-14 05:29:58)
> > Add support for rpmh clocks found in SM8150
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> 
> Patch looks OK, but can you convert this driver to use the new parent
> style and then update the binding to handle it? We can fix the other
> platforms and dts files that use this driver in parallel, but sm8150
> will be forward looking.

Yes but that would also impact sdm845 as it uses this driver, so I
wanted to get this one done so that we have support for rpm clock and
then do the conversion.

Would that be okay with you to get this in and then I convert this?

Thanks
-- 
~Vinod
