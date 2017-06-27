From: Riku Voipio <riku.voipio@linaro.org>
Subject: Re: [PATCH v8 1/3] clk: qcom: Add A53 PLL support
Date: Tue, 27 Jun 2017 12:48:07 +0300
Message-ID: <CAAqcGHm3R_P71szGq4Tf+B8sB9Mwd0RAi9RsssV5MwWcfuGdsw@mail.gmail.com>
References: <20170623161533.20449-1-georgi.djakov@linaro.org>
 <20170623161533.20449-2-georgi.djakov@linaro.org> <20170626194015.pejm43gl5khoqizy@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170626194015.pejm43gl5khoqizy@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, jassisinghbrar@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>, mturquette@baylibre.com, linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 26 June 2017 at 22:40, Rob Herring <robh@kernel.org> wrote:
> On Fri, Jun 23, 2017 at 07:15:31PM +0300, Georgi Djakov wrote:
>> The CPUs on Qualcomm MSM8916-based platforms are clocked by two PLLs,
>> a primary (A53) CPU PLL and a secondary fixed-rate GPLL0. These sources
>> are connected to a mux and half-integer divider, which is feeding the
>> CPU cores.
>>
>> This patch adds support for the primary CPU PLL which generates the
>> higher range of frequencies above 1GHz.
>>
>> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
>> ---
>>  .../devicetree/bindings/clock/qcom,a53pll.txt      | 22 +++++
>
> It's preferred to split bindings to a separate patch. In any case,
>
> Acked-by: Rob Herring <robh@kernel.org>
>
> One kconfig comment though:
>
>>  drivers/clk/qcom/Kconfig                           |  9 +++
>>  drivers/clk/qcom/Makefile                          |  1 +
>>  drivers/clk/qcom/a53-pll.c                         | 94 ++++++++++++++++++++++
>>  4 files changed, 126 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.txt
>>  create mode 100644 drivers/clk/qcom/a53-pll.c
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.txt b/Documentation/devicetree/bindings/clock/qcom,a53pll.txt
>> new file mode 100644
>> index 000000000000..f4c2fddf6e7f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.txt
>> @@ -0,0 +1,22 @@
>> +MSM8916 A53 PLL Binding
>> +---------------
>> +The A53 PLL on MSM8916 platforms is the main CPU PLL used used for frequencies
>> +above 1GHz.
>> +
>> +Required properties :
>> +- compatible : Shall contain only one of the following:
>> +
>> +             "qcom,msm8916-a53pll"
>> +
>> +- reg : shall contain base register location and length
>> +
>> +- #clock-cells : must be set to <0>
>> +
>> +Example:
>> +
>> +     a53pll: clock@b016000 {
>> +             compatible = "qcom,msm8916-a53pll";
>> +             reg = <0xb016000 0x40>;
>> +             #clock-cells = <0>;
>> +     };
>> +
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 9f6c278deead..057cf60ed037 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -12,6 +12,15 @@ config COMMON_CLK_QCOM
>>       select REGMAP_MMIO
>>       select RESET_CONTROLLER
>>
>> +config QCOM_A53PLL
>> +     bool "A53 PLL"
>
> Figuring out config options needed for a specific QC SoC is "fun". If
> this is only for MSM8916, then add that to the config option or prompt
> text at least.

> And please update the arm64 defconfig with this option.

Maybe instead of updating defconfig set:

        default ARCH_QCOM

I think the effect is roughly same but it makes the life of
distribution maintainers easier.

>> +     depends on COMMON_CLK_QCOM
>> +     help
>> +       Support for the A53 PLL on Qualcomm MSM8916 devices. It provides
>> +       support for CPU frequencies above 1GHz.
>> +       Say Y if you want to support CPU frequency scaling on devices
>> +       such as MSM8916.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
