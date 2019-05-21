From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v7 2/4] soc: qcom: Add AOSS QMP driver
Date: Tue, 21 May 2019 16:40:58 +0530
Message-ID: <20190521111058.GG15118@vkoul-mobl>
References: <20190501043734.26706-1-bjorn.andersson@linaro.org>
 <20190501043734.26706-3-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501043734.26706-3-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 30-04-19, 21:37, Bjorn Andersson wrote:

> +#include <linux/clk-provider.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/pm_domain.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/power/qcom-aoss-qmp.h>

I would have preferred this as first one, but this is fine too :)

> +/* Linux-side offsets */
> +#define QMP_DESC_MCORE_LINK_STATE	0x24
> +#define QMP_DESC_MCORE_LINK_STATE_ACK	0x28
> +#define QMP_DESC_MCORE_CH_STATE		0x2c
> +#define QMP_DESC_MCORE_CH_STATE_ACK	0x30
> +#define QMP_DESC_MCORE_MBOX_SIZE	0x34
> +#define QMP_DESC_MCORE_MBOX_OFFSET	0x38
> +
> +#define QMP_STATE_UP	0x0000ffff

I prefer using GENMASK(15, 0)

> +#define QMP_STATE_DOWN	0xffff0000

GENMASK(31, 16)?

> +/**
> + * struct qmp - driver state for QMP implementation
> + * @msgram: iomem referencing the message RAM used for communication
> + * @dev: reference to QMP device
> + * @mbox_client: mailbox client used to ring the doorbell on transmit
> + * @mbox_chan: mailbox channel used to ring the doorbell on transmit
> + * @offset: offset within @msgram where messages should be written
> + * @size: maximum size of the messages to be transmitted
> + * @event: wait_queue for synchronization with the IRQ
> + * @tx_lock: provides syncrhonization between multiple callers of qmp_send()

/s/syncrhonization/synchronization

> +int qmp_send(struct qmp *qmp, const void *data, size_t len)
> +{
> +	int ret;
> +
> +	if (WARN_ON(len + sizeof(u32) > qmp->size))
> +		return -EINVAL;
> +
> +	if (WARN_ON(len % sizeof(u32)))
> +		return -EINVAL;
> +
> +	mutex_lock(&qmp->tx_lock);
> +
> +	/* The message RAM only implements 32-bit accesses */
> +	__iowrite32_copy(qmp->msgram + qmp->offset + sizeof(u32),
> +			 data, len / sizeof(u32));
> +	writel(len, qmp->msgram + qmp->offset);
> +	qmp_kick(qmp);
> +
> +	ret = wait_event_interruptible_timeout(qmp->event,
> +					       qmp_message_empty(qmp), HZ);
> +	if (!ret) {
> +		dev_err(qmp->dev, "ucore did not ack channel\n");
> +		ret = -ETIMEDOUT;
> +
> +		/* Clear message from buffer */
> +		writel(0, qmp->msgram + qmp->offset);
> +	} else {
> +		ret = 0;

Isn't this redundant?

> +	}
> +
> +	mutex_unlock(&qmp->tx_lock);
> +
> +	return ret;
> +}
-- 
~Vinod
