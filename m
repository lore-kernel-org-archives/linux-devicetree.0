From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/6] ARM: sunxi: Introduce Allwinner H3 support
Date: Thu, 22 Oct 2015 11:08:37 +0200
Message-ID: <5628A795.8000905@redhat.com>
References: <1445444007-4260-1-git-send-email-jenskuske@gmail.com>
 <5627E515.6050505@redhat.com> <20151022095857.50e2330b@OPI2>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBIGPUKYQKGQEWHBP3UI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20151022095857.50e2330b@OPI2>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Reinder E.N. de Haan" <reinder-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, zhao_steven-Y9sIeH5OGRo@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 22-10-15 09:58, Jean-Francois Moine wrote:
> On Wed, 21 Oct 2015 21:18:45 +0200
> Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
>> Great to see that you've started working on this again. Last weekend I
>> ended up working on this too together with Reinder E.N. de Haan <reinder-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
>> (added to the Cc).
>>
>> We took a slightly different approach for the gates clocks, see:
>>
>> https://github.com/jwrdegoede/linux-sunxi/commits/sunxi-wip
>>
>> And specifically:
>>
>> https://github.com/jwrdegoede/linux-sunxi/commit/80a1afe319d5d1a0c426d42e75d37f0c64e8ea0b
>>
>> Combined with:
>>
>> https://github.com/jwrdegoede/linux-sunxi/commit/d508da5feb5048f6674d6b24b58ac9058fb9d877
>>
>> This deals with the per gate parents the same way the rockchip
>> clock code does, and it seems to be quite a bit less code then your solution.
>
> Here is a simpler patch:
>
> diff --git a/drivers/clk/sunxi/clk-simple-gates.c b/drivers/clk/sunxi/clk-simple-gates.c
> index 6ce9118..8fecaeab 100644
> --- a/drivers/clk/sunxi/clk-simple-gates.c
> +++ b/drivers/clk/sunxi/clk-simple-gates.c
> @@ -35,6 +35,7 @@ static void __init sunxi_simple_gates_setup(struct device_node *node,
>   	void __iomem *reg;
>   	const __be32 *p;
>   	int number, i = 0, j;
> +	bool parent_per_gate;
>   	u8 clk_bit;
>   	u32 index;
>
> @@ -43,6 +44,7 @@ static void __init sunxi_simple_gates_setup(struct device_node *node,
>   		return;
>
>   	clk_parent = of_clk_get_parent_name(node, 0);
> +	parent_per_gate = of_clk_get_parent_count(node) != 1;
>
>   	clk_data = kmalloc(sizeof(struct clk_onecell_data), GFP_KERNEL);
>   	if (!clk_data)
> @@ -58,6 +60,8 @@ static void __init sunxi_simple_gates_setup(struct device_node *node,
>   	of_property_for_each_u32(node, "clock-indices", prop, p, index) {
>   		of_property_read_string_index(node, "clock-output-names",
>   					      i, &clk_name);
> +		if (parent_per_gate)
> +			clk_parent = of_clk_get_parent_name(node, i);
>
>   		clk_reg = reg + 4 * (index / 32);
>   		clk_bit = index % 32;
>
>

Yes good one, doing things that way indeed is better.

Regards,

Hans
