From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [Sound-open-firmware] [PATCH v2 1/5] ASoC: SOF: imx: Add i.MX8 HW
 support
Date: Tue, 23 Jul 2019 10:01:22 -0500
Message-ID: <a5d44d96-4d50-ee46-a6bf-3ce108b1994a@linux.intel.com>
References: <20190723084104.12639-1-daniel.baluta@nxp.com>
 <20190723084104.12639-2-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723084104.12639-2-daniel.baluta@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>, m.felsch@pengutronix.de, shawnguo@kernel.org
Cc: mark.rutland@arm.com, aisheng.dong@nxp.com, peng.fan@nxp.com, anson.huang@nxp.com, devicetree@vger.kernel.org, shengjiu.wang@nxp.com, linux-kernel@vger.kernel.org, paul.olaru@nxp.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, leonard.crestez@nxp.com, festevam@gmail.com, linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
List-Id: devicetree@vger.kernel.org


> diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
> new file mode 100644
> index 000000000000..c69237971da5
> --- /dev/null
> +++ b/sound/soc/sof/imx/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +
> +ccflags-y += -DDEBUG

this should be removed or in a separate patch.


> +struct imx8_priv {
> +	struct device *dev;
> +	struct snd_sof_dev *sdev;
> +	struct imx_dsp_ipc *dsp_ipc;
> +	struct imx_sc_ipc *sc_ipc;

maybe a comment to explain what 'sc' stands for?

> +};
> +
> +static void imx8_get_windows(struct snd_sof_dev *sdev)
> +{
> +	struct sof_ipc_window_elem *elem;
> +	u32 outbox_offset = 0;
> +	u32 stream_offset = 0;
> +	u32 inbox_offset = 0;
> +	u32 outbox_size = 0;
> +	u32 stream_size = 0;
> +	u32 inbox_size = 0;
> +	int i;
> +
> +	if (!sdev->info_window) {
> +		dev_err(sdev->dev, "error: have no window info\n");
> +		return;
> +	}
> +
> +	for (i = 0; i < sdev->info_window->num_windows; i++) {
> +		elem = &sdev->info_window->window[i];
> +
> +		switch (elem->type) {
> +		case SOF_IPC_REGION_UPBOX:
> +			inbox_offset = elem->offset + MBOX_OFFSET;
> +			inbox_size = elem->size;
> +			snd_sof_debugfs_io_item(sdev,
> +						sdev->bar[SOF_FW_BLK_TYPE_SRAM]
> +						+ inbox_offset,
> +						elem->size, "inbox",
> +						SOF_DEBUGFS_ACCESS_D0_ONLY);
> +			break;
> +		case SOF_IPC_REGION_DOWNBOX:
> +			outbox_offset = elem->offset + MBOX_OFFSET;
> +			outbox_size = elem->size;
> +			snd_sof_debugfs_io_item(sdev,
> +						sdev->bar[SOF_FW_BLK_TYPE_SRAM]
> +						+ outbox_offset,
> +						elem->size, "outbox",
> +						SOF_DEBUGFS_ACCESS_D0_ONLY);
> +			break;
> +		case SOF_IPC_REGION_TRACE:
> +			snd_sof_debugfs_io_item(sdev,
> +						sdev->bar[SOF_FW_BLK_TYPE_SRAM]
> +						+ elem->offset + MBOX_OFFSET,
> +						elem->size, "etrace",
> +						SOF_DEBUGFS_ACCESS_D0_ONLY);
> +			break;
> +		case SOF_IPC_REGION_DEBUG:
> +			snd_sof_debugfs_io_item(sdev,
> +						sdev->bar[SOF_FW_BLK_TYPE_SRAM]
> +						+ elem->offset + MBOX_OFFSET,
> +						elem->size, "debug",
> +						SOF_DEBUGFS_ACCESS_D0_ONLY);
> +			break;
> +		case SOF_IPC_REGION_STREAM:
> +			stream_offset = elem->offset + MBOX_OFFSET;
> +			stream_size = elem->size;
> +			snd_sof_debugfs_io_item(sdev,
> +						sdev->bar[SOF_FW_BLK_TYPE_SRAM]
> +						+ stream_offset,
> +						elem->size, "stream",
> +						SOF_DEBUGFS_ACCESS_D0_ONLY);
> +			break;
> +		case SOF_IPC_REGION_REGS:
> +			snd_sof_debugfs_io_item(sdev,
> +						sdev->bar[SOF_FW_BLK_TYPE_SRAM]
> +						+ elem->offset + MBOX_OFFSET,
> +						elem->size, "regs",
> +						SOF_DEBUGFS_ACCESS_D0_ONLY);
> +			break;
> +		case SOF_IPC_REGION_EXCEPTION:
> +			sdev->dsp_oops_offset = elem->offset + MBOX_OFFSET;
> +			snd_sof_debugfs_io_item(sdev,
> +						sdev->bar[SOF_FW_BLK_TYPE_SRAM]
> +						+ elem->offset + MBOX_OFFSET,
> +						elem->size, "exception",
> +						SOF_DEBUGFS_ACCESS_D0_ONLY);
> +			break;
> +		default:
> +			dev_err(sdev->dev, "error: get illegal window info\n");
> +			return;
> +		}
> +	}
> +
> +	if (outbox_size == 0 || inbox_size == 0) {
> +		dev_err(sdev->dev, "error: get illegal mailbox window\n");
> +		return;
> +	}
> +
> +	snd_sof_dsp_mailbox_init(sdev, inbox_offset, inbox_size,
> +				 outbox_offset, outbox_size);
> +	sdev->stream_box.offset = stream_offset;
> +	sdev->stream_box.size = stream_size;
> +
> +	dev_dbg(sdev->dev, " mailbox upstream 0x%x - size 0x%x\n",
> +		inbox_offset, inbox_size);
> +	dev_dbg(sdev->dev, " mailbox downstream 0x%x - size 0x%x\n",
> +		outbox_offset, outbox_size);
> +	dev_dbg(sdev->dev, " stream region 0x%x - size 0x%x\n",
> +		stream_offset, stream_size);
> +}

This looks 100% similar to Baytrail?

> +
> +/*
> + * IPC Firmware ready.
> + */
> +static int imx8_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
> +{
> +	struct sof_ipc_fw_ready *fw_ready = &sdev->fw_ready;
> +	u32 offset;
> +	int ret;
> +
> +	/* mailbox must be on 4k boundary */
> +	offset = MBOX_OFFSET;
> +
> +	dev_dbg(sdev->dev, "ipc: DSP is ready 0x%8.8x offset 0x%x\n",
> +		msg_id, offset);
> +
> +	 /* no need to re-check version/ABI for subsequent boots */
> +	if (!sdev->first_boot)
> +		return 0;
> +
> +	/* copy data from the DSP FW ready offset */
> +	sof_block_read(sdev, sdev->mailbox_bar, offset, fw_ready,
> +		       sizeof(*fw_ready));
> +	snd_sof_dsp_mailbox_init(sdev, fw_ready->dspbox_offset,
> +				 fw_ready->dspbox_size,
> +				 fw_ready->hostbox_offset,
> +				 fw_ready->hostbox_size);
> +
> +	/* make sure ABI version is compatible */
> +	ret = snd_sof_ipc_valid(sdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* now check for extended data */
> +	snd_sof_fw_parse_ext_data(sdev, SOF_FW_BLK_TYPE_SRAM, MBOX_OFFSET +
> +				  sizeof(struct sof_ipc_fw_ready));
> +
> +	imx8_get_windows(sdev);
> +
> +	return 0;
> +}

That code looks nearly similar to the baytrail one except for the last 
line, we should look into factoring this.

> +
> +static void imx8_get_reply(struct snd_sof_dev *sdev)
> +{
> +	struct snd_sof_ipc_msg *msg = sdev->msg;
> +	struct sof_ipc_reply reply;
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	if (!msg) {
> +		dev_warn(sdev->dev, "unexpected ipc interrupt\n");
> +		return;
> +	}
> +
> +	/* get reply */
> +	sof_mailbox_read(sdev, sdev->host_box.offset, &reply, sizeof(reply));
> +
> +	spin_lock_irqsave(&sdev->ipc_lock, flags);
> +
> +	if (reply.error < 0) {
> +		memcpy(msg->reply_data, &reply, sizeof(reply));
> +		ret = reply.error;
> +	} else {
> +		/* reply has correct size? */
> +		if (reply.hdr.size != msg->reply_size) {
> +			dev_err(sdev->dev, "error: reply expected %zu got %u bytes\n",
> +				msg->reply_size, reply.hdr.size);
> +			ret = -EINVAL;
> +		}
> +
> +		/* read the message */
> +		if (msg->reply_size > 0)
> +			sof_mailbox_read(sdev, sdev->host_box.offset,
> +					 msg->reply_data, msg->reply_size);
> +	}
> +
> +	msg->reply_error = ret;
> +
> +	spin_unlock_irqrestore(&sdev->ipc_lock, flags);

I don't see a spin_lock/unlock for the get_reply in the Intel code, is 
this necessary?

> +}
> +
> +void imx_dsp_handle_reply(struct imx_dsp_ipc *ipc)
> +{
> +	struct imx8_priv *priv = imx_dsp_get_data(ipc);
> +
> +	imx8_get_reply(priv->sdev);
> +	snd_sof_ipc_reply(priv->sdev, 0);
> +}
> +
> +void imx_dsp_handle_request(struct imx_dsp_ipc *ipc)
> +{
> +	struct imx8_priv *priv = imx_dsp_get_data(ipc);
> +
> +	snd_sof_ipc_msgs_rx(priv->sdev);
> +}
> +
> +struct imx_dsp_ops dsp_ops = {
> +	.handle_reply		= imx_dsp_handle_reply,
> +	.handle_request		= imx_dsp_handle_request,
> +};
> +
> +static int imx8_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
> +{
> +	struct imx8_priv *priv = (struct imx8_priv *)sdev->private;
> +
> +	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
> +			  msg->msg_size);
> +	imx_dsp_ring_doorbell(priv->dsp_ipc, 0);
> +
> +	return 0;
> +}
> +
> +/*
> + * DSP control.
> + */
> +static int imx8_run(struct snd_sof_dev *sdev)
> +{
> +	int ret;
> +	struct imx8_priv *dsp_priv = (struct imx8_priv *)sdev->private;
> +
> +	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
> +				      IMX_SC_C_OFS_SEL, 1);
> +	if (ret < 0) {
> +		dev_err(sdev->dev, "Error system address offset source select\n");
> +		return ret;
> +	}
> +
> +	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
> +				      IMX_SC_C_OFS_AUDIO, 0x80);
> +	if (ret < 0) {
> +		dev_err(sdev->dev, "Error system address offset of AUDIO\n");
> +		return ret;
> +	}
> +
> +	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
> +				      IMX_SC_C_OFS_PERIPH, 0x5A);
> +	if (ret < 0) {
> +		dev_err(sdev->dev, "Error system address offset of PERIPH %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
> +				      IMX_SC_C_OFS_IRQ, 0x51);
> +	if (ret < 0) {
> +		dev_err(sdev->dev, "Error system address offset of IRQ\n");
> +		return ret;
> +	}
> +
> +	imx_sc_pm_cpu_start(dsp_priv->sc_ipc, IMX_SC_R_DSP, true,
> +			    RESET_VECTOR_VADDR);
> +
> +	return 0;
> +}
> +
> +static int imx8_probe(struct snd_sof_dev *sdev)
> +{
> +	struct imx8_priv *priv;
> +	int i;
> +	struct platform_device *pdev =
> +		container_of(sdev->dev, struct platform_device, dev);
> +	struct platform_device *ipc_dev;
> +	struct resource *mmio;
> +	int num_domains = 0;
> +	u32 base, size;
> +	int ret = 0;
> +	struct device_node *np = pdev->dev.of_node;
> +	struct device_node *res_node;
> +	struct resource res;

nit-pick: can we reorder so that we have all counters last and a nice 
xmas-tree shape.

> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	sdev->private = priv;
> +	priv->dev = sdev->dev;
> +	priv->sdev = sdev;
> +
> +	ret = imx_scu_get_handle(&priv->sc_ipc);
> +	if (ret) {
> +		dev_err(sdev->dev, "Cannot obtain SCU handle (err = %d)\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	ipc_dev = platform_device_register_data(sdev->dev, "imx-dsp",
> +						PLATFORM_DEVID_NONE,
> +						pdev, sizeof(*pdev));
> +	if (IS_ERR(ipc_dev)) {
> +		dev_err(sdev->dev, "Failed to register platform device\n");
> +		return PTR_ERR(ipc_dev);
> +	}
> +
> +	priv->dsp_ipc = dev_get_drvdata(&ipc_dev->dev);
> +	if (!priv->dsp_ipc)
> +		return -EPROBE_DEFER;
> +
> +	imx_dsp_set_data(priv->dsp_ipc, priv);
> +	priv->dsp_ipc->ops = &dsp_ops;
> +
> +	num_domains = of_count_phandle_with_args(np, "power-domains",
> +						 "#power-domain-cells");
> +	for (i = 0; i < num_domains; i++) {
> +		struct device *pd_dev;
> +		struct device_link *link;
> +
> +		pd_dev = dev_pm_domain_attach_by_id(&pdev->dev, i);
> +		if (IS_ERR(pd_dev))
> +			return PTR_ERR(pd_dev);
> +
> +		link = device_link_add(&pdev->dev, pd_dev,
> +				       DL_FLAG_STATELESS |
> +				       DL_FLAG_PM_RUNTIME |
> +				       DL_FLAG_RPM_ACTIVE);
> +		if (IS_ERR(link))
> +			return PTR_ERR(link);

Question: is the error flow final? Wondering if we release all the 
resources/memory/devices on errors?

Also are all the resources device-managed, I don't see a remove()?

> +	}
> +
> +	/* DSP base */
> +	mmio = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (mmio) {
> +		base = mmio->start;
> +		size = resource_size(mmio);
> +	} else {
> +		dev_err(sdev->dev, "error: failed to get DSP base at idx 0\n");
> +		return -EINVAL;
> +	}
> +
> +	sdev->bar[SOF_FW_BLK_TYPE_IRAM] = devm_ioremap(sdev->dev, base, size);
> +	if (!sdev->bar[SOF_FW_BLK_TYPE_IRAM]) {
> +		dev_err(sdev->dev, "failed to ioremap base 0x%x size 0x%x\n",
> +			base, size);
> +		return -ENODEV;
> +	}
> +	sdev->mmio_bar = SOF_FW_BLK_TYPE_IRAM;
> +
> +	res_node = of_parse_phandle(np, "memory-region", 0);
> +	if (!res_node) {
> +		dev_err(&pdev->dev, "failed to get memory region node\n");
> +		return -ENODEV;
> +	}
> +	if (of_address_to_resource(res_node, 0, &res)) {
> +		dev_err(&pdev->dev, "failed to get reserved region address\n");
> +		return -EINVAL;
> +	}
> +
> +	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev, res.start,
> +							  res.end - res.start +
> +							  1);
> +	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
> +		dev_err(sdev->dev, "failed to ioremap mem 0x%x size 0x%x\n",
> +			base, size);
> +		return -ENODEV;
> +	}
> +	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
> +
> +	return ret;
> +}
> +
> +/* on i.MX8 there is 1 to 1 match between type and BAR idx */
> +int imx8_get_bar_index(struct snd_sof_dev *sdev, u32 type)
> +{
> +	return type;
> +}
> +
> +void imx8_ipc_msg_data(struct snd_sof_dev *sdev,
> +		       struct snd_pcm_substream *substream,
> +		       void *p, size_t sz)
> +{
> +	sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
> +}
> +
> +int imx8_ipc_pcm_params(struct snd_sof_dev *sdev,
> +			struct snd_pcm_substream *substream,
> +			const struct sof_ipc_pcm_params_reply *reply)
> +{
> +	return 0;
> +}
> +
> +static struct snd_soc_dai_driver imx8_dai[] = {
> +{
> +	.name = "esai-port",
> +},
> +};
> +
> +/* i.MX8  ops */
> +struct snd_sof_dsp_ops sof_imx8_ops = {
> +	/* device init */
> +	.probe		= imx8_probe,
> +
> +	/* DSP core boot */
> +	.run		= imx8_run,
> +
> +	/* Block IO */
> +	.block_read	= sof_block_read,
> +	.block_write	= sof_block_write,
> +
> +	/* ipc */
> +	.send_msg	= imx8_send_msg,
> +	.fw_ready	= imx8_fw_ready,
> +
> +	.ipc_msg_data = imx8_ipc_msg_data,
> +	.ipc_pcm_params = imx8_ipc_pcm_params,
> +
> +	/* module loading */
> +	.load_module	= snd_sof_parse_module_memcpy,
> +	.get_bar_index	= imx8_get_bar_index,
> +	/* firmware loading */
> +	.load_firmware	= snd_sof_load_firmware_memcpy,
> +
> +	/* DAI drivers */
> +	.drv = imx8_dai,
> +	.num_drv = 1, /* we have only 1 ESAI interface on i.MX8 */
> +};
> +EXPORT_SYMBOL(sof_imx8_ops);
> +
> +MODULE_LICENSE("Dual BSD/GPL");
> 
