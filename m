From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: imx6qdl-nitrogen6x: Add SPI NOR partitions
Date: Mon, 27 Nov 2017 14:17:04 -0200
Message-ID: <CAOMZO5Dtf6mjWt1wg_5NDUNAe4XZ3jvxu0KC2CaUo0wE7gjaRQ@mail.gmail.com>
References: <20171127133127.16985-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171127133127.16985-1-otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Otavio Salvador <otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 27, 2017 at 11:31 AM, Otavio Salvador
<otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org> wrote:
> This adds the partitions definition for the SPI NOR to provide
> backward compatibility with the documented[1] layout used with
> Boundary Devices BSP.
>
> 1. https://boundarydevices.com/boot-flash-access-linux/
>
> It exports to Linux:
>
>  mtd0: bootloader
>  mtd1: env
>  mtd2: splash
>
> Signed-off-by: Otavio Salvador <otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org>

Has this been tested? I mean, have you tested the locking mechanism is
really working in this SPI NOR flash?

As far as I can see the SPI locking mechanism does not need device
tree properties.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
