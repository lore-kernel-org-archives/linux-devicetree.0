From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 01/11] clk: sunxi-ng: mux: Fix determine_rate for mux
 clocks with pre-dividers
Date: Thu, 26 Jan 2017 19:22:11 +0800
Message-ID: <CAGb2v66HJEn=t-kERNudXuqDApU8KV7DxBAmdiSrdPTMUP_x-g@mail.gmail.com>
References: <20170124023230.3990-1-wens@csie.org> <20170124023230.3990-2-wens@csie.org>
 <20170126095523.rat5wqbj73fkxy6z@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170126095523.rat5wqbj73fkxy6z@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 26, 2017 at 5:55 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Hi Chen-Yu,
>
> On Tue, Jan 24, 2017 at 10:32:20AM +0800, Chen-Yu Tsai wrote:
>> The determine_rate helper used ccu_mux_helper_adjust_parent_for_prediv()
>> to adjust the parent_rate to account for pre-dividers, but then passed
>> the pristine parent clock rate from clk_hw_get_rate() to the round()
>> callback, thereby ignoring the pre-divider adjustment. In addition,
>> it was saving the adjusted parent rate back into struct
>> clk_rate_request.
>>
>> This patch fixes this by saving the pristine parent clock rate, and
>> adding a copy that is adjusted and passed to the round() callback.
>> The pristine copy, if it is the best solution, would be saved back
>> to struct clk_rate_request.
>>
>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>> ---
>>  drivers/clk/sunxi-ng/ccu_mux.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
>> index 858a48621631..3445041894e7 100644
>> --- a/drivers/clk/sunxi-ng/ccu_mux.c
>> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
>> @@ -71,7 +71,7 @@ int ccu_mux_helper_determine_rate(struct ccu_common *common,
>>       unsigned int i;
>>
>>       for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
>> -             unsigned long tmp_rate, parent_rate;
>> +             unsigned long tmp_rate, parent_rate, adj_parent_rate;
>>               struct clk_hw *parent;
>>
>>               parent = clk_hw_get_parent_by_index(hw, i);
>> @@ -79,10 +79,11 @@ int ccu_mux_helper_determine_rate(struct ccu_common *common,
>>                       continue;
>>
>>               parent_rate = clk_hw_get_rate(parent);
>> +             adj_parent_rate = parent_rate;
>>               ccu_mux_helper_adjust_parent_for_prediv(common, cm, i,
>> -                                                     &parent_rate);
>> +                                                     &adj_parent_rate);
>>
>> -             tmp_rate = round(cm, clk_hw_get_rate(parent), req->rate, data);
>> +             tmp_rate = round(cm, parent_rate, req->rate, data);
>
> Shouldn't you use the adjusted rate here too?

You're right. Thanks!

ChenYu
