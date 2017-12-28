From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v11 0/6] Add support for Qualcomm A53 CPU clock
Date: Thu, 28 Dec 2017 15:53:44 -0800
Message-ID: <20171228235344.GY7997@codeaurora.org>
References: <20171205154701.27730-1-georgi.djakov@linaro.org>
 <20171222004904.GA7997@codeaurora.org>
 <1ea1fa92-de78-c4df-469c-3f36f5f62497@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1ea1fa92-de78-c4df-469c-3f36f5f62497@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: jassisinghbrar@gmail.com, bjorn.andersson@linaro.org, mturquette@baylibre.com, robh@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/22, Georgi Djakov wrote:
> On 22.12.17 г. 2:49, Stephen Boyd wrote:
> > On 12/05, Georgi Djakov wrote:
> >> This patchset adds support for the A53 CPU clock on MSM8916 platforms
> >> and allows scaling of the CPU frequency on msm8916 based platforms.
> > 
> > Ok. I will apply just the clk ones? Patches 3,4, and 6?
> > 
> 
> Yes, i think this would be best. The rest should go through the mailbox tree.
> 

Ok. I made some changes. I'll comment one patch too. But I
applied them to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
