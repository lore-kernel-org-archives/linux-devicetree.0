Return-Path: <SRS0=JCJA=QU=mellanox.com=lsun@kernel.org>
From: Liming Sun <lsun@mellanox.com>
Subject: Re: [PATCH v8 1/2] platform/mellanox: Add TmFifo driver for Mellanox
 BlueField Soc
Date: Wed, 13 Feb 2019 13:42:59 +0000
Message-ID: 
 <DB6PR05MB3223750A26A7B56F56FD5203A1660@DB6PR05MB3223.eurprd05.prod.outlook.com>
References: 
 <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
 <1548696487-8840-2-git-send-email-lsun@mellanox.com>,<AM6PR05MB522451244C4ECB0E63D69424A2900@AM6PR05MB5224.eurprd05.prod.outlook.com>
In-Reply-To: 
 <AM6PR05MB522451244C4ECB0E63D69424A2900@AM6PR05MB5224.eurprd05.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB6PR05MB3223750A26A7B56F56FD5203A1660DB6PR05MB3223eurp_"
MIME-Version: 1.0
To: Vadim Pasternak <vadimp@mellanox.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, David Woods <dwoods@mellanox.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--_000_DB6PR05MB3223750A26A7B56F56FD5203A1660DB6PR05MB3223eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks Vadim! The v9 has been posted to solve these comments. (Also thanks =
a lot for the comments in the internal review.)


Regards,

Liming

________________________________
From: Vadim Pasternak
Sent: Wednesday, January 30, 2019 1:24 AM
To: Liming Sun; Rob Herring; Mark Rutland; Arnd Bergmann; David Woods; Andy=
 Shevchenko; Darren Hart
Cc: Liming Sun; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; p=
latform-driver-x86@vger.kernel.org
Subject: RE: [PATCH v8 1/2] platform/mellanox: Add TmFifo driver for Mellan=
ox BlueField Soc



> -----Original Message-----
> From: Liming Sun <lsun@mellanox.com>
> Sent: Monday, January 28, 2019 7:28 PM
> To: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Arnd Bergmann <arnd@arndb.de>; David Woods
> <dwoods@mellanox.com>; Andy Shevchenko <andy@infradead.org>; Darren
> Hart <dvhart@infradead.org>; Vadim Pasternak <vadimp@mellanox.com>
> Cc: Liming Sun <lsun@mellanox.com>; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
> Subject: [PATCH v8 1/2] platform/mellanox: Add TmFifo driver for Mellanox
> BlueField Soc
>
> This commit adds the TmFifo platform driver for Mellanox BlueField Soc. T=
mFifo
> is a shared FIFO which enables external host machine to exchange data wit=
h the
> SoC via USB or PCIe. The driver is based on virtio framework and has cons=
ole
> and network access enabled.
>
> Reviewed-by: David Woods <dwoods@mellanox.com>
> Signed-off-by: Liming Sun <lsun@mellanox.com>
> ---
>  drivers/platform/mellanox/Kconfig             |   13 +-
>  drivers/platform/mellanox/Makefile            |    1 +
>  drivers/platform/mellanox/mlxbf-tmfifo-regs.h |   67 ++
>  drivers/platform/mellanox/mlxbf-tmfifo.c      | 1289
> +++++++++++++++++++++++++
>  4 files changed, 1369 insertions(+), 1 deletion(-)  create mode 100644
> drivers/platform/mellanox/mlxbf-tmfifo-regs.h
>  create mode 100644 drivers/platform/mellanox/mlxbf-tmfifo.c
>
> diff --git a/drivers/platform/mellanox/Kconfig
> b/drivers/platform/mellanox/Kconfig
> index cd8a908..a565070 100644
> --- a/drivers/platform/mellanox/Kconfig
> +++ b/drivers/platform/mellanox/Kconfig
> @@ -5,7 +5,7 @@
>
>  menuconfig MELLANOX_PLATFORM
>        bool "Platform support for Mellanox hardware"
> -     depends on X86 || ARM || COMPILE_TEST
> +     depends on X86 || ARM || ARM64 || COMPILE_TEST
>        ---help---
>          Say Y here to get to see options for platform support for
>          Mellanox systems. This option alone does not add any kernel code=
.
> @@ -34,4 +34,15 @@ config MLXREG_IO
>          to system resets operation, system reset causes monitoring and s=
ome
>          kinds of mux selection.
>
> +config MLXBF_TMFIFO
> +     tristate "Mellanox BlueField SoC TmFifo platform driver"
> +     depends on ARM64

Why you make it dependent on ARM64?
Should not it work on any host, x86?

> +     default m

User who needs it should select this option.
No need default 'm'.

> +     select VIRTIO_CONSOLE
> +     select VIRTIO_NET
> +     help
> +       Say y here to enable TmFifo support. The TmFifo driver provides
> +          platform driver support for the TmFifo which supports console
> +          and networking based on the virtio framework.
> +
>  endif # MELLANOX_PLATFORM
> diff --git a/drivers/platform/mellanox/Makefile
> b/drivers/platform/mellanox/Makefile
> index 57074d9c..f0c061d 100644
> --- a/drivers/platform/mellanox/Makefile
> +++ b/drivers/platform/mellanox/Makefile
> @@ -5,3 +5,4 @@
>  #
>  obj-$(CONFIG_MLXREG_HOTPLUG) +=3D mlxreg-hotplug.o
>  obj-$(CONFIG_MLXREG_IO) +=3D mlxreg-io.o
> +obj-$(CONFIG_MLXBF_TMFIFO)   +=3D mlxbf-tmfifo.o
> diff --git a/drivers/platform/mellanox/mlxbf-tmfifo-regs.h
> b/drivers/platform/mellanox/mlxbf-tmfifo-regs.h
> new file mode 100644
> index 0000000..90c9c2cf
> --- /dev/null
> +++ b/drivers/platform/mellanox/mlxbf-tmfifo-regs.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019, Mellanox Technologies. All rights reserved.
> + */
> +
> +#ifndef __MLXBF_TMFIFO_REGS_H__
> +#define __MLXBF_TMFIFO_REGS_H__
> +
> +#include <linux/types.h>
> +
> +#define MLXBF_TMFIFO_TX_DATA 0x0
> +
> +#define MLXBF_TMFIFO_TX_STS 0x8
> +#define MLXBF_TMFIFO_TX_STS__LENGTH 0x0001 #define
> +MLXBF_TMFIFO_TX_STS__COUNT_SHIFT 0 #define
> +MLXBF_TMFIFO_TX_STS__COUNT_WIDTH 9 #define
> +MLXBF_TMFIFO_TX_STS__COUNT_RESET_VAL 0 #define
> +MLXBF_TMFIFO_TX_STS__COUNT_RMASK 0x1ff #define
> +MLXBF_TMFIFO_TX_STS__COUNT_MASK  0x1ff
> +
> +#define MLXBF_TMFIFO_TX_CTL 0x10
> +#define MLXBF_TMFIFO_TX_CTL__LENGTH 0x0001 #define
> +MLXBF_TMFIFO_TX_CTL__LWM_SHIFT 0 #define
> MLXBF_TMFIFO_TX_CTL__LWM_WIDTH
> +8 #define MLXBF_TMFIFO_TX_CTL__LWM_RESET_VAL 128 #define
> +MLXBF_TMFIFO_TX_CTL__LWM_RMASK 0xff #define
> +MLXBF_TMFIFO_TX_CTL__LWM_MASK  0xff #define
> +MLXBF_TMFIFO_TX_CTL__HWM_SHIFT 8 #define
> MLXBF_TMFIFO_TX_CTL__HWM_WIDTH
> +8 #define MLXBF_TMFIFO_TX_CTL__HWM_RESET_VAL 128 #define
> +MLXBF_TMFIFO_TX_CTL__HWM_RMASK 0xff #define
> +MLXBF_TMFIFO_TX_CTL__HWM_MASK  0xff00 #define
> +MLXBF_TMFIFO_TX_CTL__MAX_ENTRIES_SHIFT 32 #define
> +MLXBF_TMFIFO_TX_CTL__MAX_ENTRIES_WIDTH 9 #define
> +MLXBF_TMFIFO_TX_CTL__MAX_ENTRIES_RESET_VAL 256 #define
> +MLXBF_TMFIFO_TX_CTL__MAX_ENTRIES_RMASK 0x1ff #define
> +MLXBF_TMFIFO_TX_CTL__MAX_ENTRIES_MASK  0x1ff00000000ULL
> +
> +#define MLXBF_TMFIFO_RX_DATA 0x0
> +
> +#define MLXBF_TMFIFO_RX_STS 0x8
> +#define MLXBF_TMFIFO_RX_STS__LENGTH 0x0001 #define
> +MLXBF_TMFIFO_RX_STS__COUNT_SHIFT 0 #define
> +MLXBF_TMFIFO_RX_STS__COUNT_WIDTH 9 #define
> +MLXBF_TMFIFO_RX_STS__COUNT_RESET_VAL 0 #define
> +MLXBF_TMFIFO_RX_STS__COUNT_RMASK 0x1ff #define
> +MLXBF_TMFIFO_RX_STS__COUNT_MASK  0x1ff
> +
> +#define MLXBF_TMFIFO_RX_CTL 0x10
> +#define MLXBF_TMFIFO_RX_CTL__LENGTH 0x0001 #define
> +MLXBF_TMFIFO_RX_CTL__LWM_SHIFT 0 #define
> MLXBF_TMFIFO_RX_CTL__LWM_WIDTH
> +8 #define MLXBF_TMFIFO_RX_CTL__LWM_RESET_VAL 128 #define
> +MLXBF_TMFIFO_RX_CTL__LWM_RMASK 0xff #define
> +MLXBF_TMFIFO_RX_CTL__LWM_MASK  0xff #define
> +MLXBF_TMFIFO_RX_CTL__HWM_SHIFT 8 #define
> MLXBF_TMFIFO_RX_CTL__HWM_WIDTH
> +8 #define MLXBF_TMFIFO_RX_CTL__HWM_RESET_VAL 128 #define
> +MLXBF_TMFIFO_RX_CTL__HWM_RMASK 0xff #define
> +MLXBF_TMFIFO_RX_CTL__HWM_MASK  0xff00 #define
> +MLXBF_TMFIFO_RX_CTL__MAX_ENTRIES_SHIFT 32 #define
> +MLXBF_TMFIFO_RX_CTL__MAX_ENTRIES_WIDTH 9 #define
> +MLXBF_TMFIFO_RX_CTL__MAX_ENTRIES_RESET_VAL 256 #define
> +MLXBF_TMFIFO_RX_CTL__MAX_ENTRIES_RMASK 0x1ff #define
> +MLXBF_TMFIFO_RX_CTL__MAX_ENTRIES_MASK  0x1ff00000000ULL
> +
> +#endif /* !defined(__MLXBF_TMFIFO_REGS_H__) */
> diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c
> b/drivers/platform/mellanox/mlxbf-tmfifo.c
> new file mode 100644
> index 0000000..c1afe47
> --- /dev/null
> +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
> @@ -0,0 +1,1289 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Mellanox BlueField SoC TmFifo driver
> + *
> + * Copyright (C) 2019 Mellanox Technologies  */
> +
> +#include <linux/acpi.h>
> +#include <linux/bitfield.h>
> +#include <linux/cache.h>
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/efi.h>
> +#include <linux/io.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/kernel.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/resource.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/version.h>
> +#include <linux/virtio.h>
> +#include <linux/virtio_config.h>
> +#include <linux/virtio_console.h>
> +#include <linux/virtio_ids.h>
> +#include <linux/virtio_net.h>
> +#include <linux/virtio_ring.h>
> +#include <asm/byteorder.h>

Is it must ti include from asm?
Could it be replaced with something like
#include <linux/byteorder/generic.h>

> +
> +#include "mlxbf-tmfifo-regs.h"
> +
> +/* Vring size. */
> +#define MLXBF_TMFIFO_VRING_SIZE                      1024
> +
> +/* Console Tx buffer size. */
> +#define MLXBF_TMFIFO_CONS_TX_BUF_SIZE                (32 * 1024)
> +
> +/* House-keeping timer interval. */
> +static int mlxbf_tmfifo_timer_interval =3D HZ / 10;
> +
> +/* Global lock. */
> +static DEFINE_MUTEX(mlxbf_tmfifo_lock);
> +
> +/* Virtual devices sharing the TM FIFO. */
> +#define MLXBF_TMFIFO_VDEV_MAX                (VIRTIO_ID_CONSOLE + 1)
> +
> +/* Struct declaration. */
> +struct mlxbf_tmfifo;
> +
> +/* Structure to maintain the ring state. */ struct mlxbf_tmfifo_vring {
> +     void *va;                       /* virtual address */
> +     dma_addr_t dma;                 /* dma address */
> +     struct virtqueue *vq;           /* virtqueue pointer */
> +     struct vring_desc *desc;        /* current desc */
> +     struct vring_desc *desc_head;   /* current desc head */
> +     int cur_len;                    /* processed len in current desc */
> +     int rem_len;                    /* remaining length to be processed=
 */
> +     int size;                       /* vring size */
> +     int align;                      /* vring alignment */
> +     int id;                         /* vring id */
> +     int vdev_id;                    /* TMFIFO_VDEV_xxx */
> +     u32 pkt_len;                    /* packet total length */
> +     __virtio16 next_avail;          /* next avail desc id */
> +     struct mlxbf_tmfifo *fifo;      /* pointer back to the tmfifo */
> +};
> +
> +/* Interrupt types. */
> +enum {
> +     MLXBF_TM_RX_LWM_IRQ,            /* Rx low water mark irq */
> +     MLXBF_TM_RX_HWM_IRQ,            /* Rx high water mark irq */
> +     MLXBF_TM_TX_LWM_IRQ,            /* Tx low water mark irq */
> +     MLXBF_TM_TX_HWM_IRQ,            /* Tx high water mark irq */
> +     MLXBF_TM_IRQ_CNT
> +};
> +
> +/* Ring types (Rx & Tx). */
> +enum {
> +     MLXBF_TMFIFO_VRING_RX,          /* Rx ring */
> +     MLXBF_TMFIFO_VRING_TX,          /* Tx ring */
> +     MLXBF_TMFIFO_VRING_NUM
> +};
> +
> +struct mlxbf_tmfifo_vdev {
> +     struct virtio_device vdev;      /* virtual device */
> +     u8 status;
> +     u64 features;
> +     union {                         /* virtio config space */
> +             struct virtio_console_config cons;
> +             struct virtio_net_config net;
> +     } config;
> +     struct mlxbf_tmfifo_vring vrings[MLXBF_TMFIFO_VRING_NUM];
> +     u8 *tx_buf;                     /* tx buffer */
> +     u32 tx_head;                    /* tx buffer head */
> +     u32 tx_tail;                    /* tx buffer tail */
> +};
> +
> +struct mlxbf_tmfifo_irq_info {
> +     struct mlxbf_tmfifo *fifo;      /* tmfifo structure */
> +     int irq;                        /* interrupt number */
> +     int index;                      /* array index */
> +};
> +
> +/* TMFIFO device structure */
> +struct mlxbf_tmfifo {
> +     struct mlxbf_tmfifo_vdev *vdev[MLXBF_TMFIFO_VDEV_MAX]; /*
> devices */
> +     struct platform_device *pdev;   /* platform device */
> +     struct mutex lock;              /* fifo lock */
> +     void __iomem *rx_base;          /* mapped register base */
> +     void __iomem *tx_base;          /* mapped register base */
> +     int tx_fifo_size;               /* number of entries of the Tx FIFO=
 */
> +     int rx_fifo_size;               /* number of entries of the Rx FIFO=
 */
> +     unsigned long pend_events;      /* pending bits for deferred proces=
s */
> +     struct mlxbf_tmfifo_irq_info irq_info[MLXBF_TM_IRQ_CNT]; /* irq inf=
o
> */
> +     struct work_struct work;        /* work struct for deferred process=
 */
> +     struct timer_list timer;        /* keepalive timer */
> +     struct mlxbf_tmfifo_vring *vring[2];    /* current Tx/Rx ring */
> +     bool is_ready;                  /* ready flag */
> +     spinlock_t spin_lock;           /* spin lock */
> +};
> +
> +union mlxbf_tmfifo_msg_hdr {
> +     struct {
> +             u8 type;                /* message type */
> +             __be16 len;             /* payload length */
> +             u8 unused[5];           /* reserved, set to 0 */
> +     } __packed;
> +     u64 data;
> +};
> +
> +/*
> + * Default MAC.
> + * This MAC address will be read from EFI persistent variable if configu=
red.
> + * It can also be reconfigured with standard Linux tools.
> + */
> +static u8 mlxbf_tmfifo_net_default_mac[6] =3D {
> +     0x00, 0x1A, 0xCA, 0xFF, 0xFF, 0x01};
> +
> +/* MTU setting of the virtio-net interface. */
> +#define MLXBF_TMFIFO_NET_MTU         1500
> +
> +/* Maximum L2 header length. */
> +#define MLXBF_TMFIFO_NET_L2_OVERHEAD 36
> +
> +/* Supported virtio-net features. */
> +#define MLXBF_TMFIFO_NET_FEATURES    ((1UL << VIRTIO_NET_F_MTU)
> | \
> +                                      (1UL << VIRTIO_NET_F_STATUS) | \
> +                                      (1UL << VIRTIO_NET_F_MAC))
> +
> +/* Return the consumed Tx buffer space. */ static int
> +mlxbf_tmfifo_vdev_tx_buf_len(struct mlxbf_tmfifo_vdev *vdev) {
> +     return ((vdev->tx_tail >=3D vdev->tx_head) ?
> +            (vdev->tx_tail - vdev->tx_head) :
> +            (MLXBF_TMFIFO_CONS_TX_BUF_SIZE - vdev->tx_head +
> +vdev->tx_tail)); }

I would suggest to split the above.

> +
> +/* Return the available Tx buffer space. */ static int
> +mlxbf_tmfifo_vdev_tx_buf_avail(struct mlxbf_tmfifo_vdev *vdev) {
> +     return (MLXBF_TMFIFO_CONS_TX_BUF_SIZE - 8 -

Thins about some extra define for
"MLXBF_TMFIFO_CONS_TX_BUF_SIZE - 8"

> +             mlxbf_tmfifo_vdev_tx_buf_len(vdev));
> +}
> +
> +/* Update Tx buffer pointer after pushing data. */ static void
> +mlxbf_tmfifo_vdev_tx_buf_push(struct mlxbf_tmfifo_vdev *vdev,
> +                                       u32 len)
> +{
> +     vdev->tx_tail +=3D len;
> +     if (vdev->tx_tail >=3D MLXBF_TMFIFO_CONS_TX_BUF_SIZE)
> +             vdev->tx_tail -=3D MLXBF_TMFIFO_CONS_TX_BUF_SIZE; }
> +
> +/* Update Tx buffer pointer after popping data. */ static void
> +mlxbf_tmfifo_vdev_tx_buf_pop(struct mlxbf_tmfifo_vdev *vdev,
> +                                      u32 len)
> +{
> +     vdev->tx_head +=3D len;
> +     if (vdev->tx_head >=3D MLXBF_TMFIFO_CONS_TX_BUF_SIZE)
> +             vdev->tx_head -=3D MLXBF_TMFIFO_CONS_TX_BUF_SIZE; }
> +
> +/* Allocate vrings for the fifo. */
> +static int mlxbf_tmfifo_alloc_vrings(struct mlxbf_tmfifo *fifo,
> +                                  struct mlxbf_tmfifo_vdev *tm_vdev,
> +                                  int vdev_id)
> +{
> +     struct mlxbf_tmfifo_vring *vring;
> +     dma_addr_t dma;
> +     int i, size;
> +     void *va;
> +
> +     for (i =3D 0; i < ARRAY_SIZE(tm_vdev->vrings); i++) {
> +             vring =3D &tm_vdev->vrings[i];
> +             vring->fifo =3D fifo;
> +             vring->size =3D MLXBF_TMFIFO_VRING_SIZE;
> +             vring->align =3D SMP_CACHE_BYTES;
> +             vring->id =3D i;
> +             vring->vdev_id =3D vdev_id;
> +
> +             size =3D PAGE_ALIGN(vring_size(vring->size, vring->align));
> +             va =3D dma_alloc_coherent(tm_vdev->vdev.dev.parent, size,
> &dma,
> +                                     GFP_KERNEL);
> +             if (!va) {
> +                     dev_err(tm_vdev->vdev.dev.parent,
> +                             "vring allocation failed\n");
> +                     return -EINVAL;
> +             }
> +
> +             vring->va =3D va;
> +             vring->dma =3D dma;
> +     }
> +
> +     return 0;
> +}
> +
> +/* Free vrings of the fifo device. */
> +static void mlxbf_tmfifo_free_vrings(struct mlxbf_tmfifo *fifo, int
> +vdev_id) {
> +     struct mlxbf_tmfifo_vdev *tm_vdev =3D fifo->vdev[vdev_id];
> +     struct mlxbf_tmfifo_vring *vring;
> +     int i, size;
> +
> +     for (i =3D 0; i < ARRAY_SIZE(tm_vdev->vrings); i++) {
> +             vring =3D &tm_vdev->vrings[i];
> +
> +             size =3D PAGE_ALIGN(vring_size(vring->size, vring->align));
> +             if (vring->va) {
> +                     dma_free_coherent(tm_vdev->vdev.dev.parent, size,
> +                                       vring->va, vring->dma);
> +                     vring->va =3D NULL;
> +                     if (vring->vq) {
> +                             vring_del_virtqueue(vring->vq);
> +                             vring->vq =3D NULL;
> +                     }
> +             }
> +     }
> +}
> +
> +/* Free interrupts of the fifo device. */ static void
> +mlxbf_tmfifo_free_irqs(struct mlxbf_tmfifo *fifo) {
> +     int i, irq;
> +
> +     for (i =3D 0; i < MLXBF_TM_IRQ_CNT; i++) {
> +             irq =3D fifo->irq_info[i].irq;
> +             if (irq) {
> +                     fifo->irq_info[i].irq =3D 0;
> +                     disable_irq(irq);
> +                     free_irq(irq, (u8 *)fifo + i);
> +             }
> +     }
> +}
> +
> +/* Interrupt handler. */
> +static irqreturn_t mlxbf_tmfifo_irq_handler(int irq, void *arg) {
> +     struct mlxbf_tmfifo_irq_info *irq_info;
> +
> +     irq_info =3D (struct mlxbf_tmfifo_irq_info *)arg;
> +
> +     if (irq_info->index < MLXBF_TM_IRQ_CNT &&
> +         !test_and_set_bit(irq_info->index, &irq_info->fifo->pend_events=
))
> +             schedule_work(&irq_info->fifo->work);
> +
> +     return IRQ_HANDLED;
> +}
> +
> +/* Nothing to do for now. */
> +static void mlxbf_tmfifo_virtio_dev_release(struct device *dev) { }

If there is nothing to do - no reason to have it.

> +
> +/* Get the next packet descriptor from the vring. */ static inline
> +struct vring_desc * mlxbf_tmfifo_virtio_get_next_desc(struct virtqueue
> +*vq) {
> +     struct mlxbf_tmfifo_vring *vring;
> +     unsigned int idx, head;
> +     struct vring *vr;
> +
> +     vring =3D (struct mlxbf_tmfifo_vring *)vq->priv;
> +     vr =3D (struct vring *)virtqueue_get_vring(vq);
> +
> +     if (!vr || vring->next_avail =3D=3D vr->avail->idx)
> +             return NULL;
> +
> +     idx =3D vring->next_avail % vr->num;
> +     head =3D vr->avail->ring[idx];
> +     BUG_ON(head >=3D vr->num);
> +     vring->next_avail++;
> +     return &vr->desc[head];
> +}
> +
> +static inline void mlxbf_tmfifo_virtio_release_desc(
> +     struct virtio_device *vdev, struct vring *vr,
> +     struct vring_desc *desc, u32 len)
> +{
> +     unsigned int idx;
> +
> +     idx =3D vr->used->idx % vr->num;
> +     vr->used->ring[idx].id =3D desc - vr->desc;
> +     vr->used->ring[idx].len =3D cpu_to_virtio32(vdev, len);
> +
> +     /* Virtio could poll and check the 'idx' to decide
> +      * whether the desc is done or not. Add a memory
> +      * barrier here to make sure the update above completes
> +      * before updating the idx.
> +      */
> +     mb();
> +     vr->used->idx++;
> +}
> +
> +/* Get the total length of a descriptor chain. */ static inline u32
> +mlxbf_tmfifo_virtio_get_pkt_len(struct virtio_device *vdev,
> +                                               struct vring_desc *desc,
> +                                               struct vring *vr)
> +{
> +     u32 len =3D 0, idx;
> +
> +     while (desc) {
> +             len +=3D virtio32_to_cpu(vdev, desc->len);
> +             if (!(virtio16_to_cpu(vdev, desc->flags) &
> VRING_DESC_F_NEXT))
> +                     break;
> +             idx =3D virtio16_to_cpu(vdev, desc->next);
> +             desc =3D &vr->desc[idx];
> +     }
> +
> +     return len;
> +}
> +
> +static void mlxbf_tmfifo_release_pkt(struct virtio_device *vdev,
> +                                  struct mlxbf_tmfifo_vring *vring,
> +                                  struct vring_desc **desc)
> +{
> +     struct vring *vr =3D (struct vring *)virtqueue_get_vring(vring->vq)=
;
> +     struct vring_desc *desc_head;
> +     uint32_t pkt_len =3D 0;
> +
> +     if (!vr)
> +             return;
> +
> +     if (desc !=3D NULL && *desc !=3D NULL && vring->desc_head !=3D NULL=
) {
> +             desc_head =3D vring->desc_head;
> +             pkt_len =3D vring->pkt_len;
> +     } else {
> +             desc_head =3D mlxbf_tmfifo_virtio_get_next_desc(vring->vq);
> +             if (desc_head !=3D NULL) {
> +                     pkt_len =3D mlxbf_tmfifo_virtio_get_pkt_len(
> +                             vdev, desc_head, vr);
> +             }
> +     }
> +
> +     if (desc_head !=3D NULL)
> +             mlxbf_tmfifo_virtio_release_desc(vdev, vr, desc_head,
> pkt_len);
> +
> +     if (desc !=3D NULL)
> +             *desc =3D NULL;
> +     vring->pkt_len =3D 0;
> +}
> +
> +/* House-keeping timer. */
> +static void mlxbf_tmfifo_timer(struct timer_list *arg) {
> +     struct mlxbf_tmfifo *fifo;
> +
> +     fifo =3D container_of(arg, struct mlxbf_tmfifo, timer);
> +
> +     /*
> +      * Wake up the work handler to poll the Rx FIFO in case interrupt
> +      * missing or any leftover bytes stuck in the FIFO.
> +      */
> +     test_and_set_bit(MLXBF_TM_RX_HWM_IRQ, &fifo->pend_events);
> +
> +     /*
> +      * Wake up Tx handler in case virtio has queued too many packets
> +      * and are waiting for buffer return.
> +      */
> +     test_and_set_bit(MLXBF_TM_TX_LWM_IRQ, &fifo->pend_events);
> +
> +     schedule_work(&fifo->work);
> +
> +     mod_timer(&fifo->timer, jiffies + mlxbf_tmfifo_timer_interval); }
> +
> +/* Buffer the console output. */
> +static void mlxbf_tmfifo_console_output(struct mlxbf_tmfifo_vdev *cons,
> +                                     struct virtqueue *vq)
> +{
> +     struct vring *vr =3D (struct vring *)virtqueue_get_vring(vq);
> +     struct vring_desc *head_desc, *desc =3D NULL;
> +     struct virtio_device *vdev =3D &cons->vdev;
> +     u32 len, pkt_len, idx;
> +     void *addr;
> +
> +     for (;;) {

It's better to modify it as while(on some condition)

> +             head_desc =3D mlxbf_tmfifo_virtio_get_next_desc(vq);
> +             if (head_desc =3D=3D NULL)
> +                     break;
> +
> +             /* Release the packet if no more space. */
> +             pkt_len =3D mlxbf_tmfifo_virtio_get_pkt_len(vdev, head_desc=
,
> vr);
> +             if (pkt_len > mlxbf_tmfifo_vdev_tx_buf_avail(cons)) {
> +                     mlxbf_tmfifo_virtio_release_desc(vdev, vr, head_des=
c,
> +                                                      pkt_len);

Why do you break line here?

> +                     break;
> +             }
> +
> +             desc =3D head_desc;
> +
> +             while (desc !=3D NULL) {
> +                     addr =3D phys_to_virt(virtio64_to_cpu(vdev, desc->a=
ddr));
> +                     len =3D virtio32_to_cpu(vdev, desc->len);
> +
> +                     if (len <=3D MLXBF_TMFIFO_CONS_TX_BUF_SIZE -
> +                         cons->tx_tail) {

Why do you break line here? Also below I see few strange breaks.

> +                             memcpy(cons->tx_buf + cons->tx_tail, addr,
> len);
> +                     } else {
> +                             u32 seg;
> +
> +                             seg =3D MLXBF_TMFIFO_CONS_TX_BUF_SIZE -
> +                                     cons->tx_tail;
> +                             memcpy(cons->tx_buf + cons->tx_tail, addr,
> seg);
> +                             addr +=3D seg;
> +                             memcpy(cons->tx_buf, addr, len - seg);
> +                     }
> +                     mlxbf_tmfifo_vdev_tx_buf_push(cons, len);
> +
> +                     if (!(virtio16_to_cpu(vdev, desc->flags) &
> +                         VRING_DESC_F_NEXT))
> +                             break;
> +                     idx =3D virtio16_to_cpu(vdev, desc->next);
> +                     desc =3D &vr->desc[idx];
> +             }
> +
> +             mlxbf_tmfifo_virtio_release_desc(vdev, vr, head_desc,
> pkt_len);
> +     }
> +}
> +
> +/* Rx & Tx processing of a virtual queue. */ static void
> +mlxbf_tmfifo_virtio_rxtx(struct virtqueue *vq, bool is_rx) {
> +     int num_avail =3D 0, hdr_len, tx_reserve;
> +     struct mlxbf_tmfifo_vring *vring;
> +     struct mlxbf_tmfifo_vdev *cons;
> +     struct virtio_device *vdev;
> +     struct mlxbf_tmfifo *fifo;
> +     struct vring_desc *desc;
> +     unsigned long flags;
> +     struct vring *vr;
> +     u64 sts, data;
> +     u32 len, idx;
> +     void *addr;
> +
> +     if (!vq)
> +             return;
> +
> +     vring =3D (struct mlxbf_tmfifo_vring *)vq->priv;
> +     fifo =3D vring->fifo;
> +     vr =3D (struct vring *)virtqueue_get_vring(vq);
> +
> +     if (!fifo->vdev[vring->vdev_id])
> +             return;
> +     vdev =3D &fifo->vdev[vring->vdev_id]->vdev;
> +     cons =3D fifo->vdev[VIRTIO_ID_CONSOLE];
> +
> +     /* Don't continue if another vring is running. */
> +     if (fifo->vring[is_rx] !=3D NULL && fifo->vring[is_rx] !=3D vring)
> +             return;
> +
> +     /* tx_reserve is used to reserved some room in FIFO for console. */
> +     if (vring->vdev_id =3D=3D VIRTIO_ID_NET) {
> +             hdr_len =3D sizeof(struct virtio_net_hdr);
> +             tx_reserve =3D fifo->tx_fifo_size / 16;

Use some define instead of 16/

> +     } else {
> +             BUG_ON(vring->vdev_id !=3D VIRTIO_ID_CONSOLE);
> +             hdr_len =3D 0;
> +             tx_reserve =3D 1;
> +     }
> +
> +     desc =3D vring->desc;
> +
> +     while (1) {

I see there are few drivers in platform which use while (1)
But it looks better to use while(some condition)
and instead of break change this condition to false.

> +             /* Get available FIFO space. */
> +             if (num_avail =3D=3D 0) {
> +                     if (is_rx) {
> +                             /* Get the number of available words in FIF=
O.
> */
> +                             sts =3D readq(fifo->rx_base +
> +                                         MLXBF_TMFIFO_RX_STS);
> +                             num_avail =3D FIELD_GET(
> +
>        MLXBF_TMFIFO_RX_STS__COUNT_MASK, sts);

                                num_avail =3D FIELD_GET(TMFIFO_RX_STS__COUN=
T_MASK, sts);

> +
> +                             /* Don't continue if nothing in FIFO. */
> +                             if (num_avail <=3D 0)
> +                                     break;
> +                     } else {
> +                             /* Get available space in FIFO. */
> +                             sts =3D readq(fifo->tx_base +
> +                                         MLXBF_TMFIFO_TX_STS);
> +                             num_avail =3D fifo->tx_fifo_size - tx_reser=
ve -
> +                                     FIELD_GET(
> +
>        MLXBF_TMFIFO_TX_STS__COUNT_MASK,
> +                                             sts);

Same as above.

> +
> +                             if (num_avail <=3D 0)
> +                                     break;
> +                     }
> +             }
> +
> +             /* Console output always comes from the Tx buffer. */
> +             if (!is_rx && vring->vdev_id =3D=3D VIRTIO_ID_CONSOLE &&
> +                 cons !=3D NULL && cons->tx_buf !=3D NULL) {
> +                     union mlxbf_tmfifo_msg_hdr hdr;
> +                     int size;
> +
> +                     size =3D mlxbf_tmfifo_vdev_tx_buf_len(cons);
> +                     if (num_avail < 2 || size =3D=3D 0)
> +                             return;
> +                     if (size + sizeof(hdr) > num_avail * sizeof(u64))
> +                             size =3D num_avail * sizeof(u64) - sizeof(h=
dr);
> +                     /* Write header. */
> +                     hdr.data =3D 0;
> +                     hdr.type =3D VIRTIO_ID_CONSOLE;
> +                     hdr.len =3D htons(size);
> +                     writeq(cpu_to_le64(hdr.data),
> +                            fifo->tx_base + MLXBF_TMFIFO_TX_DATA);
> +
> +                     spin_lock_irqsave(&fifo->spin_lock, flags);
> +                     while (size > 0) {
> +                             addr =3D cons->tx_buf + cons->tx_head;
> +
> +                             if (cons->tx_head + sizeof(u64) <=3D
> +                                 MLXBF_TMFIFO_CONS_TX_BUF_SIZE) {
> +                                     memcpy(&data, addr, sizeof(u64));
> +                             } else {
> +                                     int partial;
> +
> +                                     partial =3D
> +
>        MLXBF_TMFIFO_CONS_TX_BUF_SIZE -
> +                                             cons->tx_head;
> +
> +                                     memcpy(&data, addr, partial);
> +                                     memcpy((u8 *)&data + partial,
> +                                            cons->tx_buf,
> +                                            sizeof(u64) - partial);
> +                             }
> +                             writeq(data,
> +                                    fifo->tx_base + MLXBF_TMFIFO_TX_DATA=
);
> +
> +                             if (size >=3D sizeof(u64)) {
> +                                     mlxbf_tmfifo_vdev_tx_buf_pop(
> +                                             cons, sizeof(u64));
> +                                     size -=3D sizeof(u64);
> +                             } else {
> +                                     mlxbf_tmfifo_vdev_tx_buf_pop(
> +                                             cons, size);
> +                                     size =3D 0;
> +                             }
> +                     }
> +                     spin_unlock_irqrestore(&fifo->spin_lock, flags);
> +                     return;
> +             }
> +
> +             /* Get the desc of next packet. */
> +             if (!desc) {
> +                     /* Save the head desc of the chain. */
> +                     vring->desc_head =3D
> +                             mlxbf_tmfifo_virtio_get_next_desc(vq);
> +                     if (!vring->desc_head) {
> +                             vring->desc =3D NULL;
> +                             return;
> +                     }
> +                     desc =3D vring->desc_head;
> +                     vring->desc =3D desc;
> +
> +                     if (is_rx && vring->vdev_id =3D=3D VIRTIO_ID_NET) {
> +                             struct virtio_net_hdr *net_hdr;
> +
> +                             /* Initialize the packet header. */
> +                             net_hdr =3D (struct virtio_net_hdr *)
> +                                     phys_to_virt(virtio64_to_cpu(
> +                                             vdev, desc->addr));
> +                             memset(net_hdr, 0, sizeof(*net_hdr));
> +                     }
> +             }
> +
> +             /* Beginning of each packet. */
> +             if (vring->pkt_len =3D=3D 0) {
> +                     int vdev_id, vring_change =3D 0;
> +                     union mlxbf_tmfifo_msg_hdr hdr;
> +
> +                     num_avail--;
> +
> +                     /* Read/Write packet length. */
> +                     if (is_rx) {
> +                             hdr.data =3D readq(fifo->rx_base +
> +                                              MLXBF_TMFIFO_RX_DATA);
> +                             hdr.data =3D le64_to_cpu(hdr.data);
> +
> +                             /* Skip the length 0 packet (keepalive). */
> +                             if (hdr.len =3D=3D 0)
> +                                     continue;
> +
> +                             /* Check packet type. */
> +                             if (hdr.type =3D=3D VIRTIO_ID_NET) {
> +                                     struct virtio_net_config *config;
> +
> +                                     vdev_id =3D VIRTIO_ID_NET;
> +                                     hdr_len =3D sizeof(struct virtio_ne=
t_hdr);
> +                                     config =3D
> +                                         &fifo->vdev[vdev_id]->config.ne=
t;
> +                                     if (ntohs(hdr.len) > config->mtu +
> +
>        MLXBF_TMFIFO_NET_L2_OVERHEAD)
> +                                             continue;
> +                             } else if (hdr.type =3D=3D VIRTIO_ID_CONSOL=
E) {
> +                                     vdev_id =3D VIRTIO_ID_CONSOLE;
> +                                     hdr_len =3D 0;
> +                             } else {
> +                                     continue;
> +                             }
> +
> +                             /*
> +                              * Check whether the new packet still belon=
gs
> +                              * to this vring or not. If not, update the
> +                              * pkt_len of the new vring and return.
> +                              */
> +                             if (vdev_id !=3D vring->vdev_id) {
> +                                     struct mlxbf_tmfifo_vdev *dev2 =3D
> +                                             fifo->vdev[vdev_id];
> +
> +                                     if (!dev2)
> +                                             break;
> +                                     vring->desc =3D desc;
> +                                     vring =3D
> +                                       &dev2-
> >vrings[MLXBF_TMFIFO_VRING_RX];
> +                                     vring_change =3D 1;
> +                             }
> +                             vring->pkt_len =3D ntohs(hdr.len) + hdr_len=
;
> +                     } else {
> +                             vring->pkt_len =3D
> +                                     mlxbf_tmfifo_virtio_get_pkt_len(
> +                                             vdev, desc, vr);
> +
> +                             hdr.data =3D 0;
> +                             hdr.type =3D (vring->vdev_id =3D=3D VIRTIO_=
ID_NET) ?
> +                                     VIRTIO_ID_NET :
> +                                     VIRTIO_ID_CONSOLE;
> +                             hdr.len =3D htons(vring->pkt_len - hdr_len)=
;
> +                             writeq(cpu_to_le64(hdr.data),
> +                                    fifo->tx_base + MLXBF_TMFIFO_TX_DATA=
);
> +                     }
> +
> +                     vring->cur_len =3D hdr_len;
> +                     vring->rem_len =3D vring->pkt_len;
> +                     fifo->vring[is_rx] =3D vring;
> +
> +                     if (vring_change)
> +                             return;
> +                     continue;
> +             }
> +
> +             /* Check available space in this desc. */
> +             len =3D virtio32_to_cpu(vdev, desc->len);
> +             if (len > vring->rem_len)
> +                     len =3D vring->rem_len;
> +
> +             /* Check if the current desc is already done. */
> +             if (vring->cur_len =3D=3D len)
> +                     goto check_done;
> +
> +             addr =3D phys_to_virt(virtio64_to_cpu(vdev, desc->addr));
> +
> +             /* Read a word from FIFO for Rx. */
> +             if (is_rx) {
> +                     data =3D readq(fifo->rx_base +
> MLXBF_TMFIFO_RX_DATA);
> +                     data =3D le64_to_cpu(data);
> +             }
> +
> +             if (vring->cur_len + sizeof(u64) <=3D len) {
> +                     /* The whole word. */
> +                     if (is_rx) {
> +                             memcpy(addr + vring->cur_len, &data,
> +                                    sizeof(u64));
> +                     } else {
> +                             memcpy(&data, addr + vring->cur_len,
> +                                    sizeof(u64));
> +                     }

Why not just.
Also few places like this one below.

                        if (is_rx)
                                memcpy(addr + vring->cur_len, &data, sizeof=
(u64));
                        else
                                memcpy(&data, addr + vring->cur_len, sizeof=
(u64));

> +                     vring->cur_len +=3D sizeof(u64);
> +             } else {
> +                     /* Leftover bytes. */
> +                     BUG_ON(vring->cur_len > len);
> +                     if (is_rx) {
> +                             memcpy(addr + vring->cur_len, &data,
> +                                    len - vring->cur_len);
> +                     } else {
> +                             memcpy(&data, addr + vring->cur_len,
> +                                    len - vring->cur_len);
> +                     }
> +                     vring->cur_len =3D len;
> +             }
> +
> +             /* Write the word into FIFO for Tx. */
> +             if (!is_rx) {
> +                     writeq(cpu_to_le64(data),
> +                            fifo->tx_base + MLXBF_TMFIFO_TX_DATA);
> +             }
> +
> +             num_avail--;
> +
> +check_done:
> +             /* Check whether this desc is full or completed. */
> +             if (vring->cur_len =3D=3D len) {
> +                     vring->cur_len =3D 0;
> +                     vring->rem_len -=3D len;
> +
> +                     /* Get the next desc on the chain. */
> +                     if (vring->rem_len > 0 &&
> +                         (virtio16_to_cpu(vdev, desc->flags) &
> +                                             VRING_DESC_F_NEXT)) {
> +                             idx =3D virtio16_to_cpu(vdev, desc->next);
> +                             desc =3D &vr->desc[idx];
> +                             continue;
> +                     }
> +
> +                     /* Done and release the desc. */
> +                     mlxbf_tmfifo_release_pkt(vdev, vring, &desc);
> +                     fifo->vring[is_rx] =3D NULL;
> +
> +                     /* Notify upper layer that packet is done. */
> +                     spin_lock_irqsave(&fifo->spin_lock, flags);
> +                     vring_interrupt(0, vq);
> +                     spin_unlock_irqrestore(&fifo->spin_lock, flags);
> +                     continue;
> +             }
> +     }
> +
> +     /* Save the current desc. */
> +     vring->desc =3D desc;
> +}

I suggest to split mlxbf_tmfifo_virtio_rxtx() into few small routines.


> +
> +/* The notify function is called when new buffers are posted. */ static
> +bool mlxbf_tmfifo_virtio_notify(struct virtqueue *vq) {
> +     struct mlxbf_tmfifo_vring *vring;
> +     struct mlxbf_tmfifo *fifo;
> +     unsigned long flags;
> +
> +     vring =3D (struct mlxbf_tmfifo_vring *)vq->priv;
> +     fifo =3D vring->fifo;
> +
> +     /*
> +      * Virtio maintains vrings in pairs, even number ring for Rx
> +      * and odd number ring for Tx.
> +      */
> +     if (!(vring->id & 1)) {
> +             /* Set the RX HWM bit to start Rx. */
> +             if (!test_and_set_bit(MLXBF_TM_RX_HWM_IRQ, &fifo-
> >pend_events))
> +                     schedule_work(&fifo->work);
> +     } else {
> +             /*
> +              * Console could make blocking call with interrupts disable=
d.
> +              * In such case, the vring needs to be served right away. F=
or
> +              * other cases, just set the TX LWM bit to start Tx in the
> +              * worker handler.
> +              */
> +             if (vring->vdev_id =3D=3D VIRTIO_ID_CONSOLE) {
> +                     spin_lock_irqsave(&fifo->spin_lock, flags);
> +                     mlxbf_tmfifo_console_output(
> +                             fifo->vdev[VIRTIO_ID_CONSOLE], vq);

                        mlxbf_tmfifo_console_output(fifo->vdev[VIRTIO_ID_CO=
NSOLE], vq);

> +                     spin_unlock_irqrestore(&fifo->spin_lock, flags);
> +                     schedule_work(&fifo->work);
> +             } else if (!test_and_set_bit(MLXBF_TM_TX_LWM_IRQ,
> +                                          &fifo->pend_events))
> +                     schedule_work(&fifo->work);

                If {
                } else if {
                }

For consistency.

> +     }
> +
> +     return true;
> +}
> +
> +/* Work handler for Rx and Tx case. */
> +static void mlxbf_tmfifo_work_handler(struct work_struct *work) {
> +     struct mlxbf_tmfifo_vdev *tm_vdev;
> +     struct mlxbf_tmfifo *fifo;
> +     int i;
> +
> +     fifo =3D container_of(work, struct mlxbf_tmfifo, work);
> +     if (!fifo->is_ready)
> +             return;
> +
> +     mutex_lock(&fifo->lock);
> +
> +     /* Tx (Send data to the TmFifo). */
> +     if (test_and_clear_bit(MLXBF_TM_TX_LWM_IRQ, &fifo->pend_events)
> &&
> +                    fifo->irq_info[MLXBF_TM_TX_LWM_IRQ].irq) {
> +             for (i =3D 0; i < MLXBF_TMFIFO_VDEV_MAX; i++) {

I suggest to define local variable vq.
And have below:
                                mlxbf_tmfifo_virtio_rxtx(vq, false);

> +                     tm_vdev =3D fifo->vdev[i];
> +                     if (tm_vdev !=3D NULL) {
> +                             mlxbf_tmfifo_virtio_rxtx(
> +                                 tm_vdev-
> >vrings[MLXBF_TMFIFO_VRING_TX].vq,
> +                                 false);
> +                     }
> +             }
> +     }
> +
> +     /* Rx (Receive data from the TmFifo). */
> +     if (test_and_clear_bit(MLXBF_TM_RX_HWM_IRQ, &fifo->pend_events)
> &&
> +                    fifo->irq_info[MLXBF_TM_RX_HWM_IRQ].irq) {
> +             for (i =3D 0; i < MLXBF_TMFIFO_VDEV_MAX; i++) {
> +                     tm_vdev =3D fifo->vdev[i];

Same as above.

> +                     if (tm_vdev !=3D NULL) {
> +                             mlxbf_tmfifo_virtio_rxtx(
> +                                 tm_vdev-
> >vrings[MLXBF_TMFIFO_VRING_RX].vq,
> +                                 true);
> +                     }
> +             }
> +     }
> +
> +     mutex_unlock(&fifo->lock);
> +}
> +
> +/* Get the array of feature bits for this device. */ static u64
> +mlxbf_tmfifo_virtio_get_features(struct virtio_device *vdev) {
> +     struct mlxbf_tmfifo_vdev *tm_vdev;
> +
> +     tm_vdev =3D container_of(vdev, struct mlxbf_tmfifo_vdev, vdev);
> +     return tm_vdev->features;
> +}
> +
> +/* Confirm device features to use. */
> +static int mlxbf_tmfifo_virtio_finalize_features(struct virtio_device
> +*vdev) {
> +     struct mlxbf_tmfifo_vdev *tm_vdev;
> +
> +     tm_vdev =3D container_of(vdev, struct mlxbf_tmfifo_vdev, vdev);
> +     tm_vdev->features =3D vdev->features;
> +
> +     return 0;
> +}
> +
> +/* Free virtqueues found by find_vqs(). */ static void
> +mlxbf_tmfifo_virtio_del_vqs(struct virtio_device *vdev) {
> +     struct mlxbf_tmfifo_vdev *tm_vdev;
> +     struct mlxbf_tmfifo_vring *vring;
> +     struct virtqueue *vq;
> +     int i;
> +
> +     tm_vdev =3D container_of(vdev, struct mlxbf_tmfifo_vdev, vdev);
> +
> +     for (i =3D 0; i < ARRAY_SIZE(tm_vdev->vrings); i++) {
> +             vring =3D &tm_vdev->vrings[i];
> +
> +             /* Release the pending packet. */
> +             if (vring->desc !=3D NULL) {
> +                     mlxbf_tmfifo_release_pkt(&tm_vdev->vdev, vring,
> +                                              &vring->desc);
> +             }
> +
> +             vq =3D vring->vq;
> +             if (vq) {
> +                     vring->vq =3D NULL;
> +                     vring_del_virtqueue(vq);
> +             }
> +     }
> +}
> +
> +/* Create and initialize the virtual queues. */ static int
> +mlxbf_tmfifo_virtio_find_vqs(struct virtio_device *vdev,
> +                                     unsigned int nvqs,
> +                                     struct virtqueue *vqs[],
> +                                     vq_callback_t *callbacks[],
> +                                     const char * const names[],
> +                                     const bool *ctx,
> +                                     struct irq_affinity *desc)
> +{
> +     struct mlxbf_tmfifo_vdev *tm_vdev;
> +     struct mlxbf_tmfifo_vring *vring;
> +     int i, ret =3D -EINVAL, size;

Don't initialize ret with -EINVAL.

> +     struct virtqueue *vq;
> +
> +     tm_vdev =3D container_of(vdev, struct mlxbf_tmfifo_vdev, vdev);
> +     if (nvqs > ARRAY_SIZE(tm_vdev->vrings))
> +             return -EINVAL;
> +
> +     for (i =3D 0; i < nvqs; ++i) {
> +             if (!names[i])
> +                     goto error;
> +             vring =3D &tm_vdev->vrings[i];
> +
> +             /* zero vring */
> +             size =3D vring_size(vring->size, vring->align);
> +             memset(vring->va, 0, size);
> +             vq =3D vring_new_virtqueue(i, vring->size, vring->align, vd=
ev,
> +                                      false, false, vring->va,
> +                                      mlxbf_tmfifo_virtio_notify,
> +                                      callbacks[i], names[i]);
> +             if (!vq) {
> +                     dev_err(&vdev->dev, "vring_new_virtqueue failed\n")=
;
> +                     ret =3D -ENOMEM;
> +                     goto error;
> +             }
> +
> +             vqs[i] =3D vq;
> +             vring->vq =3D vq;
> +             vq->priv =3D vring;
> +     }
> +
> +     return 0;
> +
> +error:
> +     mlxbf_tmfifo_virtio_del_vqs(vdev);
> +     return ret;
> +}
> +
> +/* Read the status byte. */
> +static u8 mlxbf_tmfifo_virtio_get_status(struct virtio_device *vdev) {
> +     struct mlxbf_tmfifo_vdev *tm_vdev;
> +
> +     tm_vdev =3D container_of(vdev, struct mlxbf_tmfifo_vdev, vdev);
> +
> +     return tm_vdev->status;
> +}
> +
> +/* Write the status byte. */
> +static void mlxbf_tmfifo_virtio_set_status(struct virtio_device *vdev,
> +                                        u8 status)
> +{
> +     struct mlxbf_tmfifo_vdev *tm_vdev;
> +
> +     tm_vdev =3D container_of(vdev, struct mlxbf_tmfifo_vdev, vdev);
> +     tm_vdev->status =3D status;
> +}
> +
> +/* Reset the device. Not much here for now. */ static void
> +mlxbf_tmfifo_virtio_reset(struct virtio_device *vdev) {
> +     struct mlxbf_tmfifo_vdev *tm_vdev;
> +
> +     tm_vdev =3D container_of(vdev, struct mlxbf_tmfifo_vdev, vdev);
> +     tm_vdev->status =3D 0;
> +}
> +
> +/* Read the value of a configuration field. */ static void
> +mlxbf_tmfifo_virtio_get(struct virtio_device *vdev,
> +                           unsigned int offset,
> +                           void *buf,
> +                           unsigned int len)
> +{
> +     struct mlxbf_tmfifo_vdev *tm_vdev;
> +
> +     tm_vdev =3D container_of(vdev, struct mlxbf_tmfifo_vdev, vdev);
> +

        unsigned int pos =3D offset + len;

        if (pos > sizeof(tm_vdev->config) || pos < len)


> +     if (offset + len > sizeof(tm_vdev->config) || offset + len < len) {
> +             dev_err(vdev->dev.parent, "virtio_get access out of bounds\=
n");
> +             return;
> +     }
> +
> +     memcpy(buf, (u8 *)&tm_vdev->config + offset, len); }
> +
> +/* Write the value of a configuration field. */ static void
> +mlxbf_tmfifo_virtio_set(struct virtio_device *vdev,
> +                              unsigned int offset,
> +                              const void *buf,
> +                              unsigned int len)
> +{
> +     struct mlxbf_tmfifo_vdev *tm_vdev;
> +
> +     tm_vdev =3D container_of(vdev, struct mlxbf_tmfifo_vdev, vdev);
> +
> +     if (offset + len > sizeof(tm_vdev->config) || offset + len < len) {

Same as above.

> +             dev_err(vdev->dev.parent, "virtio_get access out of bounds\=
n");
> +             return;
> +     }
> +
> +     memcpy((u8 *)&tm_vdev->config + offset, buf, len); }
> +
> +/* Virtio config operations. */
> +static const struct virtio_config_ops mlxbf_tmfifo_virtio_config_ops =3D=
 {
> +     .get_features =3D mlxbf_tmfifo_virtio_get_features,
> +     .finalize_features =3D mlxbf_tmfifo_virtio_finalize_features,
> +     .find_vqs =3D mlxbf_tmfifo_virtio_find_vqs,
> +     .del_vqs =3D mlxbf_tmfifo_virtio_del_vqs,
> +     .reset =3D mlxbf_tmfifo_virtio_reset,
> +     .set_status =3D mlxbf_tmfifo_virtio_set_status,
> +     .get_status =3D mlxbf_tmfifo_virtio_get_status,
> +     .get =3D mlxbf_tmfifo_virtio_get,
> +     .set =3D mlxbf_tmfifo_virtio_set,
> +};
> +
> +/* Create vdev type in a tmfifo. */
> +int mlxbf_tmfifo_create_vdev(struct mlxbf_tmfifo *fifo, int vdev_id,
> +                          u64 features, void *config, u32 size) {
> +     struct mlxbf_tmfifo_vdev *tm_vdev;
> +     int ret =3D 0;
> +
> +     mutex_lock(&fifo->lock);
> +
> +     tm_vdev =3D fifo->vdev[vdev_id];
> +     if (tm_vdev !=3D NULL) {
> +             pr_err("vdev %d already exists\n", vdev_id);
> +             ret =3D -EEXIST;
> +             goto already_exist;
> +     }
> +
> +     tm_vdev =3D kzalloc(sizeof(*tm_vdev), GFP_KERNEL);
> +     if (!tm_vdev) {
> +             ret =3D -ENOMEM;
> +             goto already_exist;
> +     }
> +
> +     tm_vdev->vdev.id.device =3D vdev_id;
> +     tm_vdev->vdev.config =3D &mlxbf_tmfifo_virtio_config_ops;
> +     tm_vdev->vdev.dev.parent =3D &fifo->pdev->dev;
> +     tm_vdev->vdev.dev.release =3D mlxbf_tmfifo_virtio_dev_release;
> +     tm_vdev->features =3D features;
> +     if (config)
> +             memcpy(&tm_vdev->config, config, size);
> +     if (mlxbf_tmfifo_alloc_vrings(fifo, tm_vdev, vdev_id)) {
> +             pr_err("Unable to allocate vring\n");
> +             ret =3D -ENOMEM;
> +             goto alloc_vring_fail;
> +     }
> +     if (vdev_id =3D=3D VIRTIO_ID_CONSOLE) {
> +             tm_vdev->tx_buf =3D
> kmalloc(MLXBF_TMFIFO_CONS_TX_BUF_SIZE,
> +                                       GFP_KERNEL);
> +     }
> +     fifo->vdev[vdev_id] =3D tm_vdev;
> +
> +     /* Register the virtio device. */
> +     ret =3D register_virtio_device(&tm_vdev->vdev);
> +     if (ret) {
> +             dev_err(&fifo->pdev->dev, "register_virtio_device() failed\=
n");
> +             goto register_fail;
> +     }
> +
> +     mutex_unlock(&fifo->lock);
> +     return 0;
> +
> +register_fail:
> +     mlxbf_tmfifo_free_vrings(fifo, vdev_id);
> +     fifo->vdev[vdev_id] =3D NULL;
> +alloc_vring_fail:
> +     kfree(tm_vdev);
> +already_exist:
> +     mutex_unlock(&fifo->lock);
> +     return ret;
> +}
> +
> +/* Delete vdev type from a tmfifo. */
> +int mlxbf_tmfifo_delete_vdev(struct mlxbf_tmfifo *fifo, int vdev_id) {
> +     struct mlxbf_tmfifo_vdev *tm_vdev;
> +
> +     mutex_lock(&fifo->lock);
> +
> +     /* Unregister vdev. */
> +     tm_vdev =3D fifo->vdev[vdev_id];
> +     if (tm_vdev) {
> +             unregister_virtio_device(&tm_vdev->vdev);
> +             mlxbf_tmfifo_free_vrings(fifo, vdev_id);
> +             kfree(tm_vdev->tx_buf);
> +             kfree(tm_vdev);
> +             fifo->vdev[vdev_id] =3D NULL;
> +     }
> +
> +     mutex_unlock(&fifo->lock);
> +
> +     return 0;
> +}
> +
> +/* Device remove function. */
> +static int mlxbf_tmfifo_remove(struct platform_device *pdev) {

Locate it after probe.
If you'll use all devm_, like Andy noted:
devm_ioremap
devm_ioremap_resource
devm_kzalloc
devm_request_mem_region
you can drop all kfree, release_mem_region, iounmap

And make the below as a separate routine, something like
mlxbf_tmfifo_cleanup(), if you still need it.

> +     struct mlxbf_tmfifo *fifo =3D platform_get_drvdata(pdev);
> +     struct resource *rx_res, *tx_res;
> +     int i;
> +
> +     if (fifo) {
> +             mutex_lock(&mlxbf_tmfifo_lock);
> +
> +             fifo->is_ready =3D false;
> +
> +             /* Stop the timer. */
> +             del_timer_sync(&fifo->timer);
> +
> +             /* Release interrupts. */
> +             mlxbf_tmfifo_free_irqs(fifo);
> +
> +             /* Cancel the pending work. */
> +             cancel_work_sync(&fifo->work);
> +
> +             for (i =3D 0; i < MLXBF_TMFIFO_VDEV_MAX; i++)
> +                     mlxbf_tmfifo_delete_vdev(fifo, i);
> +
> +             /* Release IO resources. */
> +             if (fifo->rx_base)
> +                     iounmap(fifo->rx_base);
> +             if (fifo->tx_base)
> +                     iounmap(fifo->tx_base);
> +
> +             platform_set_drvdata(pdev, NULL);
> +             kfree(fifo);
> +
> +             mutex_unlock(&mlxbf_tmfifo_lock);
> +     }
> +
> +     rx_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +     if (rx_res)
> +             release_mem_region(rx_res->start, resource_size(rx_res));
> +     tx_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +     if (tx_res)
> +             release_mem_region(tx_res->start, resource_size(tx_res));
> +
> +     return 0;
> +}
> +
> +/* Read the configured network MAC address from efi variable. */ static
> +void mlxbf_tmfifo_get_cfg_mac(u8 *mac) {
> +     efi_char16_t name[] =3D {
> +             'R', 's', 'h', 'i', 'm', 'M', 'a', 'c', 'A', 'd', 'd', 'r',=
 0 };


Could it be moved out and set like:
static const efi_char16_t mlxbf_tmfifo_efi_name[] =3D "...";
Could you check if the are some examples in kernel, please?

> +     efi_guid_t guid =3D EFI_GLOBAL_VARIABLE_GUID;
> +     efi_status_t status;
> +     unsigned long size;
> +     u8 buf[6];
> +
> +     size =3D sizeof(buf);
> +     status =3D efi.get_variable(name, &guid, NULL, &size, buf);
> +     if (status =3D=3D EFI_SUCCESS && size =3D=3D sizeof(buf))
> +             memcpy(mac, buf, sizeof(buf));
> +}
> +
> +/* Probe the TMFIFO. */
> +static int mlxbf_tmfifo_probe(struct platform_device *pdev) {
> +     struct virtio_net_config net_config;
> +     struct resource *rx_res, *tx_res;
> +     struct mlxbf_tmfifo *fifo;
> +     int i, ret;
> +     u64 ctl;
> +
> +     /* Get the resource of the Rx & Tx FIFO. */
> +     rx_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +     tx_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +     if (!rx_res || !tx_res) {
> +             ret =3D -EINVAL;
> +             goto err;
> +     }
> +
> +     if (request_mem_region(rx_res->start,
> +                            resource_size(rx_res), "bf-tmfifo") =3D=3D N=
ULL) {
> +             ret =3D -EBUSY;
> +             goto early_err;
> +     }
> +
> +     if (request_mem_region(tx_res->start,
> +                            resource_size(tx_res), "bf-tmfifo") =3D=3D N=
ULL) {
> +             release_mem_region(rx_res->start, resource_size(rx_res));
> +             ret =3D -EBUSY;
> +             goto early_err;
> +     }
> +
> +     ret =3D -ENOMEM;
> +     fifo =3D kzalloc(sizeof(struct mlxbf_tmfifo), GFP_KERNEL);
> +     if (!fifo)
> +             goto err;
> +
> +     fifo->pdev =3D pdev;
> +     platform_set_drvdata(pdev, fifo);
> +
> +     spin_lock_init(&fifo->spin_lock);
> +     INIT_WORK(&fifo->work, mlxbf_tmfifo_work_handler);
> +
> +     timer_setup(&fifo->timer, mlxbf_tmfifo_timer, 0);
> +     fifo->timer.function =3D mlxbf_tmfifo_timer;
> +
> +     for (i =3D 0; i < MLXBF_TM_IRQ_CNT; i++) {
> +             fifo->irq_info[i].index =3D i;
> +             fifo->irq_info[i].fifo =3D fifo;
> +             fifo->irq_info[i].irq =3D platform_get_irq(pdev, i);
> +             ret =3D request_irq(fifo->irq_info[i].irq,
> +                               mlxbf_tmfifo_irq_handler, 0,
> +                               "tmfifo", &fifo->irq_info[i]);
> +             if (ret) {
> +                     pr_err("Unable to request irq\n");
> +                     fifo->irq_info[i].irq =3D 0;
> +                     goto err;
> +             }
> +     }
> +
> +     fifo->rx_base =3D ioremap(rx_res->start, resource_size(rx_res));
> +     if (!fifo->rx_base)
> +             goto err;
> +
> +     fifo->tx_base =3D ioremap(tx_res->start, resource_size(tx_res));
> +     if (!fifo->tx_base)
> +             goto err;
> +
> +     /* Get Tx FIFO size and set the low/high watermark. */
> +     ctl =3D readq(fifo->tx_base + MLXBF_TMFIFO_TX_CTL);
> +     fifo->tx_fifo_size =3D
> +             FIELD_GET(MLXBF_TMFIFO_TX_CTL__MAX_ENTRIES_MASK,
> ctl);
> +     ctl =3D (ctl & ~MLXBF_TMFIFO_TX_CTL__LWM_MASK) |
> +             FIELD_PREP(MLXBF_TMFIFO_TX_CTL__LWM_MASK,
> +                        fifo->tx_fifo_size / 2);
> +     ctl =3D (ctl & ~MLXBF_TMFIFO_TX_CTL__HWM_MASK) |
> +             FIELD_PREP(MLXBF_TMFIFO_TX_CTL__HWM_MASK,
> +                        fifo->tx_fifo_size - 1);
> +     writeq(ctl, fifo->tx_base + MLXBF_TMFIFO_TX_CTL);
> +
> +     /* Get Rx FIFO size and set the low/high watermark. */
> +     ctl =3D readq(fifo->rx_base + MLXBF_TMFIFO_RX_CTL);
> +     fifo->rx_fifo_size =3D
> +             FIELD_GET(MLXBF_TMFIFO_RX_CTL__MAX_ENTRIES_MASK,
> ctl);
> +     ctl =3D (ctl & ~MLXBF_TMFIFO_RX_CTL__LWM_MASK) |
> +             FIELD_PREP(MLXBF_TMFIFO_RX_CTL__LWM_MASK, 0);
> +     ctl =3D (ctl & ~MLXBF_TMFIFO_RX_CTL__HWM_MASK) |
> +             FIELD_PREP(MLXBF_TMFIFO_RX_CTL__HWM_MASK, 1);
> +     writeq(ctl, fifo->rx_base + MLXBF_TMFIFO_RX_CTL);
> +
> +     mutex_init(&fifo->lock);
> +
> +     /* Create the console vdev. */
> +     ret =3D mlxbf_tmfifo_create_vdev(fifo, VIRTIO_ID_CONSOLE, 0, NULL, =
0);
> +     if (ret)
> +             goto err;
> +
> +     /* Create the network vdev. */
> +     memset(&net_config, 0, sizeof(net_config));
> +     net_config.mtu =3D MLXBF_TMFIFO_NET_MTU;
> +     net_config.status =3D VIRTIO_NET_S_LINK_UP;
> +     memcpy(net_config.mac, mlxbf_tmfifo_net_default_mac, 6);
> +     mlxbf_tmfifo_get_cfg_mac(net_config.mac);
> +     ret =3D mlxbf_tmfifo_create_vdev(fifo, VIRTIO_ID_NET,
> +             MLXBF_TMFIFO_NET_FEATURES, &net_config,
> sizeof(net_config));
> +     if (ret)
> +             goto err;
> +
> +     mod_timer(&fifo->timer, jiffies + mlxbf_tmfifo_timer_interval);
> +
> +     fifo->is_ready =3D true;
> +
> +     return 0;
> +
> +err:
> +     mlxbf_tmfifo_remove(pdev);
> +early_err:
> +     dev_err(&pdev->dev, "Probe Failed\n");
> +     return ret;
> +}
> +
> +static const struct of_device_id mlxbf_tmfifo_match[] =3D {
> +     { .compatible =3D "mellanox,bf-tmfifo" },
> +     {},
> +};
> +MODULE_DEVICE_TABLE(of, mlxbf_tmfifo_match);
> +
> +static const struct acpi_device_id mlxbf_tmfifo_acpi_match[] =3D {
> +     { "MLNXBF01", 0 },
> +     {},
> +};
> +MODULE_DEVICE_TABLE(acpi, mlxbf_tmfifo_acpi_match);
> +
> +static struct platform_driver mlxbf_tmfifo_driver =3D {
> +     .probe =3D mlxbf_tmfifo_probe,
> +     .remove =3D mlxbf_tmfifo_remove,
> +     .driver =3D {
> +             .name =3D "bf-tmfifo",
> +             .of_match_table =3D mlxbf_tmfifo_match,
> +             .acpi_match_table =3D ACPI_PTR(mlxbf_tmfifo_acpi_match),
> +     },
> +};
> +
> +module_platform_driver(mlxbf_tmfifo_driver);
> +
> +MODULE_DESCRIPTION("Mellanox BlueField SoC TmFifo Driver");
> +MODULE_LICENSE("GPL"); MODULE_AUTHOR("Mellanox Technologies");
> --
> 1.8.3.1


--_000_DB6PR05MB3223750A26A7B56F56FD5203A1660DB6PR05MB3223eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, &quot;EmojiFont&quot;, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D=
"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Thanks Vadim! The v9 has been pos=
ted to solve these comments. (Also thanks a lot for the comments in the int=
ernal review.)</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Regards,</p>
<p style=3D"margin-top:0;margin-bottom:0">Liming<br>
</p>
<br>
<div style=3D"color: rgb(0, 0, 0);">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Vadim Pasternak<br>
<b>Sent:</b> Wednesday, January 30, 2019 1:24 AM<br>
<b>To:</b> Liming Sun; Rob Herring; Mark Rutland; Arnd Bergmann; David Wood=
s; Andy Shevchenko; Darren Hart<br>
<b>Cc:</b> Liming Sun; devicetree@vger.kernel.org; linux-kernel@vger.kernel=
.org; platform-driver-x86@vger.kernel.org<br>
<b>Subject:</b> RE: [PATCH v8 1/2] platform/mellanox: Add TmFifo driver for=
 Mellanox BlueField Soc</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Liming Sun &lt;lsun@mellanox.com&gt;<br>
&gt; Sent: Monday, January 28, 2019 7:28 PM<br>
&gt; To: Rob Herring &lt;robh&#43;dt@kernel.org&gt;; Mark Rutland<br>
&gt; &lt;mark.rutland@arm.com&gt;; Arnd Bergmann &lt;arnd@arndb.de&gt;; Dav=
id Woods<br>
&gt; &lt;dwoods@mellanox.com&gt;; Andy Shevchenko &lt;andy@infradead.org&gt=
;; Darren<br>
&gt; Hart &lt;dvhart@infradead.org&gt;; Vadim Pasternak &lt;vadimp@mellanox=
.com&gt;<br>
&gt; Cc: Liming Sun &lt;lsun@mellanox.com&gt;; devicetree@vger.kernel.org; =
linux-<br>
&gt; kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org<br>
&gt; Subject: [PATCH v8 1/2] platform/mellanox: Add TmFifo driver for Mella=
nox<br>
&gt; BlueField Soc<br>
&gt; <br>
&gt; This commit adds the TmFifo platform driver for Mellanox BlueField Soc=
. TmFifo<br>
&gt; is a shared FIFO which enables external host machine to exchange data =
with the<br>
&gt; SoC via USB or PCIe. The driver is based on virtio framework and has c=
onsole<br>
&gt; and network access enabled.<br>
&gt; <br>
&gt; Reviewed-by: David Woods &lt;dwoods@mellanox.com&gt;<br>
&gt; Signed-off-by: Liming Sun &lt;lsun@mellanox.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/platform/mellanox/Kconfig&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 13 &#43;-<br>
&gt;&nbsp; drivers/platform/mellanox/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 1 &#43;<br>
&gt;&nbsp; drivers/platform/mellanox/mlxbf-tmfifo-regs.h |&nbsp;&nbsp; 67 &=
#43;&#43;<br>
&gt;&nbsp; drivers/platform/mellanox/mlxbf-tmfifo.c&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 1289<br>
&gt; &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; 4 files changed, 1369 insertions(&#43;), 1 deletion(-)&nbsp; cre=
ate mode 100644<br>
&gt; drivers/platform/mellanox/mlxbf-tmfifo-regs.h<br>
&gt;&nbsp; create mode 100644 drivers/platform/mellanox/mlxbf-tmfifo.c<br>
&gt; <br>
&gt; diff --git a/drivers/platform/mellanox/Kconfig<br>
&gt; b/drivers/platform/mellanox/Kconfig<br>
&gt; index cd8a908..a565070 100644<br>
&gt; --- a/drivers/platform/mellanox/Kconfig<br>
&gt; &#43;&#43;&#43; b/drivers/platform/mellanox/Kconfig<br>
&gt; @@ -5,7 &#43;5,7 @@<br>
&gt; <br>
&gt;&nbsp; menuconfig MELLANOX_PLATFORM<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;Platform support =
for Mellanox hardware&quot;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; depends on X86 || ARM || COMPILE_TEST<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; depends on X86 || ARM || ARM64 || COMPIL=
E_TEST<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ---help---<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Say Y here to ge=
t to see options for platform support for<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mellanox systems=
. This option alone does not add any kernel code.<br>
&gt; @@ -34,4 &#43;34,15 @@ config MLXREG_IO<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to system resets=
 operation, system reset causes monitoring and some<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kinds of mux sel=
ection.<br>
&gt; <br>
&gt; &#43;config MLXBF_TMFIFO<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tristate &quot;Mellanox BlueField SoC Tm=
Fifo platform driver&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; depends on ARM64<br>
<br>
Why you make it dependent on ARM64?<br>
Should not it work on any host, x86?<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; default m<br>
<br>
User who needs it should select this option.<br>
No need default 'm'.<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; select VIRTIO_CONSOLE<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; select VIRTIO_NET<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Say y here to enable TmFifo =
support. The TmFifo driver provides<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; platform d=
river support for the TmFifo which supports console<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and networ=
king based on the virtio framework.<br>
&gt; &#43;<br>
&gt;&nbsp; endif # MELLANOX_PLATFORM<br>
&gt; diff --git a/drivers/platform/mellanox/Makefile<br>
&gt; b/drivers/platform/mellanox/Makefile<br>
&gt; index 57074d9c..f0c061d 100644<br>
&gt; --- a/drivers/platform/mellanox/Makefile<br>
&gt; &#43;&#43;&#43; b/drivers/platform/mellanox/Makefile<br>
&gt; @@ -5,3 &#43;5,4 @@<br>
&gt;&nbsp; #<br>
&gt;&nbsp; obj-$(CONFIG_MLXREG_HOTPLUG) &#43;=3D mlxreg-hotplug.o<br>
&gt;&nbsp; obj-$(CONFIG_MLXREG_IO) &#43;=3D mlxreg-io.o<br>
&gt; &#43;obj-$(CONFIG_MLXBF_TMFIFO)&nbsp;&nbsp; &#43;=3D mlxbf-tmfifo.o<br=
>
&gt; diff --git a/drivers/platform/mellanox/mlxbf-tmfifo-regs.h<br>
&gt; b/drivers/platform/mellanox/mlxbf-tmfifo-regs.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..90c9c2cf<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/drivers/platform/mellanox/mlxbf-tmfifo-regs.h<br>
&gt; @@ -0,0 &#43;1,67 @@<br>
&gt; &#43;/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; &#43;/*<br>
&gt; &#43; * Copyright (c) 2019, Mellanox Technologies. All rights reserved=
.<br>
&gt; &#43; */<br>
&gt; &#43;<br>
&gt; &#43;#ifndef __MLXBF_TMFIFO_REGS_H__<br>
&gt; &#43;#define __MLXBF_TMFIFO_REGS_H__<br>
&gt; &#43;<br>
&gt; &#43;#include &lt;linux/types.h&gt;<br>
&gt; &#43;<br>
&gt; &#43;#define MLXBF_TMFIFO_TX_DATA 0x0<br>
&gt; &#43;<br>
&gt; &#43;#define MLXBF_TMFIFO_TX_STS 0x8<br>
&gt; &#43;#define MLXBF_TMFIFO_TX_STS__LENGTH 0x0001 #define<br>
&gt; &#43;MLXBF_TMFIFO_TX_STS__COUNT_SHIFT 0 #define<br>
&gt; &#43;MLXBF_TMFIFO_TX_STS__COUNT_WIDTH 9 #define<br>
&gt; &#43;MLXBF_TMFIFO_TX_STS__COUNT_RESET_VAL 0 #define<br>
&gt; &#43;MLXBF_TMFIFO_TX_STS__COUNT_RMASK 0x1ff #define<br>
&gt; &#43;MLXBF_TMFIFO_TX_STS__COUNT_MASK&nbsp; 0x1ff<br>
&gt; &#43;<br>
&gt; &#43;#define MLXBF_TMFIFO_TX_CTL 0x10<br>
&gt; &#43;#define MLXBF_TMFIFO_TX_CTL__LENGTH 0x0001 #define<br>
&gt; &#43;MLXBF_TMFIFO_TX_CTL__LWM_SHIFT 0 #define<br>
&gt; MLXBF_TMFIFO_TX_CTL__LWM_WIDTH<br>
&gt; &#43;8 #define MLXBF_TMFIFO_TX_CTL__LWM_RESET_VAL 128 #define<br>
&gt; &#43;MLXBF_TMFIFO_TX_CTL__LWM_RMASK 0xff #define<br>
&gt; &#43;MLXBF_TMFIFO_TX_CTL__LWM_MASK&nbsp; 0xff #define<br>
&gt; &#43;MLXBF_TMFIFO_TX_CTL__HWM_SHIFT 8 #define<br>
&gt; MLXBF_TMFIFO_TX_CTL__HWM_WIDTH<br>
&gt; &#43;8 #define MLXBF_TMFIFO_TX_CTL__HWM_RESET_VAL 128 #define<br>
&gt; &#43;MLXBF_TMFIFO_TX_CTL__HWM_RMASK 0xff #define<br>
&gt; &#43;MLXBF_TMFIFO_TX_CTL__HWM_MASK&nbsp; 0xff00 #define<br>
&gt; &#43;MLXBF_TMFIFO_TX_CTL__MAX_ENTRIES_SHIFT 32 #define<br>
&gt; &#43;MLXBF_TMFIFO_TX_CTL__MAX_ENTRIES_WIDTH 9 #define<br>
&gt; &#43;MLXBF_TMFIFO_TX_CTL__MAX_ENTRIES_RESET_VAL 256 #define<br>
&gt; &#43;MLXBF_TMFIFO_TX_CTL__MAX_ENTRIES_RMASK 0x1ff #define<br>
&gt; &#43;MLXBF_TMFIFO_TX_CTL__MAX_ENTRIES_MASK&nbsp; 0x1ff00000000ULL<br>
&gt; &#43;<br>
&gt; &#43;#define MLXBF_TMFIFO_RX_DATA 0x0<br>
&gt; &#43;<br>
&gt; &#43;#define MLXBF_TMFIFO_RX_STS 0x8<br>
&gt; &#43;#define MLXBF_TMFIFO_RX_STS__LENGTH 0x0001 #define<br>
&gt; &#43;MLXBF_TMFIFO_RX_STS__COUNT_SHIFT 0 #define<br>
&gt; &#43;MLXBF_TMFIFO_RX_STS__COUNT_WIDTH 9 #define<br>
&gt; &#43;MLXBF_TMFIFO_RX_STS__COUNT_RESET_VAL 0 #define<br>
&gt; &#43;MLXBF_TMFIFO_RX_STS__COUNT_RMASK 0x1ff #define<br>
&gt; &#43;MLXBF_TMFIFO_RX_STS__COUNT_MASK&nbsp; 0x1ff<br>
&gt; &#43;<br>
&gt; &#43;#define MLXBF_TMFIFO_RX_CTL 0x10<br>
&gt; &#43;#define MLXBF_TMFIFO_RX_CTL__LENGTH 0x0001 #define<br>
&gt; &#43;MLXBF_TMFIFO_RX_CTL__LWM_SHIFT 0 #define<br>
&gt; MLXBF_TMFIFO_RX_CTL__LWM_WIDTH<br>
&gt; &#43;8 #define MLXBF_TMFIFO_RX_CTL__LWM_RESET_VAL 128 #define<br>
&gt; &#43;MLXBF_TMFIFO_RX_CTL__LWM_RMASK 0xff #define<br>
&gt; &#43;MLXBF_TMFIFO_RX_CTL__LWM_MASK&nbsp; 0xff #define<br>
&gt; &#43;MLXBF_TMFIFO_RX_CTL__HWM_SHIFT 8 #define<br>
&gt; MLXBF_TMFIFO_RX_CTL__HWM_WIDTH<br>
&gt; &#43;8 #define MLXBF_TMFIFO_RX_CTL__HWM_RESET_VAL 128 #define<br>
&gt; &#43;MLXBF_TMFIFO_RX_CTL__HWM_RMASK 0xff #define<br>
&gt; &#43;MLXBF_TMFIFO_RX_CTL__HWM_MASK&nbsp; 0xff00 #define<br>
&gt; &#43;MLXBF_TMFIFO_RX_CTL__MAX_ENTRIES_SHIFT 32 #define<br>
&gt; &#43;MLXBF_TMFIFO_RX_CTL__MAX_ENTRIES_WIDTH 9 #define<br>
&gt; &#43;MLXBF_TMFIFO_RX_CTL__MAX_ENTRIES_RESET_VAL 256 #define<br>
&gt; &#43;MLXBF_TMFIFO_RX_CTL__MAX_ENTRIES_RMASK 0x1ff #define<br>
&gt; &#43;MLXBF_TMFIFO_RX_CTL__MAX_ENTRIES_MASK&nbsp; 0x1ff00000000ULL<br>
&gt; &#43;<br>
&gt; &#43;#endif /* !defined(__MLXBF_TMFIFO_REGS_H__) */<br>
&gt; diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c<br>
&gt; b/drivers/platform/mellanox/mlxbf-tmfifo.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..c1afe47<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/drivers/platform/mellanox/mlxbf-tmfifo.c<br>
&gt; @@ -0,0 &#43;1,1289 @@<br>
&gt; &#43;// SPDX-License-Identifier: GPL-2.0&#43;<br>
&gt; &#43;/*<br>
&gt; &#43; * Mellanox BlueField SoC TmFifo driver<br>
&gt; &#43; *<br>
&gt; &#43; * Copyright (C) 2019 Mellanox Technologies&nbsp; */<br>
&gt; &#43;<br>
&gt; &#43;#include &lt;linux/acpi.h&gt;<br>
&gt; &#43;#include &lt;linux/bitfield.h&gt;<br>
&gt; &#43;#include &lt;linux/cache.h&gt;<br>
&gt; &#43;#include &lt;linux/device.h&gt;<br>
&gt; &#43;#include &lt;linux/dma-mapping.h&gt;<br>
&gt; &#43;#include &lt;linux/efi.h&gt;<br>
&gt; &#43;#include &lt;linux/io.h&gt;<br>
&gt; &#43;#include &lt;linux/interrupt.h&gt;<br>
&gt; &#43;#include &lt;linux/irq.h&gt;<br>
&gt; &#43;#include &lt;linux/kernel.h&gt;<br>
&gt; &#43;#include &lt;linux/math64.h&gt;<br>
&gt; &#43;#include &lt;linux/module.h&gt;<br>
&gt; &#43;#include &lt;linux/moduleparam.h&gt;<br>
&gt; &#43;#include &lt;linux/mutex.h&gt;<br>
&gt; &#43;#include &lt;linux/platform_device.h&gt;<br>
&gt; &#43;#include &lt;linux/resource.h&gt;<br>
&gt; &#43;#include &lt;linux/slab.h&gt;<br>
&gt; &#43;#include &lt;linux/types.h&gt;<br>
&gt; &#43;#include &lt;linux/version.h&gt;<br>
&gt; &#43;#include &lt;linux/virtio.h&gt;<br>
&gt; &#43;#include &lt;linux/virtio_config.h&gt;<br>
&gt; &#43;#include &lt;linux/virtio_console.h&gt;<br>
&gt; &#43;#include &lt;linux/virtio_ids.h&gt;<br>
&gt; &#43;#include &lt;linux/virtio_net.h&gt;<br>
&gt; &#43;#include &lt;linux/virtio_ring.h&gt;<br>
&gt; &#43;#include &lt;asm/byteorder.h&gt;<br>
<br>
Is it must ti include from asm?<br>
Could it be replaced with something like<br>
#include &lt;linux/byteorder/generic.h&gt;<br>
<br>
&gt; &#43;<br>
&gt; &#43;#include &quot;mlxbf-tmfifo-regs.h&quot;<br>
&gt; &#43;<br>
&gt; &#43;/* Vring size. */<br>
&gt; &#43;#define MLXBF_TMFIFO_VRING_SIZE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 1024<br>
&gt; &#43;<br>
&gt; &#43;/* Console Tx buffer size. */<br>
&gt; &#43;#define MLXBF_TMFIFO_CONS_TX_BUF_SIZE&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (32 * 1024)<=
br>
&gt; &#43;<br>
&gt; &#43;/* House-keeping timer interval. */<br>
&gt; &#43;static int mlxbf_tmfifo_timer_interval =3D HZ / 10;<br>
&gt; &#43;<br>
&gt; &#43;/* Global lock. */<br>
&gt; &#43;static DEFINE_MUTEX(mlxbf_tmfifo_lock);<br>
&gt; &#43;<br>
&gt; &#43;/* Virtual devices sharing the TM FIFO. */<br>
&gt; &#43;#define MLXBF_TMFIFO_VDEV_MAX&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (VIRTIO_ID_CONSOLE &=
#43; 1)<br>
&gt; &#43;<br>
&gt; &#43;/* Struct declaration. */<br>
&gt; &#43;struct mlxbf_tmfifo;<br>
&gt; &#43;<br>
&gt; &#43;/* Structure to maintain the ring state. */ struct mlxbf_tmfifo_v=
ring {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; void *va;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; /* virtual address */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; dma_addr_t dma;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
dma address */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct virtqueue *vq;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* virtqueue pointer */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct vring_desc *desc;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; /* current desc */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct vring_desc *desc_head;&nbsp;&nbsp=
; /* current desc head */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int cur_len;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; /* processed len in current desc */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int rem_len;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; /* remaining length to be processed */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int size;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; /* vring size */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int align;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* vring alignment */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int id;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* vring id */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int vdev_id;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; /* TMFIFO_VDEV_xxx */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; u32 pkt_len;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; /* packet total length */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; __virtio16 next_avail;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* next avail desc id */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo *fifo;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* pointer back to the tmfifo */<br>
&gt; &#43;};<br>
&gt; &#43;<br>
&gt; &#43;/* Interrupt types. */<br>
&gt; &#43;enum {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; MLXBF_TM_RX_LWM_IRQ,&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Rx low water mark irq */<=
br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; MLXBF_TM_RX_HWM_IRQ,&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Rx high water mark irq */=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; MLXBF_TM_TX_LWM_IRQ,&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Tx low water mark irq */<=
br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; MLXBF_TM_TX_HWM_IRQ,&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Tx high water mark irq */=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; MLXBF_TM_IRQ_CNT<br>
&gt; &#43;};<br>
&gt; &#43;<br>
&gt; &#43;/* Ring types (Rx &amp; Tx). */<br>
&gt; &#43;enum {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; MLXBF_TMFIFO_VRING_RX,&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Rx ring */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; MLXBF_TMFIFO_VRING_TX,&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Tx ring */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; MLXBF_TMFIFO_VRING_NUM<br>
&gt; &#43;};<br>
&gt; &#43;<br>
&gt; &#43;struct mlxbf_tmfifo_vdev {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct virtio_device vdev;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* virtual device */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; u8 status;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; u64 features;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; union {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* virtio config space */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; struct virtio_console_config cons;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; struct virtio_net_config net;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; } config;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vring vrings[MLXBF_T=
MFIFO_VRING_NUM];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; u8 *tx_buf;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* tx buffer */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; u32 tx_head;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; /* tx buffer head */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; u32 tx_tail;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; /* tx buffer tail */<br>
&gt; &#43;};<br>
&gt; &#43;<br>
&gt; &#43;struct mlxbf_tmfifo_irq_info {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo *fifo;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* tmfifo structure */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int irq;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* interrupt number */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int index;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* array index */<br>
&gt; &#43;};<br>
&gt; &#43;<br>
&gt; &#43;/* TMFIFO device structure */<br>
&gt; &#43;struct mlxbf_tmfifo {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vdev *vdev[MLXBF_TMF=
IFO_VDEV_MAX]; /*<br>
&gt; devices */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct platform_device *pdev;&nbsp;&nbsp=
; /* platform device */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mutex lock;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* fifo lock */<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; void __iomem *rx_base;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* mapped register base */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; void __iomem *tx_base;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* mapped register base */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int tx_fifo_size;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* number of =
entries of the Tx FIFO */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int rx_fifo_size;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* number of =
entries of the Rx FIFO */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long pend_events;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* pending bits for deferred process */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_irq_info irq_info[ML=
XBF_TM_IRQ_CNT]; /* irq info<br>
&gt; */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct work_struct work;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; /* work struct for deferred process */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct timer_list timer;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; /* keepalive timer */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vring *vring[2];&nbs=
p;&nbsp;&nbsp; /* current Tx/Rx ring */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool is_ready;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; /* ready flag */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; spinlock_t spin_lock;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* spin lock */<br>
&gt; &#43;};<br>
&gt; &#43;<br>
&gt; &#43;union mlxbf_tmfifo_msg_hdr {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; u8 type;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* message type */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; __be16 len;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* payload length */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; u8 unused[5];&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; /* reserved, set to 0 */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; } __packed;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; u64 data;<br>
&gt; &#43;};<br>
&gt; &#43;<br>
&gt; &#43;/*<br>
&gt; &#43; * Default MAC.<br>
&gt; &#43; * This MAC address will be read from EFI persistent variable if =
configured.<br>
&gt; &#43; * It can also be reconfigured with standard Linux tools.<br>
&gt; &#43; */<br>
&gt; &#43;static u8 mlxbf_tmfifo_net_default_mac[6] =3D {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; 0x00, 0x1A, 0xCA, 0xFF, 0xFF, 0x01};<br>
&gt; &#43;<br>
&gt; &#43;/* MTU setting of the virtio-net interface. */<br>
&gt; &#43;#define MLXBF_TMFIFO_NET_MTU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 1500<br>
&gt; &#43;<br>
&gt; &#43;/* Maximum L2 header length. */<br>
&gt; &#43;#define MLXBF_TMFIFO_NET_L2_OVERHEAD 36<br>
&gt; &#43;<br>
&gt; &#43;/* Supported virtio-net features. */<br>
&gt; &#43;#define MLXBF_TMFIFO_NET_FEATURES&nbsp;&nbsp;&nbsp; ((1UL &lt;&lt=
; VIRTIO_NET_F_MTU)<br>
&gt; | \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; (1UL &lt;&lt; VIRTIO_NET_F_STATUS) | \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; (1UL &lt;&lt; VIRTIO_NET_F_MAC))<br>
&gt; &#43;<br>
&gt; &#43;/* Return the consumed Tx buffer space. */ static int<br>
&gt; &#43;mlxbf_tmfifo_vdev_tx_buf_len(struct mlxbf_tmfifo_vdev *vdev) {<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return ((vdev-&gt;tx_tail &gt;=3D vdev-&=
gt;tx_head) ?<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; (vdev-&gt;tx_tail - vdev-&gt;tx_head) :<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; (MLXBF_TMFIFO_CONS_TX_BUF_SIZE - vdev-&gt;tx_head &#43;<br>
&gt; &#43;vdev-&gt;tx_tail)); }<br>
<br>
I would suggest to split the above. <br>
<br>
&gt; &#43;<br>
&gt; &#43;/* Return the available Tx buffer space. */ static int<br>
&gt; &#43;mlxbf_tmfifo_vdev_tx_buf_avail(struct mlxbf_tmfifo_vdev *vdev) {<=
br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return (MLXBF_TMFIFO_CONS_TX_BUF_SIZE - =
8 -<br>
<br>
Thins about some extra define for<br>
&quot;MLXBF_TMFIFO_CONS_TX_BUF_SIZE - 8&quot;<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; mlxbf_tmfifo_vdev_tx_buf_len(vdev));<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Update Tx buffer pointer after pushing data. */ static void<br=
>
&gt; &#43;mlxbf_tmfifo_vdev_tx_buf_push(struct mlxbf_tmfifo_vdev *vdev,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; u32 len)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; vdev-&gt;tx_tail &#43;=3D len;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (vdev-&gt;tx_tail &gt;=3D MLXBF_TMFIF=
O_CONS_TX_BUF_SIZE)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vdev-&gt;tx_tail -=3D MLXBF_TMFIFO_CONS_TX_BUF_SIZE; }<br>
&gt; &#43;<br>
&gt; &#43;/* Update Tx buffer pointer after popping data. */ static void<br=
>
&gt; &#43;mlxbf_tmfifo_vdev_tx_buf_pop(struct mlxbf_tmfifo_vdev *vdev,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; u32 len)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; vdev-&gt;tx_head &#43;=3D len;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (vdev-&gt;tx_head &gt;=3D MLXBF_TMFIF=
O_CONS_TX_BUF_SIZE)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vdev-&gt;tx_head -=3D MLXBF_TMFIFO_CONS_TX_BUF_SIZE; }<br>
&gt; &#43;<br>
&gt; &#43;/* Allocate vrings for the fifo. */<br>
&gt; &#43;static int mlxbf_tmfifo_alloc_vrings(struct mlxbf_tmfifo *fifo,<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmf=
ifo_vdev *tm_vdev,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int vdev_id)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vring *vring;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; dma_addr_t dma;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int i, size;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; void *va;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(tm_vdev-=
&gt;vrings); i&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vring =3D &amp;tm_vdev-&gt;vrings[i];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vring-&gt;fifo =3D fifo;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vring-&gt;size =3D MLXBF_TMFIFO_VRING_SIZE;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vring-&gt;align =3D SMP_CACHE_BYTES;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vring-&gt;id =3D i;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vring-&gt;vdev_id =3D vdev_id;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; size =3D PAGE_ALIGN(vring_size(vring-&gt;size, vring-&gt;align));<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; va =3D dma_alloc_coherent(tm_vdev-&gt;vdev.dev.parent, size,<br>
&gt; &amp;dma,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; GFP_KERNEL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (!va) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_err(tm_vdev-&gt=
;vdev.dev.parent,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring allocation failed\n&quot;);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vring-&gt;va =3D va;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vring-&gt;dma =3D dma;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Free vrings of the fifo device. */<br>
&gt; &#43;static void mlxbf_tmfifo_free_vrings(struct mlxbf_tmfifo *fifo, i=
nt<br>
&gt; &#43;vdev_id) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vdev *tm_vdev =3D fi=
fo-&gt;vdev[vdev_id];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vring *vring;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int i, size;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(tm_vdev-=
&gt;vrings); i&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vring =3D &amp;tm_vdev-&gt;vrings[i];<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; size =3D PAGE_ALIGN(vring_size(vring-&gt;size, vring-&gt;align));<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (vring-&gt;va) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_free_coherent(t=
m_vdev-&gt;vdev.dev.parent, size,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; vring-&gt;va, vring-&gt;dma);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vring-&gt;va =3D NU=
LL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vring-&gt;vq) {=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; vring_del_virtqueue(vring-&gt;vq);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; vring-&gt;vq =3D NULL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Free interrupts of the fifo device. */ static void<br>
&gt; &#43;mlxbf_tmfifo_free_irqs(struct mlxbf_tmfifo *fifo) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int i, irq;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; MLXBF_TM_IRQ_CNT; i=
&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; irq =3D fifo-&gt;irq_info[i].irq;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (irq) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fifo-&gt;irq_info[i=
].irq =3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; disable_irq(irq);<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free_irq(irq, (u8 *=
)fifo &#43; i);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Interrupt handler. */<br>
&gt; &#43;static irqreturn_t mlxbf_tmfifo_irq_handler(int irq, void *arg) {=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_irq_info *irq_info;<=
br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; irq_info =3D (struct mlxbf_tmfifo_irq_in=
fo *)arg;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (irq_info-&gt;index &lt; MLXBF_TM_IRQ=
_CNT &amp;&amp;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !test_and_set_bi=
t(irq_info-&gt;index, &amp;irq_info-&gt;fifo-&gt;pend_events))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; schedule_work(&amp;irq_info-&gt;fifo-&gt;work);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return IRQ_HANDLED;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Nothing to do for now. */<br>
&gt; &#43;static void mlxbf_tmfifo_virtio_dev_release(struct device *dev) {=
 }<br>
<br>
If there is nothing to do - no reason to have it.<br>
<br>
&gt; &#43;<br>
&gt; &#43;/* Get the next packet descriptor from the vring. */ static inlin=
e<br>
&gt; &#43;struct vring_desc * mlxbf_tmfifo_virtio_get_next_desc(struct virt=
queue<br>
&gt; &#43;*vq) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vring *vring;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int idx, head;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct vring *vr;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; vring =3D (struct mlxbf_tmfifo_vring *)v=
q-&gt;priv;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; vr =3D (struct vring *)virtqueue_get_vri=
ng(vq);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!vr || vring-&gt;next_avail =3D=3D v=
r-&gt;avail-&gt;idx)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return NULL;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; idx =3D vring-&gt;next_avail % vr-&gt;nu=
m;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; head =3D vr-&gt;avail-&gt;ring[idx];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; BUG_ON(head &gt;=3D vr-&gt;num);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; vring-&gt;next_avail&#43;&#43;;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return &amp;vr-&gt;desc[head];<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;static inline void mlxbf_tmfifo_virtio_release_desc(<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct virtio_device *vdev, struct vring=
 *vr,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct vring_desc *desc, u32 len)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int idx;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; idx =3D vr-&gt;used-&gt;idx % vr-&gt;num=
;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; vr-&gt;used-&gt;ring[idx].id =3D desc - =
vr-&gt;desc;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; vr-&gt;used-&gt;ring[idx].len =3D cpu_to=
_virtio32(vdev, len);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* Virtio could poll and check the 'idx'=
 to decide<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * whether the desc is done or not.=
 Add a memory<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * barrier here to make sure the up=
date above completes<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * before updating the idx.<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mb();<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; vr-&gt;used-&gt;idx&#43;&#43;;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Get the total length of a descriptor chain. */ static inline u=
32<br>
&gt; &#43;mlxbf_tmfifo_virtio_get_pkt_len(struct virtio_device *vdev,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct vring_=
desc *desc,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct vring =
*vr)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; u32 len =3D 0, idx;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; while (desc) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; len &#43;=3D virtio32_to_cpu(vdev, desc-&gt;len);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (!(virtio16_to_cpu(vdev, desc-&gt;flags) &amp;<br>
&gt; VRING_DESC_F_NEXT))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; idx =3D virtio16_to_cpu(vdev, desc-&gt;next);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; desc =3D &amp;vr-&gt;desc[idx];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return len;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;static void mlxbf_tmfifo_release_pkt(struct virtio_device *vdev,<=
br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmf=
ifo_vring *vring,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct vring_des=
c **desc)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct vring *vr =3D (struct vring *)vir=
tqueue_get_vring(vring-&gt;vq);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct vring_desc *desc_head;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t pkt_len =3D 0;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!vr)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (desc !=3D NULL &amp;&amp; *desc !=3D=
 NULL &amp;&amp; vring-&gt;desc_head !=3D NULL) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; desc_head =3D vring-&gt;desc_head;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; pkt_len =3D vring-&gt;pkt_len;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; desc_head =3D mlxbf_tmfifo_virtio_get_next_desc(vring-&gt;vq);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (desc_head !=3D NULL) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkt_len =3D mlxbf_t=
mfifo_virtio_get_pkt_len(<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; vdev, desc_head, vr);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (desc_head !=3D NULL)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; mlxbf_tmfifo_virtio_release_desc(vdev, vr, desc_head,<br>
&gt; pkt_len);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (desc !=3D NULL)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; *desc =3D NULL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; vring-&gt;pkt_len =3D 0;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* House-keeping timer. */<br>
&gt; &#43;static void mlxbf_tmfifo_timer(struct timer_list *arg) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo *fifo;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fifo =3D container_of(arg, struct mlxbf_=
tmfifo, timer);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Wake up the work handler to poll=
 the Rx FIFO in case interrupt<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * missing or any leftover bytes st=
uck in the FIFO.<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; test_and_set_bit(MLXBF_TM_RX_HWM_IRQ, &a=
mp;fifo-&gt;pend_events);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Wake up Tx handler in case virti=
o has queued too many packets<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * and are waiting for buffer retur=
n.<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; test_and_set_bit(MLXBF_TM_TX_LWM_IRQ, &a=
mp;fifo-&gt;pend_events);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; schedule_work(&amp;fifo-&gt;work);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mod_timer(&amp;fifo-&gt;timer, jiffies &=
#43; mlxbf_tmfifo_timer_interval); }<br>
&gt; &#43;<br>
&gt; &#43;/* Buffer the console output. */<br>
&gt; &#43;static void mlxbf_tmfifo_console_output(struct mlxbf_tmfifo_vdev =
*cons,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; struct virtqueue *vq)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct vring *vr =3D (struct vring *)vir=
tqueue_get_vring(vq);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct vring_desc *head_desc, *desc =3D =
NULL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct virtio_device *vdev =3D &amp;cons=
-&gt;vdev;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; u32 len, pkt_len, idx;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; void *addr;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; for (;;) {<br>
<br>
It's better to modify it as while(on some condition)<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; head_desc =3D mlxbf_tmfifo_virtio_get_next_desc(vq);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (head_desc =3D=3D NULL)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Release the packet if no more space. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; pkt_len =3D mlxbf_tmfifo_virtio_get_pkt_len(vdev, head_desc,<br>
&gt; vr);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (pkt_len &gt; mlxbf_tmfifo_vdev_tx_buf_avail(cons)) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mlxbf_tmfifo_virtio=
_release_desc(vdev, vr, head_desc,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; pkt_len);<br>
<br>
Why do you break line here?<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; desc =3D head_desc;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; while (desc !=3D NULL) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addr =3D phys_to_vi=
rt(virtio64_to_cpu(vdev, desc-&gt;addr));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D virtio32_to=
_cpu(vdev, desc-&gt;len);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (len &lt;=3D MLX=
BF_TMFIFO_CONS_TX_BUF_SIZE -<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; cons-&gt;tx_tail) {<br>
<br>
Why do you break line here? Also below I see few strange breaks.<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(cons-&gt;tx_buf &#43; cons-&gt;tx_tail,=
 addr,<br>
&gt; len);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 seg;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; seg =3D MLXBF_TMFIFO_CONS_TX_BUF_SIZE -<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; cons-&gt;tx_tail;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(cons-&gt;tx_buf &#43; cons-&gt;tx_tail,=
 addr,<br>
&gt; seg);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; addr &#43;=3D seg;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(cons-&gt;tx_buf, addr, len - seg);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mlxbf_tmfifo_vdev_t=
x_buf_push(cons, len);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(virtio16_to_c=
pu(vdev, desc-&gt;flags) &amp;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; VRING_DESC_F_NEXT))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; idx =3D virtio16_to=
_cpu(vdev, desc-&gt;next);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; desc =3D &amp;vr-&g=
t;desc[idx];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; mlxbf_tmfifo_virtio_release_desc(vdev, vr, head_desc,<br>
&gt; pkt_len);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Rx &amp; Tx processing of a virtual queue. */ static void<br>
&gt; &#43;mlxbf_tmfifo_virtio_rxtx(struct virtqueue *vq, bool is_rx) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int num_avail =3D 0, hdr_len, tx_reserve=
;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vring *vring;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vdev *cons;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct virtio_device *vdev;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo *fifo;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct vring_desc *desc;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long flags;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct vring *vr;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; u64 sts, data;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; u32 len, idx;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; void *addr;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!vq)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; vring =3D (struct mlxbf_tmfifo_vring *)v=
q-&gt;priv;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fifo =3D vring-&gt;fifo;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; vr =3D (struct vring *)virtqueue_get_vri=
ng(vq);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!fifo-&gt;vdev[vring-&gt;vdev_id])<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; vdev =3D &amp;fifo-&gt;vdev[vring-&gt;vd=
ev_id]-&gt;vdev;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; cons =3D fifo-&gt;vdev[VIRTIO_ID_CONSOLE=
];<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* Don't continue if another vring is ru=
nning. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (fifo-&gt;vring[is_rx] !=3D NULL &amp=
;&amp; fifo-&gt;vring[is_rx] !=3D vring)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* tx_reserve is used to reserved some r=
oom in FIFO for console. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (vring-&gt;vdev_id =3D=3D VIRTIO_ID_N=
ET) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; hdr_len =3D sizeof(struct virtio_net_hdr);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; tx_reserve =3D fifo-&gt;tx_fifo_size / 16;<br>
<br>
Use some define instead of 16/<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; BUG_ON(vring-&gt;vdev_id !=3D VIRTIO_ID_CONSOLE);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; hdr_len =3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; tx_reserve =3D 1;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; desc =3D vring-&gt;desc;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; while (1) {<br>
<br>
I see there are few drivers in platform which use while (1)<br>
But it looks better to use while(some condition)<br>
and instead of break change this condition to false.<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Get available FIFO space. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (num_avail =3D=3D 0) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_rx) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get the number of available words in FIFO.<=
br>
&gt; */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; sts =3D readq(fifo-&gt;rx_base &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; MLXBF_TMFIFO_RX_STS);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; num_avail =3D FIELD_GET(<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MLXBF_TMFIFO_RX_STS__COUNT_M=
ASK, sts);<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_avail =3D FIELD_GET(TMFIFO_RX_STS_=
_COUNT_MASK, sts);<br>
<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Don't continue if nothing in FIFO. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (num_avail &lt;=3D 0)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get available space in FIFO. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; sts =3D readq(fifo-&gt;tx_base &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; MLXBF_TMFIFO_TX_STS);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; num_avail =3D fifo-&gt;tx_fifo_size - tx_reser=
ve -<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; FIELD_GET(<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MLXBF_TMFIFO_TX_STS__COUNT_M=
ASK,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sts);<br>
<br>
Same as above.<br>
<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (num_avail &lt;=3D 0)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Console output always comes from the Tx buffer. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (!is_rx &amp;&amp; vring-&gt;vdev_id =3D=3D VIRTIO_ID_CONSOLE &a=
mp;&amp;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cons !=3D NULL &amp;&amp; cons-&gt;tx_buf !=
=3D NULL) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; union mlxbf_tmfifo_=
msg_hdr hdr;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int size;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size =3D mlxbf_tmfi=
fo_vdev_tx_buf_len(cons);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (num_avail &lt; =
2 || size =3D=3D 0)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (size &#43; size=
of(hdr) &gt; num_avail * sizeof(u64))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; size =3D num_avail * sizeof(u64) - sizeof(hdr)=
;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Write header. */=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hdr.data =3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hdr.type =3D VIRTIO=
_ID_CONSOLE;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hdr.len =3D htons(s=
ize);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; writeq(cpu_to_le64(=
hdr.data),<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; fifo-&gt;tx_base &#43; MLXBF_TMFIFO_TX_DATA);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock_irqsave(&=
amp;fifo-&gt;spin_lock, flags);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (size &gt; 0)=
 {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; addr =3D cons-&gt;tx_buf &#43; cons-&gt;tx_hea=
d;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (cons-&gt;tx_head &#43; sizeof(u64) &lt;=3D=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MLXBF_TMFIFO_CONS_TX_B=
UF_SIZE) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; memcpy(&amp;data, addr, sizeof(u64));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; int partial;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; partial =3D<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MLXBF_TMFIFO_CONS_TX_BUF_SIZ=
E -<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cons-&gt;tx_head;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; memcpy(&amp;data, addr, partial);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; memcpy((u8 *)&amp;data &#43; partial,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cons-&gt;tx_buf,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(u64) - partial);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; writeq(data,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fifo=
-&gt;tx_base &#43; MLXBF_TMFIFO_TX_DATA);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (size &gt;=3D sizeof(u64)) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; mlxbf_tmfifo_vdev_tx_buf_pop(<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cons, sizeof(u64));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; size -=3D sizeof(u64);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; mlxbf_tmfifo_vdev_tx_buf_pop(<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cons, size);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; size =3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock_irqrest=
ore(&amp;fifo-&gt;spin_lock, flags);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Get the desc of next packet. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (!desc) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Save the head de=
sc of the chain. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vring-&gt;desc_head=
 =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; mlxbf_tmfifo_virtio_get_next_desc(vq);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!vring-&gt;desc=
_head) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; vring-&gt;desc =3D NULL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; desc =3D vring-&gt;=
desc_head;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vring-&gt;desc =3D =
desc;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_rx &amp;&amp=
; vring-&gt;vdev_id =3D=3D VIRTIO_ID_NET) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; struct virtio_net_hdr *net_hdr;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Initialize the packet header. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; net_hdr =3D (struct virtio_net_hdr *)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; phys_to_virt(virtio64_to_cpu(<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdev, desc-&gt;addr));<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(net_hdr, 0, sizeof(*net_hdr));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Beginning of each packet. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (vring-&gt;pkt_len =3D=3D 0) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int vdev_id, vring_=
change =3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; union mlxbf_tmfifo_=
msg_hdr hdr;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_avail--;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Read/Write packe=
t length. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_rx) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; hdr.data =3D readq(fifo-&gt;rx_base &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MLXBF_TMFIFO_RX_DAT=
A);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; hdr.data =3D le64_to_cpu(hdr.data);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Skip the length 0 packet (keepalive). */<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (hdr.len =3D=3D 0)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; continue;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Check packet type. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (hdr.type =3D=3D VIRTIO_ID_NET) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; struct virtio_net_config *config;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; vdev_id =3D VIRTIO_ID_NET;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; hdr_len =3D sizeof(struct virtio_net_hdr);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; config =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &amp;fifo-&gt;vdev[vdev_id]-&gt;config.net;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; if (ntohs(hdr.len) &gt; config-&gt;mtu &#43;<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MLXBF_TMFIFO_NET_L2_OVERHEAD=
)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (hdr.type =3D=3D VIRTIO_ID_CONSOLE) =
{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; vdev_id =3D VIRTIO_ID_CONSOLE;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; hdr_len =3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; continue;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Check whether the new packet still bel=
ongs<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * to this vring or not. If not, update t=
he<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * pkt_len of the new vring and return.<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vdev_id !=3D vring-&gt;vdev_id) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; struct mlxbf_tmfifo_vdev *dev2 =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fifo-&gt;vdev[vdev_id];<b=
r>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; if (!dev2)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; vring-&gt;desc =3D desc;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; vring =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &amp;dev2-<br>
&gt; &gt;vrings[MLXBF_TMFIFO_VRING_RX];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; vring_change =3D 1;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; vring-&gt;pkt_len =3D ntohs(hdr.len) &#43; hdr=
_len;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; vring-&gt;pkt_len =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; mlxbf_tmfifo_virtio_get_pkt_len(<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdev, desc, vr);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; hdr.data =3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; hdr.type =3D (vring-&gt;vdev_id =3D=3D VIRTIO_=
ID_NET) ?<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; VIRTIO_ID_NET :<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; VIRTIO_ID_CONSOLE;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; hdr.len =3D htons(vring-&gt;pkt_len - hdr_len)=
;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; writeq(cpu_to_le64(hdr.data),<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fifo=
-&gt;tx_base &#43; MLXBF_TMFIFO_TX_DATA);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vring-&gt;cur_len =
=3D hdr_len;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vring-&gt;rem_len =
=3D vring-&gt;pkt_len;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fifo-&gt;vring[is_r=
x] =3D vring;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vring_change)<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Check available space in this desc. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; len =3D virtio32_to_cpu(vdev, desc-&gt;len);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (len &gt; vring-&gt;rem_len)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D vring-&gt;r=
em_len;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Check if the current desc is already done. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (vring-&gt;cur_len =3D=3D len)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto check_done;<br=
>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; addr =3D phys_to_virt(virtio64_to_cpu(vdev, desc-&gt;addr));<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Read a word from FIFO for Rx. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (is_rx) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data =3D readq(fifo=
-&gt;rx_base &#43;<br>
&gt; MLXBF_TMFIFO_RX_DATA);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data =3D le64_to_cp=
u(data);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (vring-&gt;cur_len &#43; sizeof(u64) &lt;=3D len) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* The whole word. =
*/<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_rx) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(addr &#43; vring-&gt;cur_len, &amp;data=
,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size=
of(u64));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(&amp;data, addr &#43; vring-&gt;cur_len=
,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size=
of(u64));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
Why not just.<br>
Also few places like this one below.<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_rx)<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(addr &#43; vring-&gt;cur_len, &=
amp;data, sizeof(u64));<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(&amp;data, addr &#43; vring-&gt=
;cur_len, sizeof(u64));<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vring-&gt;cur_len &=
#43;=3D sizeof(u64);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; } else {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Leftover bytes. =
*/<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BUG_ON(vring-&gt;cu=
r_len &gt; len);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_rx) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(addr &#43; vring-&gt;cur_len, &amp;data=
,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =
- vring-&gt;cur_len);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(&amp;data, addr &#43; vring-&gt;cur_len=
,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =
- vring-&gt;cur_len);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vring-&gt;cur_len =
=3D len;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Write the word into FIFO for Tx. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (!is_rx) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; writeq(cpu_to_le64(=
data),<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; fifo-&gt;tx_base &#43; MLXBF_TMFIFO_TX_DATA);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; num_avail--;<br>
&gt; &#43;<br>
&gt; &#43;check_done:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Check whether this desc is full or completed. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (vring-&gt;cur_len =3D=3D len) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vring-&gt;cur_len =
=3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vring-&gt;rem_len -=
=3D len;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get the next des=
c on the chain. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vring-&gt;rem_l=
en &gt; 0 &amp;&amp;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; (virtio16_to_cpu(vdev, desc-&gt;flags) &amp;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VRING_DESC_F_NEXT)) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; idx =3D virtio16_to_cpu(vdev, desc-&gt;next);<=
br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; desc =3D &amp;vr-&gt;desc[idx];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Done and release=
 the desc. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mlxbf_tmfifo_releas=
e_pkt(vdev, vring, &amp;desc);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fifo-&gt;vring[is_r=
x] =3D NULL;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Notify upper lay=
er that packet is done. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock_irqsave(&=
amp;fifo-&gt;spin_lock, flags);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vring_interrupt(0, =
vq);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock_irqrest=
ore(&amp;fifo-&gt;spin_lock, flags);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* Save the current desc. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; vring-&gt;desc =3D desc;<br>
&gt; &#43;}<br>
<br>
I suggest to split mlxbf_tmfifo_virtio_rxtx() into few small routines.<br>
<br>
<br>
&gt; &#43;<br>
&gt; &#43;/* The notify function is called when new buffers are posted. */ =
static<br>
&gt; &#43;bool mlxbf_tmfifo_virtio_notify(struct virtqueue *vq) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vring *vring;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo *fifo;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long flags;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; vring =3D (struct mlxbf_tmfifo_vring *)v=
q-&gt;priv;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fifo =3D vring-&gt;fifo;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Virtio maintains vrings in pairs=
, even number ring for Rx<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * and odd number ring for Tx.<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!(vring-&gt;id &amp; 1)) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Set the RX HWM bit to start Rx. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (!test_and_set_bit(MLXBF_TM_RX_HWM_IRQ, &amp;fifo-<br>
&gt; &gt;pend_events))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; schedule_work(&amp;=
fifo-&gt;work);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /*<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; * Console could make blocking call with interrupts disabled.<=
br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; * In such case, the vring needs to be served right away. For<=
br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; * other cases, just set the TX LWM bit to start Tx in the<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; * worker handler.<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (vring-&gt;vdev_id =3D=3D VIRTIO_ID_CONSOLE) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock_irqsave(&=
amp;fifo-&gt;spin_lock, flags);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mlxbf_tmfifo_consol=
e_output(<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; fifo-&gt;vdev[VIRTIO_ID_CONSOLE], vq);<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mlxbf_tmfif=
o_console_output(fifo-&gt;vdev[VIRTIO_ID_CONSOLE], vq);<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock_irqrest=
ore(&amp;fifo-&gt;spin_lock, flags);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; schedule_work(&amp;=
fifo-&gt;work);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; } else if (!test_and_set_bit(MLXBF_TM_TX_LWM_IRQ,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;fifo-&gt;pend_events))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; schedule_work(&amp;=
fifo-&gt;work);<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; If {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; } else if {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br>
<br>
For consistency.<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Work handler for Rx and Tx case. */<br>
&gt; &#43;static void mlxbf_tmfifo_work_handler(struct work_struct *work) {=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vdev *tm_vdev;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo *fifo;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fifo =3D container_of(work, struct mlxbf=
_tmfifo, work);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!fifo-&gt;is_ready)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;fifo-&gt;lock);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* Tx (Send data to the TmFifo). */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (test_and_clear_bit(MLXBF_TM_TX_LWM_I=
RQ, &amp;fifo-&gt;pend_events)<br>
&gt; &amp;&amp;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fifo-&gt;irq_info[MLXBF_T=
M_TX_LWM_IRQ].irq) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; for (i =3D 0; i &lt; MLXBF_TMFIFO_VDEV_MAX; i&#43;&#43;) {<br>
<br>
I suggest to define local variable vq.<br>
And have below:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mlxbf_tmfifo_virtio_rxtx(vq, false);<b=
r>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev =3D fifo-&g=
t;vdev[i];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tm_vdev !=3D NU=
LL) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; mlxbf_tmfifo_virtio_rxtx(<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev-<br>
&gt; &gt;vrings[MLXBF_TMFIFO_VRING_TX].vq,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; false);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* Rx (Receive data from the TmFifo). */=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (test_and_clear_bit(MLXBF_TM_RX_HWM_I=
RQ, &amp;fifo-&gt;pend_events)<br>
&gt; &amp;&amp;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fifo-&gt;irq_info[MLXBF_T=
M_RX_HWM_IRQ].irq) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; for (i =3D 0; i &lt; MLXBF_TMFIFO_VDEV_MAX; i&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev =3D fifo-&g=
t;vdev[i];<br>
<br>
Same as above.<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tm_vdev !=3D NU=
LL) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; mlxbf_tmfifo_virtio_rxtx(<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev-<br>
&gt; &gt;vrings[MLXBF_TMFIFO_VRING_RX].vq,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; true);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;fifo-&gt;lock);<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Get the array of feature bits for this device. */ static u64<b=
r>
&gt; &#43;mlxbf_tmfifo_virtio_get_features(struct virtio_device *vdev) {<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vdev *tm_vdev;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev =3D container_of(vdev, struct ml=
xbf_tmfifo_vdev, vdev);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return tm_vdev-&gt;features;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Confirm device features to use. */<br>
&gt; &#43;static int mlxbf_tmfifo_virtio_finalize_features(struct virtio_de=
vice<br>
&gt; &#43;*vdev) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vdev *tm_vdev;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev =3D container_of(vdev, struct ml=
xbf_tmfifo_vdev, vdev);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev-&gt;features =3D vdev-&gt;featur=
es;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Free virtqueues found by find_vqs(). */ static void<br>
&gt; &#43;mlxbf_tmfifo_virtio_del_vqs(struct virtio_device *vdev) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vdev *tm_vdev;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vring *vring;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct virtqueue *vq;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev =3D container_of(vdev, struct ml=
xbf_tmfifo_vdev, vdev);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(tm_vdev-=
&gt;vrings); i&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vring =3D &amp;tm_vdev-&gt;vrings[i];<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Release the pending packet. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (vring-&gt;desc !=3D NULL) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mlxbf_tmfifo_releas=
e_pkt(&amp;tm_vdev-&gt;vdev, vring,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;vring-&gt;desc=
);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vq =3D vring-&gt;vq;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (vq) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vring-&gt;vq =3D NU=
LL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vring_del_virtqueue=
(vq);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Create and initialize the virtual queues. */ static int<br>
&gt; &#43;mlxbf_tmfifo_virtio_find_vqs(struct virtio_device *vdev,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; unsigned int nvqs,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; struct virtqueue *vqs[],<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; vq_callback_t *callbacks[],<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; const char * const names[],<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; const bool *ctx,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; struct irq_affinity *desc)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vdev *tm_vdev;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vring *vring;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int i, ret =3D -EINVAL, size;<br>
<br>
Don't initialize ret with -EINVAL.<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct virtqueue *vq;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev =3D container_of(vdev, struct ml=
xbf_tmfifo_vdev, vdev);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (nvqs &gt; ARRAY_SIZE(tm_vdev-&gt;vri=
ngs))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return -EINVAL;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; nvqs; &#43;&#43;i) =
{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (!names[i])<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto error;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vring =3D &amp;tm_vdev-&gt;vrings[i];<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* zero vring */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; size =3D vring_size(vring-&gt;size, vring-&gt;align);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; memset(vring-&gt;va, 0, size);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vq =3D vring_new_virtqueue(i, vring-&gt;size, vring-&gt;align, vdev=
,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; false, false, vring-&gt;va,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; mlxbf_tmfifo_virtio_notify,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; callbacks[i], names[i]);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (!vq) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_err(&amp;vdev-&=
gt;dev, &quot;vring_new_virtqueue failed\n&quot;);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D -ENOMEM;<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto error;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vqs[i] =3D vq;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vring-&gt;vq =3D vq;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vq-&gt;priv =3D vring;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &#43;<br>
&gt; &#43;error:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mlxbf_tmfifo_virtio_del_vqs(vdev);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Read the status byte. */<br>
&gt; &#43;static u8 mlxbf_tmfifo_virtio_get_status(struct virtio_device *vd=
ev) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vdev *tm_vdev;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev =3D container_of(vdev, struct ml=
xbf_tmfifo_vdev, vdev);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return tm_vdev-&gt;status;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Write the status byte. */<br>
&gt; &#43;static void mlxbf_tmfifo_virtio_set_status(struct virtio_device *=
vdev,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; u8 status)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vdev *tm_vdev;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev =3D container_of(vdev, struct ml=
xbf_tmfifo_vdev, vdev);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev-&gt;status =3D status;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Reset the device. Not much here for now. */ static void<br>
&gt; &#43;mlxbf_tmfifo_virtio_reset(struct virtio_device *vdev) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vdev *tm_vdev;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev =3D container_of(vdev, struct ml=
xbf_tmfifo_vdev, vdev);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev-&gt;status =3D 0;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Read the value of a configuration field. */ static void<br>
&gt; &#43;mlxbf_tmfifo_virtio_get(struct virtio_device *vdev,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; unsigned int offset,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; void *buf,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; unsigned int len)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vdev *tm_vdev;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev =3D container_of(vdev, struct ml=
xbf_tmfifo_vdev, vdev);<br>
&gt; &#43;<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int pos =3D offset &#43=
; len;<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pos &gt; sizeof(tm_vdev-&gt;=
config) || pos &lt; len)<br>
<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (offset &#43; len &gt; sizeof(tm_vdev=
-&gt;config) || offset &#43; len &lt; len) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dev_err(vdev-&gt;dev.parent, &quot;virtio_get access out of bounds\=
n&quot;);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(buf, (u8 *)&amp;tm_vdev-&gt;confi=
g &#43; offset, len); }<br>
&gt; &#43;<br>
&gt; &#43;/* Write the value of a configuration field. */ static void<br>
&gt; &#43;mlxbf_tmfifo_virtio_set(struct virtio_device *vdev,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int offset,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const void *buf,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int len)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vdev *tm_vdev;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev =3D container_of(vdev, struct ml=
xbf_tmfifo_vdev, vdev);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (offset &#43; len &gt; sizeof(tm_vdev=
-&gt;config) || offset &#43; len &lt; len) {<br>
<br>
Same as above.<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dev_err(vdev-&gt;dev.parent, &quot;virtio_get access out of bounds\=
n&quot;);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; memcpy((u8 *)&amp;tm_vdev-&gt;config &#4=
3; offset, buf, len); }<br>
&gt; &#43;<br>
&gt; &#43;/* Virtio config operations. */<br>
&gt; &#43;static const struct virtio_config_ops mlxbf_tmfifo_virtio_config_=
ops =3D {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .get_features =3D mlxbf_tmfifo_virtio_ge=
t_features,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .finalize_features =3D mlxbf_tmfifo_virt=
io_finalize_features,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .find_vqs =3D mlxbf_tmfifo_virtio_find_v=
qs,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .del_vqs =3D mlxbf_tmfifo_virtio_del_vqs=
,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .reset =3D mlxbf_tmfifo_virtio_reset,<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .set_status =3D mlxbf_tmfifo_virtio_set_=
status,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .get_status =3D mlxbf_tmfifo_virtio_get_=
status,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .get =3D mlxbf_tmfifo_virtio_get,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .set =3D mlxbf_tmfifo_virtio_set,<br>
&gt; &#43;};<br>
&gt; &#43;<br>
&gt; &#43;/* Create vdev type in a tmfifo. */<br>
&gt; &#43;int mlxbf_tmfifo_create_vdev(struct mlxbf_tmfifo *fifo, int vdev_=
id,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; u64 features, void *config, u32 size) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vdev *tm_vdev;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;fifo-&gt;lock);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev =3D fifo-&gt;vdev[vdev_id];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (tm_vdev !=3D NULL) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; pr_err(&quot;vdev %d already exists\n&quot;, vdev_id);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ret =3D -EEXIST;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; goto already_exist;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev =3D kzalloc(sizeof(*tm_vdev), GF=
P_KERNEL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!tm_vdev) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ret =3D -ENOMEM;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; goto already_exist;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev-&gt;vdev.id.device =3D vdev_id;<=
br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev-&gt;vdev.config =3D &amp;mlxbf_t=
mfifo_virtio_config_ops;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev-&gt;vdev.dev.parent =3D &amp;fif=
o-&gt;pdev-&gt;dev;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev-&gt;vdev.dev.release =3D mlxbf_t=
mfifo_virtio_dev_release;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev-&gt;features =3D features;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (config)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; memcpy(&amp;tm_vdev-&gt;config, config, size);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (mlxbf_tmfifo_alloc_vrings(fifo, tm_v=
dev, vdev_id)) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; pr_err(&quot;Unable to allocate vring\n&quot;);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ret =3D -ENOMEM;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; goto alloc_vring_fail;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (vdev_id =3D=3D VIRTIO_ID_CONSOLE) {<=
br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; tm_vdev-&gt;tx_buf =3D<br>
&gt; kmalloc(MLXBF_TMFIFO_CONS_TX_BUF_SIZE,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; GFP_KERNEL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fifo-&gt;vdev[vdev_id] =3D tm_vdev;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* Register the virtio device. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D register_virtio_device(&amp;tm_v=
dev-&gt;vdev);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dev_err(&amp;fifo-&gt;pdev-&gt;dev, &quot;register_virtio_device() =
failed\n&quot;);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; goto register_fail;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;fifo-&gt;lock);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &#43;<br>
&gt; &#43;register_fail:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mlxbf_tmfifo_free_vrings(fifo, vdev_id);=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fifo-&gt;vdev[vdev_id] =3D NULL;<br>
&gt; &#43;alloc_vring_fail:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; kfree(tm_vdev);<br>
&gt; &#43;already_exist:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;fifo-&gt;lock);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Delete vdev type from a tmfifo. */<br>
&gt; &#43;int mlxbf_tmfifo_delete_vdev(struct mlxbf_tmfifo *fifo, int vdev_=
id) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo_vdev *tm_vdev;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;fifo-&gt;lock);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* Unregister vdev. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tm_vdev =3D fifo-&gt;vdev[vdev_id];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (tm_vdev) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; unregister_virtio_device(&amp;tm_vdev-&gt;vdev);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; mlxbf_tmfifo_free_vrings(fifo, vdev_id);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; kfree(tm_vdev-&gt;tx_buf);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; kfree(tm_vdev);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; fifo-&gt;vdev[vdev_id] =3D NULL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;fifo-&gt;lock);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Device remove function. */<br>
&gt; &#43;static int mlxbf_tmfifo_remove(struct platform_device *pdev) {<br=
>
<br>
Locate it after probe.<br>
If you'll use all devm_, like Andy noted:<br>
devm_ioremap<br>
devm_ioremap_resource<br>
devm_kzalloc<br>
devm_request_mem_region<br>
you can drop all kfree, release_mem_region, iounmap<br>
<br>
And make the below as a separate routine, something like<br>
mlxbf_tmfifo_cleanup(), if you still need it.<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo *fifo =3D platform_g=
et_drvdata(pdev);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct resource *rx_res, *tx_res;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (fifo) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; mutex_lock(&amp;mlxbf_tmfifo_lock);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; fifo-&gt;is_ready =3D false;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Stop the timer. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; del_timer_sync(&amp;fifo-&gt;timer);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Release interrupts. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; mlxbf_tmfifo_free_irqs(fifo);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Cancel the pending work. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; cancel_work_sync(&amp;fifo-&gt;work);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; for (i =3D 0; i &lt; MLXBF_TMFIFO_VDEV_MAX; i&#43;&#43;)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mlxbf_tmfifo_delete=
_vdev(fifo, i);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Release IO resources. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (fifo-&gt;rx_base)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iounmap(fifo-&gt;rx=
_base);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (fifo-&gt;tx_base)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iounmap(fifo-&gt;tx=
_base);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; platform_set_drvdata(pdev, NULL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; kfree(fifo);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; mutex_unlock(&amp;mlxbf_tmfifo_lock);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; rx_res =3D platform_get_resource(pdev, I=
ORESOURCE_MEM, 0);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (rx_res)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; release_mem_region(rx_res-&gt;start, resource_size(rx_res));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tx_res =3D platform_get_resource(pdev, I=
ORESOURCE_MEM, 1);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (tx_res)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; release_mem_region(tx_res-&gt;start, resource_size(tx_res));<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Read the configured network MAC address from efi variable. */ =
static<br>
&gt; &#43;void mlxbf_tmfifo_get_cfg_mac(u8 *mac) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; efi_char16_t name[] =3D {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; 'R', 's', 'h', 'i', 'm', 'M', 'a', 'c', 'A', 'd', 'd', 'r', 0 };<br=
>
<br>
<br>
Could it be moved out and set like:<br>
static const efi_char16_t mlxbf_tmfifo_efi_name[] =3D &quot;...&quot;;<br>
Could you check if the are some examples in kernel, please?<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; efi_guid_t guid =3D EFI_GLOBAL_VARIABLE_=
GUID;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; efi_status_t status;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long size;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; u8 buf[6];<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; size =3D sizeof(buf);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; status =3D efi.get_variable(name, &amp;g=
uid, NULL, &amp;size, buf);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (status =3D=3D EFI_SUCCESS &amp;&amp;=
 size =3D=3D sizeof(buf))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; memcpy(mac, buf, sizeof(buf));<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;/* Probe the TMFIFO. */<br>
&gt; &#43;static int mlxbf_tmfifo_probe(struct platform_device *pdev) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct virtio_net_config net_config;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct resource *rx_res, *tx_res;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct mlxbf_tmfifo *fifo;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int i, ret;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; u64 ctl;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* Get the resource of the Rx &amp; Tx F=
IFO. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; rx_res =3D platform_get_resource(pdev, I=
ORESOURCE_MEM, 0);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; tx_res =3D platform_get_resource(pdev, I=
ORESOURCE_MEM, 1);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!rx_res || !tx_res) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ret =3D -EINVAL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; goto err;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (request_mem_region(rx_res-&gt;start,=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; resource_size(rx_res), &quot;bf-tmfifo&quot;) =3D=3D=
 NULL) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ret =3D -EBUSY;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; goto early_err;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (request_mem_region(tx_res-&gt;start,=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; resource_size(tx_res), &quot;bf-tmfifo&quot;) =3D=3D=
 NULL) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; release_mem_region(rx_res-&gt;start, resource_size(rx_res));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ret =3D -EBUSY;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; goto early_err;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D -ENOMEM;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fifo =3D kzalloc(sizeof(struct mlxbf_tmf=
ifo), GFP_KERNEL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!fifo)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; goto err;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fifo-&gt;pdev =3D pdev;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; platform_set_drvdata(pdev, fifo);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock_init(&amp;fifo-&gt;spin_lock);=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; INIT_WORK(&amp;fifo-&gt;work, mlxbf_tmfi=
fo_work_handler);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; timer_setup(&amp;fifo-&gt;timer, mlxbf_t=
mfifo_timer, 0);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fifo-&gt;timer.function =3D mlxbf_tmfifo=
_timer;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; MLXBF_TM_IRQ_CNT; i=
&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; fifo-&gt;irq_info[i].index =3D i;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; fifo-&gt;irq_info[i].fifo =3D fifo;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; fifo-&gt;irq_info[i].irq =3D platform_get_irq(pdev, i);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ret =3D request_irq(fifo-&gt;irq_info[i].irq,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mlxbf_tmfifo_irq_handler, 0,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;tmfifo&quot;, &amp;fifo-&gt;=
irq_info[i]);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (ret) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_err(&quot;Unable=
 to request irq\n&quot;);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fifo-&gt;irq_info[i=
].irq =3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto err;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fifo-&gt;rx_base =3D ioremap(rx_res-&gt;=
start, resource_size(rx_res));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!fifo-&gt;rx_base)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; goto err;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fifo-&gt;tx_base =3D ioremap(tx_res-&gt;=
start, resource_size(tx_res));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!fifo-&gt;tx_base)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; goto err;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* Get Tx FIFO size and set the low/high=
 watermark. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ctl =3D readq(fifo-&gt;tx_base &#43; MLX=
BF_TMFIFO_TX_CTL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fifo-&gt;tx_fifo_size =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; FIELD_GET(MLXBF_TMFIFO_TX_CTL__MAX_ENTRIES_MASK,<br>
&gt; ctl);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ctl =3D (ctl &amp; ~MLXBF_TMFIFO_TX_CTL_=
_LWM_MASK) |<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; FIELD_PREP(MLXBF_TMFIFO_TX_CTL__LWM_MASK,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ifo-&gt;tx_fifo_size / 2);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ctl =3D (ctl &amp; ~MLXBF_TMFIFO_TX_CTL_=
_HWM_MASK) |<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; FIELD_PREP(MLXBF_TMFIFO_TX_CTL__HWM_MASK,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ifo-&gt;tx_fifo_size - 1);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; writeq(ctl, fifo-&gt;tx_base &#43; MLXBF=
_TMFIFO_TX_CTL);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* Get Rx FIFO size and set the low/high=
 watermark. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ctl =3D readq(fifo-&gt;rx_base &#43; MLX=
BF_TMFIFO_RX_CTL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fifo-&gt;rx_fifo_size =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; FIELD_GET(MLXBF_TMFIFO_RX_CTL__MAX_ENTRIES_MASK,<br>
&gt; ctl);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ctl =3D (ctl &amp; ~MLXBF_TMFIFO_RX_CTL_=
_LWM_MASK) |<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; FIELD_PREP(MLXBF_TMFIFO_RX_CTL__LWM_MASK, 0);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ctl =3D (ctl &amp; ~MLXBF_TMFIFO_RX_CTL_=
_HWM_MASK) |<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; FIELD_PREP(MLXBF_TMFIFO_RX_CTL__HWM_MASK, 1);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; writeq(ctl, fifo-&gt;rx_base &#43; MLXBF=
_TMFIFO_RX_CTL);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mutex_init(&amp;fifo-&gt;lock);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* Create the console vdev. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D mlxbf_tmfifo_create_vdev(fifo, V=
IRTIO_ID_CONSOLE, 0, NULL, 0);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; goto err;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* Create the network vdev. */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;net_config, 0, sizeof(net_co=
nfig));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; net_config.mtu =3D MLXBF_TMFIFO_NET_MTU;=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; net_config.status =3D VIRTIO_NET_S_LINK_=
UP;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(net_config.mac, mlxbf_tmfifo_net_=
default_mac, 6);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mlxbf_tmfifo_get_cfg_mac(net_config.mac)=
;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D mlxbf_tmfifo_create_vdev(fifo, V=
IRTIO_ID_NET,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; MLXBF_TMFIFO_NET_FEATURES, &amp;net_config,<br>
&gt; sizeof(net_config));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; goto err;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mod_timer(&amp;fifo-&gt;timer, jiffies &=
#43; mlxbf_tmfifo_timer_interval);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fifo-&gt;is_ready =3D true;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &#43;<br>
&gt; &#43;err:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mlxbf_tmfifo_remove(pdev);<br>
&gt; &#43;early_err:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; dev_err(&amp;pdev-&gt;dev, &quot;Probe F=
ailed\n&quot;);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;static const struct of_device_id mlxbf_tmfifo_match[] =3D {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; { .compatible =3D &quot;mellanox,bf-tmfi=
fo&quot; },<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; {},<br>
&gt; &#43;};<br>
&gt; &#43;MODULE_DEVICE_TABLE(of, mlxbf_tmfifo_match);<br>
&gt; &#43;<br>
&gt; &#43;static const struct acpi_device_id mlxbf_tmfifo_acpi_match[] =3D =
{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;MLNXBF01&quot;, 0 },<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; {},<br>
&gt; &#43;};<br>
&gt; &#43;MODULE_DEVICE_TABLE(acpi, mlxbf_tmfifo_acpi_match);<br>
&gt; &#43;<br>
&gt; &#43;static struct platform_driver mlxbf_tmfifo_driver =3D {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .probe =3D mlxbf_tmfifo_probe,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .remove =3D mlxbf_tmfifo_remove,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .driver =3D {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; .name =3D &quot;bf-tmfifo&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; .of_match_table =3D mlxbf_tmfifo_match,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; .acpi_match_table =3D ACPI_PTR(mlxbf_tmfifo_acpi_match),<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; &#43;};<br>
&gt; &#43;<br>
&gt; &#43;module_platform_driver(mlxbf_tmfifo_driver);<br>
&gt; &#43;<br>
&gt; &#43;MODULE_DESCRIPTION(&quot;Mellanox BlueField SoC TmFifo Driver&quo=
t;);<br>
&gt; &#43;MODULE_LICENSE(&quot;GPL&quot;); MODULE_AUTHOR(&quot;Mellanox Tec=
hnologies&quot;);<br>
&gt; --<br>
&gt; 1.8.3.1<br>
<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_DB6PR05MB3223750A26A7B56F56FD5203A1660DB6PR05MB3223eurp_--
