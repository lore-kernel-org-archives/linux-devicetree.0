From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: sprd: add RTC gate for SC9860
Date: Fri, 16 Mar 2018 15:53:58 -0700
Message-ID: <152124083804.242365.2908934110735507785@swboyd.mtv.corp.google.com>
References: <1518169691-14870-2-git-send-email-zhang.lyra@gmail.com>
 <1518170109-15216-1-git-send-email-zhang.lyra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518170109-15216-1-git-send-email-zhang.lyra@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting Chunyan Zhang (2018-02-09 01:55:09)
> From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
> 
> Add a few gate clocks which are used for gating RTC for some
> devices on AON area of SC9860.
> 
> This patch has been tested on SC9860, with this patch and proper DT
> configurations, the watchdog can be initialized and work well.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
> ---

Applied to clk-next
