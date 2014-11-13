From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] simplefb: Add support for enumerating
 simplefb dt nodes in /chosen
Date: Thu, 13 Nov 2014 09:40:35 +0100
Message-ID: <54646E83.9070704@redhat.com>
References: <1415830124-28787-1-git-send-email-hdegoede@redhat.com>	<1415830124-28787-2-git-send-email-hdegoede@redhat.com>	<CAGRGNgW_Q6oghpe5Mw-8aYPVVj1YZ6R3iaqOQzCE9dSD1nYSyA@mail.gmail.com>	<54646B5B.1070604@redhat.com> <CAMuHMdVSfYyHc52Tdu_wzb6ZYPzeZtOzweUwADHxiJLypuBQNw@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBEG5SGRQKGQEWDC53CQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAMuHMdVSfYyHc52Tdu_wzb6ZYPzeZtOzweUwADHxiJLypuBQNw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Fbdev development list <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 11/13/2014 09:34 AM, Geert Uytterhoeven wrote:
> Hi Hans,
> 
> On Thu, Nov 13, 2014 at 9:27 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>>> +       char name[16];
>>>> +       struct device_node *np;
>>>> +
>>>> +       ret = platform_driver_register(&simplefb_driver);
>>>> +       if (ret)
>>>> +               return ret;
>>>> +
>>>> +       for (i = 0; ; i++) {
>>>> +               snprintf(name, sizeof(name), "framebuffer%d", i);
>>>
>>> This smells like an infinite loop: we can be pretty sure that no
>>> hardware will ever exist with more than 9999 (I think?) framebuffers,
>>> however if that ever happens this'll loop until it runs out of RAM.
>>> Maybe add a suitably high limit to the for loop?
>>
>> The loop will stop as soon as there are no more framebuffer# nodes in chosen,
>> so the loop is only infinite if there are infinite nodes in the devicetree,
>> which would make the devicetree infinitely large, so this will never happen.
> 
> If there are 10000 frame buffers, the loop will continue beyond that,
> as the index will be truncated to 4 digits due to the size of name[].
> It will stop when (signed) i becomes negative, though ;-)
> 
> One solution is to increase the size of name[],

This is probably never going to happen, but I'll increase the size of name in v2
anyways.

Regards,

Hans
