Return-Path: <SRS0=Q3lJ=N7=codeaurora.org=aneela@kernel.org>
Subject: Re: [PATCH 2/3] soc: qcom: Add AOSS QMP communication driver
References: <20181112080557.22698-1-bjorn.andersson@linaro.org>
 <20181112080557.22698-3-bjorn.andersson@linaro.org>
From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Message-ID: <ce0d4d55-464c-1502-9dc1-b3a495c86aee@codeaurora.org>
Date: Tue, 20 Nov 2018 17:52:16 +0530
MIME-Version: 1.0
In-Reply-To: <20181112080557.22698-3-bjorn.andersson@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------C387EBF4243BFB792588EB7E"
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------C387EBF4243BFB792588EB7E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/12/2018 1:35 PM, Bjorn Andersson wrote:
> The AOSS QMP driver is used to communicate with the AOSS for certain
> side-channel requests, that are not enabled through the RPMh interface.
>
> The communication is a very simple synchronous mechanism of messages
> being written in message RAM and a doorbell in the AOSS is rung. As the
> AOSS has processed the message length is cleared and an interrupt is
> fired by the AOSS as acknowledgment.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> ---
>   drivers/soc/qcom/Kconfig          |   7 +
>   drivers/soc/qcom/Makefile         |   1 +
>   drivers/soc/qcom/aoss-qmp.c       | 313 ++++++++++++++++++++++++++++++
>   include/linux/soc/qcom/aoss-qmp.h |  12 ++
>   4 files changed, 333 insertions(+)
>   create mode 100644 drivers/soc/qcom/aoss-qmp.c
>   create mode 100644 include/linux/soc/qcom/aoss-qmp.h
>
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index a51458022d21..ba08fc00d7f5 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -3,6 +3,13 @@
>   #
>   menu "Qualcomm SoC drivers"
>   
> +config QCOM_AOSS_QMP
> +	tristate "Qualcomm AOSS Messaging Driver"
> +	help
> +	  This driver provides the means for communicating with the
> +	  micro-controller in the AOSS, using QMP, to control certain resource
> +	  that are not exposed through RPMh.
> +
>   config QCOM_COMMAND_DB
>   	bool "Qualcomm Command DB"
>   	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 67cb85d0373c..d0d7fdc94d9a 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   CFLAGS_rpmh-rsc.o := -I$(src)
> +obj-$(CONFIG_QCOM_AOSS_QMP) +=	aoss-qmp.o
>   obj-$(CONFIG_QCOM_GENI_SE) +=	qcom-geni-se.o
>   obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
>   obj-$(CONFIG_QCOM_GLINK_SSR) +=	glink_ssr.o
> diff --git a/drivers/soc/qcom/aoss-qmp.c b/drivers/soc/qcom/aoss-qmp.c
> new file mode 100644
> index 000000000000..acc5677a06ed
> --- /dev/null
> +++ b/drivers/soc/qcom/aoss-qmp.c
> @@ -0,0 +1,313 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, Linaro Ltd
> + */
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/qcom/aoss-qmp.h>
> +#include <linux/wait.h>
> +
> +#define QMP_DESC_MAGIC			0x0
> +#define QMP_DESC_VERSION		0x4
> +#define QMP_DESC_FEATURES		0x8
> +
> +#define QMP_DESC_UCORE_LINK_STATE	0xc
> +#define QMP_DESC_UCORE_LINK_STATE_ACK	0x10
> +#define QMP_DESC_UCORE_CH_STATE		0x14
> +#define QMP_DESC_UCORE_CH_STATE_ACK	0x18
> +#define QMP_DESC_UCORE_MBOX_SIZE	0x1c
> +#define QMP_DESC_UCORE_MBOX_OFFSET	0x20
> +
> +#define QMP_DESC_MCORE_LINK_STATE	0x24
> +#define QMP_DESC_MCORE_LINK_STATE_ACK	0x28
> +#define QMP_DESC_MCORE_CH_STATE		0x2c
> +#define QMP_DESC_MCORE_CH_STATE_ACK	0x30
> +#define QMP_DESC_MCORE_MBOX_SIZE	0x34
> +#define QMP_DESC_MCORE_MBOX_OFFSET	0x38
> +
> +#define QMP_STATE_UP	0x0000ffff
> +#define QMP_STATE_DOWN	0xffff0000
> +
> +#define QMP_MAGIC	0x4d41494c
> +#define QMP_VERSION	1
> +
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
> + */
> +struct qmp {
> +	void __iomem *msgram;
> +	struct device *dev;
> +
> +	struct mbox_client mbox_client;
> +	struct mbox_chan *mbox_chan;
> +
> +	size_t offset;
> +	size_t size;
> +
> +	wait_queue_head_t event;
> +
> +	struct mutex tx_lock;
> +};
> +
> +static void qmp_kick(struct qmp *qmp)
> +{
> +	mbox_send_message(qmp->mbox_chan, NULL);
> +	mbox_client_txdone(qmp->mbox_chan, 0);
> +}
> +
> +static bool qmp_magic_valid(struct qmp *qmp)
> +{
> +	return readl(qmp->msgram + QMP_DESC_MAGIC) == QMP_MAGIC;
> +}
> +
> +static bool qmp_link_acked(struct qmp *qmp)
> +{
> +	return readl(qmp->msgram + QMP_DESC_MCORE_LINK_STATE_ACK) == QMP_STATE_UP;
> +}
> +
> +static bool qmp_mcore_channel_acked(struct qmp *qmp)
> +{
> +	return readl(qmp->msgram + QMP_DESC_MCORE_CH_STATE_ACK) == QMP_STATE_UP;
> +}
> +
> +static bool qmp_ucore_channel_up(struct qmp *qmp)
> +{
> +	return readl(qmp->msgram + QMP_DESC_UCORE_CH_STATE) == QMP_STATE_UP;
> +}
> +
> +static int qmp_open(struct qmp *qmp)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = wait_event_timeout(qmp->event, qmp_magic_valid(qmp), HZ);
> +	if (!ret) {
> +		dev_err(qmp->dev, "QMP magic doesn't match\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	val = readl(qmp->msgram + QMP_DESC_VERSION);
> +	if (val != QMP_VERSION) {
> +		dev_err(qmp->dev, "unsupported QMP version %d\n", val);
> +		return -EINVAL;
> +	}
> +
> +	qmp->offset = readl(qmp->msgram + QMP_DESC_MCORE_MBOX_OFFSET);
> +	qmp->size = readl(qmp->msgram + QMP_DESC_MCORE_MBOX_SIZE);
> +	if (!qmp->size) {
> +		dev_err(qmp->dev, "invalid mailbox size 0x%zx\n", qmp->size);
> +		return -EINVAL;
> +	}
> +
> +	/* Ack remote core's link state */
> +	val = readl(qmp->msgram + QMP_DESC_UCORE_LINK_STATE);
> +	writel(val, qmp->msgram + QMP_DESC_UCORE_LINK_STATE_ACK);
> +
> +	/* Set local core's link state to up */
> +	writel(QMP_STATE_UP, qmp->msgram + QMP_DESC_MCORE_LINK_STATE);
> +
> +	qmp_kick(qmp);
> +
> +	ret = wait_event_timeout(qmp->event, qmp_link_acked(qmp), HZ);
> +	if (!ret) {
> +		dev_err(qmp->dev, "ucore didn't ack link\n");
> +		goto timeout_close_link;
> +	}
> +
> +	writel(QMP_STATE_UP, qmp->msgram + QMP_DESC_MCORE_CH_STATE);
> +
> +	ret = wait_event_timeout(qmp->event, qmp_ucore_channel_up(qmp), HZ);
> +	if (!ret) {
> +		dev_err(qmp->dev, "ucore didn't open channel\n");
> +		goto timeout_close_channel;
> +	}
> +
> +	/* Ack remote core's channel state */
> +	val = readl(qmp->msgram + QMP_DESC_UCORE_CH_STATE);
> +	writel(val, qmp->msgram + QMP_DESC_UCORE_CH_STATE_ACK);
> +
> +	qmp_kick(qmp);
> +
> +	ret = wait_event_timeout(qmp->event, qmp_mcore_channel_acked(qmp), HZ);
> +	if (!ret) {
> +		dev_err(qmp->dev, "ucore didn't ack channel\n");
> +		goto timeout_close_channel;
> +	}
> +
> +	return 0;
> +
> +timeout_close_channel:
> +	writel(QMP_STATE_DOWN, qmp->msgram + QMP_DESC_MCORE_CH_STATE);
> +
> +timeout_close_link:
> +	writel(QMP_STATE_DOWN, qmp->msgram + QMP_DESC_MCORE_LINK_STATE);
> +	qmp_kick(qmp);
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static void qmp_close(struct qmp *qmp)
> +{
> +	writel(QMP_STATE_DOWN, qmp->msgram + QMP_DESC_MCORE_CH_STATE);
> +	writel(QMP_STATE_DOWN, qmp->msgram + QMP_DESC_MCORE_LINK_STATE);
> +	qmp_kick(qmp);
> +}
> +
> +static irqreturn_t qmp_intr(int irq, void *data)
> +{
> +	struct qmp *qmp = data;
> +
> +	wake_up_interruptible_all(&qmp->event);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static bool qmp_message_empty(struct qmp *qmp)
> +{
> +	return readl(qmp->msgram + qmp->offset) == 0;
> +}
> +
> +/**
> + * qmp_send() - send a message to the AOSS
> + * @qmp: qmp context
> + * @data: message to be sent
> + * @len: length of the message
> + *
> + * Transmit @data to AOSS and wait for the AOSS to acknowledge the message.
> + * @len must be a multiple of 4 and not longer than the mailbox size. Access is
> + * synchronized by this implementation.
> + *
> + * Return: 0 on success, negative errno on failure
> + */
> +int qmp_send(struct qmp *qmp, const void *data, size_t len)
> +{
> +	int ret;
> +
> +	if (WARN_ON(len + sizeof(u32) > qmp->size)) {
> +		dev_err(qmp->dev, "message too long\n");
> +		return -EINVAL;
> +	}
> +
> +	if (WARN_ON(len % sizeof(u32))) {
> +		dev_err(qmp->dev, "message not 32-bit aligned\n");
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&qmp->tx_lock);
> +
> +	if (!qmp_message_empty(qmp)) {
> +		dev_err(qmp->dev, "mailbox left busy\n");
> +		ret = -EINVAL;
should it be -EBUSY ?
And qmp_messge_empty will be done either by remote if it process the 
data else by this driver in TIMEOUT case, so does we need this check for 
every TX ? I think we can just reset to Zero once in open time.
> +		goto out_unlock;
> +	}
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
> +		writel(0, qmp->msgram + qmp->offset);
> +	} else {
> +		ret = 0;
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&qmp->tx_lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(qmp_send);
> +
> +static int qmp_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct qmp *qmp;
> +	int irq;
> +	int ret;
> +
> +	qmp = devm_kzalloc(&pdev->dev, sizeof(*qmp), GFP_KERNEL);
> +	if (!qmp)
> +		return -ENOMEM;
> +
> +	qmp->dev = &pdev->dev;
> +	init_waitqueue_head(&qmp->event);
> +	mutex_init(&qmp->tx_lock);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	qmp->msgram = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(qmp->msgram))
> +		return PTR_ERR(qmp->msgram);
> +
> +	qmp->mbox_client.dev = &pdev->dev;
> +	qmp->mbox_client.knows_txdone = true;
> +	qmp->mbox_chan = mbox_request_channel(&qmp->mbox_client, 0);
> +	if (IS_ERR(qmp->mbox_chan)) {
> +		dev_err(&pdev->dev, "failed to acquire ipc mailbox\n");
> +		return PTR_ERR(qmp->mbox_chan);
> +	}
> +
> +	irq = platform_get_irq(pdev, 0);
> +	ret = devm_request_irq(&pdev->dev, irq, qmp_intr, IRQF_ONESHOT,
> +			       "aoss-qmp", qmp);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to request interrupt\n");
> +		return ret;
> +	}
> +
> +	ret = qmp_open(qmp);
> +	if (ret < 0)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, qmp);
> +
> +	return of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> +}
> +
> +static int qmp_remove(struct platform_device *pdev)
> +{
> +	struct qmp *qmp = platform_get_drvdata(pdev);
> +
> +	of_platform_depopulate(&pdev->dev);
> +
> +	qmp_close(qmp);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id qmp_dt_match[] = {
> +	{ .compatible = "qcom,sdm845-aoss-qmp", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, qmp_dt_match);
> +
> +static struct platform_driver qmp_driver = {
> +	.driver = {
> +		.name		= "aoss_qmp",
> +		.of_match_table	= qmp_dt_match,
> +	},
> +	.probe = qmp_probe,
> +	.remove	= qmp_remove,
> +};
> +module_platform_driver(qmp_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm AOSS QMP driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/soc/qcom/aoss-qmp.h b/include/linux/soc/qcom/aoss-qmp.h
> new file mode 100644
> index 000000000000..32ccaa091a9f
> --- /dev/null
> +++ b/include/linux/soc/qcom/aoss-qmp.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018, Linaro Ltd
> + */
> +#ifndef __AOP_QMP_H__
> +#define __AOP_QMP_H__
> +
> +struct qmp;
> +
> +int qmp_send(struct qmp *qmp, const void *data, size_t len);
> +
> +#endif


--------------C387EBF4243BFB792588EB7E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 11/12/2018 1:35 PM, Bjorn Andersson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20181112080557.22698-3-bjorn.andersson@linaro.org">
      <pre wrap="">The AOSS QMP driver is used to communicate with the AOSS for certain
side-channel requests, that are not enabled through the RPMh interface.

The communication is a very simple synchronous mechanism of messages
being written in message RAM and a doorbell in the AOSS is rung. As the
AOSS has processed the message length is cleared and an interrupt is
fired by the AOSS as acknowledgment.

Signed-off-by: Bjorn Andersson <a class="moz-txt-link-rfc2396E" href="mailto:bjorn.andersson@linaro.org">&lt;bjorn.andersson@linaro.org&gt;</a></pre>
    </blockquote>
    Acked-by: Arun Kumar Neelakantam <a class="moz-txt-link-rfc2396E"
      href="mailto:aneela@codeaurora.org">&lt;aneela@codeaurora.org&gt;</a>
    <blockquote type="cite"
      cite="mid:20181112080557.22698-3-bjorn.andersson@linaro.org">
      <pre wrap="">---
 drivers/soc/qcom/Kconfig          |   7 +
 drivers/soc/qcom/Makefile         |   1 +
 drivers/soc/qcom/aoss-qmp.c       | 313 ++++++++++++++++++++++++++++++
 include/linux/soc/qcom/aoss-qmp.h |  12 ++
 4 files changed, 333 insertions(+)
 create mode 100644 drivers/soc/qcom/aoss-qmp.c
 create mode 100644 include/linux/soc/qcom/aoss-qmp.h

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index a51458022d21..ba08fc00d7f5 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -3,6 +3,13 @@
 #
 menu "Qualcomm SoC drivers"
 
+config QCOM_AOSS_QMP
+	tristate "Qualcomm AOSS Messaging Driver"
+	help
+	  This driver provides the means for communicating with the
+	  micro-controller in the AOSS, using QMP, to control certain resource
+	  that are not exposed through RPMh.
+
 config QCOM_COMMAND_DB
 	bool "Qualcomm Command DB"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 67cb85d0373c..d0d7fdc94d9a 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS_rpmh-rsc.o := -I$(src)
+obj-$(CONFIG_QCOM_AOSS_QMP) +=	aoss-qmp.o
 obj-$(CONFIG_QCOM_GENI_SE) +=	qcom-geni-se.o
 obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
 obj-$(CONFIG_QCOM_GLINK_SSR) +=	glink_ssr.o
diff --git a/drivers/soc/qcom/aoss-qmp.c b/drivers/soc/qcom/aoss-qmp.c
new file mode 100644
index 000000000000..acc5677a06ed
--- /dev/null
+++ b/drivers/soc/qcom/aoss-qmp.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018, Linaro Ltd
+ */
+#include &lt;linux/interrupt.h&gt;
+#include &lt;linux/io.h&gt;
+#include &lt;linux/mailbox_client.h&gt;
+#include &lt;linux/module.h&gt;
+#include &lt;linux/of_platform.h&gt;
+#include &lt;linux/platform_device.h&gt;
+#include &lt;linux/soc/qcom/aoss-qmp.h&gt;
+#include &lt;linux/wait.h&gt;
+
+#define QMP_DESC_MAGIC			0x0
+#define QMP_DESC_VERSION		0x4
+#define QMP_DESC_FEATURES		0x8
+
+#define QMP_DESC_UCORE_LINK_STATE	0xc
+#define QMP_DESC_UCORE_LINK_STATE_ACK	0x10
+#define QMP_DESC_UCORE_CH_STATE		0x14
+#define QMP_DESC_UCORE_CH_STATE_ACK	0x18
+#define QMP_DESC_UCORE_MBOX_SIZE	0x1c
+#define QMP_DESC_UCORE_MBOX_OFFSET	0x20
+
+#define QMP_DESC_MCORE_LINK_STATE	0x24
+#define QMP_DESC_MCORE_LINK_STATE_ACK	0x28
+#define QMP_DESC_MCORE_CH_STATE		0x2c
+#define QMP_DESC_MCORE_CH_STATE_ACK	0x30
+#define QMP_DESC_MCORE_MBOX_SIZE	0x34
+#define QMP_DESC_MCORE_MBOX_OFFSET	0x38
+
+#define QMP_STATE_UP	0x0000ffff
+#define QMP_STATE_DOWN	0xffff0000
+
+#define QMP_MAGIC	0x4d41494c
+#define QMP_VERSION	1
+
+/**
+ * struct qmp - driver state for QMP implementation
+ * @msgram: iomem referencing the message RAM used for communication
+ * @dev: reference to QMP device
+ * @mbox_client: mailbox client used to ring the doorbell on transmit
+ * @mbox_chan: mailbox channel used to ring the doorbell on transmit
+ * @offset: offset within @msgram where messages should be written
+ * @size: maximum size of the messages to be transmitted
+ * @event: wait_queue for synchronization with the IRQ
+ * @tx_lock: provides syncrhonization between multiple callers of qmp_send()
+ */
+struct qmp {
+	void __iomem *msgram;
+	struct device *dev;
+
+	struct mbox_client mbox_client;
+	struct mbox_chan *mbox_chan;
+
+	size_t offset;
+	size_t size;
+
+	wait_queue_head_t event;
+
+	struct mutex tx_lock;
+};
+
+static void qmp_kick(struct qmp *qmp)
+{
+	mbox_send_message(qmp-&gt;mbox_chan, NULL);
+	mbox_client_txdone(qmp-&gt;mbox_chan, 0);
+}
+
+static bool qmp_magic_valid(struct qmp *qmp)
+{
+	return readl(qmp-&gt;msgram + QMP_DESC_MAGIC) == QMP_MAGIC;
+}
+
+static bool qmp_link_acked(struct qmp *qmp)
+{
+	return readl(qmp-&gt;msgram + QMP_DESC_MCORE_LINK_STATE_ACK) == QMP_STATE_UP;
+}
+
+static bool qmp_mcore_channel_acked(struct qmp *qmp)
+{
+	return readl(qmp-&gt;msgram + QMP_DESC_MCORE_CH_STATE_ACK) == QMP_STATE_UP;
+}
+
+static bool qmp_ucore_channel_up(struct qmp *qmp)
+{
+	return readl(qmp-&gt;msgram + QMP_DESC_UCORE_CH_STATE) == QMP_STATE_UP;
+}
+
+static int qmp_open(struct qmp *qmp)
+{
+	int ret;
+	u32 val;
+
+	ret = wait_event_timeout(qmp-&gt;event, qmp_magic_valid(qmp), HZ);
+	if (!ret) {
+		dev_err(qmp-&gt;dev, "QMP magic doesn't match\n");
+		return -ETIMEDOUT;
+	}
+
+	val = readl(qmp-&gt;msgram + QMP_DESC_VERSION);
+	if (val != QMP_VERSION) {
+		dev_err(qmp-&gt;dev, "unsupported QMP version %d\n", val);
+		return -EINVAL;
+	}
+
+	qmp-&gt;offset = readl(qmp-&gt;msgram + QMP_DESC_MCORE_MBOX_OFFSET);
+	qmp-&gt;size = readl(qmp-&gt;msgram + QMP_DESC_MCORE_MBOX_SIZE);
+	if (!qmp-&gt;size) {
+		dev_err(qmp-&gt;dev, "invalid mailbox size 0x%zx\n", qmp-&gt;size);
+		return -EINVAL;
+	}
+
+	/* Ack remote core's link state */
+	val = readl(qmp-&gt;msgram + QMP_DESC_UCORE_LINK_STATE);
+	writel(val, qmp-&gt;msgram + QMP_DESC_UCORE_LINK_STATE_ACK);
+
+	/* Set local core's link state to up */
+	writel(QMP_STATE_UP, qmp-&gt;msgram + QMP_DESC_MCORE_LINK_STATE);
+
+	qmp_kick(qmp);
+
+	ret = wait_event_timeout(qmp-&gt;event, qmp_link_acked(qmp), HZ);
+	if (!ret) {
+		dev_err(qmp-&gt;dev, "ucore didn't ack link\n");
+		goto timeout_close_link;
+	}
+
+	writel(QMP_STATE_UP, qmp-&gt;msgram + QMP_DESC_MCORE_CH_STATE);
+
+	ret = wait_event_timeout(qmp-&gt;event, qmp_ucore_channel_up(qmp), HZ);
+	if (!ret) {
+		dev_err(qmp-&gt;dev, "ucore didn't open channel\n");
+		goto timeout_close_channel;
+	}
+
+	/* Ack remote core's channel state */
+	val = readl(qmp-&gt;msgram + QMP_DESC_UCORE_CH_STATE);
+	writel(val, qmp-&gt;msgram + QMP_DESC_UCORE_CH_STATE_ACK);
+
+	qmp_kick(qmp);
+
+	ret = wait_event_timeout(qmp-&gt;event, qmp_mcore_channel_acked(qmp), HZ);
+	if (!ret) {
+		dev_err(qmp-&gt;dev, "ucore didn't ack channel\n");
+		goto timeout_close_channel;
+	}
+
+	return 0;
+
+timeout_close_channel:
+	writel(QMP_STATE_DOWN, qmp-&gt;msgram + QMP_DESC_MCORE_CH_STATE);
+
+timeout_close_link:
+	writel(QMP_STATE_DOWN, qmp-&gt;msgram + QMP_DESC_MCORE_LINK_STATE);
+	qmp_kick(qmp);
+
+	return -ETIMEDOUT;
+}
+
+static void qmp_close(struct qmp *qmp)
+{
+	writel(QMP_STATE_DOWN, qmp-&gt;msgram + QMP_DESC_MCORE_CH_STATE);
+	writel(QMP_STATE_DOWN, qmp-&gt;msgram + QMP_DESC_MCORE_LINK_STATE);
+	qmp_kick(qmp);
+}
+
+static irqreturn_t qmp_intr(int irq, void *data)
+{
+	struct qmp *qmp = data;
+
+	wake_up_interruptible_all(&amp;qmp-&gt;event);
+
+	return IRQ_HANDLED;
+}
+
+static bool qmp_message_empty(struct qmp *qmp)
+{
+	return readl(qmp-&gt;msgram + qmp-&gt;offset) == 0;
+}
+
+/**
+ * qmp_send() - send a message to the AOSS
+ * @qmp: qmp context
+ * @data: message to be sent
+ * @len: length of the message
+ *
+ * Transmit @data to AOSS and wait for the AOSS to acknowledge the message.
+ * @len must be a multiple of 4 and not longer than the mailbox size. Access is
+ * synchronized by this implementation.
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int qmp_send(struct qmp *qmp, const void *data, size_t len)
+{
+	int ret;
+
+	if (WARN_ON(len + sizeof(u32) &gt; qmp-&gt;size)) {
+		dev_err(qmp-&gt;dev, "message too long\n");
+		return -EINVAL;
+	}
+
+	if (WARN_ON(len % sizeof(u32))) {
+		dev_err(qmp-&gt;dev, "message not 32-bit aligned\n");
+		return -EINVAL;
+	}
+
+	mutex_lock(&amp;qmp-&gt;tx_lock);
+
+	if (!qmp_message_empty(qmp)) {
+		dev_err(qmp-&gt;dev, "mailbox left busy\n");
+		ret = -EINVAL;</pre>
    </blockquote>
    should it be -EBUSY ?<br>
    And qmp_messge_empty will be done either by remote if it process the
    data else by this driver in TIMEOUT case, so does we need this check
    for every TX ? I think we can just reset to Zero once in open time.<br>
    <blockquote type="cite"
      cite="mid:20181112080557.22698-3-bjorn.andersson@linaro.org">
      <pre wrap="">
+		goto out_unlock;
+	}
+
+	/* The message RAM only implements 32-bit accesses */
+	__iowrite32_copy(qmp-&gt;msgram + qmp-&gt;offset + sizeof(u32),
+			 data, len / sizeof(u32));
+	writel(len, qmp-&gt;msgram + qmp-&gt;offset);
+	qmp_kick(qmp);
+
+	ret = wait_event_interruptible_timeout(qmp-&gt;event,
+					       qmp_message_empty(qmp), HZ);
+	if (!ret) {
+		dev_err(qmp-&gt;dev, "ucore did not ack channel\n");
+		ret = -ETIMEDOUT;
+
+		writel(0, qmp-&gt;msgram + qmp-&gt;offset);
+	} else {
+		ret = 0;
+	}
+
+out_unlock:
+	mutex_unlock(&amp;qmp-&gt;tx_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(qmp_send);
+
+static int qmp_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct qmp *qmp;
+	int irq;
+	int ret;
+
+	qmp = devm_kzalloc(&amp;pdev-&gt;dev, sizeof(*qmp), GFP_KERNEL);
+	if (!qmp)
+		return -ENOMEM;
+
+	qmp-&gt;dev = &amp;pdev-&gt;dev;
+	init_waitqueue_head(&amp;qmp-&gt;event);
+	mutex_init(&amp;qmp-&gt;tx_lock);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	qmp-&gt;msgram = devm_ioremap_resource(&amp;pdev-&gt;dev, res);
+	if (IS_ERR(qmp-&gt;msgram))
+		return PTR_ERR(qmp-&gt;msgram);
+
+	qmp-&gt;mbox_client.dev = &amp;pdev-&gt;dev;
+	qmp-&gt;mbox_client.knows_txdone = true;
+	qmp-&gt;mbox_chan = mbox_request_channel(&amp;qmp-&gt;mbox_client, 0);
+	if (IS_ERR(qmp-&gt;mbox_chan)) {
+		dev_err(&amp;pdev-&gt;dev, "failed to acquire ipc mailbox\n");
+		return PTR_ERR(qmp-&gt;mbox_chan);
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	ret = devm_request_irq(&amp;pdev-&gt;dev, irq, qmp_intr, IRQF_ONESHOT,
+			       "aoss-qmp", qmp);
+	if (ret &lt; 0) {
+		dev_err(&amp;pdev-&gt;dev, "failed to request interrupt\n");
+		return ret;
+	}
+
+	ret = qmp_open(qmp);
+	if (ret &lt; 0)
+		return ret;
+
+	platform_set_drvdata(pdev, qmp);
+
+	return of_platform_populate(pdev-&gt;dev.of_node, NULL, NULL, &amp;pdev-&gt;dev);
+}
+
+static int qmp_remove(struct platform_device *pdev)
+{
+	struct qmp *qmp = platform_get_drvdata(pdev);
+
+	of_platform_depopulate(&amp;pdev-&gt;dev);
+
+	qmp_close(qmp);
+
+	return 0;
+}
+
+static const struct of_device_id qmp_dt_match[] = {
+	{ .compatible = "qcom,sdm845-aoss-qmp", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qmp_dt_match);
+
+static struct platform_driver qmp_driver = {
+	.driver = {
+		.name		= "aoss_qmp",
+		.of_match_table	= qmp_dt_match,
+	},
+	.probe = qmp_probe,
+	.remove	= qmp_remove,
+};
+module_platform_driver(qmp_driver);
+
+MODULE_DESCRIPTION("Qualcomm AOSS QMP driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/qcom/aoss-qmp.h b/include/linux/soc/qcom/aoss-qmp.h
new file mode 100644
index 000000000000..32ccaa091a9f
--- /dev/null
+++ b/include/linux/soc/qcom/aoss-qmp.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018, Linaro Ltd
+ */
+#ifndef __AOP_QMP_H__
+#define __AOP_QMP_H__
+
+struct qmp;
+
+int qmp_send(struct qmp *qmp, const void *data, size_t len);
+
+#endif
</pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:20181112080557.22698-3-bjorn.andersson@linaro.org">
    </blockquote>
    <br>
  </body>
</html>

--------------C387EBF4243BFB792588EB7E--
