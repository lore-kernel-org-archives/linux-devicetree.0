From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] dt-bindings: brcm: rationalize Broadcom documentation naming
Date: Thu, 26 Mar 2015 14:00:24 -0500
Message-ID: <CAL_JsqLGz59fyC6h7XEh=UHOCzgTUY0Y2TSrZTHmv4U8nBpunw@mail.gmail.com>
References: <1426899982-19733-1-git-send-email-sbranden@broadcom.com>
 <550F6A5B.8050906@gmail.com> <55125894.2070303@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55125894.2070303-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 25, 2015 at 1:41 AM, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> Hi Rob,
>
> On 15-03-22 06:20 PM, Rob Herring wrote:
>>
>> On 03/20/2015 08:06 PM, Scott Branden wrote:
>>>
>>> This patchset attempts to standardize the naming of dt-bindings
>>> documents based on the Broadcom vendor prefix of brcm.
>>>
>>> Although there are no guidelines currently present for how to name
>>> the dt-bindings document the "vendor,binding.txt" style is in use by
>>> some of the other vendors.
>>>
>>> Acked-by: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Acked-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Acked-by: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>>> Signed-off-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>
>>
>> Version history would be nice...
>
> Yes, I should have added a cover letter but didn't.  The difference between
> versions was minimal: a spelling correction in the commit message text and a
> few additional binding files were found that were added between the
> versions, along with the Ack's.
>
>>
>> Who did you want to apply this? I can, but I'm worried about merge
>> conflicts here. Hopefully, you're not also doing lots of changes to
>> existing bindings.
>
>
> Yes, it would be great for you to take care of applying this.  There
> shouldn't be any merge conflicts as none of these bindings are currently
> being updated.  I left a clock binding document out of this patchset at Ray
> Jui is updating/renaming the documentation for that binding in a different
> patch already.

Okay, thanks. I've applied it.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
