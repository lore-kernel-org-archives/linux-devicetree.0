From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 3/3] pinctrl: qcom: Don't allow protected pins to be
 requested
Date: Mon, 22 Jan 2018 14:03:44 -0600
Message-ID: <243180ed-cbd2-b21d-f10f-e33ec0d3a34e@codeaurora.org>
References: <20180110015848.11480-1-sboyd@codeaurora.org>
 <20180110015848.11480-4-sboyd@codeaurora.org>
 <f384a6c4-57a5-df18-862c-bf7dad9ea3f4@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <f384a6c4-57a5-df18-862c-bf7dad9ea3f4@codeaurora.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 01/22/2018 07:55 AM, Timur Tabi wrote:
> 
> Just FYI, I'm still going to have to parse "gpios" in my 
> pinctrl-qdf2xxx.c driver, even though you're also parsing it here. 
> That's because I need to make sure that the msm_pingroup array only 
> contains "approve" addresses in its ctl_reg fields.

Also, my patch

[PATCH 3/3] [v7] pinctrl: qcom: qdf2xxx: add support for new ACPI HID 
QCOM8002

Applies on top of your patches as-is.

Also, what about

[PATCH 1/3] [v2] Revert "gpio: set up initial state from .get_direction()"

I think you still need this patch.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
