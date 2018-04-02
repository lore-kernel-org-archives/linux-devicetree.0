From: Sricharan R <sricharan@codeaurora.org>
Subject: Re: [PATCH v5 08/13] ARM: dts: ipq4019: Add ipq4019-ap.dk07.1 common
 data
Date: Mon, 2 Apr 2018 11:39:46 +0530
Message-ID: <b03a8001-e1b8-4340-55a8-53c81ae689ac@codeaurora.org>
References: <1521800336-19266-1-git-send-email-sricharan@codeaurora.org>
 <1521800336-19266-9-git-send-email-sricharan@codeaurora.org>
 <20180327172034.GK1403@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180327172034.GK1403@tuxbook-pro>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: mark.rutland@arm.com, robh@kernel.org, devicetree@vger.kernel.org, marc.zyngier@arm.com, catalin.marinas@arm.com, richardcochran@gmail.com, will.deacon@arm.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, david.brown@linaro.org, absahu@codeaurora.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, linux-soc@vger.kernel.org, sboyd@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 3/27/2018 10:50 PM, Bjorn Andersson wrote:
> On Fri 23 Mar 03:18 PDT 2018, Sricharan R wrote:
>> +#include "qcom-ipq4019.dtsi"
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. IPQ4019/AP-DK07.1";
>> +	compatible = "qcom,ipq4019";
> 
> The board should set these, so you shouldn't need to specify them here.
> And you should be able to find a more specific compatible for the board.
> 

 ok. agree. As mentioned earlier, will correct the compatible in all boards.

>> +
> [..]
>> +		qpic-nand@79b0000 {
>> +			status = "ok";
> 
> No pinmux for the qpic on these boards?
> 
 clearly missed it and was lucky that bootloader was doing it in this case.
 Will add it.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
