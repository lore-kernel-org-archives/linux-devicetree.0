From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/3] soc: keystone: add QMSS driver
Date: Mon, 3 Mar 2014 10:41:10 -0600
Message-ID: <1568CFCC-C778-4116-95F6-4EB407F096D6@codeaurora.org>
References: <1393629520-12713-1-git-send-email-santosh.shilimkar@ti.com> <1393629520-12713-3-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393629520-12713-3-git-send-email-santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sandeep Nair <sandeep_n-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Feb 28, 2014, at 5:18 PM, Santosh Shilimkar <santosh.shilimkar-Bv2c3lPp1Ag@public.gmane.org=
m> wrote:

> From: Sandeep Nair <sandeep_n-l0cyMroinI0@public.gmane.org>
>=20
> The QMSS (Queue Manager Sub System) found on Keystone SOCs is one of
> the main hardware sub system which forms the backbone of the Keystone
> Multi-core Navigator. QMSS consist of queue managers, packed-data str=
ucture
> processors(PDSP), linking RAM, descriptor pools and infrastructure
> Packet DMA.
>=20
> The Queue Manager is a hardware module that is responsible for accele=
rating
> management of the packet queues. Packets are queued/de-queued by writ=
ing or
> reading descriptor address to a particular memory mapped location. Th=
e PDSPs
> perform QMSS related functions like accumulation, QoS, or event manag=
ement.
> Linking RAM registers are used to link the descriptors which are stor=
ed in
> descriptor RAM. Descriptor RAM is configurable as internal or externa=
l memory.
>=20
> The QMSS driver manages the PDSP setups, linking RAM regions,
> queue pool management (allocation, push, pop and notify) and descript=
or
> pool management. The specifics on the device tree bindings for
> QMSS can be found in:
>        Documentation/devicetree/bindings/soc/keystone-qmss.txt
>=20
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Sandeep Nair <sandeep_n-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
> ---
> .../devicetree/bindings/soc/keystone-qmss.txt      |  209 +++
> drivers/Kconfig                                    |    2 +
> drivers/Makefile                                   |    3 +
> drivers/soc/Kconfig                                |    2 +
> drivers/soc/Makefile                               |    5 +
> drivers/soc/keystone/Kconfig                       |   15 +
> drivers/soc/keystone/Makefile                      |    5 +
> drivers/soc/keystone/qmss_acc.c                    |  591 ++++++++
> drivers/soc/keystone/qmss_queue.c                  | 1533 +++++++++++=
+++++++++
> drivers/soc/keystone/qmss_queue.h                  |  236 +++

So this should be drivers/soc/ti, much like we use vendor in drivers/ne=
t/ethernet

> include/linux/soc/keystone_qmss.h                  |  390 +++++

include/linux/soc/ti/

> 11 files changed, 2991 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/soc/keystone-qms=
s.txt
> create mode 100644 drivers/soc/Makefile
> create mode 100644 drivers/soc/keystone/Kconfig
> create mode 100644 drivers/soc/keystone/Makefile
> create mode 100644 drivers/soc/keystone/qmss_acc.c
> create mode 100644 drivers/soc/keystone/qmss_queue.c
> create mode 100644 drivers/soc/keystone/qmss_queue.h
> create mode 100644 include/linux/soc/keystone_qmss.h

[snip]

> diff --git a/drivers/Kconfig b/drivers/Kconfig
> index 37f955f..3220516 100644
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@ -146,6 +146,8 @@ source "drivers/remoteproc/Kconfig"
>=20
> source "drivers/rpmsg/Kconfig"
>=20
> +source "drivers/soc/Kconfig"
> +
> source "drivers/devfreq/Kconfig"
>=20
> source "drivers/extcon/Kconfig"
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 0d8e2a4..0c22db8 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -146,6 +146,9 @@ obj-$(CONFIG_IOMMU_SUPPORT)	+=3D iommu/
> obj-$(CONFIG_REMOTEPROC)	+=3D remoteproc/
> obj-$(CONFIG_RPMSG)		+=3D rpmsg/
>=20
> +# SOC specific drivers
> +obj-y				+=3D soc/
> +
> # Virtualization drivers
> obj-$(CONFIG_VIRT_DRIVERS)	+=3D virt/
> obj-$(CONFIG_HYPERV)		+=3D hv/
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index 2f9d7d0..59980bd 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -1,3 +1,5 @@
> menu "SOC specific Drivers"
>=20
> +source "drivers/soc/keystone/Kconfig"
> +
> endmenu
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> new file mode 100644
> index 0000000..c5d141e
> --- /dev/null
> +++ b/drivers/soc/Makefile
> @@ -0,0 +1,5 @@
> +#
> +# Makefile for the Linux kernel SOC specific device drivers.
> +#
> +
> +obj-$(CONFIG_ARCH_KEYSTONE)		+=3D keystone/
> diff --git a/drivers/soc/keystone/Kconfig b/drivers/soc/keystone/Kcon=
fig
> new file mode 100644
> index 0000000..0b3131b
> --- /dev/null
> +++ b/drivers/soc/keystone/Kconfig
> @@ -0,0 +1,15 @@
> +#
> +# TI Keystone Soc drivers
> +#
> +

We should have this be something like:

menuconfig SOC_TI
	bool =93TI SoC support=94
=09

if SOC_TI

> +config KEYSTONE_QMSS
> +	tristate "Keystone Queue Manager Sub System"
> +	depends on ARCH_KEYSTONE
> +	help
> +	  Say y here to support the Keystone Hardware Queue Manager support=
=2E
> +	  The Queue Manager is a hardware module that is responsible for
> +	  accelerating management of the packet queues. Packets are queued/
> +	  de-queued by writing/reading descriptor address to a particular
> +	  memory mapped location in the Queue Manager module.
> +
> +	  If unsure, say N.

endif # SOC_TI

[snip]

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
