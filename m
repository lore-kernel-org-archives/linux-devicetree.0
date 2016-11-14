From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 2/2] clk: hisilicon: add CRG driver for Hi3516CV300 SoC
Date: Mon, 14 Nov 2016 12:03:59 -0800
Message-ID: <20161114200359.GM5177@codeaurora.org>
References: <1477721618-10809-1-git-send-email-xuejiancheng@hisilicon.com>
 <1477721618-10809-3-git-send-email-xuejiancheng@hisilicon.com>
 <20161112000415.GE5177@codeaurora.org>
 <0c3b49a4-f58c-253a-fd87-ab52b0b26010@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0c3b49a4-f58c-253a-fd87-ab52b0b26010@hisilicon.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, bin.chen@linaro.org, elder@linaro.org, hermit.wangheming@hisilicon.com, yanhaifeng@hisilicon.com, wenpan@hisilicon.com, howell.yang@hisilicon.com
List-Id: devicetree@vger.kernel.org

On 11/14, Jiancheng Xue wrote:
> Hi Stephen,
> 
> On 2016/11/12 8:04, Stephen Boyd wrote:
> > On 10/29, Jiancheng Xue wrote:
> > 
> > Should be a From: Pan Wen here?
> > 
> >> Add CRG driver for Hi3516CV300 SoC. CRG(Clock and Reset
> >> Generator) module generates clock and reset signals used
> >> by other module blocks on SoC.
> >>
> >> Signed-off-by: Pan Wen <wenpan@hisilicon.com>
> > 
> > And you should have signed it off? Care to resend or state that
> > this is incorrectly attributed to you instead of Pan Wen?
> > 
> 
> Pan Wen is the main author of this patch. I just made some small modification
> with agreement from him. Do I need to resend this patch if it's better to add my
> signed-off?
> 

Sure I'll apply the resent one. But you should also make sure to
retain Pan Wen's authorship. I'll go do that when applying it.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
