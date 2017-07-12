From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 01/18] clk: ingenic: Use const pointer to clk_ops in
 struct
Date: Wed, 12 Jul 2017 16:20:37 -0700
Message-ID: <20170712232037.GR22780@codeaurora.org>
References: <20170607200439.24450-2-paul@crapouillou.net>
 <20170702163016.6714-1-paul@crapouillou.net>
 <20170702163016.6714-2-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170702163016.6714-2-paul@crapouillou.net>
Sender: linux-clk-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Paul Burton <paul.burton@imgtec.com>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/02, Paul Cercueil wrote:
> The CGU common code does not modify the pointed clk_ops structure, so it
> should be marked as const.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Sorry I forgot, did you want an ack for these clk patches or for
me to take them through clk tree. If it's the ack case,

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

for patches 1 through 6.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
