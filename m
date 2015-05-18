From: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 02/10] clk: sunxi: Add support for
 multiple parents to gates
Date: Mon, 18 May 2015 11:11:34 +0200
Message-ID: <5559ACC6.6050202@gmail.com>
References: <1431707940-19372-1-git-send-email-jenskuske@gmail.com> <1431707940-19372-3-git-send-email-jenskuske@gmail.com> <20150517125014.GB4004@lukather>
Reply-To: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCC5XIE2SIHBBQ7T42VAKGQELA4D54Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150517125014.GB4004@lukather>
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

Hi,

On 05/17/15 14:50, Maxime Ripard wrote:
> Hi Jens,
> 
> On Fri, May 15, 2015 at 06:38:52PM +0200, Jens Kuske wrote:
>> Some newer sunxi SoCs (A83T, H3) don't have individual registers for
>> AHB1, APB1 and APB2 gates anymore, but one big bus gates area where each
>> gate can have a different parent.
>>
>> The current clock driver sets the same parent for all gates in a group.
>> This commit adds a new parents field to the gates_data structure, which
>> allows us to specify an array of parent indices for every single gate.
>>
>> Signed-off-by: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/clk/sunxi/clk-sunxi.c | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
>> index 9a82f17..17cba4d 100644
>> --- a/drivers/clk/sunxi/clk-sunxi.c
>> +++ b/drivers/clk/sunxi/clk-sunxi.c
>> @@ -898,6 +898,8 @@ static void __init sunxi_divider_clk_setup(struct device_node *node,
>>  
>>  struct gates_data {
>>  	DECLARE_BITMAP(mask, SUNXI_GATES_MAX_SIZE);
>> +	/* If used, ARRAY_SIZE(parents) has to be >= bitmap_weight(mask) */
>> +	const u8 *parents;
>>  };
>>  
>>  static const struct gates_data sun4i_axi_gates_data __initconst = {
>> @@ -1000,16 +1002,21 @@ static void __init sunxi_gates_clk_setup(struct device_node *node,
>>  					 struct gates_data *data)
>>  {
>>  	struct clk_onecell_data *clk_data;
>> +	const char *parents[SUNXI_MAX_PARENTS];
>>  	const char *clk_parent;
>>  	const char *clk_name;
>>  	void __iomem *reg;
>> +	int npar = 0;
>>  	int qty;
>>  	int i = 0;
>>  	int j = 0;
>>  
>>  	reg = of_iomap(node, 0);
>>  
>> -	clk_parent = of_clk_get_parent_name(node, 0);
>> +	while (npar < SUNXI_MAX_PARENTS &&
>> +	       (parents[npar] = of_clk_get_parent_name(node, npar)) != NULL)
>> +		npar++;
>> +	clk_parent = parents[0];
>>  
>>  	/* Worst-case size approximation and memory allocation */
>>  	qty = find_last_bit(data->mask, SUNXI_GATES_MAX_SIZE);
>> @@ -1026,6 +1033,9 @@ static void __init sunxi_gates_clk_setup(struct device_node *node,
>>  		of_property_read_string_index(node, "clock-output-names",
>>  					      j, &clk_name);
>>  
>> +		if (data->parents && !WARN_ON(data->parents[j] >= npar))
>> +			clk_parent = parents[data->parents[j]];
>> +
> 
> I'm currently removing that code, so I was more expecting a new
> standalone driver for that clock.

How do you want to replace that code? To me this looks like a good way
to set up all the different gates sunxi has.

Jens
