From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] dma: add Qualcomm Technologies HIDMA management driver
Date: Fri, 30 Oct 2015 10:34:03 +0100
Message-ID: <4548985.gMZJhM3R1p@wuerfel>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 29 October 2015 23:08:12 Sinan Kaya wrote:
> diff --git a/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
> new file mode 100644
> index 0000000..81674ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
> @@ -0,0 +1,42 @@
> +Qualcomm Technologies HIDMA Management interface
> +
> +Required properties:
> +- compatible: must contain "qcom,hidma_mgmt"

No underscores in the name please. Also try to be more specific, in case this
device shows up in more than one SoC and they end up not being 100% compatible
we want to be able to tell them apart.

> +- reg: Address range for DMA device
> +- interrupts: Should contain the one interrupt shared by all channels
> +- nr-channels: Number of channels supported by this DMA controller.
> +- max-write: Maximum write burst in bytes. A memcpy requested is
> +  fragmented to multiples of this amount.
> +- max-read: Maximum read burst in bytes. A memcpy request is
> +  fragmented to multiples of this amount.
> +- max-wxactions: Maximum write transactions to perform in a burst
> +- max-rdactions: Maximum read transactions to perform in a burst
> +- max-memset-limit: Maximum memset limit
> +- ch-priority-#n: Priority of the channel
> +- ch-weight-#n: Round robin weight of the channel

For the last two, you can just use a multi-cell property, using one
cell per channel.

> +
> +#define MODULE_NAME			"hidma-mgmt"
> +#define PREFIX				MODULE_NAME ": "

These can be removed, just use dev_info() etc for messages, to include
a unique identifier.

> +#define AUTOSUSPEND_TIMEOUT		2000
> +
> +#define HIDMA_RUNTIME_GET(dmadev)				\
> +do {								\
> +	atomic_inc(&(dmadev)->pm_counter);			\
> +	TRC_PM(&(dmadev)->pdev->dev,				\
> +		"%s:%d pm_runtime_get %d\n", __func__, __LINE__,\
> +		atomic_read(&(dmadev)->pm_counter));		\
> +	pm_runtime_get_sync(&(dmadev)->pdev->dev);		\
> +} while (0)
> +
> +#define HIDMA_RUNTIME_SET(dmadev)				\
> +do {								\
> +	atomic_dec(&(dmadev)->pm_counter);			\
> +	TRC_PM(&(dmadev)->pdev->dev,				\
> +		"%s:%d pm_runtime_put_autosuspend:%d\n",	\
> +		__func__, __LINE__,				\
> +		atomic_read(&(dmadev)->pm_counter));		\
> +	pm_runtime_mark_last_busy(&(dmadev)->pdev->dev);	\
> +	pm_runtime_put_autosuspend(&(dmadev)->pdev->dev);	\
> +} while (0)

Better use inline functions.

> +struct qcom_hidma_mgmt_dev {
> +	u8 max_wr_xactions;
> +	u8 max_rd_xactions;
> +	u8 max_memset_limit;
> +	u16 max_write_request;
> +	u16 max_read_request;
> +	u16 nr_channels;
> +	u32 chreset_timeout;
> +	u32 sw_version;
> +	u8 *priority;
> +	u8 *weight;
> +
> +	atomic_t	pm_counter;
> +	/* Hardware device constants */
> +	dma_addr_t dev_physaddr;

No need to store the physaddr, it's write-only here.

> +
> +static unsigned int debug_pm;
> +module_param(debug_pm, uint, 0644);
> +MODULE_PARM_DESC(debug_pm,
> +		 "debug runtime power management transitions (default: 0)");
> +
> +#define TRC_PM(...) do {			\
> +		if (debug_pm)			\
> +			dev_info(__VA_ARGS__);	\
> +	} while (0)
> +

Once you are done debugging the driver and have a final version, please
remove these.

> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +
> +#define HIDMA_SHOW(dma, name) \
> +		seq_printf(s, #name "=0x%x\n", dma->name)

Only used once, just remove.

> +#define HIDMA_READ_SHOW(dma, name, offset) \
> +	do { \
> +		u32 val; \
> +		val = readl(dma->dev_virtaddr + offset); \
> +		seq_printf(s, name "=0x%x\n", val); \
> +	} while (0)

Inline function.

> +/**
> + * qcom_hidma_mgmt_info: display HIDMA device info
> + *
> + * Display the info for the current HIDMA device.
> + */
> +static int qcom_hidma_mgmt_info(struct seq_file *s, void *unused)
> +{
> +	struct qcom_hidma_mgmt_dev *mgmtdev = s->private;
> +	u32 val;
> +	int i;
> +
> +	HIDMA_RUNTIME_GET(mgmtdev);
> +	HIDMA_SHOW(mgmtdev, sw_version);
> +
> +	val = readl(mgmtdev->dev_virtaddr + CFG_OFFSET);
> +	seq_printf(s, "ENABLE=%d\n", val & 0x1);
> +
> +	val = readl(mgmtdev->dev_virtaddr + CHRESET_TIMEOUUT_OFFSET);
> +	seq_printf(s, "reset_timeout=%d\n", val & CHRESET_TIMEOUUT_MASK);
> +
> +	val = readl(mgmtdev->dev_virtaddr + MHICFG_OFFSET);
> +	seq_printf(s, "nr_event_channel=%d\n",
> +		(val >> NR_EV_CHANNEL_BIT_POS) & NR_CHANNEL_MASK);
> +	seq_printf(s, "nr_tr_channel=%d\n", (val & NR_CHANNEL_MASK));
> +	seq_printf(s, "nr_virt_tr_channel=%d\n", mgmtdev->nr_channels);
> +	seq_printf(s, "dev_virtaddr=%p\n", &mgmtdev->dev_virtaddr);
> +	seq_printf(s, "dev_physaddr=%pap\n", &mgmtdev->dev_physaddr);
> +	seq_printf(s, "dev_addrsize=%pap\n", &mgmtdev->dev_addrsize);

printing pointers is a security risk, just remove them if they are
not essential here.
> +
> +static int qcom_hidma_mgmt_err_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, qcom_hidma_mgmt_err, inode->i_private);
> +}
> +
> +static const struct file_operations qcom_hidma_mgmt_err_fops = {
> +	.open = qcom_hidma_mgmt_err_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +
> +static ssize_t qcom_hidma_mgmt_mhiderr_clr(struct file *file,
> +	const char __user *user_buf, size_t count, loff_t *ppos)
> +{
> +	struct qcom_hidma_mgmt_dev *mgmtdev = file->f_inode->i_private;
> +
> +	HIDMA_RUNTIME_GET(mgmtdev);
> +	writel(1, mgmtdev->dev_virtaddr + MHID_BUS_ERR_CLR_OFFSET);
> +	HIDMA_RUNTIME_SET(mgmtdev);
> +	return count;
> +}
> +
> +static const struct file_operations qcom_hidma_mgmt_mhiderr_clrfops = {
> +	.write = qcom_hidma_mgmt_mhiderr_clr,
> +};

Is this really just a debugging interface? If anyone would do this
for normal operation, it needs to be a proper API.

> +
> +static void qcom_hidma_mgmt_debug_uninit(struct qcom_hidma_mgmt_dev *mgmtdev)
> +{
> +	debugfs_remove(mgmtdev->evt_ena);
> +	debugfs_remove(mgmtdev->tre_errclr);
> +	debugfs_remove(mgmtdev->msi_errclr);
> +	debugfs_remove(mgmtdev->ode_errclr);
> +	debugfs_remove(mgmtdev->ide_errclr);
> +	debugfs_remove(mgmtdev->evt_errclr);
> +	debugfs_remove(mgmtdev->mhid_errclr);
> +	debugfs_remove(mgmtdev->err);
> +	debugfs_remove(mgmtdev->info);
> +	debugfs_remove(mgmtdev->debugfs);
> +}
>
I guess debugfs_remove_recursive() would do the job as well.

> +static int qcom_hidma_mgmt_debug_init(struct qcom_hidma_mgmt_dev *mgmtdev)
> +{
> +	int rc = 0;
> +
> +	mgmtdev->debugfs = debugfs_create_dir(dev_name(&mgmtdev->pdev->dev),
> +						NULL);
> +	if (!mgmtdev->debugfs) {
> +		rc = -ENODEV;
> +		return rc;
> +	}
> +
> +	mgmtdev->info = debugfs_create_file("info", S_IRUGO,
> +			mgmtdev->debugfs, mgmtdev, &qcom_hidma_mgmt_fops);
> +	if (!mgmtdev->info) {
> +		rc = -ENOMEM;
> +		goto cleanup;
> +	}
> +
> +	mgmtdev->err = debugfs_create_file("err", S_IRUGO,
> +			mgmtdev->debugfs, mgmtdev,
> +			&qcom_hidma_mgmt_err_fops);
> +	if (!mgmtdev->err) {
> +		rc = -ENOMEM;
> +		goto cleanup;
> +	}
> +
> +	mgmtdev->mhid_errclr = debugfs_create_file("mhiderrclr", S_IWUSR,
> +			mgmtdev->debugfs, mgmtdev,
> +			&qcom_hidma_mgmt_mhiderr_clrfops);
> +	if (!mgmtdev->mhid_errclr) {
> +		rc = -ENOMEM;
> +		goto cleanup;
> +	}

Maybe use a loop around an array here to avoid writing the same thing 10 times?

Also, you could move the debugging code into a separate file and have a separate
Kconfig symbol so users can disable this if they do not debug your driver
but still want to use debugfs for other things.

> +static irqreturn_t qcom_hidma_mgmt_irq_handler(int irq, void *arg)
> +{
> +	/* TODO: handle irq here */
> +	return IRQ_HANDLED;
> +}


> +	rc = devm_request_irq(&pdev->dev, irq, qcom_hidma_mgmt_irq_handler,
> +		IRQF_SHARED, "qcom-hidmamgmt", mgmtdev);
> +	if (rc) {
> +		dev_err(&pdev->dev, "irq registration failed: %d\n", irq);
> +		goto out;
> +	}

If you create a shared handler, you must check whether there was an
interrupt pending, otherwise you will lose interrupts for all other devices
that share the same IRQ.

Better remove the handler completely here so you don't need to check it.

> +
> +	if (device_property_read_u16(&pdev->dev, "nr-channels",
> +		&mgmtdev->nr_channels)) {
> +		dev_err(&pdev->dev, "number of channels missing\n");
> +		rc = -EINVAL;
> +		goto out;
> +	}

This should be a u32 name 'dma-channels' for consistency with the
generic DMA binding.

Also, try to avoid using u8 and u16 properties everywhere and just
us u32 for consistency.

> +
> +	for (i = 0; i < mgmtdev->nr_channels; i++) {
> +		char name[30];
> +
> +		sprintf(name, "ch-priority-%d", i);
> +		device_property_read_u8(&pdev->dev, name,
> +			&mgmtdev->priority[i]);
> +
> +		sprintf(name, "ch-weight-%d", i);
> +		device_property_read_u8(&pdev->dev, name,
> +			&mgmtdev->weight[i]);

Per comment above, just read this as an array.

> +	dev_info(&pdev->dev,
> +		"HI-DMA engine management driver registration complete\n");
> +	platform_set_drvdata(pdev, mgmtdev);
> +	HIDMA_RUNTIME_SET(mgmtdev);
> +	return 0;
> +out:
> +	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_put_sync_suspend(&pdev->dev);
> +	return rc;
> +}

The rest of the probe function does not register any user interface aside from
the debugging stuff. Can you explain in the changelog how you expect the
driver to be used in a real system? Is there another driver coming?

> +
> +static const struct of_device_id qcom_hidma_mgmt_match[] = {
> +	{ .compatible = "qcom,hidma_mgmt", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, qcom_hidma_mgmt_match);
> +
> +static struct platform_driver qcom_hidma_mgmt_driver = {
> +	.probe = qcom_hidma_mgmt_probe,
> +	.remove = qcom_hidma_mgmt_remove,
> +	.driver = {
> +		.name = MODULE_NAME,
> +		.owner = THIS_MODULE,
> +		.of_match_table = of_match_ptr(qcom_hidma_mgmt_match),

drop the .owner field and the of_match_ptr() macro to avoid warnings here.

> +static int __init qcom_hidma_mgmt_init(void)
> +{
> +	return platform_driver_register(&qcom_hidma_mgmt_driver);
> +}
> +device_initcall(qcom_hidma_mgmt_init);
> +
> +static void __exit qcom_hidma_mgmt_exit(void)
> +{
> +	platform_driver_unregister(&qcom_hidma_mgmt_driver);
> +}
> +module_exit(qcom_hidma_mgmt_exit);

module_platform_driver()

	Arnd
