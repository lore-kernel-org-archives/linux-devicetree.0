From: Abhishek Sahu <absahu@codeaurora.org>
Subject: Re: [PATCH v3 4/7] clk: qcom: ipq4019: Added all the frequencies for
 apps cpu
Date: Thu, 24 Nov 2016 18:16:02 +0530
Message-ID: <356199897fb2022342a76bc872b703d5@codeaurora.org>
References: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
 <1474460512-31994-5-git-send-email-absahu@codeaurora.org>
 <20161102012450.GD16026@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161102012450.GD16026@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2016-11-02 06:54, Stephen Boyd wrote:
> On 09/21, Abhishek Sahu wrote:
>> The APPS CPU clock does not contain all the frequencies in its
>> frequency table so this patch adds the same.
>> 
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> ---
>>  drivers/clk/qcom/gcc-ipq4019.c | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/clk/qcom/gcc-ipq4019.c 
>> b/drivers/clk/qcom/gcc-ipq4019.c
>> index 211c68c..160e0cf 100644
>> --- a/drivers/clk/qcom/gcc-ipq4019.c
>> +++ b/drivers/clk/qcom/gcc-ipq4019.c
>> @@ -565,10 +565,20 @@ static struct clk_rcg2  sdcc1_apps_clk_src = {
>>  };
>> 
>>  static const struct freq_tbl ftbl_gcc_apps_clk[] = {
>> -	F(48000000, P_XO,	   1, 0, 0),
>> +	F(48000000,  P_XO,         1, 0, 0),
>>  	F(200000000, P_FEPLL200,   1, 0, 0),
>> +	F(380000000, P_DDRPLLAPSS, 1, 0, 0),
>> +	F(409000000, P_DDRPLLAPSS, 1, 0, 0),
>> +	F(444000000, P_DDRPLLAPSS, 1, 0, 0),
>> +	F(484000000, P_DDRPLLAPSS, 1, 0, 0),
>>  	F(500000000, P_FEPLL500,   1, 0, 0),
>> +	F(507000000, P_DDRPLLAPSS, 1, 0, 0),
>> +	F(532000000, P_DDRPLLAPSS, 1, 0, 0),
>> +	F(560000000, P_DDRPLLAPSS, 1, 0, 0),
>> +	F(592000000, P_DDRPLLAPSS, 1, 0, 0),
>>  	F(626000000, P_DDRPLLAPSS, 1, 0, 0),
>> +	F(666000000, P_DDRPLLAPSS, 1, 0, 0),
>> +	F(710000000, P_DDRPLLAPSS, 1, 0, 0),
>>  	{ }
>>  };
> 
> Can't we have the determine_rate callback know the speeds of the
> "fixed" PLLs and use those first if the rate hits exactly? And
> then if that doesn't happen go try ddrpllapps and set the rate on
> it? I'm hoping we can get rid of this frequency table.
This clock is being registered with QCOM clk_rcg2 operations which
already has determine_rate callback based on this frequency table.
Currently all the frequencies are being generated without HID
divider but in future, we can have some frequency which will use
dividers also.
-- 
Abhishek Sahu
