From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Thu, 24 Sep 2015 09:54:11 -0700
Message-ID: <CACRpkdYLYWVHoy+OV2wnS7pHrJ=PUFcSLdcB-8wu2z-HbKBj7Q@mail.gmail.com>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
	<20150828101227.GD31748@leverpostej>
	<CAAVeFuJCSv74HLws7Adb1fnSbxf8rR5=NYX8GG59K1nLgFs+VA@mail.gmail.com>
	<CAPiN7iU+NzW1oYjXLsLgn7Sh=i6DPMC49WrDcpsa4XvmjpORcw@mail.gmail.com>
	<20150831145500.GP12027@sirena.org.uk>
	<CAPiN7iWFR2Sm8t9dUttNzwj-qZmUc-cdK69rGhG2RjD+s1gdSA@mail.gmail.com>
	<20150831180140.GS12027@sirena.org.uk>
	<CAPiN7iWWAxhg6YQ8BjYHh+Gu8bvQrntvT4QGV+oDe4KAnb1nvg@mail.gmail.com>
	<CAAVeFuJsM_gDNHNqSRi2iHNAzMHAiw0-y5V1pRce4SD8OgY11Q@mail.gmail.com>
	<CAPiN7iUvDgifPYxhtVf3oOJLV1q1ZA6MZ-2tL2JbpgE0oUM6AA@mail.gmail.com>
	<CACRpkda=2qnxnnRBga-6U9mCDUD61=1+62-awC8NVOV6Yt9mAA@mail.gmail.com>
	<CAPiN7iVZgvLS0HGifhDULVavCw2TdxZBC_+bcGjWKAAax=YFKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPiN7iVZgvLS0HGifhDULVavCw2TdxZBC_+bcGjWKAAax=YFKQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 22, 2015 at 6:54 AM, Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
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

I am usually conservative with this because all too often, people
do not know about all the stuff listed in
Documentation/gpio/drivers-on-gpio.txt
and their usual reasoning is "just lemme do this in userspace real
quick now because I have this project". And that doesn't sit well with
our long-term view of kernel ABIs.

For proper userspace ABI the sysfs has been deemed unusable
and does not scale. What is needed is a chardev rewrite as has
been discussed several times.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
