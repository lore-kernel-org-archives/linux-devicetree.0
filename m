From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [RESEND PATCH v2] clk: hisilicon: add CRG driver for Hi3798CV200
 SoC
Date: Thu, 27 Oct 2016 17:25:48 -0700
Message-ID: <20161028002548.GN26139@codeaurora.org>
References: <1477013830-11481-1-git-send-email-xuejiancheng@hisilicon.com>
 <20161027134833.vdtd5t5hx33o3ahb@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161027134833.vdtd5t5hx33o3ahb@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jiancheng Xue <xuejiancheng@hisilicon.com>, mturquette@baylibre.com, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bin.chen@linaro.org, elder@linaro.org, hermit.wangheming@hisilicon.com, yanhaifeng@hisilicon.com, wenpan@hisilicon.com
List-Id: devicetree@vger.kernel.org

On 10/27, Rob Herring wrote:
> On Fri, Oct 21, 2016 at 09:37:10AM +0800, Jiancheng Xue wrote:
> > Add CRG driver for Hi3798CV200 SoC. CRG(Clock and Reset
> > Generator) module generates clock and reset signals used
> > by other module blocks on SoC.
> > 
> > Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
> > ---
> > change log
> > v2:
> > - Fixed compiling error when compiled as a module.
> > - Fixed issues pointed by Stephen Boyd.
> > - Added prefix HISTB for clock index macro definitions.
> 
> What Stephen asked for is send this and the Hi3516CV300 series as one 
> series since there is a dependency.

Exactly. Please resend both parts, along with Rob's ack on this
one. I can review it all then and hopefully Rob will be ok with
the other binding change.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
