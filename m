From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v3 0/8] qcom audio clock control drivers
Date: Tue, 27 Jan 2015 11:52:06 -0800
Message-ID: <20150127195206.22722.54678@quantum>
References: <1421719535-28398-1-git-send-email-sboyd@codeaurora.org>
 <20150122214121.GA23451@kwestfie-linux.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150122214121.GA23451@kwestfie-linux.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ken Westfield <kwestfie@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Josh Cartwright <joshc@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Ken Westfield (2015-01-22 13:41:22)
> On Mon, Jan 19, 2015 at 06:05:27PM -0800, Stephen Boyd wrote:
> > This patchset adds support for the low power audio subsystem (LPASS)
> > clock controller hardware. I split out the #define patch for IPQ so that
> > it can go through the clock tree and the arm-soc tree in parallel
> > if desired.
> 
> Verified all supported bit clock frequencies for audio playback work on
> the ipq806x SOC with max98357a codec.
> 
> Tested-by: Kenneth Westfield <kwestfie@codeaurora.org>

Applied to clk-next.

Regards,
Mike

> 
> -- 
> Kenneth Westfield
> Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, 
> a Linux Foundation Collaborative Project
