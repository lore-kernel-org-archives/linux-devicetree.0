From: Brijesh Singh <brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org>
Subject: Re: [PATCH v3] EDAC: Add ARM64 EDAC
Date: Tue, 27 Oct 2015 15:01:59 -0500
Message-ID: <562FD837.50505@amd.com>
References: <1445966985-5777-1-git-send-email-brijeshkumar.singh@amd.com>
 <20151027190832.GN19782@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151027190832.GN19782-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, andre.przywara-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thanks for review Steve.

On 10/27/2015 02:08 PM, Stephen Boyd wrote:
>> +config EDAC_CORTEX_ARM64
>> +	tristate "ARM Cortex A57/A53"
>> +	depends on EDAC_MM_EDAC && ARM64
>> +	default n
> 
> n is the default so this can be removed.
> 
noted

>> +	.driver = {
>> +		.name = DRV_NAME,
>> +		.owner = THIS_MODULE,
> 
> This line can be removed. THIS_MODULE is assigned by
> platform_driver_register().
noted. 

> 
>> +		.of_match_table = cortex_arm64_edac_of_match,
>> +	},
>> +};
>> +
>> +static int __init cortex_arm64_edac_init(void)
>> +{
>> +	return platform_driver_register(&cortex_arm64_edac_driver);
>> +}
>> +module_init(cortex_arm64_edac_init);
>> +
>> +static void __exit cortex_arm64_edac_exit(void)
>> +{
>> +	platform_driver_unregister(&cortex_arm64_edac_driver);
>> +}
>> +module_exit(cortex_arm64_edac_exit);
> 
> This can be module_platform_driver(cortex_arm64_edac_driver) now.
> 
noted.

-Brijesh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
