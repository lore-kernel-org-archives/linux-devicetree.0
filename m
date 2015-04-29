From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 4/5] edac: Add APM X-Gene SoC EDAC driver
Date: Wed, 29 Apr 2015 11:57:09 -0500
Message-ID: <CAL_Jsq+5f_dFJBnQ=vBj7dS8ebqGQe9_5c00CgmA7gT1yp=mZg@mail.gmail.com>
References: <1430259045-19012-1-git-send-email-lho@apm.com>
 <1430259045-19012-4-git-send-email-lho@apm.com> <1430259045-19012-5-git-send-email-lho@apm.com>
 <4492781.xynGhSMMir@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4492781.xynGhSMMir@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 29, 2015 at 3:49 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tuesday 28 April 2015 16:10:44 Loc Ho wrote:
>> +
>> +       rc = platform_driver_register(&xgene_edac_mc_driver);
>> +       if (rc) {
>> +               edac_printk(KERN_ERR, EDAC_MOD_STR, "MCU fails to register\n");
>> +               goto reg_mc_failed;
>> +       }
>> +       rc = platform_driver_register(&xgene_edac_pmd_driver);
>> +       if (rc) {
>> +               edac_printk(KERN_ERR, EDAC_MOD_STR, "PMD fails to register\n");
>> +               goto reg_pmd_failed;
>> +       }
>> +       rc = platform_driver_register(&xgene_edac_l3_driver);
>> +       if (rc) {
>> +               edac_printk(KERN_ERR, EDAC_MOD_STR, "L3 fails to register\n");
>> +               goto reg_l3_failed;
>> +       }
>> +       rc = platform_driver_register(&xgene_edac_soc_driver);
>> +       if (rc) {
>> +               edac_printk(KERN_ERR, EDAC_MOD_STR, "SoC fails to register\n");
>> +               goto reg_soc_failed;
>> +       }
>>
>
> I had not looked at the driver before, but I have one comment now:
>
> I think this can be simplified to registering a single platform_driver
> that just matches all four compatible strings, with an appropriate data:
>
> +static struct of_device_id xgene_edac_of_match[] = {
> +       { .compatible = "apm,xgene-edac-mcu", .data = &xgene_edac_mcu_data },
> +       { .compatible = "apm,xgene-edac-pmd", .data = &xgene_edac_pmd_data },
> +       { .compatible = "apm,xgene-edac-l3",  .data = &xgene_edac_l3_data },
> +       { .compatible = "apm,xgene-edac-soc", .data = &xgene_edac_soc_data },
> +       {},
> +};

What exactly is shared here to combine all this into one driver? I
would argue these are all independent functions and should be separate
drivers. Add some library functions if there are common parts. The
bindings are still a bit broken IMO.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
