From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 3/3] pinctrl: qcom: Don't allow protected pins to be
 requested
Date: Thu, 25 Jan 2018 15:53:54 -0600
Message-ID: <b05406cc-21a3-9c1a-b093-a3db2477eee4@codeaurora.org>
References: <20180110015848.11480-1-sboyd@codeaurora.org>
 <20180110015848.11480-4-sboyd@codeaurora.org>
 <f384a6c4-57a5-df18-862c-bf7dad9ea3f4@codeaurora.org>
 <20180125215135.GY28313@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20180125215135.GY28313@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/25/2018 03:51 PM, Stephen Boyd wrote:
> Sorry I don't get it. Is that some sort of hardening requirement?
> If the framework doesn't cause those pins to be touched I fail to
> see how it could hurt to have the other addresses listed. I'm
> sure with some effort protected addresses could be crafted in
> other ways to cause an XPU violation to the same place.

It's for my own sanity.  By ensuring that those physical addresses are 
not ever present in the driver or any data structure, I can fend off, 
"Hey Timur, your gpio driver is causing XPU violations again, heh heh".

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
