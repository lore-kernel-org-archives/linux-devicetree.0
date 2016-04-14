From: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v3 3/3] drm: bridge: anx78xx: Add anx78xx driver support.
Date: Thu, 14 Apr 2016 16:08:43 +0200
Message-ID: <570FA46B.2080706@collabora.com>
References: <1460119972-8658-1-git-send-email-enric.balletbo@collabora.com>	<1460119972-8658-4-git-send-email-enric.balletbo@collabora.com>	<20160414131013.GA32237@ulmo.ba.sec>	<570F9E4D.7040401@collabora.com> <CACvgo50ku9FZJU4YqdFsa6_=FqeDsq2UiCZkSVTLuTKsPRf7qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACvgo50ku9FZJU4YqdFsa6_=FqeDsq2UiCZkSVTLuTKsPRf7qw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Emil,

On 14/04/16 16:06, Emil Velikov wrote:
> Hi Enric,
>
> On 14 April 2016 at 14:42, Enric Balletbo i Serra
> <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
>> The patch was implemented first without OR'ing error codes. The reason why I
>> changed this is because I received the comments that checking the error on
>> every regmap_* didn't help the readability of the driver and is likely to
>> not fail if the first call doesn't fail.
>>
>> For example, originally the code was like this:
>>    http://pastebin.com/rPgyji8k
>> but I changed to this
>>    http://pastebin.com/rPgyji8k
>>
> Both links are the same ;-) But I believe we all get what you meant.
>

Ooops, sorry. This is the other link

http://pastebin.com/e2KpGxHy

> Just a side note: many other drivers in DRM subsystem, inconsistently
> check the return value of the regmap API. Note sure how likely is any
> of it [regmap_foo] to fail and/or how determined people are to handle
> every possible error case.
>
> -Emil
>

Enric
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
