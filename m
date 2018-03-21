From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCHv6 3/3] clk: socfpga: stratix10: add clock driver for
 Stratix10 platform
Date: Tue, 20 Mar 2018 23:09:02 -0500
Message-ID: <f0d3fc46-5fa1-4e77-ef73-284bf2ee0d61@kernel.org>
References: <1519656455-14629-1-git-send-email-dinguyen@kernel.org>
 <1519656455-14629-3-git-send-email-dinguyen@kernel.org>
 <152148346040.242365.18406406194344107023@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <152148346040.242365.18406406194344107023@swboyd.mtv.corp.google.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 03/19/2018 01:17 PM, Stephen Boyd wrote:
> Quoting Dinh Nguyen (2018-02-26 06:47:35)
>> diff --git a/drivers/clk/socfpga/Makefile b/drivers/clk/socfpga/Makefile
>> index 9146c20..87ef977 100644
>> --- a/drivers/clk/socfpga/Makefile
>> +++ b/drivers/clk/socfpga/Makefile
>> @@ -1,6 +1,11 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> +ifeq ($(CONFIG_ARCH_SOCFPGA),y)
> 
> Ugh, any chance to make this better if we get three?
> 

I'll try.

...

> 
>> +{
>> +       struct stratix10_clock_data *clk_data;
>> +
>> +       clk_data = __socfpga_s10_clk_init(node, STRATIX10_NUM_CLKS);
>> +       if (!clk_data)
>> +               return;
>> +
>> +       s10_clk_register_pll(s10_pll_clks, ARRAY_SIZE(s10_pll_clks), clk_data);
>> +
>> +       s10_clk_register_c_perip(s10_main_perip_c_clks,
>> +                                ARRAY_SIZE(s10_main_perip_c_clks), clk_data);
>> +
>> +       s10_clk_register_cnt_perip(s10_main_perip_cnt_clks,
>> +                                  ARRAY_SIZE(s10_main_perip_cnt_clks),
>> +                                  clk_data);
>> +
>> +       s10_clk_register_gate(s10_gate_clks, ARRAY_SIZE(s10_gate_clks),
>> +                             clk_data);
>> +}
>> +
>> +CLK_OF_DECLARE(stratix10_clock, "intel,stratix10-clkmgr", socfpga_s10_init);
> 
> Can it be a platform device? We prefer those over the CLK_OF_DECLARE
> style.
> 

Thanks for the review! I'll change it to a platform device and address
your other comments in v7.

Dinh
