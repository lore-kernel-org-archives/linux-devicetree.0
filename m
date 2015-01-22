From: Ken Westfield <kwestfie@codeaurora.org>
Subject: Re: [PATCH v3 0/8] qcom audio clock control drivers
Date: Thu, 22 Jan 2015 13:41:22 -0800
Message-ID: <20150122214121.GA23451@kwestfie-linux.qualcomm.com>
References: <1421719535-28398-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1421719535-28398-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Josh Cartwright <joshc@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 19, 2015 at 06:05:27PM -0800, Stephen Boyd wrote:
> This patchset adds support for the low power audio subsystem (LPASS)
> clock controller hardware. I split out the #define patch for IPQ so that
> it can go through the clock tree and the arm-soc tree in parallel
> if desired.

Verified all supported bit clock frequencies for audio playback work on
the ipq806x SOC with max98357a codec.

Tested-by: Kenneth Westfield <kwestfie@codeaurora.org>

-- 
Kenneth Westfield
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, 
a Linux Foundation Collaborative Project
