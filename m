Return-Path: <SRS0=20ow=F7=codeaurora.org=kramasub@kernel.org>
Subject: Re: [PATCH v3 2/4] soc: qcom: Add GENI based QUP Wrapper driver
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
 <1519781889-16117-3-git-send-email-kramasub@codeaurora.org>
 <152002326567.108663.16836885081217739460@swboyd.mtv.corp.google.com>
 <4ac213a6-081f-72c1-c9c8-6994786285c9@codeaurora.org>
 <152037339742.218381.11498404122038956963@swboyd.mtv.corp.google.com>
From: Karthik Ramasubramanian <kramasub@codeaurora.org>
Message-ID: <7057eefd-f7f1-9795-1b97-d314771ff373@codeaurora.org>
Date: Fri, 9 Mar 2018 11:18:50 -0700
MIME-Version: 1.0
In-Reply-To: <152037339742.218381.11498404122038956963@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <swboyd@chromium.org>, Stephen Boyd <sboyd@chromium.org>, andy.gross@linaro.org, corbet@lwn.net, david.brown@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org, Sagar Dharia <sdharia@codeaurora.org>, Girish Mahadevan <girishm@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>



On 3/6/2018 2:56 PM, Stephen Boyd wrote:
> Quoting Karthik Ramasubramanian (2018-03-02 16:58:23)
>>
>>
>> On 3/2/2018 1:41 PM, Stephen Boyd wrote:
>>> Quoting Karthikeyan Ramasubramanian (2018-02-27 17:38:07)
>>>> +/**
>>>> + * geni_se_read_proto() - Read the protocol configured for a Serial Engine
>>>> + * @se:        Pointer to the concerned Serial Engine.
>>>> + *
>>>> + * Return: Protocol value as configured in the serial engine.
>>>> + */
>>>> +u32 geni_se_read_proto(struct geni_se *se)
>>>> +{
>>>> +       u32 val;
>>>> +
>>>> +       val = readl_relaxed(se->base + GENI_FW_REVISION_RO);
>>>> +
>>>> +       return (val & FW_REV_PROTOCOL_MSK) >> FW_REV_PROTOCOL_SHFT;
>>>> +}
>>>> +EXPORT_SYMBOL(geni_se_read_proto);
>>>
>>> Is this API really needed outside of this file? It would seem like the
>>> drivers that implement the protocol, which are child devices, would only
>>> use this API to confirm that the protocol chosen is for their particular
>>> protocol.
>> No, this API is meant for the protocol drivers to confirm that the
>> serial engine is programmed with the firmware for the concerned protocol
>> before using the serial engine. If the check fails, the protocol drivers
>> stop using the serial engine.
> 
> Ok maybe we don't really need it then?
Without this function the protocol drivers may not be able to verify if 
the serial engine is programmed with the right protocol. Operating on a 
serial engine that is not programmed with the right protocol leads to 
totally undefined behavior.
> >>>> +
>>>> +       ret = geni_se_clks_on(se);
>>>> +       if (ret)
>>>> +               return ret;
>>>> +
>>>> +       ret = pinctrl_pm_select_default_state(se->dev);
>>>> +       if (ret)
>>>> +               geni_se_clks_off(se);
>>>> +
>>>> +       return ret;
>>>> +}
>>>> +EXPORT_SYMBOL(geni_se_resources_on);
>>>
>>> IS there a reason why we can't use runtime PM or normal linux PM
>>> infrastructure to power on the wrapper and keep it powered while the
>>> protocol driver is active?
>> Besides turning on the clocks & pinctrl settings, wrapper also has to do
>> the bus scaling votes. The bus scaling votes depend on the individual
>> serial interface bandwidth requirements. The bus scaling votes is not
>> present currently. But once the support comes in, this function enables
>> adding it.
> 
> Ok, but that would basically be some code consolidation around picking a
> bandwidth and enabling/disabling? It sounds like it could go into either
> the serial interface drivers or into the runtime PM path of the wrapper.
Not really. SPI slaves, for example, can operate on different 
frequencies and therefore within a serial engine the bandwidth 
requirements can vary based on the slave. UART & I2C serial interfaces 
have different bandwidth requirements than SPI. So each serial interface 
driver has to specify their bandwidth requirements depending on their 
use-case. This function also allows for aggregation of the votes from 
the wrapper perspective, instead of constant RPMh communication
> 
>>>
>>>> +
>>>> +/**
>>>> + * geni_se_clk_tbl_get() - Get the clock table to program DFS
>>>> + * @se:                Pointer to the concerned Serial Engine.
>>>> + * @tbl:       Table in which the output is returned.
>>>> + *
>>>> + * This function is called by the protocol drivers to determine the different
>>>> + * clock frequencies supported by Serial Engine Core Clock. The protocol
>>>> + * drivers use the output to determine the clock frequency index to be
>>>> + * programmed into DFS.
>>>> + *
>>>> + * Return: number of valid performance levels in the table on success,
>>>> + *        standard Linux error codes on failure.
>>>> + */
>>>> +int geni_se_clk_tbl_get(struct geni_se *se, unsigned long **tbl)
>>>> +{
>>>> +       struct geni_wrapper *wrapper = se->wrapper;
>>>> +       unsigned long freq = 0;
>>>> +       int i;
>>>> +       int ret = 0;
>>>> +
>>>> +       mutex_lock(&wrapper->lock);
>>>> +       if (wrapper->clk_perf_tbl) {
>>>> +               *tbl = wrapper->clk_perf_tbl;
>>>> +               ret = wrapper->num_clk_levels;
>>>> +               goto out_unlock;
>>>> +       }
>>>> +
>>>> +       wrapper->clk_perf_tbl = kcalloc(MAX_CLK_PERF_LEVEL,
>>>> +                                       sizeof(*wrapper->clk_perf_tbl),
>>>> +                                       GFP_KERNEL);
>>>> +       if (!wrapper->clk_perf_tbl) {
>>>> +               ret = -ENOMEM;
>>>> +               goto out_unlock;
>>>> +       }
>>>> +
>>>> +       for (i = 0; i < MAX_CLK_PERF_LEVEL; i++) {
>>>> +               freq = clk_round_rate(se->clk, freq + 1);
>>>> +               if (!freq || freq == wrapper->clk_perf_tbl[i - 1])
>>>> +                       break;
>>>> +               wrapper->clk_perf_tbl[i] = freq;
>>>> +       }
>>>> +       wrapper->num_clk_levels = i;
>>>> +       *tbl = wrapper->clk_perf_tbl;
>>>> +       ret = wrapper->num_clk_levels;
>>>> +out_unlock:
>>>> +       mutex_unlock(&wrapper->lock);
>>>
>>> Is this lock actually protecting anything? I mean to say, is any more
>>> than one geni protocol driver calling this function at a time? Or is
>>> the same geni protocol driver calling this from multiple threads at the
>>> same time? The lock looks almost useless.
>> Yes, there is a possibility of multiple I2C instances within the same
>> wrapper trying to get this table simultaneously.
>>
>> As Evan mentioned in the other thread, Bjorn had the comment to move it
>> to the probe and remove the lock. I looked into the possibility of it.
>>   From the hardware perspective, this table belongs to the wrapper and is
>> shared by all the serial engines within the wrapper. But due to software
>> implementation reasons, clk_round_rate can be be performed only on the
>> clocks that are tagged as DFS compatible and only the serial engine
>> clocks are tagged so. At least this was the understanding based on our
>> earlier discussion with the concerned folks. We will revisit it and
>> check if anything has changed recently.
> 
> Hmm sounds like the round rate should happen on the parent of the
> se_clk, and this wrapper DT binding should get the clk for the parent of
> the se->clk to run round_rate() on. Then it could all be done in probe,
> which sounds good.
The parent of the se->clk is also specific to the serial engine itself. 
So putting that into the wrapper's DT binding does not look like a right 
location. For now, I will move the table to the individual serial engine 
themselves. Hence the lock can be removed.
> 
>>>> +
>>>> +/**
>>>> + * struct geni_se - GENI Serial Engine
>>>> + * @base:              Base Address of the Serial Engine's register block.
>>>> + * @dev:               Pointer to the Serial Engine device.
>>>> + * @wrapper:           Pointer to the parent QUP Wrapper core.
>>>> + * @clk:               Handle to the core serial engine clock.
>>>> + */
>>>> +struct geni_se {
>>>> +       void __iomem *base;
>>>> +       struct device *dev;
>>>> +       void *wrapper;
>>>
>>> Can this get the geni_wrapper type? It could be opaque if you like.
>> I am not sure if it is ok to have the children know the details of the
>> parent. That is why it is kept as opaque.
> 
> That's fine, but I mean to have struct geni_wrapper *wrapper, and then
> struct geni_wrapper; in this file. Children won't know details and we
> get slightly more type safety.
Ok.
> 
Regards,
Karthik.
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
