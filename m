From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCHv4] video: backlight: gpio-backlight: Add DT support.
Date: Mon, 04 Nov 2013 09:20:08 +0900
Message-ID: <004101ced8f3$9e4e7ec0$daeb7c40$%han@samsung.com>
References: <20131019104555.GI18477@ns203013.ovh.net>
 <2730370.0UKsY9Ox0H@avalon> <20131024110524.GB11296@ulmo.nvidia.com>
 <1389386.JnbumUe76M@avalon> <003701ced693$2f856150$8e9023f0$%han@samsung.com>
 <20131101095754.GJ27864@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20131101095754.GJ27864-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Thierry Reding' <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: 'Laurent Pinchart' <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, 'Jean-Christophe PLAGNIOL-VILLARD' <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, 'Denis Carikli' <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Ian Campbell' <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, 'Eric B??nard' <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, 'Pawel Moll' <pawel.moll-5wv7dgnIgG8@public.gmane.org>, 'Rob Herring' <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, 'Richard Purdie' <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, 'Sascha Hauer' <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, 'Lothar Wa??mann' <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday, November 01, 2013 6:58 PM, Thierry Reding wrote:
> On Fri, Nov 01, 2013 at 08:44:48AM +0900, Jingoo Han wrote:
>> On Friday, October 25, 2013 10:58 PM, Laurent Pinchart wrote:
>>> On Thursday 24 October 2013 13:05:25 Thierry Reding wrote:

[....]

>>>> Or is there still a reason to have more than a single bit for backlight
>>>> state? I don't know any hardware that actually makes a difference
>>>> between FB_BLANK_NORMAL, FB_BLANK_VSYNC_SUSPEND, FB_BLANK_HSYNC_SUSPEND
>>>> or FB_BLANK_POWERDOWN.
>>
>> On Exynos side, I have never seen that FB_BLANK_VSYNC_SUSPEND,
>> FB_BLANK_HSYNC_SUSPEND are used for controlling display panels or
>> Display controllers.
>>
>> However, I heard that FB_BLANK_VSYNC_SUSPEND, FB_BLANK_HSYNC_SUSPEND are
>> used for some monitors.
> 
> I think that those may make sense in the context of fbdev, and looking
> at some fbdev drivers seems to substantiate that.
> 
> However, I don't think backlights have any such capability. I mean they
> are either on or off, right? There's no such thing as partially off, or
> partially on. How would a backlight behave differently if the panel was
> in HSYNC suspend mode or VSYNC suspend mode?

Hi Thierry Reding.

I agree with you.
In the case of backlight, there is no need that a backlight behaves
differently in HSYNC suspend mode or VSYNC suspend mode.

Best regards,
Jingoo Han

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
