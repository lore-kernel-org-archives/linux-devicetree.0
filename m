From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: document bindings for mounting matrixes
Date: Mon, 15 Aug 2016 20:47:31 +0200
Message-ID: <CACRpkdZ2bpy2cLo2y8i1x9y+8PfJWcG=_A8D=gPZ1usz+=6a2A@mail.gmail.com>
References: <1469355434-17043-1-git-send-email-linus.walleij@linaro.org>
 <CACRpkdY0gCLKD3rmiYuFgWSYOe6dtUaBeRi1ns-UFF=AspntFg@mail.gmail.com> <c8e83cf2-f9dc-0bc9-fcde-326b05ee290b@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c8e83cf2-f9dc-0bc9-fcde-326b05ee290b-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samu Onkalo <samu.onkalo-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 15, 2016 at 4:58 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> I'd also like input from Gregor as his usecase is somewhat different
> and drove the sysfs docs.  They need to agree and I haven't actually
> verified they do as yet!

OK I actually copy-pasted from the sysfs docs for the compass,
but it's good to have him look at it first indeed.

I hope it's OK if I refer to this doc in other patches assuming we
will merge something like it.

> Also for trivial comments, plural of matrix is matrices.
> Isn't English weird sometimes ;)

Aha another irregularity... OK I will fix up when collecting the
feedback.

Yours,
Linus Walleij
