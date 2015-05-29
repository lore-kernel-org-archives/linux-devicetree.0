From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 5/6] Watchdog: introduce ARM SBSA watchdog driver
Date: Fri, 29 May 2015 18:17:46 +0800
Message-ID: <CADyBb7uQCPoerjyiGT3uUxXJk6XVTEkEuOdEB+-w6G-=RrdTmA@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<1432548193-19569-1-git-send-email-fu.wei@linaro.org>
	<1432548193-19569-6-git-send-email-fu.wei@linaro.org>
	<5564A44A.5000606@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5564A44A.5000606-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Timur,

On 27 May 2015 at 00:50, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 05/25/2015 05:03 AM, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
>
>> +/*
>> + * help functions for accessing 32bit registers of SBSA Generic Watchdog
>> + */
>> +static void sbsa_gwdt_cf_write(unsigned int reg, u32 val,
>> +                              struct watchdog_device *wdd)
>> +{
>> +       struct sbsa_gwdt *gwdt = to_sbsa_gwdt(wdd);
>> +
>> +       writel_relaxed(val, gwdt->control_base + reg);
>> +}
>> +
>> +static void sbsa_gwdt_rf_write(unsigned int reg, u32 val,
>> +                              struct watchdog_device *wdd)
>> +{
>> +       struct sbsa_gwdt *gwdt = to_sbsa_gwdt(wdd);
>> +
>> +       writel_relaxed(val, gwdt->refresh_base + reg);
>> +}
>> +
>> +static u32 sbsa_gwdt_cf_read(unsigned int reg, struct watchdog_device
>> *wdd)
>> +{
>> +       struct sbsa_gwdt *gwdt = to_sbsa_gwdt(wdd);
>> +
>> +       return readl_relaxed(gwdt->control_base + reg);
>> +}
>
>
> I don't understand the value of these functions.  You're just adding
> overhead to each read and write by dereferencing wdd every time.  I would
> get rid of them and just call readl_relaxed() and writel_relaxed() directly.

yes, that makes sense, sometimes , I also feel these functions are a
little redundant,
let me see if I can improve it.

>
>> +/*
>> + * help functions for accessing 64bit WCV register
>> + */
>> +static u64 sbsa_gwdt_get_wcv(struct watchdog_device *wdd)
>> +{
>> +       u32 wcv_lo, wcv_hi;
>> +
>> +       do {
>> +               wcv_hi = sbsa_gwdt_cf_read(SBSA_GWDT_WCV_HI, wdd);
>> +               wcv_lo = sbsa_gwdt_cf_read(SBSA_GWDT_WCV_LO, wdd);
>> +       } while (wcv_hi != sbsa_gwdt_cf_read(SBSA_GWDT_WCV_HI, wdd));
>
>
> Please add a comment indicating that you're trying to read WCV atomically.

OK , that makes sense

>
>> +
>> +       return (((u64)wcv_hi << 32) | wcv_lo);
>> +}
>
>
> How about defining this macro:
>
> #define make64(high, low) (((u64)(high) << 32) | (low))
>
> and using it instead?  That makes the code easier to read.

good idea, but it's  just  used once, not sure if it's worthy
Actually, I have seen some macro in some driver, but not in kernel header file.

>
>> +
>> +static void sbsa_gwdt_set_wcv(struct watchdog_device *wdd, u64 value)
>> +{
>> +       u32 wcv_lo, wcv_hi;
>> +
>> +       wcv_lo = value & U32_MAX;
>> +       wcv_hi = (value >> 32) & U32_MAX;
>
>
> Use upper_32_bits() and lower_32_bits() instead.

cool, thanks ,  fixed it

>
>> +
>> +       sbsa_gwdt_cf_write(SBSA_GWDT_WCV_HI, wcv_hi, wdd);
>> +       sbsa_gwdt_cf_write(SBSA_GWDT_WCV_LO, wcv_lo, wdd);
>> +}
>> +
>> +static void reload_timeout_to_wcv(struct watchdog_device *wdd)
>
>
> This should be sbsa_gwdt_reload_timeout_to_wcv()
>
>> +{
>> +       struct sbsa_gwdt *gwdt = to_sbsa_gwdt(wdd);
>> +       u64 wcv;
>> +
>> +       wcv = arch_counter_get_cntvct() +
>> +               (u64)(wdd->timeout - wdd->pretimeout) * gwdt->clk;
>> +
>> +       sbsa_gwdt_set_wcv(wdd, wcv);
>
>
> Shouldn't you program WCV and WOR together?

why? WOR just for pretimeout in this driver.

>
>> +static int sbsa_gwdt_set_pretimeout(struct watchdog_device *wdd,
>> +                                   unsigned int pretimeout)
>> +{
>> +       struct sbsa_gwdt *gwdt = to_sbsa_gwdt(wdd);
>> +       u32 wor;
>> +
>> +       wdd->pretimeout = pretimeout;
>> +       sbsa_gwdt_update_limits(wdd);
>> +
>> +       if (!pretimeout)
>> +               /* gives sbsa_gwdt_start a chance to setup timeout */
>> +               wor = gwdt->clk;
>> +       else
>> +               wor = pretimeout * gwdt->clk;
>> +
>> +       /* refresh the WOR, that will cause an explicit watchdog refresh
>> */
>> +       sbsa_gwdt_cf_write(SBSA_GWDT_WOR, wor, wdd);
>
>
> Why not just ping the watchdog explicitely?

we just setup WOR, but we don't need to load pretimeout to WCV now, right ?

>
>> +static irqreturn_t sbsa_gwdt_interrupt(int irq, void *dev_id)
>> +{
>> +       struct sbsa_gwdt *gwdt = (struct sbsa_gwdt *)dev_id;
>> +       struct watchdog_device *wdd = &gwdt->wdd;
>> +       u32 status;
>> +
>> +       status = sbsa_gwdt_cf_read(SBSA_GWDT_WCS, wdd);
>> +
>> +       if (status & SBSA_GWDT_WCS_WS0)
>
>
> This should always be true.  Instead of reading WCS, I think you should just
> panic().

I thinks I need to confirm it , in case this has been cleaned.

>
>> +static int sbsa_gwdt_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct sbsa_gwdt *gwdt;
>> +       struct watchdog_device *wdd;
>> +       struct resource *res;
>> +       void *rf_base, *cf_base;
>> +       int irq;
>> +       u32 clk, status;
>> +       int ret = 0;
>> +       u64 first_period_max = U64_MAX;
>> +
>> +       /*
>> +        * Get the frequency of system counter from
>> +        * the cp15 interface of ARM Generic timer
>> +        */
>> +       clk = arch_timer_get_cntfrq();
>> +       if (!clk) {
>
>
> You have
>
>         depends on ARM_ARCH_TIMER
>
> in your Kconfig, so you don't need to check the return of
> arch_timer_get_cntfrq().  It can never be zero.
>
> Also, I would not use the variable name 'clk', because that's usually used
> for a "struct clk" object.  I would call this "freq" instead.

yes, I have fixed it .

>
>
> --
> Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.



-- 
Best regards,

Fu Wei
Software Engineer
Red Hat Software (Beijing) Co.,Ltd.Shanghai Branch
Ph: +86 21 61221326(direct)
Ph: +86 186 2020 4684 (mobile)
Room 1512, Regus One Corporate Avenue,Level 15,
One Corporate Avenue,222 Hubin Road,Huangpu District,
Shanghai,China 200021
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
