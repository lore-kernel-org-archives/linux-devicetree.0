From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCHv5] watchdog: xilinx: Add clock support
Date: Mon, 12 Sep 2016 05:45:36 -0700
Message-ID: <47c40b8c-664e-e2ff-9059-6f566448cf76@roeck-us.net>
References: <1470984421-3494-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <20160812190123.GB16954@rob-hp-laptop>
 <CAKfKVtFYEqz2Be81hBBX3Nb9kRR+4QUpdP5iJs88HoyYoC3-jQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKfKVtFYEqz2Be81hBBX3Nb9kRR+4QUpdP5iJs88HoyYoC3-jQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shubhrajyoti Datta <shubhrajyoti.datta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/12/2016 02:49 AM, Shubhrajyoti Datta wrote:
> On Sat, Aug 13, 2016 at 12:31 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Fri, Aug 12, 2016 at 12:17:01PM +0530, Shubhrajyoti Datta wrote:
>>> Add support for the clock. Currently we enable
>>> at probe and relinquish at remove.
>>>
>>> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>>> Acked-by: Sören Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>> ---
>>> v2:
>>> fix spaces and error path.
>>> v3
>>> do not fail existing dts
>>> v4:
>>> fix the error prints as the clock is optional
>>> v5:
>>> remove some more prints
>>>
>>>  .../devicetree/bindings/watchdog/of-xilinx-wdt.txt |  3 +++
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> If there are no further comments can this be applied.

Please be patient. Wim usually sends "applied" e-mails shortly before
the commit window opens, and I'll send him a reminder about pending
patches.

Guenter


--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
