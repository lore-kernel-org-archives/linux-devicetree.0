From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v5 1/2] clk: add lpc18xx creg clk driver
Date: Fri, 4 Mar 2016 12:51:10 -0800
Message-ID: <20160304205110.GA25972@codeaurora.org>
References: <1457041625-21163-1-git-send-email-manabian@gmail.com>
 <1457041625-21163-2-git-send-email-manabian@gmail.com>
 <20160304174201.GH24999@codeaurora.org>
 <CAGhQ9VxYBRUbj+afsHUa21cwNFT4bdYRDNwxagdUwBXg4-x_3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGhQ9VxYBRUbj+afsHUa21cwNFT4bdYRDNwxagdUwBXg4-x_3w@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/04, Joachim Eastwood wrote:
> 
> The MMIO bus config sets fast io to true and __regmap_init() uses
> spinlocks if either bus or regmap config is set to true.
> 
> http://lxr.free-electrons.com/source/drivers/base/regmap/regmap-mmio.c#L209
> http://lxr.free-electrons.com/source/drivers/base/regmap/regmap.c#L548
> 
> or am I missing something?
> 

Ah good! Brain model updated.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
