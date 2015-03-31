From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 0/7] clk: Common clock support for IMG Pistachio
Date: Mon, 30 Mar 2015 17:01:09 -0700
Message-ID: <5519E3C5.7040806@codeaurora.org>
References: <1424836567-7252-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424836567-7252-1-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>, Mike Turquette <mturquette@linaro.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>
List-Id: devicetree@vger.kernel.org

On 02/24/15 19:56, Andrew Bresticker wrote:
> This series adds common clock support for the IMG Pistachio SoC.
> Pistachio has two clock controllers (core and peripheral) and two
> general control blocks (peripheral and top) which also contain
> several clock gates.  Like the recently submitted pinctrl driver [1],
> this driver is written so that it's hopefully easy to add support
> for future IMG SoCs.
>
> Tested on an IMG Pistachio BuB.  Based on 4.0-rc1 + my series adding
> Pistachio platform support [2], which introduces the MACH_PISTACHIO
> Kconfig symbol.  A branch with this series and the dependent patches
> is available at [3].  I'd like this to go through the MIPS tree with
> Mike's or Stephen's ACK if possible.
>
>

Minor comment on patch 2, but otherwise

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
