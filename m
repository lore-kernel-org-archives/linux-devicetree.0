Return-Path: <SRS0=bqe9=JM=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:58686 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932206AbeFZJiC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 Jun 2018 05:38:02 -0400
Subject: Re: [PATCH v2] arm64: dts: msm8996: Use dwc3-qcom glue driver for USB
References: <20180531104710.23965-1-mgautam@codeaurora.org>
 <d98cd884-f25d-ee2e-58cf-400993e0d213@codeaurora.org>
From: Manu Gautam <mgautam@codeaurora.org>
Message-ID: <7a791c29-c5b1-4e64-63a7-702c9ae2b267@codeaurora.org>
Date: Tue, 26 Jun 2018 15:07:55 +0530
MIME-Version: 1.0
In-Reply-To: <d98cd884-f25d-ee2e-58cf-400993e0d213@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>, andy.gross@linaro.org
Cc: linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, dianders@chromium.org, linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com, gregkh@linuxfoundation.org, bjorn.andersson@linaro.org
List-ID: <devicetree@vger.kernel.org>

Hi Andy,

On 6/7/2018 2:00 PM, Vivek Gautam wrote:
> 
> 
> On 5/31/2018 4:17 PM, Manu Gautam wrote:
>> Move from dwc3-of-simple to dwc3-qcom glue driver to
>> support peripheral mode which requires qscratch wrapper
>> programming on VBUS event.
>>
>> Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
>> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
>> ---
>>
>> Changes since v1:
>>   - Update unit address of DT node as per Doug's comment
>>
>>   arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi |  6 ++++--
>>   arch/arm64/boot/dts/qcom/msm8996.dtsi        | 10 ++++++----
>>   2 files changed, 10 insertions(+), 6 deletions(-)
> 
> Tested on DB820c. Works fine.
> Tested-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> 

Andy, let me know if this looks good to you.
And it would be great to get this in 4.18 to fix USB regression on db820c.

Thanks,
Manu
 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
