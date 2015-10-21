From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [PATCH] driver core: Disable late probes by default
Date: Wed, 21 Oct 2015 17:53:13 +0200
Message-ID: <CAAObsKASbhBrEoE-=k3Vwg7BygLQ2vXU2jxu3FyxNrD5AAHROg@mail.gmail.com>
References: <20151016181129.GA1764@gradator.net> <1445267602-12576-1-git-send-email-tomeu.vizoso@collabora.com>
 <20151019151953.GA22662@kroah.com> <CAAObsKC5LZU1YTmQd16duiN1d0WhpLF8Af8z4ep-PUVy3n_hnw@mail.gmail.com>
 <20151020140523.GA22021@kroah.com> <CAAObsKAL782-poBT1gkid+zzhWBOrnOUh7P7epjcja38j_-fbQ@mail.gmail.com>
 <20151021033917.GB32366@kroah.com> <CAAObsKBLL_-bARp_W0sVqoGdpQ+nftdJtQepnFL1foJOGJmbQQ@mail.gmail.com>
 <20151021151447.GA19720@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151021151447.GA19720@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 21 October 2015 at 17:14, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Wed, Oct 21, 2015 at 04:35:58PM +0200, Tomeu Vizoso wrote:
>> On 21 October 2015 at 05:39, Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>> > On Tue, Oct 20, 2015 at 06:17:39PM +0200, Tomeu Vizoso wrote:
>> >> On 20 October 2015 at 16:05, Greg Kroah-Hartman
>> >> <gregkh@linuxfoundation.org> wrote:
>> >> > On Tue, Oct 20, 2015 at 09:40:48AM +0200, Tomeu Vizoso wrote:
>> >> >> On 19 October 2015 at 17:19, Greg Kroah-Hartman
>> >> >> <gregkh@linuxfoundation.org> wrote:
>> >> >> > On Mon, Oct 19, 2015 at 05:13:22PM +0200, Tomeu Vizoso wrote:
>> >> >> >> To smooth the transition to late probes, make disabled the default for
>> >> >> >> DELAY_DEVICE_PROBES and let individual SoCs enable the option as they
>> >> >> >> get fixed.
>> >> >> >>
>> >> >> >> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>> >> >> >> Link: https://lkml.kernel.org/g/20151016181129.GA1764@gradator.net
>> >> >> >>
>> >> >> >> ---
>> >> >> >>
>> >> >> >> Hi Rob,
>> >> >> >>
>> >> >> >> I'm sending this in case you think it would be best to leave the
>> >> >> >> on-demand probe series in -next for now but have late probes disabled to
>> >> >> >> avoid hassle to some people.
>> >> >> >
>> >> >> > I would like Rob to just drop this series please, I don't agree with it
>> >> >> > at all at the moment.
>> >> >>
>> >> >> Hi Greg,
>> >> >>
>> >> >> is it the case that you are satisfied with deferred probes as a way of
>> >> >> ordering device probing and that I should look at how to solve my
>> >> >> problem by improving it?
>> >> >
>> >> > Yes, especially given that you have said this does not speed up your
>> >> > boot times, which I thought was your main goal here :(
>> >>
>> >> Sorry if I'm repeating myself too often, but I have two goals: change
>> >> the probing order to not send deferred probes to the back of the queue
>> >> (getting the display up as fast as possible), and making easier to
>> >> understand the boot process on embedded platforms.
>> >>
>> >> The concrete issue that would be fixed by achieving the first goal was
>> >> explained in this email from last year:
>> >>
>> >> http://lists.freedesktop.org/archives/dri-devel/2014-August/066527.html
>> >>
>> >> Because of that, ChromeOS had to use their own bindings for the panel
>> >> node so that the panel probe wouldn't be deferred, introducing a
>> >> sizable delta that is a barrier to rebasing on newer mainline releases
>> >> and for vendors to upstream their HW adaptation for chrome devices.
>> >
>> > 1.5 second delay is crazy (again, my laptop boots to X in less time than
>> > that),
>>
>> 1.5 seconds isn't crazy at all for the kernel to initialize all the
>> devices in an embedded board. That's the current state of affairs
>> today.
>
> Then someone needs to fix that, that really is crazy.  What takes so
> long here?  Why aren't you using async probing to do things in parallel
> when you need to sleep in device probe (I'm hoping you are sleeping in
> device probe, otherwise that's really broken)?

I'm a bit surprised now. During all the time that I have been pushing
this forward I have been regularly testing on more than a dozen boards
with different socs and 1.5 seconds to probe all the devices isn't
that much. This is basically due to having to wait for the hardware a
bit here and there, and to the sheer number of devices involved.

Of course people have been looking at speeding up boot on ARM devices
for years now and this is what we have come with up to now.

> Have you used the tools we have to find where the time is being spent?

Have to recognize that my starting point has been that probe order was
the cause of the problem and haven't profiled the whole boot process,
but I don't see how probe ordering would become irrelevant unless we
got total probing time down to 200ms. And that would give us a
fabulously fast boot, which I don't think is as realistic as you seem
to believe.

>> > if there are a zillion probe deferrs, then maybe you can blame
>> > this type of system, but I would _strongly_ suggest fixing the broken
>> > driver that is causing such a delay instead, as that's the real problem
>> > here.
>> >
>> > And again, you say you did this to save boot time, yet you didn't
>> > actually test to see if you fixed this issue, sorry, but I need to see
>> > real numbers.
>>
>> I haven't said that I did this to save boot time, but I do have
>> repeated several times that the goal is to get the display up as early
>> as possible during the boot process.
>
> Ok, sorry, I implied that this was speeding it up, you are just
> reordering things, makes sense.  But you shouldn't have to touch all
> different subsystems just to reorder things, why not do that to the
> device tree file itself before you parse it?

Because the code that parses the DT according to bindings is in each
subsystem. If I was to reorder the DT file at compilation time as
Alexander proposes I would still have to either modify all subsystems
or just duplicate that code somewhere else.

Note that in the other thread people are discussing using the
dependency information for PM and unbind, so we would be back here
again if we just patched deferred probe this time.

Regards,

Tomeu

>> Again, the problem is that a device that defers its probe is currently
>> sent to the back of the queue, so it will be given a second chance
>> only after most other devices have been probed.
>>
>> On a tegra124-nyan-big with multi_v7_defconfig I get this difference:
>>
>> [    0.310032] [drm] Initialized tegra 0.0.0 20120330 on minor 0
>> [    2.038431] [drm] Initialized tegra 0.0.0 20120330 on minor 0
>
> Again, broken drivers, go fix them, we have the tools to do so, that's
> a crazy and unacceptable delay.
>
>
> greg k-h
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
