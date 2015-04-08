From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v6 0/4] clk: Provide support for always-on clocks
Date: Tue, 7 Apr 2015 22:28:25 -0700
Message-ID: <20150408052825.GC31970@codeaurora.org>
References: <1428432239-4114-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1428432239-4114-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, mturquette@linaro.org, devicetree@vger.kernel.org, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org

On 04/07, Lee Jones wrote:
> Lots of platforms contain clocks which if turned off would prove fatal.
> The only way to recover from these catastrophic failures is to restart
> the board(s).  Now, when a clock provider is registered with the
> framework it is possible for a list of always-on clocks to be supplied
> which must be kept ungated.  Each clock mentioned in the newly
> introduced 'clock-always-on' will be clk_prepare_enable()d where the
> normal references will be taken.  This will prevent the common clk
> framework from attempting to gate them during the clk_disable_unused()
> and disable_clock() procedures.

Ah I see now. The disable_clock() part is from the PM core not
the common clock framework. This paragraph could be the commit
text for the binding patch.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
