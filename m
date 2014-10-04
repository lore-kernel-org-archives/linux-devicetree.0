From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH v3] dt-bindings: Add a clocks property
 to the simple-framebuffer binding
Date: Sat, 04 Oct 2014 11:32:59 +0200
Message-ID: <542FBECB.2000300@redhat.com>
References: <1412345120-24588-1-git-send-email-hdegoede@redhat.com> <CAL_JsqKU2n8p=YfJua3k-mR40bG_4SiZY8_-SL-MXtuWN5NeHg@mail.gmail.com> <542EDE11.3010802@redhat.com> <CAL_Jsq+3c7ToCGaR4Nz7dDXvebBKzzMv85swzy2mzOou+gM5iw@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBW75X2QQKGQEQTL4XPI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAL_Jsq+3c7ToCGaR4Nz7dDXvebBKzzMv85swzy2mzOou+gM5iw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 10/03/2014 10:08 PM, Rob Herring wrote:
> On Fri, Oct 3, 2014 at 12:34 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> Hi,
>>
>> On 10/03/2014 05:57 PM, Rob Herring wrote:
>>> On Fri, Oct 3, 2014 at 9:05 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>>> A simple-framebuffer node represents a framebuffer setup by the firmware /
>>>> bootloader. Such a framebuffer may have a number of clocks in use, add a
>>>> property to communicate this to the OS.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>>> Reviewed-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>>
>>>> --
>>>> Changes in v2:
>>>> -Added Reviewed-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> Changes in v3:
>>>> -Updated description to make clear simplefb deals with more then just memory
>>>
>>> NAK. "Fixing" the description is not what I meant and does not address
>>> my concerns. Currently, simplefb is configuration data. It is
>>> auxiliary data about how a chunk of memory is used. Using it or not
>>> has no side effects on the hardware setup, but you are changing that
>>> aspect. You are mixing in a hardware description that is simply
>>> inaccurate.
>>
>> Memory is hardware too, what simplefb is is best seen as a virtual device, and
>> even virtual devices have hardware resources they need, such as a chunk of memory,
>> which the kernel should not touch other then use it as a framebuffer, likewise
>> on some systems the virtual device needs clocks to keep running.
>>
>>> The kernel has made the decision to turn off "unused" clocks. If its
>>> determination of what is unused is wrong, then it is not a problem to
>>> fix in DT.
>>
>> No, it is up to DT to tell the kernel what clocks are used, that is how it works
>> for any other device. I don't understand why some people keep insisting simplefb
>> for some reason is o so very very special, because it is not special, it needs
>> resources, and it needs to tell the kernel about this or bad things happen.
> 
> No, the DT describes the connections of clocks from h/w block to h/w
> block. Their use is implied by the connection.

So normally DT describes HW aka clock connections, and your objection is
that I cannot add HW description AKA clock connections to the simplefb node.

> And yes, as the other thread mentioned DT is more than just hardware
> information. However, what you are adding IS hardware information and
> clearly has a place somewhere else. And adding anything which is not
> hardware description gets much more scrutiny.

But what I'm adding is not actually clock connections (aka HW description),
the display engine has many clocks, and what is being added to the simplefb
node is which clocks are *actually* used by the video mode setup for the simplefb,
not the clock connections, not which clocks can be used by the hw-block_s_ involved
in the display engine, but which ones are actually used for the specific mode
(and output connector) setup for the simplefb.

So according to your definition this is not HW description. This is usage description,
just like the simplefb node contains which memory is used.

>> More over it is a bit late to start making objections now. This has already been
>> discussed to death for weeks now, and every argument against this patch has already
>> been countered multiple times (including the one you are making now). Feel free to
>> read the entire thread in the archives under the subject:
>> "[PATCH 4/4] simplefb: add clock handling code"
> 
> You are on v2 and I hardly see any consensus on the v1 thread. Others
> have made suggestions which I would agree with and you've basically
> ignored them.

I have NOT ignored those, that is simply not true. I've even offered an alternative
approach myself, which was quickly shot down, see:

http://www.spinics.net/lists/arm-kernel/msg367559.html

And being quickly shotdown is exactly what my alternative solution has in common
with all the other alternatives. Non of them provide the simplicity nor robustness
of simply adding clocks to the dt-node. And this is not surprising since adding
clocks to the dt-node is exactly the right mechanism to tell the kernel that certain
clocks are used for something.

Mike Turquette, the clk maintainer, agrees that this is the right thing to do.

Yet people keep arguing that simplefb is magically special and thus cannot have
clocks. Arguments which to me after discussing this for weeks in a row are starting
to sound like "you cannot do this because I say so" rather then proper technical
arguments.

It seems to me that you're arguing purely at semantics without looking at the use case
in question at all. In the end creating a workable and working solution should always
trump semantics.

Note that I'm willing to look at alternatives, as long as those are not tons
more complicated then the current proposal, and they don't introduce a number of
trouble some unhandled corner cases which the current proposal does not introduce.

Unfortunately all alternatives proposed sofar are both more complicated and introduce
unhandled corner cases. Adding the clocks to the simplefb node is very KISS and
for those who actually have looked at the requirements for the use-cases we're
discussing here also feels like a natural fit, which usually is an indication that
it is the right solution.

So since adding clocks to simplefb seems problematic for some people, how about the
following, we add a new firmwarefb binding, which is basically simplefb + clocks,
then people who want simplefb to stay clean and elegant can use the clean and
elegant simplefb bindings, and people who have a need to express clocks usage
can do so using the firmwarefb binding. Would that be acceptable to you ?

Regards,

Hans
