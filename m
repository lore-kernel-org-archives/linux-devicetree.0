From: Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>
Subject: Re: [PATCH v6 40/41] ARM: da8xx-dt: switch to device tree clocks
Date: Mon, 5 Feb 2018 15:04:00 +0100
Message-ID: <CAMRc=McJsneYdh8zDmYcUsFLiAyOmSeyOKhKfim4or7LwyEH1w@mail.gmail.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-41-git-send-email-david@lechnology.com> <335d92c8-1af2-da64-e366-95d7513ad69d@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <335d92c8-1af2-da64-e366-95d7513ad69d-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2018-01-24 4:26 GMT+01:00 David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>:
> On 01/20/2018 11:14 AM, David Lechner wrote:
>>
>> This removes all of the clock init code from da8xx-dt.c. This includes
>> all of the OF_DEV_AUXDATA that was just used for looking up clocks.
>>
>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>> ---
>>
>> v6 changes:
>> - removed misleading statement from commit message
>>
>>   arch/arm/mach-davinci/da8xx-dt.c | 61
>> +---------------------------------------
>>   1 file changed, 1 insertion(+), 60 deletions(-)
>>
>> diff --git a/arch/arm/mach-davinci/da8xx-dt.c
>> b/arch/arm/mach-davinci/da8xx-dt.c
>
>
>>   static void __init da850_init_machine(void)
>>   {
>> -       /* All existing boards use 100MHz SATA refclkpn */
>> -       static const unsigned long sata_refclkpn = 100 * 1000 * 1000;
>> -
>> -       int ret;
>> -
>> -       ret = da8xx_register_usb20_phy_clk(false);
>> -       if (ret)
>> -               pr_warn("%s: registering USB 2.0 PHY clock failed: %d",
>> -                       __func__, ret);
>> -       ret = da8xx_register_usb11_phy_clk(false);
>> -       if (ret)
>> -               pr_warn("%s: registering USB 1.1 PHY clock failed: %d",
>> -                       __func__, ret);
>> -
>> -       ret = da850_register_sata_refclk(sata_refclkpn);
>> -       if (ret)
>> -               pr_warn("%s: registering SATA REFCLK failed: %d",
>> -                       __func__, ret);
>> -
>> -       of_platform_default_populate(NULL, da850_auxdata_lookup, NULL);
>> +       of_platform_default_populate(NULL, NULL, NULL);
>
>
> of_platform_default_populate() can actually be removed completely.
> of_platform_default_populate_init() is called implicitly during
> arch_initcall_sync
>
>>         davinci_pm_init();
>>         pdata_quirks_init();
>>   }

Hi David,

this patch breaks nand on da850-lcdk (and probably on da850-evm) since
the nand driver can no longer clk_get() the nand clock. We would need
to keep the dev_auxdata at least for aemif.

Thanks,
Bartosz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
