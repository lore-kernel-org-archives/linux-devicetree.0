From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: document bindings for mounting matrixes
Date: Thu, 11 Aug 2016 13:33:29 +0200
Message-ID: <CACRpkdY0gCLKD3rmiYuFgWSYOe6dtUaBeRi1ns-UFF=AspntFg@mail.gmail.com>
References: <1469355434-17043-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469355434-17043-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samu Onkalo <samu.onkalo-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 24, 2016 at 12:17 PM, Linus Walleij
<linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> The mounting matrix for sensors was introduced in
> commit dfc57732ad38 ("iio:core: mounting matrix support")
>
> However the device tree bindings are very terse and since this is
> a widely applicable property, we need a proper binding for it
> that the other bindings can reference. This will also be useful
> for other operating systems and sensor engineering at large.
>
> I think all 3D sensors should support it, the current situation
> is probably that the mounting information is confined in magic
> userspace components rather than using the mounting matrix, which
> is not good for portability and reuse.
>
> Cc: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
> Cc: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Samu Onkalo <samu.onkalo-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

AFAICT there is no comments on this patch per se, just chit chat
about misc, and we have Rob's ACK.

Can it be merged?

Yours,
Linus Walleij
