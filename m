From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 22/22] arm64: dts: qcom: sm8150: Add APSS shared mailbox
Date: Tue, 20 Aug 2019 12:07:05 +0530
Message-ID: <20190820063705.GP12733@vkoul-mobl.Dlink>
References: <20190814125012.8700-1-vkoul@kernel.org>
 <20190814125012.8700-23-vkoul@kernel.org>
 <20190814171743.C38C4206C1@mail.kernel.org>
 <20190819174107.GM12733@vkoul-mobl.Dlink>
 <179635ff3f55d5d121008d6193ea4120@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <179635ff3f55d5d121008d6193ea4120@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 20-08-19, 11:50, Sibi Sankar wrote:
> Hey Vinod,
> 
> There seems to be a mismatch
> between the commit description
> and the dt node (This is the
> aoss qmp node not the APPS
> shared node).

Thanks for pointing, I have squashed this and other into single patch
and updated the description

> 
> 
> On 2019-08-19 23:11, Vinod Koul wrote:
> > On 14-08-19, 10:17, Stephen Boyd wrote:
> > > Quoting Vinod Koul (2019-08-14 05:50:12)
> > > > @@ -338,6 +339,16 @@
> > > >                         #interrupt-cells = <2>;
> > > >                 };
> > > >
> > > > +               aoss_qmp: qmp@c300000 {
> > > 
> > > Node name of 'clock-controller', or 'power-controller'?
> > 
> > The orignal entry for sdm845 has no such statement, but yes it doesn
> > makes sense. I am thinking power-controller.. Bjorn?
> 
> aoss_qmp registers both pd and
> clock providers.

Thats correct, I chatted with Bjorn and he recommended we use power-controller

-- 
~Vinod
