From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 3/3] pinctrl: qcom: Don't allow protected pins to be
 requested
Date: Thu, 25 Jan 2018 14:48:42 -0600
Message-ID: <dcbc067c-4baf-8814-a8a1-582a4dd3e500@codeaurora.org>
References: <20180110015848.11480-1-sboyd@codeaurora.org>
 <20180110015848.11480-4-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20180110015848.11480-4-sboyd@codeaurora.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/09/2018 07:58 PM, Stephen Boyd wrote:
> +static int msm_pinmux_request(struct pinctrl_dev *pctldev, unsigned offset)

"unsigned int", instead of just "unsigned"?

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
