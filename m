From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: socfpga: Add SD card detect
Date: Thu, 14 Aug 2014 16:01:56 -0500
Message-ID: <53ED23C4.4010004@opensource.altera.com>
References: <1408031491-15609-1-git-send-email-dinguyen@opensource.altera.com> <1408031491-15609-3-git-send-email-dinguyen@opensource.altera.com> <20140814185158.GD11558@amd.pavel.ucw.cz> <53ED22D0.3060404@opensource.altera.com> <20140814205941.GA26857@amd.pavel.ucw.cz> <53ED239A.8090905@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53ED239A.8090905-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, vbridger-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 8/14/14, 4:01 PM, Dinh Nguyen wrote:
> 
> 
> On 8/14/14, 3:59 PM, Pavel Machek wrote:
>> On Thu 2014-08-14 15:57:52, Dinh Nguyen wrote:
>>>
>>>
>>> On 8/14/14, 1:51 PM, Pavel Machek wrote:
>>>> On Thu 2014-08-14 10:51:30, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
>>>>> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>>>>
>>>>> Revision D of the SOCFGPA devkit has a GPIO line used for SD/MMC
>>>>> card detect.
>>>>
>>>> Are there previous revisions outside Altera?
>>>>
>>>
>>> Not with SD card detect.
>>
>> So this patch will break those revision C (and below) boards, by
>> adding gpio for card detect that does not exists there, no?
>>
> 
> No, the card detect line is muxed with DAT3, so it'll work fine on
> previous boards that does have card detect.

Sorry...i'll work fine on previous boards that does NOT have card detect.

>> Confused,
> 
> Tested on all board revisions.
> 
> Dinh
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
