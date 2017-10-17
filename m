From: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC][PATCH 0/3] Overlay manager for predefined DT overlay fragments
Date: Tue, 17 Oct 2017 14:20:45 -0700
Message-ID: <CALAqxLWSLqmN8WWGktVDxfcs3zyk8ktqVJbtAEoHtqZZw5KTVw@mail.gmail.com>
References: <1507613660-27236-1-git-send-email-john.stultz@linaro.org>
 <20171013214103.mv6wcemzcl36nnvs@rob-hp-laptop> <CALAqxLWcK-wbmQxtX4RziQsvQ26DmixC=gEPojFVHruFrpBnjw@mail.gmail.com>
 <20171017194600.he3suyuls4na5p6x@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171017194600.he3suyuls4na5p6x@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Shmidt <dimitrysh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 17, 2017 at 12:46 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Oct 13, 2017 at 04:51:03PM -0700, John Stultz wrote:
>> On Fri, Oct 13, 2017 at 2:41 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> > Someone has to decide what to put on the kernel command line. If you are
>> > setting the overlay in the command line at bootimage build time or in
>> > the bootloader, then you could just apply the overlay at that point in
>> > time. Maybe it's slightly easier to change the kernel command line than
>> > change the dtb.
>>
>> Not, its not slightly easier, its much *much* easier to tweak the boot
>> arguments. Since the dtb is appended to the kernel image w/ the
>> abootimg format, its not simple at all to cut one out and replace it.
>
> Appended dtb was to support legacy non-DT aware bootloaders. It never
> should have been carried over to arm64.
>
>> While the cmdline is trivial to do with the abootimg command:
>> abootimg -x boot.img
>> vi bootimg.cfg
>> abootimg -u boot.img -f ./bootimg.cfg
>
> It's easy because there is a tool to do so, not because a the kernel
> command line is inheritly easier to modify than a dtb.

Maybe not in some theoretical sense, but practically it very much is
easier. There are packaged tools available on most distros, user
familiarity, etc.


A bit of a tangent, but part of the reason why appended dtbs (despite
being only for legacy platforms) are often used is because they make
things simpler. At least for the boards I use, dtbs aren't static
enough to be considered firmware. If I've got a new kernel to test, I
usually have to copy a dtb over too. Managing separate files that are
effectively tied together is a practical pain.  With appended dtbs I
never have to guess if some failure I'm seeing is because I forgot a
step w/ the dtb.

Now, maybe with boards like hikey and others getting upstreamed, there
will be less dts churn there and I can happily forget to build and
copy over new dtbs. But I'm not sure if that really is the common case
yet.


> It would be trivial to write a tool or add to this one the code to find
> the dtb within the image and modify it. That's what every bootloader can
> do.

But would such a tool be usable? Or capable of being shared between boards?
How does one enumerate or distribute fragments?

These are all extra complexities with the pure dtb modification
methods, which the embedded fragment + boot arg selection avoids.

> Of course, abootimg is a horrible creation IMO. Why Android can't use
> something called a filesystem for the boot partition is beyond me. Then
> modifying it would not require special tools that could only modify
> whatever someone had the itch to modify. And combining the kernel, dtb,
> and overlays into a single file would not be necessary.

While I agree the extensibility of abootimg (particularly in the dtb
era) has been restrictive, I personally find it reasonably nice to
work with.  Being able to trivially modify the kernel and cmdlines w/o
having to have root permissions to mount images is pretty nice. FAT
filesystems can be similarly tweaked w/ mtools, but then you need a
secondary bootloader, etc, and tweaking grub menus isn't as simple as
the abootimg config file.


>> and re-flash.  This doesn't require access to the kernel source or
>> rebuilding anything.
>>
>> It seems you're suggesting that there be some sort of special overlay
>> partition which users have to flash with pre-built images containing
>> the appropriate overlay dtbs, so that something like the treble
>> overlay-per-partition approach could be used.
>
> I'm not really suggesting anything. I'm not going to take something that
> *only* solves your usecase of apply an overlay embedded in a base dtb
> based on the kernel command line. I have no issue really with either one
> of those. What I don't want is another "overlay manager" for each
> usecase. And sorry, you don't win for being first (you're not really).
> All this I said before.

So, I'm not actually asking anyone to take anything here, I'm just
trying to reopen the conversation that hasn't gone very far, so we can
find some direction to take.

I've not followed the discussion super closely here, so apologies if
I'm off base here.  But it does seem there's a number of similar
efforts, and it seems no one has gotten enough momentum to make a real
push upstream. It seems its just easier for everyone to keep their own
approach in their own tree and not to bother.  At one end, sure,
keeping half baked ideas out of mainline until they really sort
themselves out is fine, but at the other extreme you risk the
half-baked ideas calcifying in their own tree and then you have more
Android (or whatever variant) specific cruft to shake your fist at.
:)

How do we get to a shared solution here where folks are engaging with upstream?

Even an "I like approach B, go make that work" would help here.

>> And in the case with hikey/hikey960, this may be doable, as we can
>> modify the UEFI source, but it would also require users to have all
>> the various overlay images to flash as well, which adds complexity.
>> Additionally on other boards which don't have open firmware, such a
>> solution may not be feasible. The benefit to this approach is it
>> doesn't require such standardized firmware behavior.
>
> Unless there's some great, overwhelming demand to support such devices
> with closed firmware, there's no benefit to me to care. What board do we
> have with closed firmware that needs this?

Just across the 96boards we don't have open firmware on all the boards.

thanks
-john
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
