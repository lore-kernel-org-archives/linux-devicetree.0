From: Eric Nelson <eric@nelint.com>
Subject: Re: [PATCH] clk: imx6q: remove unsupported pll4_audio_div
Date: Mon, 11 Mar 2019 07:02:53 -0700
Message-ID: <6eeb02d8-62fe-6b2a-d265-b437a02ef8d1@nelint.com>
References: <1552259930-27786-1-git-send-email-eric@nelint.com>
 <1552304271.2453.12.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552304271.2453.12.camel@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>, linux-clk@vger.kernel.org
Cc: anson.huang@nxp.com, clement.peron@devialet.com, colin.didier@devialet.com, devicetree@vger.kernel.org, festevam@gmail.com, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, s.hauer@pengutronix.de, sboyd@kernel.org, shawnguo@kernel.org, tiny.windzz@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Lucas,

On 3/11/19 4:37 AM, Lucas Stach wrote:
> Hi Eric,
> 
> Am Sonntag, den 10.03.2019, 16:18 -0700 schrieb Eric Nelson:
>> The pll4_audio_div attempted to reflect one bit of a two-bit
>> divisor (AUDIO_DIV_LSB) in the CCM_ANALOG_MISC2 register.
>>
>> Unfortunately, this divisor is non-functional at least on the
>> latest silicon revisions and has been removed from the reference
>> manual.
>>
>> This is discussed in this NXP Community thread:
>>
>>      https://community.nxp.com/thread/462806
>>
>> Remove the definition of pll4_audio_div to reflect this and
>> reparent the ssi, cko1, and ESAI/ASRC/SPDIF clocks to the
>> pll4_post_div clock.
>>
>>> Signed-off-by: Eric Nelson <eric@nelint.com>
>> ---
>>   drivers/clk/imx/clk-imx6q.c               |   7 +-
>>   include/dt-bindings/clock/imx6qdl-clock.h | 127 +++++++++++++++---------------
>>   2 files changed, 66 insertions(+), 68 deletions(-)
>>

<snip>

>>   
>> diff --git a/include/dt-bindings/clock/imx6qdl-clock.h b/include/dt-bindings/clock/imx6qdl-clock.h
>> index b3cef29..dea23a9 100644
>> --- a/include/dt-bindings/clock/imx6qdl-clock.h
>> +++ b/include/dt-bindings/clock/imx6qdl-clock.h
>> @@ -213,69 +213,68 @@
>>>   #define IMX6QDL_CLK_CKO2			200
>>>   #define IMX6QDL_CLK_CKO				201
>>>   #define IMX6QDL_CLK_VDOA			202
>>> -#define IMX6QDL_CLK_PLL4_AUDIO_DIV		203
>>> -#define IMX6QDL_CLK_LVDS1_SEL			204

<snip>

>>> +#define IMX6QDL_CLK_LVDS1_SEL			203
>>> +#define IMX6QDL_CLK_LVDS2_SEL			204
>>> +#define IMX6QDL_CLK_LVDS1_GATE			205

<snip>

> 
> You can not renumber the DT clock defines, as this breaks DT backward
> compatibility. You can however remove IMX6QDL_CLK_PLL4_AUDIO_DIV and
> leave a hole in the numbers, maybe with a comment about why it exists.
> 

Okay. I wasn't aware of this requirement, and I'll send a V2.

It will also make the patch much smaller!
