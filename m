From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [PATCH] of: Add vendor prefix for Sharp Microelectronics
Date: Tue, 28 Jul 2015 18:25:00 -0700
Message-ID: <CAJAp7OjMKApxObdThqwTR+1dhG9ZUiGqUj4LrsjJLg_q2FFM1w@mail.gmail.com>
References: <1406901044-32654-1-git-send-email-thierry.reding@gmail.com>
	<20141013115409.GB16186@ulmo>
	<20150701120141.GA18065@ulmo.nvidia.com>
	<CAL_JsqJtRObzkdDz5X2Np8kdjfXP+YZo+=-cDPmM+wYff6OEwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJtRObzkdDz5X2Np8kdjfXP+YZo+=-cDPmM+wYff6OEwQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 1, 2015 at 10:41 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Jul 1, 2015 at 7:01 AM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Mon, Oct 13, 2014 at 01:54:09PM +0200, Thierry Reding wrote:
>>> On Fri, Aug 01, 2014 at 03:50:44PM +0200, Thierry Reding wrote:
>>> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> >
>>> > Use "sharp" as the vendor prefix for Sharp Microelectronics in device
>>> > tree compatible strings.
>>> >
>>> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> > ---
>>> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>> >  1 file changed, 1 insertion(+)
>>>
>>> Ping?
>>
>> Rob, I just stumbled across this in my stack of patches that never got
>> merged. Can you ack this?
>
> Sorry, missed this one. I've flagged it now to apply for 4.2 or you
> can if you prefer:
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>

Sorry for jumping in late, but found this as I was about to submit a
patch for the same addition.

Except that from what I can find the real name is "Sharp
Microelectronics of the Americas" (or Europe...), which is a division
of Sharp Electronics Corporation, a subsidiary of Sharp Corporation -
the latter which is what's used in the data sheets for my e.g. the
lp855x.

So I think the patch should instead be adding:
sharp   Sharp Corporation

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
