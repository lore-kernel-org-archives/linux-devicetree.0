From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: bcm476x: Add stub clock driver
Date: Mon, 08 Oct 2012 21:00:06 -0600
Message-ID: <50739336.1000805@wwwdotorg.org>
References: <20121007015300.828366635@gmail.com>
 <20121007015407.154476821@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121007015407.154476821-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "Turquette, Mike" <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/06/2012 07:53 PM, Domenico Andreoli wrote:
> From: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
> 
> This is the minimal clock support required for the boot, a more complete
> implementation will follow (shortly).

> Index: b/drivers/clk/clk-bcm476x.c

> +/*
> + * These are fixed clocks (and device tree doesn't support clk!).
> + *
> + * They're probably not all root clocks and it may be possible to
> + * turn them on and off but until this is mapped out better it's
> + * the only way they can be used.
> + */
> +DEFINE_CLK_FIXED_RATE(sys_pclk,   CLK_IS_ROOT, 312000000, 0);
> +DEFINE_CLK_FIXED_RATE(apb_pclk,   CLK_IS_ROOT, 156000000, 0);
> +DEFINE_CLK_FIXED_RATE(uart0_pclk, CLK_IS_ROOT, 78000000, 0);
> +DEFINE_CLK_FIXED_RATE(uart1_pclk, CLK_IS_ROOT, 78000000, 0);
> +DEFINE_CLK_FIXED_RATE(uart2_pclk, CLK_IS_ROOT, 78000000, 0);
> +
> +static struct clk_lookup lookups[] = {
> +	{ .con_id = "sys_pclk", .clk = &sys_pclk },
> +	{ .con_id = "apb_pclk", .clk = &apb_pclk },
> +	{ .dev_id = "c0000.uart0", .clk = &uart0_pclk },
> +	{ .dev_id = "c1000.uart1", .clk = &uart1_pclk },
> +	{ .dev_id = "b2000.uart2", .clk = &uart2_pclk },
> +};

Mike Turquette (common clk maintainer) objected to this form of static
clock initialization when I originally posted the bcm2835 patches.
Instead, please see how it got re-written dynamically:

https://git.kernel.org/?p=linux/kernel/git/swarren/linux-rpi.git;a=blob;f=drivers/clk/clk-bcm2835.c;h=67ad16b20b8119cc079e63d5dc7a9da0c79c567c;hb=f680f25c635a1a4327bef34fcbe1e9e3777b546c

(or, see linux-next or Linus Torvald's tree)

Also, please be aware of an error-handling bug there; see:

https://lkml.org/lkml/2012/10/7/75
