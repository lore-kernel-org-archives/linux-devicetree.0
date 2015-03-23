From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND] iio: st-sensors: add support for lis3lv02d accelerometer
Date: Mon, 23 Mar 2015 10:21:50 +0100
Message-ID: <CACRpkdYuWL_rs9nzg8ivRehG6-yFOheo+ZugZ-1iqmAyhwVaLQ@mail.gmail.com>
References: <1426672326-6292-1-git-send-email-linus.walleij@linaro.org>
	<20150318153948.GQ3318@x1>
	<550D5B65.10906@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <550D5B65.10906-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denis CIOCCA <denis.ciocca-qxv4g6HH51o@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 21, 2015 at 12:52 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> We aren't going to move forward without doing something.
> Hence applied to the togreg branch of iio.git.

Thanks!

>  Lets see
> whether anyone cares enough to add the stuff the other driver supports
> and this one doesn't.

The one really interesting feature I saw was the free-fall detection.
I think it'd be nice if we had the ability to register for listening
to such events from the IIO accelerometer subsystem, but I'm
scared to even try to test it, god knows how many boards I'd
break before I had this properly supported...

Yours,
Linus Walleij
