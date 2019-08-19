From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 22/22] arm64: dts: qcom: sm8150: Add APSS shared mailbox
Date: Mon, 19 Aug 2019 23:11:07 +0530
Message-ID: <20190819174107.GM12733@vkoul-mobl.Dlink>
References: <20190814125012.8700-1-vkoul@kernel.org>
 <20190814125012.8700-23-vkoul@kernel.org>
 <20190814171743.C38C4206C1@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814171743.C38C4206C1@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14-08-19, 10:17, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-08-14 05:50:12)
> > @@ -338,6 +339,16 @@
> >                         #interrupt-cells = <2>;
> >                 };
> >  
> > +               aoss_qmp: qmp@c300000 {
> 
> Node name of 'clock-controller', or 'power-controller'?

The orignal entry for sdm845 has no such statement, but yes it doesn
makes sense. I am thinking power-controller.. Bjorn?

-- 
~Vinod
