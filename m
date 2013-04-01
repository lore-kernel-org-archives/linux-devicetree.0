From: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: drm/tilcdc: LCD panels clocks initialization and earlier
 backlight initialization
Date: Mon, 1 Apr 2013 09:46:05 -0400
Message-ID: <CAF6AEGur7yuduNs9-HqP980NcXSB24Wz=2g_P4uPmXC9fJ9-9w@mail.gmail.com>
References: <1552838.0ugGbIv7sQ@ganymedes>
 <79CD15C6BA57404B839C016229A409A83EC3E861@DBDE01.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <79CD15C6BA57404B839C016229A409A83EC3E861-Er742YJ7I/eIQmiDNMet8wC/G2K4zDHf@public.gmane.org>
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
To: "Hiremath, Vaibhav" <hvaibhav-l0cyMroinI0@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Michal Bachraty <michal.bachraty-6oiIBCxl0MMjD8S081q9vkEOCMrvLtNR@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org" <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 1, 2013 at 7:31 AM, Hiremath, Vaibhav <hvaibhav-l0cyMroinI0@public.gmane.org> wrote:
>
>> -----Original Message-----
>> From: devicetree-discuss [mailto:devicetree-discuss-
>> bounces+hvaibhav=ti.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On Behalf Of Michal Bachraty
>> Sent: Thursday, March 28, 2013 11:02 PM
>> To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org; devicetree-
>> discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Cc: robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org
>> Subject: drm/tilcdc: LCD panels clocks initialization and earlier
>> backlight initialization
>>
>> Hi,
>>
>> I'm trying to use tilcdc driver for KWH050TG08 LCD panel connected to
>> AM335x
>> processor (3.9 rc1 kernel). I have prepared DT bindings for that
>> (listed
>> bellow). I see fb0 device but I have no clocks going from cpu to LCD.
>> My
>> clocks for LCD seems not properly to be set ...
>>
>> virt_25000000_ck               1           1            25000000
>>     sys_clkin_ck                8           19           25000000
>>        dpll_disp_ck             0           1            25000000
>>           dpll_disp_m2_ck       0           1            25000000
>>              lcd_gclk           0           1            25000000
>>
>> and tilcdc_crtc is not called. I also set lcd_gclk to 300MHz, but I got
>> same
>> result. The question is there any way how to properly set clocks for
>> LCD?
>>
> Not sure  about the LCDC DRM driver, but I just tested clk_set_rate()
> For lcdc_gclk clock and it is working for me. I could able to set
> 300MHz freq on my BeagleBone platform, with below code -
>

fwiw, tilcdc drm driver won't set clocks until you do modeset, as it
is setting them based on the requested pixel clock.  As opposed to
setting it once at boot time.

Michal, you may want to add 'drm.debug=7' in your bootargs, and send
the bootlog.  That should set some light about whether it is even
trying to modeset but failing, or some other issue.

BR,
-R

>
> diff --git a/arch/arm/mach-omap2/board-generic.c b/arch/arm/mach-omap2/board-generic.c
> index e54a480..443fb26 100644
> --- a/arch/arm/mach-omap2/board-generic.c
> +++ b/arch/arm/mach-omap2/board-generic.c
> @@ -11,6 +11,7 @@
>   * it under the terms of the GNU General Public License version 2 as
>   * published by the Free Software Foundation.
>   */
> +#include <linux/clk-private.h>
>  #include <linux/io.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
> @@ -37,6 +38,8 @@ static struct of_device_id omap_dt_match_table[] __initdata = {
>
>  static void __init omap_generic_init(void)
>  {
> +       struct clk *clk;
> +
>         omap_sdrc_init(NULL, NULL);
>
>         of_platform_populate(NULL, omap_dt_match_table, NULL, NULL);
> @@ -49,6 +52,15 @@ static void __init omap_generic_init(void)
>                 omap4_panda_display_init_of();
>         else if (of_machine_is_compatible("ti,omap4-sdp"))
>                 omap_4430sdp_display_init_of();
> +
> +       clk = clk_get(NULL, "lcd_gclk");
> +       if (IS_ERR(clk))
> +               printk("Can not get lcd_gclk clock\n");
> +
> +       printk("%s:%d gclk_rate - %lu\n", __func__, __LINE__, clk_get_rate(clk));
> +       clk_set_rate(clk, 300000000);
> +       printk("%s:%d clk_rate - %lu\n", __func__, __LINE__, clk_get_rate(clk));
> +       clk_put(clk);
>  }
>
>  #ifdef CONFIG_SOC_OMAP2420
>
>
> Thanks,
> Vaibhav
