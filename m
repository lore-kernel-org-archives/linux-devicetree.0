From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v7 3/3] clk: qcom: Add A53 clock driver
Date: Mon, 14 Nov 2016 18:15:46 +0200
Message-ID: <13eb175c-0f1d-4cd6-4d1a-7b952be9a6b2@linaro.org>
References: <20161031145526.5023-1-georgi.djakov@linaro.org>
 <20161031145526.5023-4-georgi.djakov@linaro.org>
 <20161109182440.hjiv725vpsh5dctd@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161109182440.hjiv725vpsh5dctd@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/09/2016 08:24 PM, Rob Herring wrote:
> On Mon, Oct 31, 2016 at 04:55:26PM +0200, Georgi Djakov wrote:
>> Add a driver for the A53 Clock Controller. It is a hardware block that
>> implements a combined mux and half integer divider functionality. It can
>> choose between a fixed-rate clock or the dedicated A53 PLL. The source
>> and the divider can be set both at the same time.
>>
>> This is required for enabling CPU frequency scaling on platforms like
>> MSM8916.
>>
>> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
>> ---
>>  .../devicetree/bindings/clock/qcom,a53cc.txt       |  23 ++++
>>  drivers/clk/qcom/Kconfig                           |   8 ++
>>  drivers/clk/qcom/Makefile                          |   1 +
>>  drivers/clk/qcom/a53cc.c                           | 152 +++++++++++++++++++++
>>  4 files changed, 184 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53cc.txt
>>  create mode 100644 drivers/clk/qcom/a53cc.c
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53cc.txt b/Documentation/devicetree/bindings/clock/qcom,a53cc.txt
>> new file mode 100644
>> index 000000000000..82d1634a2713
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,a53cc.txt
>> @@ -0,0 +1,23 @@
>> +Qualcomm A53 CPU Clock Controller Binding
>> +------------------------------------------------
>> +The A53 CPU Clock Controller is hardware, which provides a combined
>> +mux and divider functionality for the CPU clocks. It can choose between
>> +a fixed rate clock and the dedicated A53 PLL. This hardware block is used
>> +on platforms such as msm8916.
>> +
>> +Required properties :
>> +- compatible : shall contain:
>> +
>> +			"qcom,a53cc-msm8916"
>
> Same comment on the ordering. With that, for the binding:
>
> Acked-by: Rob Herring <robh@kernel.org>
>

Thanks for reviewing, Rob. I am also going to make this a child node
as discussed here [1]. Please let me know if you have any comments.

[1]. https://lkml.org/lkml/2016/11/11/387

Thanks,
Georgi
