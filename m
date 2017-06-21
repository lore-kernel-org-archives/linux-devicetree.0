From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 01/17] clk: ingenic: Use const pointer to clk_ops in
 struct
Date: Wed, 21 Jun 2017 14:50:38 -0700
Message-ID: <20170621215038.GG4493@codeaurora.org>
References: <20170607200439.24450-2-paul@crapouillou.net>
 <20170620151855.19399-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170620151855.19399-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Paul Burton <paul.burton@imgtec.com>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/20, Paul Cercueil wrote:
> The CGU common code does not modify the pointed clk_ops structure, so it
> should be marked as const.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

How did you want to merge this series? I can ack clk patches if
you like, or apply the clk patches to the clk tree.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
