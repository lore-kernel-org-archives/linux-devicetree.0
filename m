From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4 v4] iio: st_sensors: support open drain mode
Date: Wed, 13 Apr 2016 15:52:22 -0500
Message-ID: <CAL_JsqKudTxbK9goinYCQhGLK=Gd_+PHgQ+mnpkU=cz4pB0k2w@mail.gmail.com>
References: <1460466079-15392-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460466079-15392-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Giuseppe Barba <giuseppe.barba-qxv4g6HH51o@public.gmane.org>, Denis Ciocca <denis.ciocca-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 12, 2016 at 8:01 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Some types of ST Sensors can be connected to the same IRQ line
> as other peripherals using open drain. Add a device tree binding
> and a sensor data property to flip the right bit in the interrupt
> control register to enable open drain mode on the INT line.
>
> If the line is set to be open drain, also tag on IRQF_SHARED
> to the IRQ flags when requesting the interrupt, as the whole
> point of using open drain interrupt lines is to share them with
> more than one peripheral (wire-or).
>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Giuseppe Barba <giuseppe.barba-qxv4g6HH51o@public.gmane.org>
> Cc: Denis Ciocca <denis.ciocca-qxv4g6HH51o@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> ChangeLog v3->v4:
> - Rename DT bool property st,int-pin-open-drain to int-pin-open-drain
> - Rob Herring ACKed st,int-pin-open-drain but not including his ACK
>   on this even though it's close

We already have st,irq-open-drain, gpio-open-drain, linux,open-drain
and drive-open-drain (from pinctrl).

If we want something common, then it should probably be part of
interrupt bindings, not something common to IIO.

Rob
