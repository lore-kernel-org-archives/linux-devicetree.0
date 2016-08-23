From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 2/5] clk: sunxi-ng: mux: support fixed pre-dividers on
 multiple parents
Date: Tue, 23 Aug 2016 17:52:59 +0800
Message-ID: <CAGb2v67gaQX_CEtysfDh+8sgo7L=zeRw2TSDbXnPnHA1awZF3w@mail.gmail.com>
References: <1471248795-17951-1-git-send-email-wens@csie.org>
 <1471248795-17951-3-git-send-email-wens@csie.org>
 <20160823085534.GC2598@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160823085534.GC2598@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: devicetree <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 23, 2016 at 4:55 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Mon, Aug 15, 2016 at 04:13:12PM +0800, Chen-Yu Tsai wrote:
>> Some clocks on the A31 have fixed pre-dividers on multiple parents.
>> Add support for them.
>>
>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>> ---
>> Changes since v1:
>>
>>   - Add field for number of fixed pre-dividers.
>> ---
>>  drivers/clk/sunxi-ng/ccu-sun8i-h3.c |  9 +++++----
>>  drivers/clk/sunxi-ng/ccu_mux.c      |  6 ++++--
>>  drivers/clk/sunxi-ng/ccu_mux.h      | 11 +++++++----
>>  3 files changed, 16 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
>> index 9af359544110..a01298881991 100644
>> --- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
>> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
>> @@ -184,15 +184,16 @@ static SUNXI_CCU_MP_WITH_MUX(apb2_clk, "apb2", apb2_parents, 0x058,
>>                            0);
>>
>>  static const char * const ahb2_parents[] = { "ahb1" , "pll-periph0" };
>> +static const struct ccu_mux_fixed_prediv ahb2_fixed_predivs[] = {
>> +     { .index = 1, .div = 2 },
>> +     { },
>> +};
>>  static struct ccu_mux ahb2_clk = {
>>       .mux            = {
>>               .shift  = 0,
>>               .width  = 1,
>>
>> -             .fixed_prediv   = {
>> -                     .index  = 1,
>> -                     .div    = 2,
>> -             },
>> +             .fixed_predivs  = ahb2_fixed_predivs,
>>       },
>>
>>       .common         = {
>> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
>> index 68b32f168a74..7b17e0c26b01 100644
>> --- a/drivers/clk/sunxi-ng/ccu_mux.c
>> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
>> @@ -20,6 +20,7 @@ void ccu_mux_helper_adjust_parent_for_prediv(struct ccu_common *common,
>>  {
>>       u16 prediv = 1;
>>       u32 reg;
>> +     int i;
>>
>>       if (!((common->features & CCU_FEATURE_FIXED_PREDIV) ||
>>             (common->features & CCU_FEATURE_VARIABLE_PREDIV)))
>> @@ -32,8 +33,9 @@ void ccu_mux_helper_adjust_parent_for_prediv(struct ccu_common *common,
>>       }
>>
>>       if (common->features & CCU_FEATURE_FIXED_PREDIV)
>> -             if (parent_index == cm->fixed_prediv.index)
>> -                     prediv = cm->fixed_prediv.div;
>> +             for (i = 0; i < cm->n_predivs; i++)
>> +                     if (parent_index == cm->fixed_predivs[i].index)
>> +                             prediv = cm->fixed_predivs[i].div;
>>
>>       if (common->features & CCU_FEATURE_VARIABLE_PREDIV)
>>               if (parent_index == cm->variable_prediv.index) {
>> diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
>> index f0078de78712..5308b41da22a 100644
>> --- a/drivers/clk/sunxi-ng/ccu_mux.h
>> +++ b/drivers/clk/sunxi-ng/ccu_mux.h
>> @@ -5,15 +5,18 @@
>>
>>  #include "ccu_common.h"
>>
>> +struct ccu_mux_fixed_prediv {
>> +     u8      index;
>> +     u16     div;
>> +};
>> +
>>  struct ccu_mux_internal {
>>       u8              shift;
>>       u8              width;
>>       const u8        *table;
>>
>> -     struct {
>> -             u8      index;
>> -             u16     div;
>> -     } fixed_prediv;
>> +     const struct ccu_mux_fixed_prediv       *fixed_predivs;
>> +     u8              n_predivs;
>
> I don't think you're using it anywhere (at least you don't define it
> in ahb2_clk, and the extra item in the array will introduce an
> off-by-one error.

The truth is I forgot to update the change in ccu-sun8i-h3.c
It is used correctly in the subsequent a31 patch. Sorry.

I'm not sure what you mean by the off-by-one error though. IIRC
we initialize the structure using named fields.


ChenYu

>
> Thanks!
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
