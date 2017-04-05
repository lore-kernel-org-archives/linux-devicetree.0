From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: imx7: add USDHC NAND clock to SDHC instances
Date: Tue, 4 Apr 2017 23:15:24 -0300
Message-ID: <CAOMZO5A7QQEe5rgBbJBzo8GY41aYV9WA8e9teCUROyihg0kq_g@mail.gmail.com>
References: <20170330005029.6472-1-stefan@agner.ch> <20170330005029.6472-2-stefan@agner.ch>
 <20170401030312.GB24882@b29396-OptiPlex-7040> <5c8339900fa1bd6215fb94d4386f7e06@agner.ch>
 <CAOMZO5CprxqnqRXMFJLBAgYAZGGnXNs3ZciyVz_mSLRnnSQQRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5CprxqnqRXMFJLBAgYAZGGnXNs3ZciyVz_mSLRnnSQQRQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 2, 2017 at 2:02 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sat, Apr 1, 2017 at 1:15 AM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:
>
>> IMX7D_IPG_ROOT_CLK is currently not a valid clock in upstream... So we
>> would have to add it to the clock driver first.
>>
>> I guess we could/should add it anyway at one point? But probably also as
>> init on, just to make sure Linux does not disable it since it is
>> currently used by several IPs implicitly.
>
> Yes, I made a previous attempt do add  IMX7D_IPG_ROOT_CLK and it did
> not work as I did not put it in the init_on clock list.
>
> Will submit a new patch adding it to init_on, thanks.

I thought that adding IMX7D_IPG_ROOT_CLK would do the trick, but the
patch below also causes the kernel to not boot:

--- a/drivers/clk/imx/clk-imx7d.c
+++ b/drivers/clk/imx/clk-imx7d.c
@@ -386,7 +386,7 @@ static int const clks_init_on[] __initconst = {
        IMX7D_PLL_SYS_MAIN_480M_CLK, IMX7D_NAND_USDHC_BUS_ROOT_CLK,
        IMX7D_DRAM_PHYM_ROOT_CLK, IMX7D_DRAM_ROOT_CLK,
        IMX7D_DRAM_PHYM_ALT_ROOT_CLK, IMX7D_DRAM_ALT_ROOT_CLK,
-       IMX7D_AHB_CHANNEL_ROOT_CLK,
+       IMX7D_AHB_CHANNEL_ROOT_CLK, IMX7D_IPG_ROOT_CLK,
 };

 static struct clk_onecell_data clk_data;
@@ -788,7 +788,7 @@ static void __init imx7d_clocks_init(struct
device_node *ccm_node)
        clks[IMX7D_WRCLK_ROOT_DIV] =
imx_clk_divider2("wrclk_post_div", "wrclk_pre_div", base + 0xbd00, 0,
6);
        clks[IMX7D_CLKO1_ROOT_DIV] =
imx_clk_divider2("clko1_post_div", "clko1_pre_div", base + 0xbd80, 0,
6);
        clks[IMX7D_CLKO2_ROOT_DIV] =
imx_clk_divider2("clko2_post_div", "clko2_pre_div", base + 0xbe00, 0,
6);
-
+       clks[IMX7D_IPG_ROOT_CLK] = imx_clk_divider2("ipg_root_clk",
"ahb_root_clk", base + 0x9080, 0, 2);
        clks[IMX7D_ARM_A7_ROOT_CLK] = imx_clk_gate4("arm_a7_root_clk",
"arm_a7_div", base + 0x4000, 0);
        clks[IMX7D_ARM_M4_ROOT_CLK] = imx_clk_gate4("arm_m4_root_clk",
"arm_m4_div", base + 0x4010, 0);
        clks[IMX7D_ARM_M0_ROOT_CLK] = imx_clk_gate4("arm_m0_root_clk",
"arm_m0_div", base + 0x4020, 0);
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
