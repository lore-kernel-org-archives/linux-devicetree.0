From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Fixing boot-time hiccups in your display
Date: Mon, 06 Oct 2014 09:39:12 +0200
Message-ID: <54324720.1040005@redhat.com>
References: <CAKON4OxRFCvMPMfZhxYNVaxscgAs5AX46YzK-4SU5o6E-iTD1w@mail.gmail.com> <20141005200150.4379.28017@quantum>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBL4OZGQQKGQE7XKOSLQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20141005200150.4379.28017@quantum>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 10/05/2014 10:01 PM, Mike Turquette wrote:
> Quoting jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org (2014-10-05 10:09:52)
>> I edited the subject line to something more appropriate. This impacts
>> a lot of platforms and we should be getting more replies from people
>> on the ARM kernel list. This is likely something that deserves a
>> Kernel Summit discussion.
> 
> ELC-E and LPC are just around the corner as well. I am attending both. I
> suppose some of the others interested in this topic will be present?

Having a get together about this there sounds very good. I'm willing to
organize this. If you want to attend please reply to this thread (or drop
me a personal mail) with when you will be available to attend, then I'll
pick a time where hopefully we will all be available, and I'll try to get
a room for this, not sure if I'll be able to get a room, if not we will
just need to find a quiet spot in the lobby or some such.

I'll be present for the entire week too. Monday I'll be at the u-boot
mini-conf. Thursday and Friday I'll be at the Linux Kernel Media mini-summit,
and Friday afternoon I'll be at the Wayland mini-conf.

If this causes scheduling problems, I can miss parts of the media mini-summit,
and if I really have to I can maybe miss some parts of the u-boot mini-conf,
I cannot walk out of the Wayland track as I'm one of the session leaders
there.

>> To summarize the problem....
>>
>> The BIOS (uboot, etc) may have set various devices up into a working
>> state before handing off to the kernel.  The most obvious example of
>> this is the boot display.
>>
>> So how do we transition onto the kernel provided device specific
>> drivers without interrupting these functioning devices?
>>
>> This used to be simple, just build everything into the kernel. But
>> then along came multi-architecture kernels where most drivers are not
>> built in. Those kernels clean up everything (ie turn off unused
>> clocks, regulators, etc) right before user space starts. That's done
>> as a power saving measure.
>>
>> Unfortunately that code turns off the clocks and regulators providing
>> the display on your screen. Which then promptly gets turned back on a
>> half second later when the boot scripts load the display driver. Let's
>> all hope the boot doesn't fail while the display is turned off.
> 
> I would say this is one half of the discussion. How do you ever really
> know when it is safe to disable these things? In a world with loadable
> modules the kernel cannot know that everything that is going to be
> loaded has been loaded. There really is no boundary that makes it easy
> to say, "OK, now it is truly safe for me to disable these things because
> I know every possible piece of code that might claim these resources has
> probed".
> 
> Somebody (Geert?) proposed an ioctl for userspace to send such an "all
> clear" signal, but I dislike that idea. We're talking about managing
> fairly low-level hardware bits (clocks, regulators) and getting
> userspace involved feels wrong.

Ack, also see my other reply as on why this can never work 100% reliable.

> Additionally clocks and regulators should be managed by PM Runtime
> implementations (via generic power domains and friends), so any solution
> that we come up with today that is specific for the clock and regulator
> frameworks would need to scale up to other abstraction layers, because
> those layers would probably like to know that they are not really
> idle/gated in hardware because the ioctl/garbage collector has not yet
> happened.
> 
> The second half of the discussion is specific to simple framebuffer and
> the desire to keep it extremely simple and narrowly focused. I can
> understand both sides of the argument and I hope to stay well out of the
> flame zone.
> 
> Even if we do leave simple framebuffer alone, the *idea* behind a very
> simple, entirely data-driven driver implementation that is meant to be
> compiled into the kernel image, claim resources early, ensure they stay
> enabled and then hand-off to a real driver that may be a loadable module
> is very interesting. It doesn't have to be simplefb. It could be
> something new.

Right, as I already said earlier if this is just about keeping simplefb
simple, I'm more then happy to clone the simplefb binding to a new binding,
called say firmwarefb, and add resource management there.

Regards,

Hans
