From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: st-sensors: add support for lis3lv02d accelerometer
Date: Fri, 31 Oct 2014 21:53:41 +0100
Message-ID: <CACRpkdZQk+5bemmLQsiP-eLiAhrS8-cJriP=8LBaBDu+Jiustw@mail.gmail.com>
References: <1408815064-5763-1-git-send-email-linus.walleij@linaro.org>
	<53FB6205.5020704@kernel.org>
	<CACRpkdZuSsePVjPpmLV5bs5VOcbnH2_gK4-kOfbpBM1-7Q=zgQ@mail.gmail.com>
	<c422075c-f86a-415b-a19b-d4c11fd5e0fd@email.android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c422075c-f86a-415b-a19b-d4c11fd5e0fd-2ueSQiBKiTY7tOexoI0I+QC/G2K4zDHf@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denis CIOCCA <denis.ciocca-qxv4g6HH51o@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 11, 2014 at 6:39 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On September 11, 2014 10:13:24 AM GMT+01:00, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

>>Apart from that it has a custom sysfs interface to read the
>>accelerometer, similar to the IIO interface. It seems to *only* support
>>raw values AFAICT  though, not sensitivity adjustment, so my patch
>>gives the ability to have better sensor handling in the kernel from an
>>IIO point of view.
>>
> I likewise looked at this long ago (came out roughly concurrently
> with the similar lis3l02dq driver) came to roughly the same conclusion.

So Jonathan what do you say, should we simply merge this patch?

It will be two drivers in the kernel for the same hardware but one
of them is modern and uses IIO.

The misc driver maintainers doesn't seem to be moving anywhere
near IIO on its own whereas this patch establishes a base for
moving features over to generic IIO whenever someone finds the
time.

Yours,
Linus Walleij
