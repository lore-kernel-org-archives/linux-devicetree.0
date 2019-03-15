From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 1/9] soc: Add TmFifo driver for Mellanox BlueField Soc
Date: Fri, 15 Mar 2019 14:18:25 +0100
Message-ID: <39eb778e-64ae-ce81-ee66-3ff8eacd52b4@gmail.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
 <1546543042-156044-1-git-send-email-lsun@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1546543042-156044-1-git-send-email-lsun@mellanox.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Liming Sun <lsun@mellanox.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, David Woods <dwoods@mellanox.com>, Robin Murphy <robin.murphy@arm.com>, arm-soc <arm@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 03/01/2019 20:17, Liming Sun wrote:
> This commit adds the TmFifo driver for Mellanox BlueField Soc.
> TmFifo is a shared FIFO which enables external host machine to
> exchange data with the SoC via USB or PCIe. The driver is based on
> virtio framework and has console and network access enabled.
> 
> Reviewed-by: David Woods <dwoods@mellanox.com>
> Signed-off-by: Liming Sun <lsun@mellanox.com>
> ---
>  drivers/soc/Kconfig                |    1 +
>  drivers/soc/Makefile               |    1 +
>  drivers/soc/mellanox/Kconfig       |   18 +
>  drivers/soc/mellanox/Makefile      |    5 +
>  drivers/soc/mellanox/tmfifo.c      | 1244 ++++++++++++++++++++++++++++++++++++
>  drivers/soc/mellanox/tmfifo_regs.h |   76 +++
>  6 files changed, 1345 insertions(+)
>  create mode 100644 drivers/soc/mellanox/Kconfig
>  create mode 100644 drivers/soc/mellanox/Makefile
>  create mode 100644 drivers/soc/mellanox/tmfifo.c
>  create mode 100644 drivers/soc/mellanox/tmfifo_regs.h
> 
[..]
> diff --git a/drivers/soc/mellanox/tmfifo.c b/drivers/soc/mellanox/tmfifo.c
> new file mode 100644
> index 0000000..2975229
> --- /dev/null
> +++ b/drivers/soc/mellanox/tmfifo.c
[..]

> +
> +/* Console Tx buffer size. */
> +#define TMFIFO_CONS_TX_BUF_SIZE			(32 * 1024)
> +
> +/* House-keeping timer interval. */
> +static int tmfifo_timer_interval = HZ / 10;
> +module_param(tmfifo_timer_interval, int, 0644);
> +MODULE_PARM_DESC(tmfifo_timer_interval, "timer interval");
> +
> +/* Global lock. */
> +static DEFINE_MUTEX(tmfifo_lock);

Why do we need that? To synchronize between different tmfifo driver instances?

> +
> +/* Virtio ring size. */
> +static int tmfifo_vring_size = TMFIFO_VRING_SIZE;
> +module_param(tmfifo_vring_size, int, 0444);
> +MODULE_PARM_DESC(tmfifo_vring_size, "Size of the vring");
> +
> +/* Struct declaration. */
> +struct tmfifo;
> +
> +/* Virtual devices sharing the TM FIFO. */
> +#define TMFIFO_VDEV_MAX		(VIRTIO_ID_CONSOLE + 1)
> +
> +/* Structure to maintain the ring state. */
> +struct tmfifo_vring {
> +	void *va;			/* virtual address */
> +	dma_addr_t dma;			/* dma address */
> +	struct virtqueue *vq;		/* virtqueue pointer */
> +	struct vring_desc *desc;	/* current desc */
> +	struct vring_desc *desc_head;	/* current desc head */
> +	int cur_len;			/* processed len in current desc */
> +	int rem_len;			/* remaining length to be processed */
> +	int size;			/* vring size */
> +	int align;			/* vring alignment */
> +	int id;				/* vring id */
> +	int vdev_id;			/* TMFIFO_VDEV_xxx */
> +	u32 pkt_len;			/* packet total length */
> +	__virtio16 next_avail;		/* next avail desc id */
> +	struct tmfifo *fifo;		/* pointer back to the tmfifo */
> +};
> +
> +/* Interrupt types. */
> +enum {
> +	TM_RX_LWM_IRQ,			/* Rx low water mark irq */
> +	TM_RX_HWM_IRQ,			/* Rx high water mark irq */
> +	TM_TX_LWM_IRQ,			/* Tx low water mark irq */
> +	TM_TX_HWM_IRQ,			/* Tx high water mark irq */
> +	TM_IRQ_CNT
> +};
> +
> +/* Ring types (Rx & Tx). */
> +enum {
> +	TMFIFO_VRING_RX,		/* Rx ring */
> +	TMFIFO_VRING_TX,		/* Tx ring */
> +	TMFIFO_VRING_NUM
> +};
> +
> +struct tmfifo_vdev {
> +	struct virtio_device vdev;	/* virtual device */
> +	u8 status;
> +	u64 features;
> +	union {				/* virtio config space */
> +		struct virtio_console_config cons;
> +		struct virtio_net_config net;
> +	} config;
> +	struct tmfifo_vring vrings[TMFIFO_VRING_NUM];
> +	u8 *tx_buf;			/* tx buffer */
> +	u32 tx_head;			/* tx buffer head */
> +	u32 tx_tail;			/* tx buffer tail */
> +};
> +
> +struct tmfifo_irq_info {
> +	struct tmfifo *fifo;		/* tmfifo structure */
> +	int irq;			/* interrupt number */
> +	int index;			/* array index */
> +};
> +
> +/* TMFIFO device structure */
> +struct tmfifo {
> +	struct tmfifo_vdev *vdev[TMFIFO_VDEV_MAX];	/* virtual devices */
> +	struct platform_device *pdev;	/* platform device */
> +	struct mutex lock;

>From what I understand we use this lock to syncronize between
tmfifo_create_vdev, tmfifo_delete_vdev and tmfifo_work_handler.

Create happens in probe and delete in remove, so we don't need a lock here.
So the only reason I can see we need this lock here is, to make sure that we
don't mess up between create a vdev and being already in the work handler. That
can only happen, if an IRQ was triggered. If we enable the IRQs after creating
the vdev, we don't need the lock at all.

> +	void __iomem *rx_base;		/* mapped register base */
> +	void __iomem *tx_base;		/* mapped register base */
> +	int tx_fifo_size;		/* number of entries of the Tx FIFO */
> +	int rx_fifo_size;		/* number of entries of the Rx FIFO */
> +	unsigned long pend_events;	/* pending bits for deferred process */
> +	struct tmfifo_irq_info irq_info[TM_IRQ_CNT];	/* irq info */
> +	struct work_struct work;	/* work struct for deferred process */
> +	struct timer_list timer;	/* keepalive timer */
> +	struct tmfifo_vring *vring[2];	/* current Tx/Rx ring */
> +	bool is_ready;			/* ready flag */
> +	spinlock_t spin_lock;		/* spin lock */
> +};
> +
> +union tmfifo_msg_hdr {
> +	struct {
> +		u8 type;		/* message type */
> +		__be16 len;		/* payload length */
> +		u8 unused[5];		/* reserved, set to 0 */
> +	} __packed;
> +	u64 data;
> +};
> +
> +/*
> + * Default MAC.
> + * This MAC address will be read from EFI persistent variable if configured.
> + * It can also be reconfigured with standard Linux tools.
> + */
> +static u8 tmfifo_net_default_mac[6] = {0x00, 0x1A, 0xCA, 0xFF, 0xFF, 0x01};
> +
> +/* MTU setting of the virtio-net interface. */
> +#define TMFIFO_NET_MTU		1500
> +
> +/* Supported virtio-net features. */
> +#define TMFIFO_NET_FEATURES	((1UL << VIRTIO_NET_F_MTU) | \
> +				 (1UL << VIRTIO_NET_F_STATUS) | \
> +				 (1UL << VIRTIO_NET_F_MAC))
> +
> +/* Return the available Tx buffer space. */
> +static inline int tmfifo_vdev_tx_buf_avail(struct tmfifo_vdev *vdev)
> +{
> +	return ((vdev->tx_tail >= vdev->tx_head) ?
> +		(TMFIFO_CONS_TX_BUF_SIZE - 8 - (vdev->tx_tail -
> +		vdev->tx_head)) : (vdev->tx_head - vdev->tx_tail - 8));

Why do we need to subtract 8 from the available buffer size?

> +}
> +
> +/* Update Tx buffer pointer after pushing data. */
> +static inline void tmfifo_vdev_tx_buf_push(struct tmfifo_vdev *vdev, u32 len)
> +{
> +	vdev->tx_tail += len;
> +	if (vdev->tx_tail >= TMFIFO_CONS_TX_BUF_SIZE)
> +		vdev->tx_tail -= TMFIFO_CONS_TX_BUF_SIZE;

I would have expected
vdev->tx_tail = (vdev->tx_tail + len) % TMFIFO_CONS_TX_BUF_SIZE;

But I suppose your code executes faster.
What I miss is some code to assure that no ring buffer overflow/underrun can happen.

> +}
> +
> +/* Update Tx buffer pointer after popping data. */
> +static inline void tmfifo_vdev_tx_buf_pop(struct tmfifo_vdev *vdev, u32 len)
> +{
> +	vdev->tx_head += len;
> +	if (vdev->tx_head >= TMFIFO_CONS_TX_BUF_SIZE)
> +		vdev->tx_head -= TMFIFO_CONS_TX_BUF_SIZE;
> +}
> +

[...]

> +
> +/* Rx & Tx processing of a virtual queue. */
> +static void tmfifo_virtio_rxtx(struct virtqueue *vq, bool is_rx)> +{
> +	struct tmfifo_vring *vring;
> +	struct tmfifo *fifo;
> +	struct vring *vr;
> +	struct virtio_device *vdev;
> +	u64 sts, data;
> +	int num_avail = 0, hdr_len, tx_reserve;
> +	void *addr;
> +	u32 len, idx;
> +	struct vring_desc *desc;
> +	unsigned long flags;
> +	struct tmfifo_vdev *cons;
> +
> +	if (!vq)
> +		return;
> +
> +	vring = (struct tmfifo_vring *)vq->priv;


You can pass strict tmfifo_vring* instead of virtqueue as function parameter,
then you don't have to do this.


> +	fifo = vring->fifo;
> +	vr = (struct vring *)virtqueue_get_vring(vq);
> +
> +	if (!fifo->vdev[vring->vdev_id])
> +		return;
> +	vdev = &fifo->vdev[vring->vdev_id]->vdev;
> +	cons = fifo->vdev[VIRTIO_ID_CONSOLE];
> +
> +	/* Don't continue if another vring is running. */
> +	if (fifo->vring[is_rx] != NULL && fifo->vring[is_rx] != vring)

How can that happen?

> +		return;
> +
> +	/* tx_reserve is used to reserved some room in FIFO for console. */
> +	if (vring->vdev_id == VIRTIO_ID_NET) {
> +		hdr_len = sizeof(struct virtio_net_hdr);
> +		tx_reserve = fifo->tx_fifo_size / 16;
> +	} else {
> +		BUG_ON(vring->vdev_id != VIRTIO_ID_CONSOLE);
> +		hdr_len = 0;
> +		tx_reserve = 1;
> +	}
> +
> +	desc = vring->desc;
> +
[...]
> +
> +/* Work handler for Rx, Tx or activity monitoring. */
> +static void tmfifo_work_handler(struct work_struct *work)
> +{
> +	int i;
> +	struct tmfifo_vdev *tm_vdev;
> +	struct tmfifo *fifo = container_of(work, struct tmfifo, work);
> +
> +	if (!fifo->is_ready)
> +		return;
> +
> +	mutex_lock(&fifo->lock);
> +

So you don't want to queue up more work when remove is called. As is_ready is
not atomic you could deadlock here:
  remove             work_handler
 mutex_lock
                    if(!is_ready)
                   mutex_lock <- sleeps
is_ready = false
    ...
cancel_work_sync <- deadlock

> +	/* Tx. */
> +	if (test_and_clear_bit(TM_TX_LWM_IRQ, &fifo->pend_events) &&
> +		       fifo->irq_info[TM_TX_LWM_IRQ].irq) {
> +		for (i = 0; i < TMFIFO_VDEV_MAX; i++) {
> +			tm_vdev = fifo->vdev[i];
> +			if (tm_vdev != NULL) {
> +				tmfifo_virtio_rxtx(
> +					tm_vdev->vrings[TMFIFO_VRING_TX].vq,
> +					false);
> +			}
> +		}
> +	}
> +
> +	/* Rx. */
> +	if (test_and_clear_bit(TM_RX_HWM_IRQ, &fifo->pend_events) &&
> +		       fifo->irq_info[TM_RX_HWM_IRQ].irq) {
> +		for (i = 0; i < TMFIFO_VDEV_MAX; i++) {
> +			tm_vdev = fifo->vdev[i];
> +			if (tm_vdev != NULL) {
> +				tmfifo_virtio_rxtx(
> +					tm_vdev->vrings[TMFIFO_VRING_RX].vq,
> +					true);
> +			}
> +		}
> +	}
> +
> +	mutex_unlock(&fifo->lock);
> +}
[...]

> +
> +/* Probe the TMFIFO. */
> +static int tmfifo_probe(struct platform_device *pdev)
> +{
> +	u64 ctl;
> +	struct tmfifo *fifo;
> +	struct resource *rx_res, *tx_res;
> +	struct virtio_net_config net_config;
> +	int i, ret;
> +
> +	/* Get the resource of the Rx & Tx FIFO. */
> +	rx_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	tx_res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!rx_res || !tx_res) {
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	if (request_mem_region(rx_res->start,
> +			       resource_size(rx_res), "bf-tmfifo") == NULL) {
> +		ret = -EBUSY;
> +		goto early_err;
> +	}
> +
> +	if (request_mem_region(tx_res->start,
> +			       resource_size(tx_res), "bf-tmfifo") == NULL) {

Can't we use devm_request_mem_region and get rid of the release_mem_region here
and in the remove function?

Regards,
Matthias

> +		release_mem_region(rx_res->start, resource_size(rx_res));
> +		ret = -EBUSY;
> +		goto early_err;
> +	}
> +
> +	ret = -ENOMEM;
> +	fifo = kzalloc(sizeof(struct tmfifo), GFP_KERNEL);
> +	if (!fifo)
> +		goto err;
> +
> +	fifo->pdev = pdev;
> +	platform_set_drvdata(pdev, fifo);
> +
> +	spin_lock_init(&fifo->spin_lock);
> +	INIT_WORK(&fifo->work, tmfifo_work_handler);
> +
> +	timer_setup(&fifo->timer, tmfifo_timer, 0);
> +	fifo->timer.function = tmfifo_timer;
> +
> +	for (i = 0; i < TM_IRQ_CNT; i++) {
> +		fifo->irq_info[i].index = i;
> +		fifo->irq_info[i].fifo = fifo;
> +		fifo->irq_info[i].irq = platform_get_irq(pdev, i);
> +		ret = request_irq(fifo->irq_info[i].irq, tmfifo_irq_handler, 0,
> +				  "tmfifo", &fifo->irq_info[i]);
> +		if (ret) {
> +			pr_err("Unable to request irq\n");
> +			fifo->irq_info[i].irq = 0;
> +			goto err;
> +		}
> +	}
> +
> +	fifo->rx_base = ioremap(rx_res->start, resource_size(rx_res));
> +	if (!fifo->rx_base)
> +		goto err;
> +
> +	fifo->tx_base = ioremap(tx_res->start, resource_size(tx_res));
> +	if (!fifo->tx_base)
> +		goto err;
> +
> +	/* Get Tx FIFO size and set the low/high watermark. */
> +	ctl = readq(fifo->tx_base + TMFIFO_TX_CTL);
> +	fifo->tx_fifo_size =
> +		FIELD_GET(TMFIFO_TX_CTL__MAX_ENTRIES_MASK, ctl);
> +	ctl = (ctl & ~TMFIFO_TX_CTL__LWM_MASK) |
> +		FIELD_PREP(TMFIFO_TX_CTL__LWM_MASK, fifo->tx_fifo_size / 2);
> +	ctl = (ctl & ~TMFIFO_TX_CTL__HWM_MASK) |
> +		FIELD_PREP(TMFIFO_TX_CTL__HWM_MASK, fifo->tx_fifo_size - 1);
> +	writeq(ctl, fifo->tx_base + TMFIFO_TX_CTL);
> +
> +	/* Get Rx FIFO size and set the low/high watermark. */
> +	ctl = readq(fifo->rx_base + TMFIFO_RX_CTL);
> +	fifo->rx_fifo_size =
> +		FIELD_GET(TMFIFO_RX_CTL__MAX_ENTRIES_MASK, ctl);
> +	ctl = (ctl & ~TMFIFO_RX_CTL__LWM_MASK) |
> +		FIELD_PREP(TMFIFO_RX_CTL__LWM_MASK, 0);
> +	ctl = (ctl & ~TMFIFO_RX_CTL__HWM_MASK) |
> +		FIELD_PREP(TMFIFO_RX_CTL__HWM_MASK, 1);
> +	writeq(ctl, fifo->rx_base + TMFIFO_RX_CTL);
> +
> +	mutex_init(&fifo->lock);
> +
> +	/* Create the console vdev. */
> +	ret = tmfifo_create_vdev(fifo, VIRTIO_ID_CONSOLE, 0, NULL, 0);
> +	if (ret)
> +		goto err;
> +
> +	/* Create the network vdev. */
> +	memset(&net_config, 0, sizeof(net_config));
> +	net_config.mtu = TMFIFO_NET_MTU;
> +	net_config.status = VIRTIO_NET_S_LINK_UP;
> +	memcpy(net_config.mac, tmfifo_net_default_mac, 6);
> +	tmfifo_get_cfg_mac(net_config.mac);
> +	ret = tmfifo_create_vdev(fifo, VIRTIO_ID_NET, TMFIFO_NET_FEATURES,
> +				 &net_config, sizeof(net_config));
> +	if (ret)
> +		goto err;
> +
> +	mod_timer(&fifo->timer, jiffies + tmfifo_timer_interval);
> +
> +	fifo->is_ready = true;
> +
> +	return 0;
> +
> +err:
> +	tmfifo_remove(pdev);
> +early_err:
> +	dev_err(&pdev->dev, "Probe Failed\n");
> +	return ret;
> +}
> +
> +static const struct of_device_id tmfifo_match[] = {
> +	{ .compatible = "mellanox,bf-tmfifo" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, tmfifo_match);
> +
> +static const struct acpi_device_id bf_tmfifo_acpi_match[] = {
> +	{ "MLNXBF01", 0 },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(acpi, bf_tmfifo_acpi_match);
> +
> +static struct platform_driver tmfifo_driver = {
> +	.probe = tmfifo_probe,
> +	.remove = tmfifo_remove,
> +	.driver = {
> +		.name = "bf-tmfifo",
> +		.of_match_table = tmfifo_match,
> +		.acpi_match_table = ACPI_PTR(bf_tmfifo_acpi_match),
> +	},
> +};
> +
> +static int __init tmfifo_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_driver_register(&tmfifo_driver);
> +	if (ret)
> +		pr_err("Failed to register tmfifo driver.\n");
> +
> +	return ret;
> +}
> +
> +static void __exit tmfifo_exit(void)
> +{
> +	platform_driver_unregister(&tmfifo_driver);
> +}
> +
> +module_init(tmfifo_init);
> +module_exit(tmfifo_exit);
> +
> +MODULE_DESCRIPTION("Mellanox BlueField SoC TMFIFO Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Mellanox Technologies");
> diff --git a/drivers/soc/mellanox/tmfifo_regs.h b/drivers/soc/mellanox/tmfifo_regs.h
> new file mode 100644
> index 0000000..9f21764
> --- /dev/null
> +++ b/drivers/soc/mellanox/tmfifo_regs.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018, Mellanox Technologies. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __TMFIFO_REGS_H__
> +#define __TMFIFO_REGS_H__
> +
> +#include <linux/types.h>
> +
> +#define TMFIFO_TX_DATA 0x0
> +
> +#define TMFIFO_TX_STS 0x8
> +#define TMFIFO_TX_STS__LENGTH 0x0001
> +#define TMFIFO_TX_STS__COUNT_SHIFT 0
> +#define TMFIFO_TX_STS__COUNT_WIDTH 9
> +#define TMFIFO_TX_STS__COUNT_RESET_VAL 0
> +#define TMFIFO_TX_STS__COUNT_RMASK 0x1ff
> +#define TMFIFO_TX_STS__COUNT_MASK  0x1ff
> +
> +#define TMFIFO_TX_CTL 0x10
> +#define TMFIFO_TX_CTL__LENGTH 0x0001
> +#define TMFIFO_TX_CTL__LWM_SHIFT 0
> +#define TMFIFO_TX_CTL__LWM_WIDTH 8
> +#define TMFIFO_TX_CTL__LWM_RESET_VAL 128
> +#define TMFIFO_TX_CTL__LWM_RMASK 0xff
> +#define TMFIFO_TX_CTL__LWM_MASK  0xff
> +#define TMFIFO_TX_CTL__HWM_SHIFT 8
> +#define TMFIFO_TX_CTL__HWM_WIDTH 8
> +#define TMFIFO_TX_CTL__HWM_RESET_VAL 128
> +#define TMFIFO_TX_CTL__HWM_RMASK 0xff
> +#define TMFIFO_TX_CTL__HWM_MASK  0xff00
> +#define TMFIFO_TX_CTL__MAX_ENTRIES_SHIFT 32
> +#define TMFIFO_TX_CTL__MAX_ENTRIES_WIDTH 9
> +#define TMFIFO_TX_CTL__MAX_ENTRIES_RESET_VAL 256
> +#define TMFIFO_TX_CTL__MAX_ENTRIES_RMASK 0x1ff
> +#define TMFIFO_TX_CTL__MAX_ENTRIES_MASK  0x1ff00000000ULL
> +
> +#define TMFIFO_RX_DATA 0x0
> +
> +#define TMFIFO_RX_STS 0x8
> +#define TMFIFO_RX_STS__LENGTH 0x0001
> +#define TMFIFO_RX_STS__COUNT_SHIFT 0
> +#define TMFIFO_RX_STS__COUNT_WIDTH 9
> +#define TMFIFO_RX_STS__COUNT_RESET_VAL 0
> +#define TMFIFO_RX_STS__COUNT_RMASK 0x1ff
> +#define TMFIFO_RX_STS__COUNT_MASK  0x1ff
> +
> +#define TMFIFO_RX_CTL 0x10
> +#define TMFIFO_RX_CTL__LENGTH 0x0001
> +#define TMFIFO_RX_CTL__LWM_SHIFT 0
> +#define TMFIFO_RX_CTL__LWM_WIDTH 8
> +#define TMFIFO_RX_CTL__LWM_RESET_VAL 128
> +#define TMFIFO_RX_CTL__LWM_RMASK 0xff
> +#define TMFIFO_RX_CTL__LWM_MASK  0xff
> +#define TMFIFO_RX_CTL__HWM_SHIFT 8
> +#define TMFIFO_RX_CTL__HWM_WIDTH 8
> +#define TMFIFO_RX_CTL__HWM_RESET_VAL 128
> +#define TMFIFO_RX_CTL__HWM_RMASK 0xff
> +#define TMFIFO_RX_CTL__HWM_MASK  0xff00
> +#define TMFIFO_RX_CTL__MAX_ENTRIES_SHIFT 32
> +#define TMFIFO_RX_CTL__MAX_ENTRIES_WIDTH 9
> +#define TMFIFO_RX_CTL__MAX_ENTRIES_RESET_VAL 256
> +#define TMFIFO_RX_CTL__MAX_ENTRIES_RMASK 0x1ff
> +#define TMFIFO_RX_CTL__MAX_ENTRIES_MASK  0x1ff00000000ULL
> +
> +#endif /* !defined(__TMFIFO_REGS_H__) */
> 
