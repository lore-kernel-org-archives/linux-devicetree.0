From: =?windows-1252?Q?Noralf_Tr=F8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 2/3 v2] ARM: bcm2835: Add the Raspberry Pi firmware driver
Date: Fri, 29 May 2015 00:40:24 +0200
Message-ID: <55679958.8010003@tronnes.org>
References: <1431543609-19646-1-git-send-email-eric@anholt.net> <1431543609-19646-3-git-send-email-eric@anholt.net> <556785D8.2090709@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <556785D8.2090709-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Den 28.05.2015 23:17, skrev Stephen Warren:
> On 05/13/2015 01:00 PM, Eric Anholt wrote:
>> This gives us a function for making mailbox property channel requests
>> of the firmware, which is most notable in that it will let us get and
>> set clock rates.
> ...
>> Note that I don't think I've done what srwarren wanted for
>> -EPROBE_DEFER, because I'm not clear what he wants.  I think he might
>> just be asking for a function that does:
>>
>> /*
>>   * Returns 0 if the firmware device is probed and available, otherwise
>>   * -EPROBE_DEFER.
>>   */
>> int rpi_firmware_get(struct device_node *firmware_node)
>> {
>> 	struct platform_device *pdev = of_find_device_by_node(of_node);
>> 	if (!platform_get_drvdata(pdev))

of_find_device_by_node() can return NULL if the device can't be found.
platform_get_drvdata() can't handle a NULL pointer.

>> 		return -EPROBE_DEFER;
>> 	return 0;
>> }
>> EXPORT_SYMBOL(rpi_firmware_get)
>>
>> If that's all, I'm happy to add it.
> Yes, there definitely needs to be something that clients can call at
> probe() time to make sure the firmware driver is there already. That
> check is quite different from actually sending a request to the FW, so
> I'd certainly expect a separate function for that.

A try_module_get() here would make sure this module won't go away while a
client relies on it. For that we would need a rpi_firmware_put() as well.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
