From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/5] mfd: add Ricoh RN5T567 PMIC support
Date: Wed, 8 Jun 2016 15:22:57 -0500
Message-ID: <20160608202257.GA22463@rob-hp-laptop>
References: <20160608010429.19618-1-stefan@agner.ch>
 <20160608010429.19618-3-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160608010429.19618-3-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, max.oss.09-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 07, 2016 at 06:04:26PM -0700, Stefan Agner wrote:
> The Ricoh RN5T567 is from the same family as the Ricoh RN5T618 is,
> the differences are:
> 
> + DCDC4
> + Slightly different output voltage/currents
> + 32kHz Output
> - ADC/Charger capabilities
> 
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/rn5t618.txt | 19 ++++++++++-------
>  drivers/mfd/Kconfig                               |  7 +++---
>  drivers/mfd/rn5t618.c                             | 26 +++++++++++++++++------
>  include/linux/mfd/rn5t618.h                       | 12 +++++++++++
>  4 files changed, 46 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/rn5t618.txt b/Documentation/devicetree/bindings/mfd/rn5t618.txt
> index 937785a..5b493ed 100644
> --- a/Documentation/devicetree/bindings/mfd/rn5t618.txt
> +++ b/Documentation/devicetree/bindings/mfd/rn5t618.txt
> @@ -1,18 +1,21 @@
> -* Ricoh RN5T618 PMIC
> +* Ricoh RN5T567/RN5T618 PMIC
>  
> -Ricoh RN5T618 is a power management IC which integrates 3 step-down
> -DCDC converters, 7 low-dropout regulators, a Li-ion battery charger,
> -fuel gauge, ADC, GPIOs and a watchdog timer. It can be controlled
> -through a I2C interface.
> +Ricoh RN5T567/RN5T618 is a power management IC family which integrates
> +3 to 5 step-down DCDC converters, 7 low-dropout regulators, GPIOs and

I count 4?

Otherwise, for the binding:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
