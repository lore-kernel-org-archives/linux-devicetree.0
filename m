From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/8] irqchip: New driver for ST's SysCfg controlled
 IRQs
Date: Mon, 15 Dec 2014 12:28:26 +0000
Message-ID: <20141215122826.GB13885@x1>
References: <1416932705-16880-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416932705-16880-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jason, would you like me to send this set again?

> This driver enables IRQs which are controlled using System Configurat=
ion
> registers.  Without it Performance Monitoring, Core Sight Tracing and=
 some
> L2 Caches will fail to function.
>=20
> v1 =3D> v2:
>  - Fixed up Jason's review comments
>=20
> Lee Jones (8):
>   dt: bindings: Supply shared ST IRQ defines
>   irqchip: Supply new driver for STi based devices
>   irqchip: irq-st: Add documentation for STi based syscfg IRQs
>   ARM: STi: STiH416: Enable Cortex-A9 PMU support
>   ARM: STi: STiH416: Enable PMU IRQs
>   ARM: STi: STiH407: Enable Cortex-A9 PMU support
>   ARM: STi: STiH407: Enable PMU IRQs
>   ARM: STI: Ensure requested STi's SysCfg Controlled IRQs are enabled=
 at
>     boot
>=20
>  .../interrupt-controller/st,sti-irq-syscfg.txt     |  35 ++++
>  arch/arm/boot/dts/stih407.dtsi                     |  16 ++
>  arch/arm/boot/dts/stih416.dtsi                     |  16 ++
>  arch/arm/mach-sti/Kconfig                          |   1 +
>  drivers/irqchip/Kconfig                            |   7 +
>  drivers/irqchip/Makefile                           |   1 +
>  drivers/irqchip/irq-st.c                           | 208 +++++++++++=
++++++++++
>  include/dt-bindings/interrupt-controller/irq-st.h  |  30 +++
>  8 files changed, 314 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-contr=
oller/st,sti-irq-syscfg.txt
>  create mode 100644 drivers/irqchip/irq-st.c
>  create mode 100644 include/dt-bindings/interrupt-controller/irq-st.h
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
