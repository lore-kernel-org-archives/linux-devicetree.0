From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v4 1/5] clk: sunxi: Add CLK_OF_DECLARE
 support for sun8i-a23-apb0-clk driver
Date: Tue, 1 Dec 2015 22:19:46 +0800
Message-ID: <CAGb2v6502U3=GcbZOtj59r2_JRjKfTq=U9TGQgWFKpr3_-hcNw@mail.gmail.com>
References: <1448766190-11345-1-git-send-email-wens@csie.org>
 <1448766190-11345-2-git-send-email-wens@csie.org> <20151201100416.GF29263@lukather>
 <CAGb2v66bJJZ_xmD8B2X6nR3bxte9CdrnBpnd1KMRTmyRTr1KRQ@mail.gmail.com> <20151201125032.GH29263@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBGWZ62ZAKGQEFZ2VZ3A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20151201125032.GH29263@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 1, 2015 at 8:50 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Tue, Dec 01, 2015 at 07:54:06PM +0800, Chen-Yu Tsai wrote:
>> On Tue, Dec 1, 2015 at 6:04 PM, Maxime Ripard
>> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> > Hi,
>> >
>> > On Sun, Nov 29, 2015 at 11:03:06AM +0800, Chen-Yu Tsai wrote:
>> >> The APBS clock on sun9i is the same as the APB0 clock on sun8i. With
>> >> sun9i we are supporting the PRCM clocks by using CLK_OF_DECLARE,
>> >> instead of through a PRCM mfd device and subdevices for each clock
>> >> and reset control. As such we need a CLK_OF_DECLARE version of
>> >> the sun8i-a23-apb0-clk driver.
>> >>
>> >> Also, build it for sun9i/A80, and not just for configurations with
>> >> MFD_SUN6I_PRCM enabled.
>> >>
>> >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> >> ---
>> >>  drivers/clk/sunxi/Makefile         |  5 +--
>> >>  drivers/clk/sunxi/clk-sun8i-apb0.c | 71 +++++++++++++++++++++++++++++++-------
>> >>  2 files changed, 62 insertions(+), 14 deletions(-)
>> >>
>> >> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
>> >> index cb4c299214ce..c55d5cd1c0e5 100644
>> >> --- a/drivers/clk/sunxi/Makefile
>> >> +++ b/drivers/clk/sunxi/Makefile
>> >> @@ -15,6 +15,7 @@ obj-y += clk-sun9i-core.o
>> >>  obj-y += clk-sun9i-mmc.o
>> >>  obj-y += clk-usb.o
>> >>
>> >> +obj-$(CONFIG_MACH_SUN9I) += clk-sun8i-apb0.o
>> >> +
>> >
>> > So sun8i doesn't use it?
>>
>> Shit... I messed up. clk-sun8i-apb0.o should also be under
>> CONFIG_MFD_SUN6I_PRCM.
>>
>> I'll send a new version of this patch. No need to keep spamming
>> people with the whole series.
>
> Ok.
>
>> >>  obj-$(CONFIG_MFD_SUN6I_PRCM) += \
>> >> -     clk-sun6i-ar100.o clk-sun6i-apb0.o clk-sun6i-apb0-gates.o \
>> >> -     clk-sun8i-apb0.o
>> >> +     clk-sun6i-ar100.o clk-sun6i-apb0.o clk-sun6i-apb0-gates.o
>> >> diff --git a/drivers/clk/sunxi/clk-sun8i-apb0.c b/drivers/clk/sunxi/clk-sun8i-apb0.c
>> >> index 7ae5d2c2cde1..c1e2ac8f4b0d 100644
>> >> --- a/drivers/clk/sunxi/clk-sun8i-apb0.c
>> >> +++ b/drivers/clk/sunxi/clk-sun8i-apb0.c
>> >> @@ -17,13 +17,68 @@
>> >>  #include <linux/clk-provider.h>
>> >>  #include <linux/module.h>
>> >>  #include <linux/of.h>
>> >> +#include <linux/of_address.h>
>> >>  #include <linux/platform_device.h>
>> >>
>> >> +static struct clk *sun8i_a23_apb0_register(struct device_node *node,
>> >> +                                        void __iomem *reg)
>> >> +{
>> >> +     const char *clk_name = node->name;
>> >> +     const char *clk_parent;
>> >> +     struct clk *clk;
>> >> +     int ret;
>> >> +
>> >> +     clk_parent = of_clk_get_parent_name(node, 0);
>> >> +     if (!clk_parent)
>> >> +             return ERR_PTR(-EINVAL);
>> >> +
>> >> +     of_property_read_string(node, "clock-output-names", &clk_name);
>> >> +
>> >> +     /* The A23 APB0 clock is a standard 2 bit wide divider clock */
>> >> +     clk = clk_register_divider(NULL, clk_name, clk_parent, 0, reg,
>> >> +                                0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
>> >> +     if (IS_ERR(clk))
>> >> +             return clk;
>> >> +
>> >> +     ret = of_clk_add_provider(node, of_clk_src_simple_get, clk);
>> >> +     if (ret)
>> >> +             goto err_unregister;
>> >> +
>> >> +     return clk;
>> >> +
>> >> +err_unregister:
>> >> +     clk_unregister_divider(clk);
>> >> +
>> >> +     return ERR_PTR(ret);
>> >> +}
>> >> +
>> >> +static void sun8i_a23_apb0_setup(struct device_node *node)
>> >> +{
>> >> +     void __iomem *reg;
>> >> +     struct resource res;
>> >> +     struct clk *clk;
>> >> +
>> >> +     reg = of_io_request_and_map(node, 0, of_node_full_name(node));
>> >> +     if (IS_ERR(reg))
>> >> +             return;
>> >> +
>> >> +     clk = sun8i_a23_apb0_register(node, reg);
>> >> +     if (IS_ERR(clk))
>> >> +             goto err_unmap;
>> >> +
>> >> +     return;
>> >> +
>> >> +err_unmap:
>> >> +     iounmap(reg);
>> >> +     of_address_to_resource(node, 0, &res);
>> >> +     release_mem_region(res.start, resource_size(&res));
>> >> +}
>> >> +CLK_OF_DECLARE(sun8i_a23_apb0, "allwinner,sun8i-a23-apb0-clk",
>> >> +            sun8i_a23_apb0_setup);
>> >> +
>> >>  static int sun8i_a23_apb0_clk_probe(struct platform_device *pdev)
>> >>  {
>> >>       struct device_node *np = pdev->dev.of_node;
>> >> -     const char *clk_name = np->name;
>> >> -     const char *clk_parent;
>> >>       struct resource *r;
>> >>       void __iomem *reg;
>> >>       struct clk *clk;
>> >> @@ -33,19 +88,11 @@ static int sun8i_a23_apb0_clk_probe(struct platform_device *pdev)
>> >>       if (IS_ERR(reg))
>> >>               return PTR_ERR(reg);
>> >>
>> >> -     clk_parent = of_clk_get_parent_name(np, 0);
>> >> -     if (!clk_parent)
>> >> -             return -EINVAL;
>> >> -
>> >> -     of_property_read_string(np, "clock-output-names", &clk_name);
>> >> -
>> >> -     /* The A23 APB0 clock is a standard 2 bit wide divider clock */
>> >> -     clk = clk_register_divider(&pdev->dev, clk_name, clk_parent, 0, reg,
>> >> -                                0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
>> >> +     clk = sun8i_a23_apb0_register(np, reg);
>> >>       if (IS_ERR(clk))
>> >>               return PTR_ERR(clk);
>> >>
>> >> -     return of_clk_add_provider(np, of_clk_src_simple_get, clk);
>> >> +     return 0;
>> >>  }
>> >
>> > Won't this probe twice now? First the CLK_OF_DECLARE will register a
>> > clock, and then the device model will call probe a second time.
>>
>> AFAIK it will.
>>
>> > I guess then request_mem_region will catch it, but then you return an
>> > error code, which is probably an error success, since the clock is
>> > registered :)
>>
>> Indeed. clk-mod0.c actually has a comment block explaining this.
>> I didn't want to repeat the whole thing though.
>
> I guess, we can simply return 0 if of_io_request_and_map returns
> EBUSY, since it would simply mean that we already probed.

I think CLK_OF_DECLARE gets probed first, then platform devices.
of_io_request_and_map fails for mfd cells, which have no DT reg
properties. So we should be ignoring -EINVAL instead of -EBUSY.
But yeah, I'll have it return 0 in this case, and add a brief
comment.

ChenYu
