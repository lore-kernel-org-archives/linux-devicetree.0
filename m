From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] simplefb: Fix build failure on Sparc
Date: Mon, 05 Jan 2015 12:21:53 +0100
Message-ID: <54AA73D1.3@redhat.com>
References: <1420445716-13468-1-git-send-email-hdegoede@redhat.com> <54AA72CB.1020303@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54AA72CB.1020303-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 05-01-15 12:17, Tomi Valkeinen wrote:
> On 05/01/15 10:15, Hans de Goede wrote:
>> of_platform_device_create is only defined when CONFIG_OF_ADDRESS is set,
>> which is normally always the case when CONFIG_OF is defined, except on Sparc,
>> so explicitly check for CONFIG_OF_ADDRESS rather then for CONFIG_OF.
>>
>> Reported-by: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/video/fbdev/simplefb.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
>> index 92cac80..1085c04 100644
>> --- a/drivers/video/fbdev/simplefb.c
>> +++ b/drivers/video/fbdev/simplefb.c
>> @@ -402,7 +402,7 @@ static int __init simplefb_init(void)
>>   	if (ret)
>>   		return ret;
>>
>> -	if (IS_ENABLED(CONFIG_OF) && of_chosen) {
>> +	if (IS_ENABLED(CONFIG_OF_ADDRESS) && of_chosen) {
>>   		for_each_child_of_node(of_chosen, np) {
>>   			if (of_device_is_compatible(np, "simple-framebuffer"))
>>   				of_platform_device_create(np, NULL, NULL);
>>
>
> Doesn't this depend on the compiler optimizing the
> of_platform_device_create call away?

Yes it does.

> Isn't that rather dangerous assumption?

The kernel relies on being build with optimization enabled in various places,
this specific construction was suggested during review (by Grant Likely IIRC)
I initially had an #ifdef here. Note that this construction is used in various
places throughout the kernel and it seems to be used more and more often.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
