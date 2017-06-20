From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 1/3] clk: hi3660: fix wrong parent name of
 clk_mux_sysbus
Date: Mon, 19 Jun 2017 18:00:54 -0700
Message-ID: <20170620010054.GF20170@codeaurora.org>
References: <20170526073821.25971-1-guodong.xu@linaro.org>
 <20170526073821.25971-2-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170526073821.25971-2-guodong.xu@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Guodong Xu <guodong.xu@linaro.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, chenjun14@huawei.com, zhongkaihua@huawei.com, zhangfei.gao@linaro.org, leo.yan@linaro.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

On 05/26, Guodong Xu wrote:
> From: Chen Jun <chenjun14@huawei.com>
> 
> Parent name of clk_mux_sysbus is not correct. This patch fixes it.
> 
> Signed-off-by: Chen Jun <chenjun14@huawei.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
