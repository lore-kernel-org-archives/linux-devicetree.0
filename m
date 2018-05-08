From: Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 2/3] usb: dwc3: Add Qualcomm DWC3 glue driver
Date: Tue, 8 May 2018 09:36:48 +0530
Message-ID: <7bc35d33-c819-fb64-353c-f64dce08505f@codeaurora.org>
References: <1525459689-1358-1-git-send-email-mgautam@codeaurora.org>
 <1525459689-1358-3-git-send-email-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525459689-1358-3-git-send-email-mgautam@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, robh@kernel.org, andy.gross@linaro.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org



On 5/5/2018 12:18 AM, Manu Gautam wrote:
> DWC3 controller on Qualcomm SOCs has a Qscratch wrapper.
> Some of its uses are described below resulting in need to
> have a separate glue driver instead of using dwc3-of-simple:
>  - It exposes register interface to override vbus-override
>    and lane0-pwr-present signals going to hardware. These
>    must be updated in peripheral mode for DWC3 if vbus lines
>    are not connected to hardware block. Otherwise RX termination
>    in SS mode or DP pull-up is not applied by device controller.
>  - pwr_events_irq_stat support to check if USB2 PHY is in L2 state
>    before glue driver proceeds with suspend.
>  - Support for wakeup interrupts lines that are asserted whenever
>    there is any wakeup event on USB3 or USB2 bus.
>  - Support to replace pip3 clock going to DWC3 with utmi clock
>    for hardware configuration where SSPHY is not used with DWC3.
>
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
[snip]
> +static const struct of_device_id dwc3_qcom_of_match[] = {
> +	{ .compatible = "qcom,dwc3" },

I should also add SOC specific compatibles.
Will do that in next patch.


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
