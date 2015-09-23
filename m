From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Wed, 23 Sep 2015 19:17:47 +0900
Message-ID: <CAAVeFuL3BihvLhOJBiHBiJu41F8KJLPfsEsHEpQ5oP5jf+ikAw@mail.gmail.com>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com> <20150828101227.GD31748@leverpostej>
 <CAAVeFuJCSv74HLws7Adb1fnSbxf8rR5=NYX8GG59K1nLgFs+VA@mail.gmail.com>
 <CAPiN7iU+NzW1oYjXLsLgn7Sh=i6DPMC49WrDcpsa4XvmjpORcw@mail.gmail.com>
 <20150831145500.GP12027@sirena.org.uk> <CAPiN7iWFR2Sm8t9dUttNzwj-qZmUc-cdK69rGhG2RjD+s1gdSA@mail.gmail.com>
 <20150831180140.GS12027@sirena.org.uk> <CAPiN7iWWAxhg6YQ8BjYHh+Gu8bvQrntvT4QGV+oDe4KAnb1nvg@mail.gmail.com>
 <CAAVeFuJsM_gDNHNqSRi2iHNAzMHAiw0-y5V1pRce4SD8OgY11Q@mail.gmail.com>
 <CAPiN7iUvDgifPYxhtVf3oOJLV1q1ZA6MZ-2tL2JbpgE0oUM6AA@mail.gmail.com>
 <CACRpkda=2qnxnnRBga-6U9mCDUD61=1+62-awC8NVOV6Yt9mAA@mail.gmail.com> <CAPiN7iVZgvLS0HGifhDULVavCw2TdxZBC_+bcGjWKAAax=YFKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPiN7iVZgvLS0HGifhDULVavCw2TdxZBC_+bcGjWKAAax=YFKQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 22, 2015 at 10:54 PM, Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Sep 21, 2015 at 4:55 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On Wed, Sep 2, 2015 at 6:35 AM, Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> There are some hardware aspects/parameters
>>> of exporting that aren't controllable from userspace, such as whether or not
>>> reversing the direction of a GPIO is safe.
>>
>> The original argument as to why kernel should handle hardware
>> is to keep things safe and under control.
>>
>> I don't understand this argument really, should the kernel give you
>> a gun but stop you from shooting yourself in the foot with it or
>> what do you mean? Then the stance of kernel not to give out guns
>> is better.
>
> From my embedded perspective a board designer wants to keep
> hardware safe and under control too.  He may want or need to expose
> controls or status to userspace applications, though, and what he
> wants to have exposed may vary from board to board.  I just feel that
> exposing them via the DT could be OK, whereas others do not.

It is really not a matter of feeling. The DT's job is to describe what
the hardware is and how it is connected together - not the way in
which it may be used.

In your case, the DT describes a given range of pins as not being used
(typically, any unclaimed GPIO) and the sysfs kernel option allows
these GPIOs to be exposed to user-space. It is then up to the
priviledged userspace (via init scripts and/or udev rules) to export
and configure these GPIOs in the way they are supposed to be by
regular users.

This basically covers what you wanted to do exclusively by DT, but
with a stronger role separation. IIUC a good old init script could
just do what you want, using chmod to restrict write access to a GPIO
value or the ability to change direction. I also suspect the same
could be achieved with udev (especially since this series has just
been merged: http://www.spinics.net/lists/linux-gpio/msg07844.html ,
see the link for an example of a rule).

Board differenciation can also be handled at boot time, with init
doing different things depending on the board model. Again, similarly
to what you would do with DT, but without the it being involved in
describing the system semantics.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
