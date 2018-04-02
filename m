From: Sricharan R <sricharan@codeaurora.org>
Subject: Re: [PATCH v5 05/13] ARM: dts: ipq4019: Add ipq4019-ap.dk04.dtsi
Date: Mon, 2 Apr 2018 10:58:30 +0530
Message-ID: <41dbb135-f392-3450-029f-bab5a8e2f9d8@codeaurora.org>
References: <1521800336-19266-1-git-send-email-sricharan@codeaurora.org>
 <1521800336-19266-6-git-send-email-sricharan@codeaurora.org>
 <20180327170450.GH1403@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180327170450.GH1403@tuxbook-pro>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: mark.rutland@arm.com, robh@kernel.org, devicetree@vger.kernel.org, marc.zyngier@arm.com, catalin.marinas@arm.com, richardcochran@gmail.com, will.deacon@arm.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, david.brown@linaro.org, absahu@codeaurora.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, linux-soc@vger.kernel.org, sboyd@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 3/27/2018 10:34 PM, Bjorn Andersson wrote:
> On Fri 23 Mar 03:18 PDT 2018, Sricharan R wrote:
>> +	soc {
>> +		pinctrl@1000000 {
>> +			serial_0_pins: serial0_pinmux {
> 
> Please, no underscores in the node name.

 ok.

> 
>> +				mux {
> 
> Fyi, you can put the pinctrl properties directly into the state node,
> omitting the "mux" level.
> 

 ok, will change.

>> +					pins = "gpio16", "gpio17";
>> +					function = "blsp_uart0";
>> +					bias-disable;
>> +				};
>> +			};
>> +
> 
> Apart from this the patch looks good.
 Thanks.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
