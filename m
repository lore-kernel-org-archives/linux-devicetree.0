From: Otavio Salvador <otavio.salvador-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: imx6qdl-nitrogen6x: Add SPI NOR partitions
Date: Sat, 25 Nov 2017 07:55:53 -0200
Message-ID: <CAP9ODKoefNEcQtrCCLEa7hzx2D_2vJTit0t8ooQGTx7Uyds1mQ@mail.gmail.com>
References: <20171124170004.31133-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171124170004.31133-1-otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Otavio Salvador <otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kernel development list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 24, 2017 at 3:00 PM, Otavio Salvador
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

After thinking a bit about Fabio's recommendation to use 'read-only'
to protect the partitions, I think it'd be better to use 'lock' so it
is still possible to write them on Linux but it requires a unlock
prior changing it.

In my case, I am interested in being capable of upgrading the
bootloader from Linux.

What people think?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
