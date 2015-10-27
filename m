From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 18/19] ARM: dts: ste: replace legacy *,wakeup property
 with wakeup-source
Date: Tue, 27 Oct 2015 12:46:18 +0000
Message-ID: <562F7219.9010705@arm.com>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
 <1445422216-29375-19-git-send-email-sudeep.holla@arm.com>
 <CACRpkdYNFa-R8-u8JXijsCDyY+RHo4ANp+Voz3PEn6b9hcCrzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYNFa-R8-u8JXijsCDyY+RHo4ANp+Voz3PEn6b9hcCrzQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 27/10/15 12:34, Linus Walleij wrote:
> On Wed, Oct 21, 2015 at 12:10 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>
>> Though the keyboard and other driver will continue to support the legacy
>> "gpio-key,wakeup", "linux,wakeup" boolean property to enable the wakeup
>> source, "wakeup-source" is the new standard binding.
>>
>> This patch replaces all the legacy wakeup properties with the unified
>> "wakeup-source" property in order to avoid any futher copy-paste
>> duplication.
>>
>> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Are you sending this to ARM SoC or do I need to handle the
> patch?
>

Many platform maintainers preferred to pick up via their tree, so if you
want to pick up with other STE patches, I am fine as there's no
dependency on the driver changes.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
