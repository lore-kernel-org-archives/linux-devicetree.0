From: Eric Nelson <eric@nelint.com>
Subject: Re: [V2 1/2] clk: imx6q: remove unsupported pll4_audio_div
Date: Mon, 11 Mar 2019 13:48:55 -0700
Message-ID: <0cf890a4-20b0-13ce-14d3-06f7c3227655@nelint.com>
References: <1552304271.2453.12.camel@pengutronix.de>
 <1552319997-24622-1-git-send-email-eric@nelint.com>
 <1552319997-24622-2-git-send-email-eric@nelint.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552319997-24622-2-git-send-email-eric@nelint.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: anson.huang@nxp.com, colin.didier@devialet.com, festevam@gmail.com, kernel@pengutronix.de, l.stach@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, s.hauer@pengutronix.de, sboyd@kernel.org, shawnguo@kernel.org, tiny.windzz@gmail.com
List-Id: devicetree@vger.kernel.org

 > On March 11, 2019, 6:35 p.m. UTC, Stephen Boyd wrote:
 >
> Quoting Eric Nelson (2019-03-11 08:59:56)
>> diff --git a/include/dt-bindings/clock/imx6qdl-clock.h b/include/dt-bindings/clock/imx6qdl-clock.h
>> index b3cef29..34bb14d 100644
>> --- a/include/dt-bindings/clock/imx6qdl-clock.h
>> +++ b/include/dt-bindings/clock/imx6qdl-clock.h
>> @@ -213,7 +213,15 @@
>>  #define IMX6QDL_CLK_CKO2                       200
>>  #define IMX6QDL_CLK_CKO                                201
>>  #define IMX6QDL_CLK_VDOA                       202
>> -#define IMX6QDL_CLK_PLL4_AUDIO_DIV             203
>> +
>> +/* The PLL4_AUDIO_DIV divider only appeared in
>> + * early versions of the reference manual.
>> + *
>> + * Renamed to _BROKEN to prevent inadvertent use,
>> + * but reserved the array slot to maintain DT binary
>> + * compatibility.
>> + */
>> +#define IMX6QDL_CLK_PLL4_AUDIO_DIV_BROKEN      203
> 
> But it breaks the build. I don't get it. Just add a comment indicating
> it shouldn't be used? That breaks the cross-tree dependency chain and
> lets clk tree merge the clk driver part and arm-soc merge the dts part.
The device tree update also requires the update to clk-imx6q.c
for proper run-time operation, so I don't see how these two parts
can be separated.

I thought about leaving the PLL4_AUDIO_DIV clock in place but
turning it into a dummy (placeholder), but that might lead others
down the long path I traversed before I found out that my manual
was old and the clock didn't function.
