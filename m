From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH v4 0/5] Support qcom pinctrl protected pins
Date: Fri, 23 Mar 2018 18:50:18 -0500
Message-ID: <d7e0d2e1-c0d8-f751-7a73-71d5ab15bf52@codeaurora.org>
References: <20180323163453.96495-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180323163453.96495-1-swboyd@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On 03/23/2018 11:34 AM, Stephen Boyd wrote:
> Stephen Boyd (5):
>    dt-bindings: gpio: Add a gpio-reserved-ranges property
>    gpiolib: Extract mask allocation into subroutine
>    gpiolib: Change bitmap allocation to kmalloc_array
>    gpiolib: Support 'gpio-reserved-ranges' property
>    pinctrl: qcom: Don't allow protected pins to be requested

ACPI parts:

Tested-by: Timur Tabi <timur@codeaurora.org>

I posted a pair of patches that should be applied on top of yours.  The 
first one fixed pinctrl-msm when there is more than one TLMM device. 
The second adds support for my SOC.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
