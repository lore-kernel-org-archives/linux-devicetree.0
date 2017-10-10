From: Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: Add document for rockchip RGB output
 interface
Date: Tue, 10 Oct 2017 09:59:24 +0800
Message-ID: <e877b1d6-9365-6c26-fbca-8d307610c94a@rock-chips.com>
References: <1506049221-117283-1-git-send-email-hjc@rock-chips.com>
 <1506049229-117376-1-git-send-email-hjc@rock-chips.com>
 <20171003215631.rc2jsf2m3qgoltsb@rob-hp-laptop>
 <2d502a9d-e952-8afb-d2d7-45c21c36da7e@rock-chips.com>
 <CAL_JsqJcO6VtgYBzby+gjerODT9n6fE0aMNJXNejvvhF1nqM-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJcO6VtgYBzby+gjerODT9n6fE0aMNJXNejvvhF1nqM-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



在 2017/10/9 21:05, Rob Herring 写道:
> On Mon, Oct 9, 2017 at 3:06 AM, Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>> Hi rob,
>>      Thanks for your reply.
>>
>> 在 2017/10/4 5:56, Rob Herring 写道:
>>>
>>> On Fri, Sep 22, 2017 at 11:00:26AM +0800, Sandy Huang wrote:
>>>>
>>>> This path add support rv1108 rgb output interface driver.
>>>>
>>>> Signed-off-by: Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>> ---
>>>> Changes in v2:
>>>>    1. rename rockchip,rgb-mode to rgb-mode;
>>>
>>>
>>> You can't just drop the vendor. This needs to be documented in a common
>>> place that others will find and use. See panel-common.txt or
>>> panel-dpi.txt.
>>>
>>> Alternatively, you could just drop it and let the panel compatible imply
>>> what the mode is.
>>>
>>>
>> ok, get it, i will move the rgb-mode to panel and describe it at
>> panel-rgb.txt. the patches will be send soon later.
> 
> Don't create yet another common panel file. We already have
> panel-dpi.txt which is for digital parallel interface.
> The panel-rgb.txt define different rgb output format and timing, this is 
the detail info: https://patchwork.kernel.org/patch/9992241/
do you think this need move to panel-dpi.txt?
> Rob
> 
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
