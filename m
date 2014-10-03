From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] dt-bindings: Add a clocks property to
 the simple-framebuffer binding
Date: Fri, 3 Oct 2014 11:19:52 -0500
Message-ID: <CAL_Jsq+_uFAQ-LjRtmqTW8CQvAwUVkYNu6STVEgeqsHA684rtw@mail.gmail.com>
References: <1412345120-24588-1-git-send-email-hdegoede@redhat.com>
 <CAL_JsqKU2n8p=YfJua3k-mR40bG_4SiZY8_-SL-MXtuWN5NeHg@mail.gmail.com> <CAMuHMdVgaXoGXyJdD8PRufZQYLTSY=_ZWRRo=OtRo3mrg3uEug@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD62P6P6EQILZGN3UECRUBCTKMCAS-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAMuHMdVgaXoGXyJdD8PRufZQYLTSY=_ZWRRo=OtRo3mrg3uEug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 3, 2014 at 11:04 AM, Geert Uytterhoeven
<geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> Hi Rob,
>
> On Fri, Oct 3, 2014 at 5:57 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Fri, Oct 3, 2014 at 9:05 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>> A simple-framebuffer node represents a framebuffer setup by the firmware /
>>> bootloader. Such a framebuffer may have a number of clocks in use, add a
>>> property to communicate this to the OS.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>> Reviewed-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>
>>> --
>>> Changes in v2:
>>> -Added Reviewed-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Changes in v3:
>>> -Updated description to make clear simplefb deals with more then just memory
>>
>> NAK. "Fixing" the description is not what I meant and does not address
>> my concerns. Currently, simplefb is configuration data. It is
>> auxiliary data about how a chunk of memory is used. Using it or not
>> has no side effects on the hardware setup, but you are changing that
>> aspect. You are mixing in a hardware description that is simply
>> inaccurate.
>>
>> The kernel has made the decision to turn off "unused" clocks. If its
>> determination of what is unused is wrong, then it is not a problem to
>> fix in DT.
>
> The kernel has made that decision because the driver hadn't told the
> kernel that those clocks had to be enabled.
> The only way for the driver to know which clocks to enable is by adding
> them to the description in DT.

Lack of a proper and complete driver is still a kernel problem. Now,
if you want to accurately describe the display h/w in DT and you
happen to use the simplefb driver, I don't really care. It just needs
to be a separate binding.

A driver is not the only solution here. The SOC or clock controller
code could keep the clock on based on either the fact that the clock
is already on or it is just hardcoded. This is not a problem unique to
displays.

Rob
