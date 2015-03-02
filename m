From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v3 0/3] Scorpion PMU support
Date: Mon, 2 Mar 2015 18:24:24 +0000
Message-ID: <20150302182424.GE7919@arm.com>
References: <1425082295-10941-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425082295-10941-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <Mark.Rutland@arm.com>, Neil Leeder <nleeder@codeaurora.org>, Ashwin Chaugule <ashwinc@codeaurora.org>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sheetal Sahasrabudhe <sheetals@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 28, 2015 at 12:11:32AM +0000, Stephen Boyd wrote:
> These patches add support for the Scorpion PMU found on devices
> such as msm8660, qsd8x50, etc. The first patch is some groundwork
> to make functions more "generic". Even then we end up copying quite
> a bit of code from the Krait part into the Scorpion part with only
> subtle tweaks because two things happen:
> 
>  1. We gain another "region" register, L2LPM
>  2. The way to access the region registers are with different cp15 instructions
> 
> I'm not sure how to make this better, suggestions are welcome. The second
> patch is an optimization for an implementation defined register. The 
> final patch is the one that actually adds support for Scorpion.
> 
> Changes from v2:
>  * New patch 2
>  * Macros instead of an inline function for patch 1

Thanks, Stephen. I'll queue this for 4.1.

Will
