From: Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v2 3/3] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
Date: Wed, 18 Sep 2019 15:14:50 +0530
Message-ID: <6a5b6bf6-a99a-e4aa-b9ac-fcc0fceab5bd@codeaurora.org>
References: <20190819163748.18318-1-tdas@codeaurora.org>
 <20190819163748.18318-4-tdas@codeaurora.org>
 <20190821180200.1F7EF2082F@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821180200.1F7EF2082F@mail.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh+dt@kernel.org
Cc: David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

Thanks for your review.

On 8/21/2019 11:31 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-08-19 09:37:48)
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index e1ff83cc361e..ebd4902afd9f 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -322,5 +331,4 @@ config KRAITCC
>>          help
>>            Support for the Krait CPU clocks on Qualcomm devices.
>>            Say Y if you want to support CPU frequency scaling.
>> -
>>   endif
> 
> Please remove this hunk
> 

Would remove this.

>> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
>> new file mode 100644
>> index 000000000000..8718b675d609
>> --- /dev/null
>> +++ b/drivers/clk/qcom/gcc-sc7180.c
> [...]
>> +       },
>> +};
>> +
>> +/* Camera Subsystem requires always ON. */
> 
> Yes, but why? This comment is useful unless it explains why.
> 

Next patch would take care.

>> +static struct clk_branch gcc_camera_ahb_clk = {
>> +       .halt_reg = 0xb008,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0xb008,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0xb008,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_camera_ahb_clk",
>> +                       .flags = CLK_IS_CRITICAL,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_camera_hf_axi_clk = {
>> +       .halt_reg = 0xb020,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0xb020,
>> +               .enable_mask = BIT(0),

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
