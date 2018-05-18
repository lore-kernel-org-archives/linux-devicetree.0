From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH v4 03/12] clk: imx7d: fix mipi dphy div parent
Date: Fri, 18 May 2018 09:30:12 +0100
Message-ID: <m3sh6pxt63.fsf@linaro.org>
References: <20180517125033.18050-1-rui.silva@linaro.org>
 <20180517125033.18050-4-rui.silva@linaro.org>
 <152658031035.210890.12212209931570500982@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-reply-to: <152658031035.210890.12212209931570500982@swboyd.mtv.corp.google.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Rob Herring <robh+dt@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, sakari.ailus@linux.intel.com, Steve Longerbeam <slongerbeam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,
On Thu 17 May 2018 at 18:05, Stephen Boyd wrote:
> Quoting Rui Miguel Silva (2018-05-17 05:50:24)
>> Fix the mipi dphy root divider to mipi_dphy_pre_div, this would 
>> remove a orphan
>> clock and set the correct parent.
>> 
>> before:
>> cat clk_orphan_summary
>>                                  enable  prepare  protect
>>    clock                          count    count    count 
>>    rate   accuracy   phase
>> ----------------------------------------------------------------------------------------
>>  mipi_dphy_post_div                   1        1        0 
>>  0          0 0
>>     mipi_dphy_root_clk                1        1        0 
>>     0          0 0
>> 
>> cat clk_dump | grep mipi_dphy
>> mipi_dphy_post_div                    1        1        0 
>> 0          0 0
>>     mipi_dphy_root_clk                1        1        0 
>>     0          0 0
>> 
>> after:
>> cat clk_dump | grep mipi_dphy
>>    mipi_dphy_src                     1        1        0 
>>    24000000          0 0
>>        mipi_dphy_cg                  1        1        0 
>>        24000000          0 0
>>           mipi_dphy_pre_div          1        1        0 
>>           24000000          0 0
>>              mipi_dphy_post_div      1        1        0 
>>              24000000          0 0
>>                 mipi_dphy_root_clk   1        1        0 
>>                 24000000          0 0
>> 
>> Fixes: 8f6d8094b215 ("ARM: imx: add imx7d clk tree support")
>> 
>> Cc: linux-clk@vger.kernel.org
>> Acked-by: Dong Aisheng <Aisheng.dong@nxp.com>
>> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>> ---
>
> I only get two patches out of the 12 and I don't get a cover 
> letter.
> Did you want me to pick up these clk patches into clk-next? 
> Where are
> the other patches? Can you cc lkml on all your kernel emails so 
> I can
> easily find them?

Yea, sorry, You are right, I will cc all patches to the lists. v5 
is on
the way and I will do that.

---
Cheers,
	Rui
