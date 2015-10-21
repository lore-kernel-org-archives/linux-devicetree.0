From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] driver core: Disable late probes by default
Date: Wed, 21 Oct 2015 13:09:55 -0500
Message-ID: <CAL_Jsq+iGjXz2DVrwif7Lj4iJwnoBMb0OAHji-3hNG2UbvM6yQ@mail.gmail.com>
References: <20151016181129.GA1764@gradator.net> <1445267602-12576-1-git-send-email-tomeu.vizoso@collabora.com>
 <20151019151953.GA22662@kroah.com> <CAAObsKC5LZU1YTmQd16duiN1d0WhpLF8Af8z4ep-PUVy3n_hnw@mail.gmail.com>
 <20151020140523.GA22021@kroah.com> <CAAObsKAL782-poBT1gkid+zzhWBOrnOUh7P7epjcja38j_-fbQ@mail.gmail.com>
 <20151021033917.GB32366@kroah.com> <CAAObsKBLL_-bARp_W0sVqoGdpQ+nftdJtQepnFL1foJOGJmbQQ@mail.gmail.com>
 <20151021151447.GA19720@kroah.com> <CAAObsKASbhBrEoE-=k3Vwg7BygLQ2vXU2jxu3FyxNrD5AAHROg@mail.gmail.com>
 <20151021160656.GA20899@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151021160656.GA20899@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 21, 2015 at 11:06 AM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Wed, Oct 21, 2015 at 05:53:13PM +0200, Tomeu Vizoso wrote:
>> On 21 October 2015 at 17:14, Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>> > On Wed, Oct 21, 2015 at 04:35:58PM +0200, Tomeu Vizoso wrote:
>> >> On 21 October 2015 at 05:39, Greg Kroah-Hartman
>> >> <gregkh@linuxfoundation.org> wrote:
>> >> > On Tue, Oct 20, 2015 at 06:17:39PM +0200, Tomeu Vizoso wrote:
>> >> >> On 20 October 2015 at 16:05, Greg Kroah-Hartman
>> >> >> <gregkh@linuxfoundation.org> wrote:
>> >> >> > On Tue, Oct 20, 2015 at 09:40:48AM +0200, Tomeu Vizoso wrote:
>> >> >> >> On 19 October 2015 at 17:19, Greg Kroah-Hartman
>> >> >> >> <gregkh@linuxfoundation.org> wrote:
>> >> >> >> > On Mon, Oct 19, 2015 at 05:13:22PM +0200, Tomeu Vizoso wrote:
>> >> >> >> >> To smooth the transition to late probes, make disabled the default for
>> >> >> >> >> DELAY_DEVICE_PROBES and let individual SoCs enable the option as they
>> >> >> >> >> get fixed.
>> >> >> >> >>
>> >> >> >> >> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>> >> >> >> >> Link: https://lkml.kernel.org/g/20151016181129.GA1764@gradator.net
>> >> >> >> >>
>> >> >> >> >> ---
>> >> >> >> >>
>> >> >> >> >> Hi Rob,
>> >> >> >> >>
>> >> >> >> >> I'm sending this in case you think it would be best to leave the
>> >> >> >> >> on-demand probe series in -next for now but have late probes disabled to
>> >> >> >> >> avoid hassle to some people.
>> >> >> >> >
>> >> >> >> > I would like Rob to just drop this series please, I don't agree with it
>> >> >> >> > at all at the moment.
>> >> >> >>
>> >> >> >> Hi Greg,
>> >> >> >>
>> >> >> >> is it the case that you are satisfied with deferred probes as a way of
>> >> >> >> ordering device probing and that I should look at how to solve my
>> >> >> >> problem by improving it?
>> >> >> >
>> >> >> > Yes, especially given that you have said this does not speed up your
>> >> >> > boot times, which I thought was your main goal here :(
>> >> >>
>> >> >> Sorry if I'm repeating myself too often, but I have two goals: change
>> >> >> the probing order to not send deferred probes to the back of the queue
>> >> >> (getting the display up as fast as possible), and making easier to
>> >> >> understand the boot process on embedded platforms.
>> >> >>
>> >> >> The concrete issue that would be fixed by achieving the first goal was
>> >> >> explained in this email from last year:
>> >> >>
>> >> >> http://lists.freedesktop.org/archives/dri-devel/2014-August/066527.html
>> >> >>
>> >> >> Because of that, ChromeOS had to use their own bindings for the panel
>> >> >> node so that the panel probe wouldn't be deferred, introducing a
>> >> >> sizable delta that is a barrier to rebasing on newer mainline releases
>> >> >> and for vendors to upstream their HW adaptation for chrome devices.
>> >> >
>> >> > 1.5 second delay is crazy (again, my laptop boots to X in less time than
>> >> > that),
>> >>
>> >> 1.5 seconds isn't crazy at all for the kernel to initialize all the
>> >> devices in an embedded board. That's the current state of affairs
>> >> today.
>> >
>> > Then someone needs to fix that, that really is crazy.  What takes so
>> > long here?  Why aren't you using async probing to do things in parallel
>> > when you need to sleep in device probe (I'm hoping you are sleeping in
>> > device probe, otherwise that's really broken)?
>>
>> I'm a bit surprised now. During all the time that I have been pushing
>> this forward I have been regularly testing on more than a dozen boards
>> with different socs and 1.5 seconds to probe all the devices isn't
>> that much. This is basically due to having to wait for the hardware a
>> bit here and there, and to the sheer number of devices involved.
>>
>> Of course people have been looking at speeding up boot on ARM devices
>> for years now and this is what we have come with up to now.
>>
>> > Have you used the tools we have to find where the time is being spent?
>>
>> Have to recognize that my starting point has been that probe order was
>> the cause of the problem and haven't profiled the whole boot process,
>> but I don't see how probe ordering would become irrelevant unless we
>> got total probing time down to 200ms. And that would give us a
>> fabulously fast boot, which I don't think is as realistic as you seem
>> to believe.
>
> So you aren't using the tools that we have today that were created years
> ago, to help to reduce boot time problems like this and instead work on
> changing the driver core to try to guess at what the real issue is here?
>
> Come on, until you really know where you are taking so long, how can you
> know what you need to fix?  I strongly recommend doing that here first,
> that's why those tools were written in the first place.

For something everyone is or should be doing for years, there is
surprisingly zero information I can find. It is perf timechart you are
talking about, right? Everything I find on it is all after userspace
starts. I know perf has command line options, but I never could get it
to do what I wanted (which was dumping events up until a boot hang).

Still, the 1.5 sec doesn't surprise me either.

Rob
