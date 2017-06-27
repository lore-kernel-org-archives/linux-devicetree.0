From: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 1/3] clk: qcom: Add A53 PLL support
Date: Tue, 27 Jun 2017 19:23:10 +0300
Message-ID: <c9ff9e8d-3214-6faf-484d-849f43be7a7d@linaro.org>
References: <20170623161533.20449-1-georgi.djakov@linaro.org>
 <20170623161533.20449-2-georgi.djakov@linaro.org>
 <20170626194015.pejm43gl5khoqizy@rob-hp-laptop>
 <CAAqcGHm3R_P71szGq4Tf+B8sB9Mwd0RAi9RsssV5MwWcfuGdsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAqcGHm3R_P71szGq4Tf+B8sB9Mwd0RAi9RsssV5MwWcfuGdsw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Riku Voipio <riku.voipio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/27/2017 12:48 PM, Riku Voipio wrote:
> On 26 June 2017 at 22:40, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Fri, Jun 23, 2017 at 07:15:31PM +0300, Georgi Djakov wrote:
>>> The CPUs on Qualcomm MSM8916-based platforms are clocked by two PLLs,
>>> a primary (A53) CPU PLL and a secondary fixed-rate GPLL0. These sources
>>> are connected to a mux and half-integer divider, which is feeding the
>>> CPU cores.
>>>
>>> This patch adds support for the primary CPU PLL which generates the
>>> higher range of frequencies above 1GHz.
>>>
>>> Signed-off-by: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> ---
>>>  .../devicetree/bindings/clock/qcom,a53pll.txt      | 22 +++++
>>
>> It's preferred to split bindings to a separate patch. In any case,
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> One kconfig comment though:
>>
>>>  drivers/clk/qcom/Kconfig                           |  9 +++
>>>  drivers/clk/qcom/Makefile                          |  1 +
>>>  drivers/clk/qcom/a53-pll.c                         | 94 ++++++++++++++++++++++
>>>  4 files changed, 126 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.txt
>>>  create mode 100644 drivers/clk/qcom/a53-pll.c
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.txt b/Documentation/devicetree/bindings/clock/qcom,a53pll.txt
>>> new file mode 100644
>>> index 000000000000..f4c2fddf6e7f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.txt
>>> @@ -0,0 +1,22 @@
>>> +MSM8916 A53 PLL Binding
>>> +---------------
>>> +The A53 PLL on MSM8916 platforms is the main CPU PLL used used for frequencies
>>> +above 1GHz.
>>> +
>>> +Required properties :
>>> +- compatible : Shall contain only one of the following:
>>> +
>>> +             "qcom,msm8916-a53pll"
>>> +
>>> +- reg : shall contain base register location and length
>>> +
>>> +- #clock-cells : must be set to <0>
>>> +
>>> +Example:
>>> +
>>> +     a53pll: clock@b016000 {
>>> +             compatible = "qcom,msm8916-a53pll";
>>> +             reg = <0xb016000 0x40>;
>>> +             #clock-cells = <0>;
>>> +     };
>>> +
>>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>>> index 9f6c278deead..057cf60ed037 100644
>>> --- a/drivers/clk/qcom/Kconfig
>>> +++ b/drivers/clk/qcom/Kconfig
>>> @@ -12,6 +12,15 @@ config COMMON_CLK_QCOM
>>>       select REGMAP_MMIO
>>>       select RESET_CONTROLLER
>>>
>>> +config QCOM_A53PLL
>>> +     bool "A53 PLL"
>>
>> Figuring out config options needed for a specific QC SoC is "fun". If
>> this is only for MSM8916, then add that to the config option or prompt
>> text at least.
> 
>> And please update the arm64 defconfig with this option.
> 
> Maybe instead of updating defconfig set:
> 
>         default ARCH_QCOM
> 
> I think the effect is roughly same but it makes the life of
> distribution maintainers easier.>

Thanks for the ideas, Riku and Rob. It looks like currently its only
used in msm8916 (but i might be wrong), so i will add MSM8916 to the
prompt and rename it to MSM_A53PLL_8916 to be more consistent with the
rest of the options.

If there are no objections, i can add:
	default ARCH_QCOM && ARM64

Thanks,
Georgi

>>> +     depends on COMMON_CLK_QCOM
>>> +     help
>>> +       Support for the A53 PLL on Qualcomm MSM8916 devices. It provides
>>> +       support for CPU frequencies above 1GHz.
>>> +       Say Y if you want to support CPU frequency scaling on devices
>>> +       such as MSM8916.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
