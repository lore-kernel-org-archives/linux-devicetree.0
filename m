From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] regulator: Add support for S2MPA01 regulator
Date: Thu, 9 Jan 2014 10:39:34 +0530
Message-ID: <CAK9yfHwZN93T=Cs0jZ=ce6PBnjoFM6OcpC2cT1TCZVjHLBEJ=Q@mail.gmail.com>
References: <1389162390-4582-1-git-send-email-sachin.kamat@linaro.org>
	<1389162390-4582-2-git-send-email-sachin.kamat@linaro.org>
	<20140108123002.GY31886@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140108123002.GY31886-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Thanks for reviewing.

On 8 January 2014 18:00, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Jan 08, 2014 at 11:56:29AM +0530, Sachin Kamat wrote:
>
>> +     if (!iodev->dev->of_node) {
>> +             if (pdata) {
>> +                     goto common_reg;
>> +             } else {
>> +                     dev_err(pdev->dev.parent,
>> +                             "Platform data or DT node not supplied\n");
>> +                     return -ENODEV;
>> +             }
>> +     }
>
> The driver shouldn't need these to probe, it should be able to start in
> read only mode with no configuration.

OK.

>
>> +static int __init s2mpa01_pmic_init(void)
>> +{
>> +     return platform_driver_register(&s2mpa01_pmic_driver);
>> +}
>> +subsys_initcall(s2mpa01_pmic_init);
>
> module_platform_driver().

Just a small doubt here. Wouldn't changing this from subsys init to module init
cause problems to devices like mmc which would want the regulators available
(where they are not already enabled by the boot loader)?

-- 
With warm regards,
Sachin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
