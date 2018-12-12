From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v6 1/9] soc: Add TmFifo driver for Mellanox BlueField Soc
Date: Thu, 13 Dec 2018 00:07:42 +0100
Message-ID: <23fff14b-0e44-651c-1dfd-8f8e07c7eaee@gmail.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
 <1541089431-175572-1-git-send-email-lsun@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1541089431-175572-1-git-send-email-lsun@mellanox.com>
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
To: Liming Sun <lsun@mellanox.com>, y@bu-lab53.mtbu.labs.mlnx, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, David Woods <dwoods@mellanox.com>, Robin Murphy <robin.murphy@arm.com>, arm-soc <arm@kernel.org>
Cc: devicetree@vger.kernel.org, "mbrugger@suse.com >> Matthias Brugger" <mbrugger@suse.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 01/11/2018 17:23, Liming Sun wrote:> This commit adds the TmFifo driver for
Mellanox BlueField Soc.
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
>  drivers/soc/mellanox/tmfifo.c      | 1236 ++++++++++++++++++++++++++++++++++++
>  drivers/soc/mellanox/tmfifo_regs.h |   76 +++
>  6 files changed, 1337 insertions(+)
>  create mode 100644 drivers/soc/mellanox/Kconfig
>  create mode 100644 drivers/soc/mellanox/Makefile
>  create mode 100644 drivers/soc/mellanox/tmfifo.c
>  create mode 100644 drivers/soc/mellanox/tmfifo_regs.h
>

[...]

> +
> +/* Interrupt handler. */
> +static irqreturn_t tmfifo_irq_handler(int irq, void *dev_id)
> +{
> +	int i = (uintptr_t)dev_id % sizeof(void *);
> +	struct tmfifo *fifo = dev_id - i;
> +
> +	if (i < TM_IRQ_CNT && !test_and_set_bit(i, &fifo->pend_events))
> +		schedule_work(&fifo->work);
> +
> +	return IRQ_HANDLED;
> +}
> +
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
> +		fifo->irq[i] = platform_get_irq(pdev, i);
> +		ret = request_irq(fifo->irq[i], tmfifo_irq_handler, 0,
> +				  "tmfifo", (u8 *)fifo + i);

I think it would be better if you create a struct that passes a pointer to fifo
and the ID instead of "hiding" the ID inside the address.

Regards,
Matthias
