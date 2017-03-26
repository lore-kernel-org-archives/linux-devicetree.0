From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v3 2/4] iio: Documentation: Add max9611 sysfs documentation
Date: Sun, 26 Mar 2017 10:38:24 +0200
Message-ID: <CAMuHMdUMksHLC_0Nnhi=vWHTgQLbHMRdpWCCM4S3Bew+i1ffKA@mail.gmail.com>
References: <1490369323-13866-1-git-send-email-jacopo+renesas@jmondi.org> <1490369323-13866-3-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490369323-13866-3-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 24, 2017 at 4:28 PM, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:
> Add documentation for max9611 driver.
> Document attributes describing value of shunt resistor installed between
> RS+ and RS- voltage sense inputs.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/ABI/testing/sysfs-bus-iio-adc-max9611 | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-max9611
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-max9611 b/Documentation/ABI/testing/sysfs-bus-iio-adc-max9611
> new file mode 100644
> index 0000000..9c60824
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-max9611
> @@ -0,0 +1,16 @@
> +What:          /sys/bus/iio/devices/iio:deviceX/in_shunt_resistor_power
> +Date:          March 2017
> +KernelVersion: 4.12
> +Contact:       linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> +Description:   The value of the shunt resistor used to compute power drain on
> +                common input voltage pin (RS+). In micro Ohms.
> +
> +What:          /sys/bus/iio/devices/iio:deviceX/in_shunt_resistor_current
> +Date:          March 2017
> +KernelVersion: 4.12
> +Contact:       linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> +Description:   The value of the shunt resistor used to compute current flowing
> +                between RS+ and RS- voltage sense inputs. In micro Ohms.

I'd add a blank line here, to make it clear the following paragraph applies
to both attributes above.

> +               This attributes describe a single physical component, exposed

These attributes

> +               as two distinct attributes as it is used to calculate two
> +               different values.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
