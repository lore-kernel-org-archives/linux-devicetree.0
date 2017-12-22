From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v11 0/6] Add support for Qualcomm A53 CPU clock
Date: Fri, 22 Dec 2017 16:52:25 +0200
Message-ID: <1ea1fa92-de78-c4df-469c-3f36f5f62497@linaro.org>
References: <20171205154701.27730-1-georgi.djakov@linaro.org>
 <20171222004904.GA7997@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20171222004904.GA7997@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, jassisinghbrar@gmail.com
Cc: bjorn.andersson@linaro.org, mturquette@baylibre.com, robh@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 22.12.17 г. 2:49, Stephen Boyd wrote:
> On 12/05, Georgi Djakov wrote:
>> This patchset adds support for the A53 CPU clock on MSM8916 platforms
>> and allows scaling of the CPU frequency on msm8916 based platforms.
> 
> Ok. I will apply just the clk ones? Patches 3,4, and 6?
> 

Yes, i think this would be best. The rest should go through the mailbox tree.
Jassi, are you ok with this?

Thanks,
Georgi
