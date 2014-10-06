From: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Fixing boot-time hiccups in your display
Date: Mon, 6 Oct 2014 07:26:13 -0400
Message-ID: <CAKON4Ozum1SeAhecR14uuAmk1NqfMuLZAEyGZnv3Yr0CwAavzA@mail.gmail.com>
References: <CAKON4OxRFCvMPMfZhxYNVaxscgAs5AX46YzK-4SU5o6E-iTD1w@mail.gmail.com>
	<20141005200150.4379.28017@quantum>
	<CAKON4OxunQNC_Ebf5u9yh9EnGS2A+DdWCRyoFcJWS7GSNoLoqA@mail.gmail.com>
	<54324445.9070400@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBC55LFUF6ALBBVXYZGQQKGQEMZWLKOQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <54324445.9070400-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 6, 2014 at 3:27 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
> On 10/05/2014 10:34 PM, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> On Sun, Oct 5, 2014 at 4:01 PM, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>> Quoting jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org (2014-10-05 10:09:52)
>>>> I edited the subject line to something more appropriate. This impacts
>>>> a lot of platforms and we should be getting more replies from people
>>>> on the ARM kernel list. This is likely something that deserves a
>>>> Kernel Summit discussion.
>>>
>>> ELC-E and LPC are just around the corner as well. I am attending both. I
>>> suppose some of the others interested in this topic will be present?
>>>
>>>>
>>>> To summarize the problem....
>>>>
>>>> The BIOS (uboot, etc) may have set various devices up into a working
>>>> state before handing off to the kernel.  The most obvious example of
>>>> this is the boot display.
>>>>
>>>> So how do we transition onto the kernel provided device specific
>>>> drivers without interrupting these functioning devices?
>>>>
>>>> This used to be simple, just build everything into the kernel. But
>>>> then along came multi-architecture kernels where most drivers are not
>>>> built in. Those kernels clean up everything (ie turn off unused
>>>> clocks, regulators, etc) right before user space starts. That's done
>>>> as a power saving measure.
>>>>
>>>> Unfortunately that code turns off the clocks and regulators providing
>>>> the display on your screen. Which then promptly gets turned back on a
>>>> half second later when the boot scripts load the display driver. Let's
>>>> all hope the boot doesn't fail while the display is turned off.
>>>
>>> I would say this is one half of the discussion. How do you ever really
>>> know when it is safe to disable these things? In a world with loadable
>>> modules the kernel cannot know that everything that is going to be
>>> loaded has been loaded. There really is no boundary that makes it easy
>>> to say, "OK, now it is truly safe for me to disable these things because
>>> I know every possible piece of code that might claim these resources has
>>> probed".
>>
>> Humans know where this boundary is and can insert the clean up command
>> at the right point in the bootscript.
>
> No they don't, we've been over this so many times already it just is
> not funny anymore. So I'm not even go to repeat the same old technical
> arguments why this is not true.
>
> There is only one 100% correct moment when it is safe to turn of resources
> used by something like simplefb, which is when a real driver takes over.
>
> The same for any other resources used by any other firmware setup things,
> the right moment to release those resources is at handover time, and
> the handover time may differ from driver to driver, so there is no
> single magic moment to disable this.

Process works like this...

boot kernel with built in drivers
user space starts
loadable drivers load
- load device specific framebuffer which claims resources from BIOS
all the loadable drivers are loaded
now run the 'clean up' command

The 'clean up' command only releases resources that no one was
claimed. The device specific framebuffer loaded and claimed all of the
video resources, so this command has no impact on those resources.

>
> Also this non-solution completely discards the use case where e.g. simplefb
> is used as an early bringup mechanism and there may complete be no real
> driver for a long time (months if not years). So then again there is no

I in no way support long term use of simplefb after the boot process.
The problems with this model are legendary on the x86. Try running
your X server right now on the VBIOS driver, see if it functions.

I will point out:
a) if you are crazy enough to do this, you can do it by simply not
running the 'clean up' command
b) write a device specific framebuffer driver while you wait years for
KMS to appear. Should take under a week to get the device specific
framebuffer driver going.

> right magic moment to turn the resources off, because in this use case the
> magic moment is *never*.
>
> I'm all for finding a proper solution for this, but you seem to be blind
> to anything other then your own idea that this is just a boot ordering problem,

Because this needs to be fixed in the OS without relying on detailed
communication with the BIOS.  Of course you can get this going on one
box with one BIOS and one kernel. The problems occur when you try to
get this going on all boxes, all BIOS and all kernels.

> which it is not, the problem is that things like simplefb simply need to claim
> the resources they use, and then all ordering problems go away.
>
> We've tried this "ordering magic" kind of solutions before, see e.g. the
> scsi_wait_scan module hack, which was not enough, so then initrd-s started
> inserting sleeps to wait for storage to be available, and the hacks just got
> uglier and uglier, until we moved to an event based system, and instead
> of waiting for a "magic moment", actually waited for the storage device
> we're looking for to show up, which is exactly the same as what we should
> do here, wait for the real driver to show up.
>
> This also means that we need to tie resources to devices like simplefb,
> because the event causing their release will be that the real driver for
> the display pipeline loaded, which is not a single event for all similar
> drivers. And since there is no single event, there is no single moment
> to do the magic ioctl for this.
>
> Really this is a solved problem, The only 100% correct solution is to tie
> the ordering of releasing the resources to the lifetime of the simplefb,
> which is easily achieved by making the simplefb properly claim the resources
> it needs.

...and make sure every BIOS properly describes this. Something that
never happened in the x86 world in the last thirty years.

>
> Regards,
>
> Hans



-- 
Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
