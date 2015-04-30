From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 4/4] clk: si5351: Reset PLL after rate change
Date: Thu, 30 Apr 2015 20:58:10 +0200
Message-ID: <55427B42.9060902@gmail.com>
References: <1430415954-29517-1-git-send-email-sebastian.hesselbarth@gmail.com> <1430415954-29517-5-git-send-email-sebastian.hesselbarth@gmail.com> <20150430184932.GB22000@deathray>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150430184932.GB22000@deathray>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Jean-Francois Moine <moinejf@free.fr>, Russell King <rmk+linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 30.04.2015 20:49, Michael Welling wrote:
> On Thu, Apr 30, 2015 at 07:45:54PM +0200, Sebastian Hesselbarth wrote:
>> When changing PLL rate significantly, PLLs have to be reset. Add a function
>> to perform and check for successful PLL reset.
>>
>> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>> ---
[...]
>> @@ -519,6 +545,9 @@ static int si5351_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>>   		SI5351_CLK_INTEGER_MODE,
>>   		(hwdata->params.p2 == 0) ? SI5351_CLK_INTEGER_MODE : 0);
>>
>> +	/* reset pll after rate change */
>> +	si5351_pll_reset(hwdata);
>> +
>
> What is the point of having a return code if it is not being used?

Good point, I'll pass that on to the return value of .set_rate()
callback for v2.

Sebastian
