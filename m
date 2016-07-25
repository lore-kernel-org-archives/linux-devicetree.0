From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: document bindings for mounting matrixes
Date: Mon, 25 Jul 2016 15:57:24 +0200
Message-ID: <CACRpkdbUorArtpy5KH46TmaLHphj3EerQ6cJDfDu5YWZkGFi=w@mail.gmail.com>
References: <1469355434-17043-1-git-send-email-linus.walleij@linaro.org>
 <06168d06-b609-a0ec-945e-aa36a4dbe795@kernel.org> <57960AAF.1060103@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57960AAF.1060103-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samu Onkalo <samu.onkalo-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 25, 2016 at 2:48 PM, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org> wrote:

> I'm wondering how to ensure consistent documentation between sysfs
> iio ABI and DT binding since there will be duplicates at some point.
> Cross-refering Documentation/devicetree/bindings/iio/mount-matrix.txt within
> Documentation/ABI/testing/sysfs-bus-iio might be an option since "DT
> bindings
> are (in theory, mind you) a standards document used by other" as Linus said.

That's my position on the issue, if the documents should refer each other
in any direction the sysfs should reference the DT bindings.

(Maybe someone will slap me for this...)

Yours.
Linus Walleij
