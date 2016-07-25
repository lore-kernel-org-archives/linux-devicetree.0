From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: document bindings for mounting matrixes
Date: Mon, 25 Jul 2016 10:42:45 +0200
Message-ID: <CACRpkdYrMWDR2s=QnP3K5V5iL0rKpw16phJd2xKAiH6sG=cY1Q@mail.gmail.com>
References: <1469355434-17043-1-git-send-email-linus.walleij@linaro.org> <06168d06-b609-a0ec-945e-aa36a4dbe795@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <06168d06-b609-a0ec-945e-aa36a4dbe795-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samu Onkalo <samu.onkalo-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 24, 2016 at 9:03 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

>> Please help out to get this right, I think this could be confusing
>> to users unless documented properly. I think the doc has some rough
>> edges since I'm not the smartest in physics nor english at all times.
>
> Note that there is rather more substantial documentation in the
> sysfs abi docs.
>
> Documentation/ABI/testing/sysfs-bus-iio

Yes I used that actually, for the magnetometer example.

Thanks anyways!

> That's not to say we shouldn't have better docs for the
> binding, but rather that we should make sure they agree ;)

Yes, this is mainly for establishing terminology, as the DT bindings
are (in theory, mind you) a standards document used by other
operating systems as well.

There are some problems with the Linux implementation,
primarily that it is "opt-in per driver" and I think it would make
sense to try to enable it by default for any 3-axis 3D things
and move all code to a central spot, if possible. I also think
we should patch generic_buffer to make use of the mount
matrix if it finds one. (I know, talk is cheap, show me the
code, it's all on my TODO list.)

Yours,
Linus Walleij
