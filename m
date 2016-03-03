From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] usb: core: add power sequence for USB devices
Date: Thu, 3 Mar 2016 14:54:55 -0600
Message-ID: <CAL_JsqLYHzb0ABYN_P9ZOEorT6otvn_BPNzuCFhoqwa5M4y-hw@mail.gmail.com>
References: <1456999276-6315-1-git-send-email-peter.chen@nxp.com> <1456999276-6315-2-git-send-email-peter.chen@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456999276-6315-2-git-send-email-peter.chen-3arQi8VN3Tc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "Maciej S. Szmigiero" <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>, troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 3, 2016 at 4:01 AM, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org> wrote:
> Some hard-wired USB devices need to do power sequence to let the
> device work normally, the typical power sequence like: enable USB
> PHY clock, toggle reset pin, etc. But current Linux USB driver
> lacks of such code to do it, it may cause some hard-wired USB devices
> works abnormal or can't be recognized by controller at all.
>
> In this patch, it will do power on sequence at hub's probe for all
> devices under this hub (includes root hub) if this device is described
> at dts and there is a phandle "usb-pwrseq" for it. At hub_disconnect,
> it will do power off sequence.
>
> Signed-off-by: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/usb-device.txt         |  41 +++++-
>  drivers/usb/core/Makefile                          |   2 +-
>  drivers/usb/core/hub.c                             |  32 +++++
>  drivers/usb/core/pwrseq.c                          | 149 +++++++++++++++++++++
>  include/linux/usb/of.h                             |  10 ++
>  5 files changed, 232 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/usb/core/pwrseq.c
>
> diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
> index 1c35e7b..c7a298c 100644
> --- a/Documentation/devicetree/bindings/usb/usb-device.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-device.txt
> @@ -13,8 +13,37 @@ Required properties:
>  - reg: the port number which this device is connecting to, the range
>    is 1-31.
>
> +Optional properties:
> +- usb-pwrseq: the power sequence handler which need to do before this USB
> +  device can work.
> +- clocks: the input clock for USB device.
> +- clock-frequency: the frequency for device's clock.
> +- reset-gpios: Should specify the GPIO for reset.
> +- reset-duration-us: the duration in microsecond for assert reset signal.

So we sorted out how to describe USB devices in DT, but now we don't
use it? I know this is similar to what was done for MMC, but I really
don't like it.

Just put all these properties into the device nodes. The parent can
then scan for children and handle the power sequencing with generic
code. I think it is safe to assume that if these properties are
present, they need to be handled for device detection. We may still
need something device specific to handle some devices at some point,
but that is true either way.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
