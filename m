From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [PATCH] driver core: Disable late probes by default
Date: Tue, 20 Oct 2015 18:17:39 +0200
Message-ID: <CAAObsKAL782-poBT1gkid+zzhWBOrnOUh7P7epjcja38j_-fbQ@mail.gmail.com>
References: <20151016181129.GA1764@gradator.net> <1445267602-12576-1-git-send-email-tomeu.vizoso@collabora.com>
 <20151019151953.GA22662@kroah.com> <CAAObsKC5LZU1YTmQd16duiN1d0WhpLF8Af8z4ep-PUVy3n_hnw@mail.gmail.com>
 <20151020140523.GA22021@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151020140523.GA22021@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 20 October 2015 at 16:05, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Tue, Oct 20, 2015 at 09:40:48AM +0200, Tomeu Vizoso wrote:
>> On 19 October 2015 at 17:19, Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>> > On Mon, Oct 19, 2015 at 05:13:22PM +0200, Tomeu Vizoso wrote:
>> >> To smooth the transition to late probes, make disabled the default for
>> >> DELAY_DEVICE_PROBES and let individual SoCs enable the option as they
>> >> get fixed.
>> >>
>> >> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>> >> Link: https://lkml.kernel.org/g/20151016181129.GA1764@gradator.net
>> >>
>> >> ---
>> >>
>> >> Hi Rob,
>> >>
>> >> I'm sending this in case you think it would be best to leave the
>> >> on-demand probe series in -next for now but have late probes disabled to
>> >> avoid hassle to some people.
>> >
>> > I would like Rob to just drop this series please, I don't agree with it
>> > at all at the moment.
>>
>> Hi Greg,
>>
>> is it the case that you are satisfied with deferred probes as a way of
>> ordering device probing and that I should look at how to solve my
>> problem by improving it?
>
> Yes, especially given that you have said this does not speed up your
> boot times, which I thought was your main goal here :(

Sorry if I'm repeating myself too often, but I have two goals: change
the probing order to not send deferred probes to the back of the queue
(getting the display up as fast as possible), and making easier to
understand the boot process on embedded platforms.

The concrete issue that would be fixed by achieving the first goal was
explained in this email from last year:

http://lists.freedesktop.org/archives/dri-devel/2014-August/066527.html

Because of that, ChromeOS had to use their own bindings for the panel
node so that the panel probe wouldn't be deferred, introducing a
sizable delta that is a barrier to rebasing on newer mainline releases
and for vendors to upstream their HW adaptation for chrome devices.

The goal of the project I'm working on is to help reduce the delta so
that ChromeOS (but will also help other downstreams) can rebase more
often and so that vendors have one excuse less to upstream support for
their SoCs in a timely way.

About simplifying the boot processes, I was really convinced that
people were as tired as me of debugging probing issues with deferred
probes in the middle and I'm very surprised that you and Russell don't
see any problem with it.

Regards,

Tomeu

> If deferred probes doesn't work well, we can fix it, but for now it
> seems our best option.
>
> thanks,
>
> greg k-h
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
