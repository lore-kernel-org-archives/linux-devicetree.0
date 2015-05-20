From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 2/2] clk: mmp: add PXA1928 clock support
Date: Tue, 19 May 2015 18:45:08 -0700
Message-ID: <20150520014508.GC4815@codeaurora.org>
References: <1431383120-16957-1-git-send-email-robh@kernel.org>
 <1431383120-16957-2-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1431383120-16957-2-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mike Turquette <mturquette@linaro.org>, Chao Xie <xiechao.mail@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/11, Rob Herring wrote:
> Add initial clock support for Marvell PXA1928. The PXA1928 is a mobile
> SOC and is similar to other MMP/PXA series of SOCs, so a lot of the
> existing infrastructure is reused here.
> 
> Currently the PLLs are just fixed clocks, and not all leaf clocks are
> implemented.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Mike Turquette <mturquette@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
