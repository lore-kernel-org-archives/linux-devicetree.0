From: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 03/10] clk: sunxi: Let divs clocks read
 the base factor clock name from devicetree
Date: Mon, 18 May 2015 11:22:32 +0200
Message-ID: <5559AF58.60508@gmail.com>
References: <1431707940-19372-1-git-send-email-jenskuske@gmail.com> <1431707940-19372-4-git-send-email-jenskuske@gmail.com> <20150517130657.GD4004@lukather>
Reply-To: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCC5XIE2SIHBBRXT42VAKGQEPLQH2RY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150517130657.GD4004@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: =?windows-1252?Q?Emilio_L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/17/15 15:06, Maxime Ripard wrote:
> On Fri, May 15, 2015 at 06:38:53PM +0200, Jens Kuske wrote:
>> Currently, the sunxi clock driver gets the name for the base factor clock
>> of divs clocks from the name field in factors_data. This prevents reusing
>> of the factor clock for clocks with same properties, but different name.
>>
>> This commit makes the divs setup function try to get a name from
>> clock-output-names in the devicetree. It also removes the name field where
>> possible and merges the sun4i PLL5 and PLL6 clocks.
>>
>> The sun4i PLL5 clock doesn't have a output for the base factor clock,
>> so we still have to use the name field there.
>>
>> Signed-off-by: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/clk/sunxi/clk-sunxi.c | 22 ++++++++++++----------
>>  1 file changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
>> index 17cba4d..afe560c 100644
>> --- a/drivers/clk/sunxi/clk-sunxi.c
>> +++ b/drivers/clk/sunxi/clk-sunxi.c
>> @@ -708,18 +708,10 @@ static const struct factors_data sun4i_pll5_data __initconst = {
>>  	.name = "pll5",
>>  };
>>  
>> -static const struct factors_data sun4i_pll6_data __initconst = {
>> -	.enable = 31,
>> -	.table = &sun4i_pll5_config,
>> -	.getter = sun4i_get_pll5_factors,
>> -	.name = "pll6",
>> -};
>> -
>>  static const struct factors_data sun6i_a31_pll6_data __initconst = {
>>  	.enable = 31,
>>  	.table = &sun6i_a31_pll6_config,
>>  	.getter = sun6i_a31_get_pll6_factors,
>> -	.name = "pll6x2",
>>  };
>>  
>>  static const struct factors_data sun5i_a13_ahb_data __initconst = {
>> @@ -1099,7 +1091,7 @@ static const struct divs_data pll5_divs_data __initconst = {
>>  };
>>  
>>  static const struct divs_data pll6_divs_data __initconst = {
>> -	.factors = &sun4i_pll6_data,
>> +	.factors = &sun4i_pll5_data,
>>  	.ndivs = 4,
>>  	.div = {
>>  		{ .shift = 0, .table = pll6_sata_tbl, .gate = 14 }, /* M, SATA */
>> @@ -1141,6 +1133,7 @@ static void __init sunxi_divs_clk_setup(struct device_node *node,
>>  	struct clk_gate *gate = NULL;
>>  	struct clk_fixed_factor *fix_factor;
>>  	struct clk_divider *divider;
>> +	struct factors_data factors = *data->factors;
>>  	void __iomem *reg;
>>  	int ndivs = SUNXI_DIVS_MAX_QTY, i = 0;
>>  	int flags, clkflags;
>> @@ -1149,8 +1142,17 @@ static void __init sunxi_divs_clk_setup(struct device_node *node,
>>  	if (data->ndivs)
>>  		ndivs = data->ndivs;
>>  
>> +	/* Try to find a name for base factor clock */
>> +	for (i = 0; i < ndivs; i++) {
>> +		if (data->div[i].self) {
> 
> I'm not sure we should expect the factor clock to have a self factor.

Maybe not, but in that case it would fall back to the name provided in
the factors_data struct, as it is the case for sun4i pll5.

> what about taking the first output and taking the substring up to the
> first "_" ?

That only works for the sun[457]i pll5 & pll6, for sun[68]i the base
clock name would have to be "pll6x2".

Jens
