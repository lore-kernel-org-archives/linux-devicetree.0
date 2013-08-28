From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 2/2] iio: add Bosch BMA180 acceleration sensor driver
Date: Wed, 28 Aug 2013 14:17:24 +0100
Message-ID: <20130828131724.GE10250@e106331-lin.cambridge.arm.com>
References: <1377687678-5761-1-git-send-email-o.v.kravchenko@globallogic.com>
 <1377687678-5761-2-git-send-email-o.v.kravchenko@globallogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1377687678-5761-2-git-send-email-o.v.kravchenko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksandr Kravchenko <o.v.kravchenko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org" <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org" <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, "denis.ciocca-qxv4g6HH51o@public.gmane.org" <denis.ciocca-qxv4g6HH51o@public.gmane.org>, "srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org" <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 28, 2013 at 12:01:18PM +0100, Oleksandr Kravchenko wrote:
> This patch adds IIO driver for Bosch BMA180 triaxial
> acceleration sensor.
> http://dlnmh9ip6v2uc.cloudfront.net/datasheets/
>                 Sensors/Accelerometers/BST-BMA180-DS000-07_2.pdf
> 
> Stephen Warren:
> The binding looks simple enough to me, so the binding

You can lose the above two lines, just the Acked-by is good enough. :)

> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Oleksandr Kravchenko <o.v.kravchenko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/accel/bma180.txt       |   24 +
>  drivers/iio/accel/Kconfig                          |   12 +
>  drivers/iio/accel/Makefile                         |    2 +
>  drivers/iio/accel/bma180.c                         |  676 ++++++++++++++++++++
>  4 files changed, 714 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/accel/bma180.txt
>  create mode 100644 drivers/iio/accel/bma180.c
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/bma180.txt b/Documentation/devicetree/bindings/iio/accel/bma180.txt
> new file mode 100644
> index 0000000..c593357
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/accel/bma180.txt
> @@ -0,0 +1,24 @@
> +* Bosch BMA180 triaxial acceleration sensor
> +
> +http://omapworld.com/BMA180_111_1002839.pdf
> +
> +Required properties:
> +
> +  - compatible : should be "bosch,bma180"
> +  - reg : the I2C address of the sensor
> +
> +Optional properties:
> +
> +  - interrupt-parent : should be the phandle for the interrupt controller
> +
> +  - interrupts : interrupt mapping for GPIO IRQ, it should by configured with
> +               flags IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING
> +

One thing I noticed from the datasheet is that this has a clock input
(sck) and two regulator inputs (vdd and vddio). It might not always be
the case that these are configured statically, so they may need to be
described in the dt. It's possible that they could be added later as
optional properties, though.

Thanks,
Mark.
