From: Tirupathi Reddy T <tirupath@codeaurora.org>
Subject: Re: [PATCH V6] clk: qcom: Add spmi_pmic clock divider support
Date: Tue, 21 Nov 2017 14:42:51 +0530
Message-ID: <396227ab-d628-ba5e-1e63-ad51f5cae253@codeaurora.org>
References: <1510912127-4582-1-git-send-email-tirupath@codeaurora.org>
 <20171117202243.you76ej4qvk3ul3g@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171117202243.you76ej4qvk3ul3g@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 11/18/2017 1:52 AM, Rob Herring wrote:
> On Fri, Nov 17, 2017 at 03:18:47PM +0530, Tirupathi Reddy wrote:
>> Clkdiv module provides a clock output on the PMIC with CXO as
>> the source. This clock can be routed through PMIC GPIOs. Add
>> a device driver to configure this clkdiv module.
>>
>> Signed-off-by: Tirupathi Reddy <tirupath@codeaurora.org>
>> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> Normally your S-o-B would be last.
Addressed in next patch version [7]
>
>> ---
>>   .../bindings/clock/clk-spmi-pmic-div.txt           |  59 ++++
> Please split bindings to a separate patch.
Addressed in next patch version [7]
>
> Otherwise,
>
> Acked-by: Rob Herring <robh@kernel.org>
>
>>   drivers/clk/qcom/Kconfig                           |   9 +
>>   drivers/clk/qcom/Makefile                          |   1 +
>>   drivers/clk/qcom/clk-spmi-pmic-div.c               | 308 +++++++++++++++++++++
>>   4 files changed, 377 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt
>>   create mode 100644 drivers/clk/qcom/clk-spmi-pmic-div.c
