From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH v3 5/6] clk: sunxi: Add A23 clocks support
Date: Thu, 26 Jun 2014 11:25:49 +0800
Message-ID: <CAGb2v66wBfq2z93gJ7Xh64o09AdFDWJwAS2VzgU_EVURKoQ+YA@mail.gmail.com>
References: <1403603980-31101-1-git-send-email-wens@csie.org>
 <1403603980-31101-6-git-send-email-wens@csie.org> <20140625202029.GJ19569@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBLVIV2OQKGQERZWF3PA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20140625202029.GJ19569@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 26, 2014 at 4:20 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Tue, Jun 24, 2014 at 05:59:39PM +0800, Chen-Yu Tsai wrote:
>> The clock control unit on the A23 is similar to the one found on the A31.
>>
>> The AHB1, APB1, APB2 gates on the A23 are almost identical to the ones
>> on the A31, but some outputs are missing.
>>
>> The main CPU PLL (PLL1) however is like that on older Allwinner SoCs,
>> such as the A10 or A20, but the N factor starts from 1 instead of 0.
>>
>> This patch adds support for PLL1 and all the basic clock muxes and gates.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/clock/sunxi.txt |   5 ++
>>  drivers/clk/sunxi/clk-sunxi.c                     | 103 ++++++++++++++++++++++
>>  2 files changed, 108 insertions(+)
>>
>> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
>> index 6fe9492..d4832a7 100644
>> --- a/drivers/clk/sunxi/clk-sunxi.c
>> +++ b/drivers/clk/sunxi/clk-sunxi.c
[...]
>> @@ -673,6 +739,25 @@ static const struct div_data sun4i_axi_data __initconst = {
>>       .width  = 2,
>>  };
>>
>> +static const struct clk_div_table sun8i_a23_axi_table[] __initconst = {
>> +     { .val = 0, .div = 1 },
>> +     { .val = 1, .div = 2 },
>> +     { .val = 2, .div = 3 },
>> +     { .val = 3, .div = 4 },
>> +     { .val = 4, .div = 4 },
>> +     { .val = 5, .div = 4 },
>> +     { .val = 6, .div = 4 },
>> +     { .val = 7, .div = 4 },
>> +     { } /* sentinel */
>> +};
>> +
>> +static const struct div_data sun8i_a23_axi_data __initconst = {
>> +     .shift  = 0,
>> +     .pow    = 0,
>
> These are the default value.

I am aware. This is consistent with all the other div_data
instances, which have all fields set regardless of default
values.

>> +     .width  = 3,
>> +     .table  = sun8i_a23_axi_table,
>> +};
>> +
>>  static const struct div_data sun4i_ahb_data __initconst = {
>>       .shift  = 4,
>>       .pow    = 1,

[...]

> Looks fine otherwise,
>
> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

If you're ok with being consistent, I'll add your acked-by
without changing it. Otherwise I'll remove the fields with
default values.

Thanks!


ChenYu
