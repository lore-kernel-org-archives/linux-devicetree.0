From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 16/54] MAINTAINERS: Add file patterns for drm device tree bindings
Date: Tue, 24 May 2016 16:22:14 +0100
Message-ID: <CACvgo50saNmS0F2fu=tg=xR_iFYkJ+W5LQRHkjWde4b=X4xQiQ@mail.gmail.com>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
	<1463907991-7916-17-git-send-email-geert@linux-m68k.org>
	<CACvgo53Hpsbi91=d+jxBF85zXG8_ddSZTDxpG_ntf2wRmreU9Q@mail.gmail.com>
	<CAL_Jsq+OJnTJNm9POLzSmAAko1EB171mvbNzw0ALgRMxaXTgzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+OJnTJNm9POLzSmAAko1EB171mvbNzw0ALgRMxaXTgzQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 23 May 2016 at 13:35, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, May 23, 2016 at 4:33 AM, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 22 May 2016 at 10:05, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>>> Submitters of device tree binding documentation may forget to CC
>>> the subsystem maintainer if this is missing.
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
>>> Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
>>> Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> ---
>>> Please apply this patch directly if you want to be involved in device
>>> tree binding documentation for your subsystem.
>>> ---
>>>  MAINTAINERS | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index c79b99dd3a0bf22d..75138c09dd603093 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -3868,6 +3868,9 @@ T:        git git://people.freedesktop.org/~airlied/linux
>>>  S:     Maintained
>>>  F:     drivers/gpu/drm/
>>>  F:     drivers/gpu/vga/
>>> +F:     Documentation/devicetree/bindings/display/
>> Contains a mixed bag of fb (drivers/video) and drm ones. Perhaps one
>> could/should move the former to a fb/legacy/other subfolder ?
>
> Yes, there are some poorly designed bindings that reflect the
> subsystem needs rather than the h/w. They were separate, I moved them
> all together to hopefully discourage further separate bindings.
>
I'm slightly concerned that someone will pick one of these and
consider it good, basing their design on it. That's why I was thinking
that moving them to a subfolder (called nasty/bad-design/legacy and/or
alike) might be a good idea.


>>> +F:     Documentation/devicetree/bindings/gpu/
>> nvidia,gk20a.txt
>> samsung-g2d.txt
>> samsung-rotator.txt
>>
>> These three should be listed alongside the respective drivers and/or
>> moved to display/{tegra,exynos} ?
>
> Possibly, but these bindings pretty much stand on their own.
>
Having a gpu only in different places does feel odd - nvidia,gk20a (in
gpu) vs etnaviv (in display). If we consider 'rotator' a GPU perhaps
so are exynos' mixer, mic...

Not saying that one has to do one or the other... just that it's not
that bad of an idea ;-)

Emil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
