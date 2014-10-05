From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: Fixing boot-time hiccups in your display
Date: Mon, 6 Oct 2014 09:36:00 +1100
Message-ID: <CAGRGNgUcHxWEZmdsM947UuKW-20u+T20ztNqgWxms6iK8-8ugw@mail.gmail.com>
References: <CAKON4OxRFCvMPMfZhxYNVaxscgAs5AX46YzK-4SU5o6E-iTD1w@mail.gmail.com>
 <20141005200150.4379.28017@quantum> <CAKON4OxunQNC_Ebf5u9yh9EnGS2A+DdWCRyoFcJWS7GSNoLoqA@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDQIP76OUQLBBZMPY6QQKGQEMTSDPXQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAKON4OxunQNC_Ebf5u9yh9EnGS2A+DdWCRyoFcJWS7GSNoLoqA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jon,

On Mon, Oct 6, 2014 at 7:34 AM, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sun, Oct 5, 2014 at 4:01 PM, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> Quoting jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org (2014-10-05 10:09:52)
>>> I edited the subject line to something more appropriate. This impacts
>>> a lot of platforms and we should be getting more replies from people
>>> on the ARM kernel list. This is likely something that deserves a
>>> Kernel Summit discussion.
>>
>> ELC-E and LPC are just around the corner as well. I am attending both. I
>> suppose some of the others interested in this topic will be present?
>>
>>>
>>> To summarize the problem....
>>>
>>> The BIOS (uboot, etc) may have set various devices up into a working
>>> state before handing off to the kernel.  The most obvious example of
>>> this is the boot display.
>>>
>>> So how do we transition onto the kernel provided device specific
>>> drivers without interrupting these functioning devices?
>>>
>>> This used to be simple, just build everything into the kernel. But
>>> then along came multi-architecture kernels where most drivers are not
>>> built in. Those kernels clean up everything (ie turn off unused
>>> clocks, regulators, etc) right before user space starts. That's done
>>> as a power saving measure.
>>>
>>> Unfortunately that code turns off the clocks and regulators providing
>>> the display on your screen. Which then promptly gets turned back on a
>>> half second later when the boot scripts load the display driver. Let's
>>> all hope the boot doesn't fail while the display is turned off.
>>
>> I would say this is one half of the discussion. How do you ever really
>> know when it is safe to disable these things? In a world with loadable
>> modules the kernel cannot know that everything that is going to be
>> loaded has been loaded. There really is no boundary that makes it easy
>> to say, "OK, now it is truly safe for me to disable these things because
>> I know every possible piece of code that might claim these resources has
>> probed".
>
> Humans know where this boundary is and can insert the clean up command
> at the right point in the bootscript. It is also not fatal if the
> command is inserted at the wrong point, things will just needlessly
> flicker. It not even fatal if you never run this command, you'll just
> leave clocks/regulators turned on that could be turned off.

What about distros? Would this "all clear" point be at the same point
in the boot process for every sub-architecture? Would it ever change?

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
