From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v9 0/7] Add support for Qualcomm A53 CPU clock
Date: Wed, 25 Oct 2017 14:56:20 +0300
Message-ID: <49c12500-db97-0133-e43d-72b8116ed0a0@linaro.org>
References: <20170921164940.20343-1-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170921164940.20343-1-georgi.djakov@linaro.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: sboyd@codeaurora.org, jassisinghbrar@gmail.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/21/2017 07:49 PM, Georgi Djakov wrote:
> This patchset adds support for the A53 CPU clock on MSM8916 platforms
> and allows scaling of the CPU frequency on msm8916 based platforms.
> 
> Changes since v8 (https://lkml.org/lkml/2017/6/23/476)
>  * Converted APCS mailbox driver to use regmap and to populate child
>  platform devices that will handle the rest of the functionality
>  provided by APCS block.
>  * Picked Rob's Ack for the PLL binding.
>  * Changed the APCS binding and put it into a separate patch.
>  * Addressed review comments.
>  * Minor changes.

Hi Stephen and Bjorn. A gentle ping on this..
