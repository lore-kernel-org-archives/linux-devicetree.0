From: Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH v5 1/2] clk: add lpc18xx creg clk driver
Date: Fri, 4 Mar 2016 21:48:08 +0100
Message-ID: <CAGhQ9VxYBRUbj+afsHUa21cwNFT4bdYRDNwxagdUwBXg4-x_3w@mail.gmail.com>
References: <1457041625-21163-1-git-send-email-manabian@gmail.com>
	<1457041625-21163-2-git-send-email-manabian@gmail.com>
	<20160304174201.GH24999@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160304174201.GH24999@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 4 March 2016 at 18:42, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 03/03, Joachim Eastwood wrote:
>> diff --git a/drivers/clk/nxp/clk-lpc18xx-creg.c b/drivers/clk/nxp/clk-lpc18xx-creg.c
>> new file mode 100644
>> index 000000000000..d44b61afa2dc
>> --- /dev/null
>> +++ b/drivers/clk/nxp/clk-lpc18xx-creg.c
>> @@ -0,0 +1,226 @@
>> +
>> +static int clk_creg_32k_is_prepared(struct clk_hw *hw)
>> +{
>> +     struct clk_creg_data *creg = to_clk_creg(hw);
>> +     u32 reg;
>> +
>> +     regmap_read(creg->reg, LPC18XX_CREG_CREG0, &reg);
>> +
>> +     return !(reg & LPC18XX_CREG_CREG0_PD32KHZ) &&
>> +            !(reg & LPC18XX_CREG_CREG0_RESET32KHZ);
>> +}
>> +
>> +static unsigned long clk_creg_1k_recalc_rate(struct clk_hw *hw,
>> +                                          unsigned long parent_rate)
>> +{
>> +     return parent_rate / 32;
>> +}
>> +
>> +static int clk_creg_enable(struct clk_hw *hw)
>> +{
>> +     struct clk_creg_data *creg = to_clk_creg(hw);
>> +
>> +     return regmap_update_bits(creg->reg, LPC18XX_CREG_CREG0,
>> +                               creg->en_mask, creg->en_mask);
>
> Have you tested this with CONFIG_DEBUG_ATOMIC_SLEEP=y? I seem to
> recall that syscon uses a regmap with regmap_config::fast_io set
> to false, so all regmap operations take a mutex lock.
> clk_ops::enable is called with a spinlock held, so that isn't
> going to work well.

The MMIO bus config sets fast io to true and __regmap_init() uses
spinlocks if either bus or regmap config is set to true.

http://lxr.free-electrons.com/source/drivers/base/regmap/regmap-mmio.c#L209
http://lxr.free-electrons.com/source/drivers/base/regmap/regmap.c#L548

or am I missing something?

regards,
Joachim Eastwood
