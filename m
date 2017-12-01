From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v1 2/2] drm/tinydrm: add driver for ILI9225 panels
Date: Fri, 1 Dec 2017 19:27:37 +0100
Message-ID: <81afd9e7-4c84-697a-0963-834494ca77a5@tronnes.org>
References: <1510113136-6788-1-git-send-email-david@lechnology.com>
 <1510113136-6788-3-git-send-email-david@lechnology.com>
 <CACRpkdYRQoTyzTOK=8n7sawDZAWS3sXRDdDdFpxhZKuV+DE5oQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYRQoTyzTOK=8n7sawDZAWS3sXRDdDdFpxhZKuV+DE5oQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Stefano Babic <sbabic-ynQEQJNshbs@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

(cc: Thierry)

Den 01.12.2017 15.03, skrev Linus Walleij:
> On Wed, Nov 8, 2017 at 4:52 AM, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org> wrote:
>
>> This adds a new driver for display panels based on the Ilitek ILI9225
>> controller.
>>
>> This was developed for a no-name panel with a red PCB that is commonly
>> marketed for Arduino. See <https://github.com/Nkawu/TFT_22_ILI9225>.
>>
>> I really did try very hard to find a make and model for this panel, but
>> there doesn't seem to be one, so the best I can do is offer the picture
>> in the link above for identification.
>>
>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> Can you explain why tinydrm is not putting its panel drivers in
> drivers/gpu/drm/panel?

The short answer is that tinydrm sends pixel data over the panel
controller's control interface whereas drm/panel leaves that to a
dedicated pixel interface fed by another driver.

tinydrm is used with controllers that have onboard GRAM which is
scanned out by the panel controller itself. Many of these controllers
support multiple interfaces, like MIPI DSI/DPI/DBI. A MIPI DPI
compatible controller has a control bus, usually SPI, to operate the
panel. This same control bus can be used in MIPI DBI mode on some
controllers to push pixels.

The MIPI standard documents isn't open, but some are available if you
do a search. We also have MIPI DCS which is the command set shared by
the MIPI compatible controllers.

So how do we deal with controllers that can operate in many modes?
I raised the question when a panel driver was reviewed earlier this
year, but nothing really came out of it.

I suppose that displays that are used with DSI/DPI doesn't have a
controller with onboard GRAM, since that would just increase the price.
The MIPI standard defines different controller types which has no,
partial or full framebuffer. So in reality it's not that likely that
we will see the same controller used both in tinydrm and drm/panel.

But I'm hardly an expert on these matters, I've only used the DBI mode.
I've cc'ed the drm/panel maintainer, maybe he can shed some more light.

Noralf.

> I guess everybody knows except me, it's usually like that :(
>
> I am anyways working on a driver for Ilitek 9322 that I want
> to land in drivers/gpu/drm/panel. Here is the last iteration:
> https://lists.freedesktop.org/archives/dri-devel/2017-August/150205.html
> Yeah I got sidetracked. OK I will get to it now.
>
> There are some similarities with the code I'm seeing here
> but I believe they are essentially different. But it will be hard
> to share code if you put the driver in the tinydrm framework.
>
> I guess you have also seen:
> drivers/video/backlight/ili922x.c
> ?
>
> Stefano Babic who wrote the backlight driver is available for
> reviewing, so includ him in follow-ups (added to To: line).
>
> I'm putting you on CC as I'm rewriting it a bit after the DT
> maintainers review, will try to repost ASAP.
>
> Yours,
> Linus Walleij
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
