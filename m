From: Shubhrajyoti Datta <shubhrajyoti.datta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4] watchdog: xilinx: Add clock support
Date: Fri, 12 Aug 2016 12:18:19 +0530
Message-ID: <CAKfKVtHaYSiHuU6WPsQtMrjASQPAwn6jeqw1oEAnZGcgaiLyuw@mail.gmail.com>
References: <1470982664-13228-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1a86f6d6-fc92-81ec-eb07-669c2bda8b38@roeck-us.net> <CAKfKVtHubRMwdYUfFx1YaiwKjYR_uUBBgouCTaTahmK9DGq6gQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKfKVtHubRMwdYUfFx1YaiwKjYR_uUBBgouCTaTahmK9DGq6gQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 12, 2016 at 12:12 PM, Shubhrajyoti Datta
<shubhrajyoti.datta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> [...]
>>
>>
>> The clock is optional. Why print anything ?
>>
>> I am not a friend of logging noise, and I think this is just noise.
>> Would you want such a message printed for each optional property ?
>>
>> Guenter
>>
> sure patch below
noticed some issue so sent by git
thanks,
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
