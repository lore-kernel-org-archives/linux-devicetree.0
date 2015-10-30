From: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: add Qualcomm Technologies HIDMA channel driver
Date: Fri, 30 Oct 2015 17:42:26 -0400
Message-ID: <5633E442.3010003@codeaurora.org>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
 <1446174501-8870-2-git-send-email-okaya@codeaurora.org>
 <5741892.rRLhcI7KQG@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5741892.rRLhcI7KQG@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

thanks for the review. I'll work on these.

On 10/30/2015 6:24 AM, Arnd Bergmann wrote:
> On Thursday 29 October 2015 23:08:13 Sinan Kaya wrote:
>> This patch adds support for hidma engine. The driver
>> consists of two logical blocks. The DMA engine interface
>> and the low-level interface. This version of the driver
>> does not support virtualization on this release and only
>> memcpy interface support is included.
>
> Does that mean you can have slave device support eventually?
>
> If so, please put that into the binding document already.

will do.

>
>> Signed-off-by: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>   .../devicetree/bindings/dma/qcom_hidma.txt         |   18 +
>>   drivers/dma/Kconfig                                |   11 +
>>   drivers/dma/Makefile                               |    4 +
>>   drivers/dma/qcom_hidma.c                           | 1717 ++++++++++++++++++++
>>   drivers/dma/qcom_hidma.h                           |   44 +
>>   drivers/dma/qcom_hidma_ll.c                        | 1132 +++++++++++++
>>   6 files changed, 2926 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/dma/qcom_hidma.txt
>>   create mode 100644 drivers/dma/qcom_hidma.c
>>   create mode 100644 drivers/dma/qcom_hidma.h
>>   create mode 100644 drivers/dma/qcom_hidma_ll.c
>>
>> diff --git a/Documentation/devicetree/bindings/dma/qcom_hidma.txt b/Documentation/devicetree/bindings/dma/qcom_hidma.txt
>> new file mode 100644
>> index 0000000..9a01635
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/qcom_hidma.txt
>> @@ -0,0 +1,18 @@
>> +Qualcomm Technologies HIDMA Channel driver
>> +
>> +Required properties:
>> +- compatible: must contain "qcom,hidma"
>
> Be more specific here. Also, should this be 'hisilicon,hidma-1.0' rather
> than 'qcom'? I'm guessing from the name that this is a device you licensed
> from them.
>
No, this is a QCOM part. I used the driver from hisilicon as a starting 
point instead of starting from scratch. That's why, I kept the original 
copy rights.

>> +- reg: Addresses for the transfer and event channel
>> +- interrupts: Should contain the event interrupt
>> +- desc-count: Number of asynchronous requests this channel can handle
>> +- event-channel: The HW event channel completions will be delivered.
>> +Example:
>> +
>> +	hidma_24: hidma@0x5c050000 {
>
> Name should be 'dma-controller' in DT, not 'hidma'.
will test and change.

>
>> +		compatible = "qcom,hidma";
>> +		reg = <0 0x5c050000 0x0 0x1000>,
>> +		      <0 0x5c0b0000 0x0 0x1000>;
>> +		interrupts = <0 389 0>;
>> +		desc-count = <10>;
>> +		event-channel = /bits/ 8 <4>;
>> +	};
>
> Remove the /bits/.

ok

>
>> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
>> index 76a5a5e..2645185 100644
>> --- a/drivers/dma/Kconfig
>> +++ b/drivers/dma/Kconfig
>> @@ -512,6 +512,17 @@ config QCOM_HIDMA_MGMT
>>   	  OS would run QCOM_HIDMA driver and the hypervisor would run
>>   	  the QCOM_HIDMA_MGMT driver.
>>
>> +config QCOM_HIDMA
>> +	tristate "Qualcomm Technologies HIDMA support"
>> +	select DMA_ENGINE
>> +	select DMA_VIRTUAL_CHANNELS
>> +	help
>> +	  Enable support for the Qualcomm Technologies HIDMA controller.
>> +	  The HIDMA controller supports optimized buffer copies
>> +	  (user to kernel, kernel to kernel, etc.).  It only supports
>> +	  memcpy/memset interfaces. The core is not intended for general
>> +	  purpose slave DMA.
>> +
>>   config XILINX_VDMA
>>   	tristate "Xilinx AXI VDMA Engine"
>>   	depends on (ARCH_ZYNQ || MICROBLAZE)
>> diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
>> index 3d25ffd..5665df2 100644
>> --- a/drivers/dma/Makefile
>> +++ b/drivers/dma/Makefile
>> @@ -53,6 +53,10 @@ obj-$(CONFIG_PL330_DMA) += pl330.o
>>   obj-$(CONFIG_PPC_BESTCOMM) += bestcomm/
>>   obj-$(CONFIG_PXA_DMA) += pxa_dma.o
>>   obj-$(CONFIG_QCOM_BAM_DMA) += qcom_bam_dma.o
>> +obj-$(CONFIG_QCOM_HIDMA) +=  qcom_hdma.o
>> +qcom_hdma-objs        := qcom_hidma_ll.o qcom_hidma.o
>> +
>
> The driver is linked into a single module, so all the EXPORT_SYMBOL
> statements can be dropped.

will test and change.

>
>> +/* Default idle time is 2 seconds. This parameter can
>> + * be overridden by changing the following
>> + * /sys/bus/platform/devices/QCOM8061:<xy>/power/autosuspend_delay_ms
>> + * during kernel boot.
>> + */
>> +#define AUTOSUSPEND_TIMEOUT		2000
>> +#define HIDMA_DEFAULT_DESCRIPTOR_COUNT	16
>> +#define MODULE_NAME			"hidma"
>
> MODULE_NAME and HIDMA_DEFAULT_DESCRIPTOR_COUNT can be dropped

I'll remove the module_name. The default descriptor is used if 
device-tree or acpi table does not have the descriptor count.

>
>
>> +#define HIDMA_RUNTIME_GET(dmadev)				\
>> +do {								\
>> +	atomic_inc(&(dmadev)->pm_counter);			\
>> +	TRC_PM((dmadev)->ddev.dev,				\
>> +		"%s:%d pm_runtime_get %d\n", __func__, __LINE__,\
>> +		atomic_read(&(dmadev)->pm_counter));		\
>> +	pm_runtime_get_sync((dmadev)->ddev.dev);		\
>> +} while (0)
>> +
>> +#define HIDMA_RUNTIME_SET(dmadev)				\
>> +do {								\
>> +	atomic_dec(&(dmadev)->pm_counter);			\
>> +	TRC_PM((dmadev)->ddev.dev,				\
>> +		"%s:%d pm_runtime_put_autosuspend:%d\n",	\
>> +		__func__, __LINE__,				\
>> +		atomic_read(&(dmadev)->pm_counter));		\
>> +	pm_runtime_mark_last_busy((dmadev)->ddev.dev);		\
>> +	pm_runtime_put_autosuspend((dmadev)->ddev.dev);		\
>> +} while (0)
>
> Inline functions.

ok, I was hoping to keep the file and line numbers as the PM stuff gets 
called from multiple locations. should I call the inline functions with 
__func__ and __LINE__ from another macro  like

#define HIDMA_RUNTIME_GET(dmadev)
	func(dmadev, __func__, __LINE__)

etc.


>
>> +struct hidma_test_sync {
>> +	atomic_t			counter;
>> +	wait_queue_head_t		wq;
>> +};
>
> Let me guess, you converted this from a semaphore? ;-)
>
> Just put the two members into the containing structure and relete it here.

Probably some other code that I don't remember. will do.

>
>> +struct hidma_dev {
>> +	u8				evridx;
>> +	u32				nr_descriptors;
>> +
>> +	void				*lldev;
>> +	void				__iomem *dev_trca;
>> +	void				__iomem *dev_evca;
>> +	int (*self_test)(struct hidma_dev *device);
>> +	struct dentry			*debugfs;
>> +	struct dentry			*stats;
>> +
>> +	/* used to protect the pending channel list*/
>> +	spinlock_t			lock;
>> +	dma_addr_t			dev_trca_phys;
>> +	struct dma_device		ddev;
>> +	struct tasklet_struct		tasklet;
>
> workqueue maybe?

is there an advantage of workqueue over tasklet? I'm open to suggestions.

>
>> +	resource_size_t			dev_trca_size;
>> +	dma_addr_t			dev_evca_phys;
>> +	resource_size_t			dev_evca_size;
>
> All three look unused and can be removed.

ok.

>
>> +static unsigned int debug_pm;
>> +module_param(debug_pm, uint, 0644);
>> +MODULE_PARM_DESC(debug_pm,
>> +		 "debug runtime power management transitions (default: 0)");
>> +
>> +#define TRC_PM(...) do {			\
>> +		if (debug_pm)			\
>> +			dev_info(__VA_ARGS__);	\
>> +	} while (0)
>
> Again, remove these after you are done debugging the problem at hand,
> we don't need to clutter up the upstream version.

ok, I'll take them out if that's the norm. I was hoping to keep them in 
case something shows up.

>
>> +	/*
>> +	 * It is assumed that the hardware can move the data within 1s
>> +	 * and signal the OS of the completion
>> +	 */
>> +	ret = wait_event_interruptible_timeout(dmadev->test_result.wq,
>> +		atomic_read(&dmadev->test_result.counter) == (map_count),
>> +				msecs_to_jiffies(10000));
>> +
>> +	if (ret <= 0) {
>> +		dev_err(dmadev->ddev.dev,
>> +			"Self-test sg copy timed out, disabling\n");
>> +		err = -ENODEV;
>> +		goto tx_status;
>> +	}
>
> Why ENODEV? Could you make this handle restarted system calls?

This is the self test code. It gets called from probe. If there is a 
problem with the device or system configuration, I don't want to enable 
this device. I can certainly return a different error code though. 
What's a good code?

>
>> +
>> +/*
>> + * Perform a streaming transaction to verify the HW works.
>> + */
>> +static int hidma_selftest_streaming(struct hidma_dev *dmadev,
>> +			struct dma_chan *dma_chanptr, u64 size,
>> +			unsigned long flags)
>> +{
>
> You have a lot of selftest code here. Can you try to move that into a file
> that works for all DMA engines? It feels like this should not be part of
> a driver.

Will try.

>
>> +
>> +#if IS_ENABLED(CONFIG_DEBUG_FS)
>> +
>> +#define SIER_CHAN_SHOW(chan, name) \
>> +		seq_printf(s, #name "=%u\n", chan->name)
>
> can be open-coded for clarity.
>

I think I copied this from another driver. Would you rather see 
seq_printf in the code than a macro.

Sorry, I didn't get what you mean by "open-coded".

>> +       ret = dma_mapping_error(dev, dma_src);
>> +       if (ret) {
>> +               dev_err(dev, "dma_mapping_error with ret:%d\n", ret);
>> +               ret = -ENOMEM;
>> +       } else {
>> +               phys_addr_t phys;
>> +
>> +               phys = dma_to_phys(dev, dma_src);
>> +               if (strcmp(__va(phys), "hello world") != 0) {
>> +                       dev_err(dev, "memory content mismatch\n");
>> +                       ret = -EINVAL;
>> +               } else {
>> +                       dev_dbg(dev, "mapsingle:dma_map_single works\n");
>> +               }
>> +               dma_unmap_single(dev, dma_src, buf_size, DMA_TO_DEVICE);
>> +       }
>
> dma_to_phys() is architecture specific and does not work if you
> have an IOMMU. Just use the virtual address you passed into dma_map_*.

Should we fix the real problem?

I patched dma_to_phys to call IOMMU driver for translation when IOMMU is 
present. I was planning to upstream that patch when Robin Murphy's 
changes make upstream.

The assumption of phys==dma address doesn't look scalable to me. I was 
checking the DMA subsystem for correctness with this test. If use 
dma_src, it is going to be a 1==1 test.

>
>> +/**
>> + * hidma_dma_info: display HIDMA device info
>> + *
>> + * Display the info for the current HIDMA device.
>> + */
>> +static int hidma_dma_info(struct seq_file *s, void *unused)
>> +{
>> +	struct hidma_dev *dmadev = s->private;
>> +	struct dma_device *dma = &dmadev->ddev;
>> +
>> +	seq_printf(s, "nr_descriptors=%d\n", dmadev->nr_descriptors);
>> +	seq_printf(s, "dev_trca=%p\n", &dmadev->dev_trca);
>> +	seq_printf(s, "dev_trca_phys=%pa\n", &dmadev->dev_trca_phys);
>> +	seq_printf(s, "dev_trca_size=%pa\n", &dmadev->dev_trca_size);
>> +	seq_printf(s, "dev_evca=%p\n", &dmadev->dev_evca);
>> +	seq_printf(s, "dev_evca_phys=%pa\n", &dmadev->dev_evca_phys);
>> +	seq_printf(s, "dev_evca_size=%pa\n", &dmadev->dev_evca_size);
>
> Don't print pointers here.

ok

>
>> +	seq_printf(s, "self_test=%u\n",
>> +		atomic_read(&dmadev->test_result.counter));
>> +
>> +	seq_printf(s, "copy%s%s%s%s%s%s%s%s%s%s%s\n",
>> +		dma_has_cap(DMA_PQ, dma->cap_mask) ? " pq" : "",
>> +		dma_has_cap(DMA_PQ_VAL, dma->cap_mask) ? " pq_val" : "",
>> +		dma_has_cap(DMA_XOR, dma->cap_mask) ? " xor" : "",
>> +		dma_has_cap(DMA_XOR_VAL, dma->cap_mask) ? " xor_val" : "",
>> +		dma_has_cap(DMA_INTERRUPT, dma->cap_mask) ? " intr" : "",
>> +		dma_has_cap(DMA_SG, dma->cap_mask) ? " sg" : "",
>> +		dma_has_cap(DMA_ASYNC_TX, dma->cap_mask) ? " async" : "",
>> +		dma_has_cap(DMA_SLAVE, dma->cap_mask) ? " slave" : "",
>> +		dma_has_cap(DMA_CYCLIC, dma->cap_mask) ? " cyclic" : "",
>> +		dma_has_cap(DMA_INTERLEAVE, dma->cap_mask) ? " intl" : "",
>> +		dma_has_cap(DMA_MEMCPY, dma->cap_mask) ? " memcpy" : "");
>> +
>> +	return 0;
>> +}
>
> The selftest part and the features could just be separate files in the
> core dmaengine code, it doesn't really belong here.
>
I'll take a look. It could take a couple of iterations to get this right 
but I could certainly move my testing to another file for sharing.

>> +}
>> +#else
>> +static void hidma_debug_uninit(struct hidma_dev *dmadev)
>> +{
>> +}
>> +static int hidma_debug_init(struct hidma_dev *dmadev)
>> +{
>> +	return 0;
>> +}
>> +#endif
>
> You can remove the #ifdef here. The debugfs code already stubs out all
> debugfs_create_*() and turns it all into nops when it is disabled.

ok, I think I got compilation errors with the data structures but I'll 
take a look.

>
>> +	dma_cap_set(DMA_MEMCPY, dmadev->ddev.cap_mask);
>> +	/* Apply default dma_mask if needed */
>> +	if (!pdev->dev.dma_mask) {
>> +		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
>> +		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(64);
>> +	}
>> +
>
> remove the check, or use

I got caught on this problem before. Let me go back and revisit. It took 
my entire day to figure out that dma_mask pointer was not set.

>
> 	if (WARN_ON(!pdev->dev.dma_mask))
> 		return -ENXIO;
>
> The dma mask has to always be set by the platform code before probe()
> is called. If it is not set, you are not allowed to perform DMA.

I tested this on an ACPI platform BTW when I was working on the initial 
implementation.

>
>> +	dmadev->dev_evca_phys = evca_resource->start;
>> +	dmadev->dev_evca_size = resource_size(evca_resource);
>> +
>> +	dev_dbg(&pdev->dev, "dev_evca_phys:%pa\n", &dmadev->dev_evca_phys);
>> +	dev_dbg(&pdev->dev, "dev_evca_size:%pa\n", &dmadev->dev_evca_size);
>> +
>
>> +	dev_dbg(&pdev->dev, "qcom_hidma: mapped EVCA %pa to %p\n",
>> +		&dmadev->dev_evca_phys, dmadev->dev_evca);
>
>
>
>> +	dmadev->dev_trca_phys = trca_resource->start;
>> +	dmadev->dev_trca_size = resource_size(trca_resource);
>> +
>> +	dev_dbg(&pdev->dev, "dev_trca_phys:%pa\n", &dmadev->dev_trca_phys);
>> +	dev_dbg(&pdev->dev, "dev_trca_size:%pa\n", &dmadev->dev_trca_size);
>
> Don't print pointers.

OK

>
>> +	rc = devm_request_irq(&pdev->dev, chirq, hidma_chirq_handler, 0,
>> +			      "qcom-hidma", &dmadev->lldev);
>> +	if (rc) {
>> +		dev_err(&pdev->dev, "chirq registration failed: %d\n", chirq);
>> +		goto chirq_request_failed;
>> +	}
>> +
>> +	dev_dbg(&pdev->dev, "initializing DMA channels\n");
>> +	INIT_LIST_HEAD(&dmadev->ddev.channels);
>> +	rc = hidma_chan_init(dmadev, 0);
>> +	if (rc) {
>> +		dev_err(&pdev->dev, "probe:channel init failed\n");
>> +		goto channel_init_failed;
>> +	}
>> +	dev_dbg(&pdev->dev, "HI-DMA engine driver starting self test\n");
>> +	rc = dmadev->self_test(dmadev);
>> +	if (rc) {
>> +		dev_err(&pdev->dev, "probe: self test failed: %d\n", rc);
>> +		goto self_test_failed;
>> +	}
>> +	dev_info(&pdev->dev, "probe: self test succeeded.\n");
>> +
>> +	dev_dbg(&pdev->dev, "calling dma_async_device_register\n");
>> +	rc = dma_async_device_register(&dmadev->ddev);
>> +	if (rc) {
>> +		dev_err(&pdev->dev,
>> +			"probe: failed to register slave DMA: %d\n", rc);
>> +		goto device_register_failed;
>> +	}
>> +	dev_dbg(&pdev->dev, "probe: dma_async_device_register done\n");
>> +
>> +	rc = hidma_debug_init(dmadev);
>> +	if (rc) {
>> +		dev_err(&pdev->dev,
>> +			"probe: failed to init debugfs: %d\n", rc);
>> +		goto debug_init_failed;
>> +	}
>> +
>> +	dev_info(&pdev->dev, "HI-DMA engine driver registration complete\n");
>> +	platform_set_drvdata(pdev, dmadev);
>> +	HIDMA_RUNTIME_SET(dmadev);
>> +	return 0;
>
> Remove the debug prints when you are done debugging.

errors or the dev_infos?

>
>> +debug_init_failed:
>> +device_register_failed:
>> +self_test_failed:
>> +channel_init_failed:
>> +chirq_request_failed:
>> +	hidma_ll_uninit(dmadev->lldev);
>> +ll_init_failed:
>> +evridx_failed:
>> +remap_trca_failed:
>> +remap_evca_failed:
>> +	if (dmadev)
>> +		hidma_free(dmadev);
>
> Rename the labels according to what you do at in the failure case
> and remove most of them. This is 'goto', not 'comefrom' ;-)

ok, We had different opinions how gotos should be written.
>
>> +static struct platform_driver hidma_driver = {
>> +	.probe = hidma_probe,
>> +	.remove = hidma_remove,
>> +	.driver = {
>> +		.name = MODULE_NAME,
>> +		.owner = THIS_MODULE,
>> +		.of_match_table = of_match_ptr(hidma_match),
>> +		.acpi_match_table = ACPI_PTR(hidma_acpi_ids),
>
>
> Remove .owner and of_match_ptr().
>
ok, will do.

>> +	},
>> +};
>> +
>> +static int __init hidma_init(void)
>> +{
>> +	return platform_driver_register(&hidma_driver);
>> +}
>> +late_initcall(hidma_init);
>> +
>> +static void __exit hidma_exit(void)
>> +{
>> +	platform_driver_unregister(&hidma_driver);
>> +}
>> +module_exit(hidma_exit);
>
> module_platform_driver()

ok
>
>> +
>> +	if (unlikely(tre_ch >= lldev->nr_tres)) {
>> +		dev_err(lldev->dev, "invalid TRE number in free:%d", tre_ch);
>> +		return;
>> +	}
>> +
>> +	tre = &lldev->trepool[tre_ch];
>> +	if (unlikely(atomic_read(&tre->allocated) != true)) {
>> +		dev_err(lldev->dev, "trying to free an unused TRE:%d",
>> +			tre_ch);
>> +		return;
>> +	}
>
> Remove the 'unlikely' and the redundant '!= true'.
>
> Only use 'likely' or 'unlikely' if you can measure a difference.

ok
>
>> +static int hidma_ll_reset(struct hidma_lldev *lldev)
>> +{
>> +	u32 val;
>> +	int count;
>> +
>> +	val = readl_relaxed(lldev->trca + TRCA_CTRLSTS_OFFSET);
>> +	val = val & ~(CH_CONTROL_MASK << 16);
>> +	val = val | (CH_RESET << 16);
>> +	writel_relaxed(val, lldev->trca + TRCA_CTRLSTS_OFFSET);
>> +
>> +	/* wait until the reset is performed */
>> +	wmb();
>> +
>> +	/* Delay 10ms after reset to allow DMA logic to quiesce.*/
>> +	for (count = 0; count < 10; count++) {
>> +		val = readl_relaxed(lldev->trca + TRCA_CTRLSTS_OFFSET);
>> +		lldev->trch_state = (val >> CH_STATE_BIT_POS)
>> +					& CH_STATE_MASK;
>> +		if (lldev->trch_state == CH_DISABLED)
>> +			break;
>> +		mdelay(1);
>> +	}
>> +	val = readl_relaxed(lldev->trca + TRCA_CTRLSTS_OFFSET);
>> +	lldev->trch_state = (val >> CH_STATE_BIT_POS) & CH_STATE_MASK;
>> +	if (lldev->trch_state != CH_DISABLED) {
>> +		dev_err(lldev->dev,
>> +			"transfer channel did not reset\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	val = readl_relaxed(lldev->evca + EVCA_CTRLSTS_OFFSET);
>> +	val = val & ~(CH_CONTROL_MASK << 16);
>> +	val = val | (CH_RESET << 16);
>> +	writel_relaxed(val, lldev->evca + EVCA_CTRLSTS_OFFSET);
>> +
>> +	/* wait until the reset is performed */
>> +	wmb();
>> +
>> +	/* Delay 10ms after reset to allow DMA logic to quiesce.*/
>> +	for (count = 0; count < 10; count++) {
>> +		val = readl_relaxed(lldev->evca + EVCA_CTRLSTS_OFFSET);
>> +		lldev->evch_state = (val >> CH_STATE_BIT_POS)
>> +					& CH_STATE_MASK;
>> +		if (lldev->evch_state == CH_DISABLED)
>> +			break;
>> +		mdelay(1);
>> +	}
>
> Try using a workqueue to get into a state where you can call msleep()
> instead of mdelay().
>
will try

> Also, if you waste CPU cycles for hundreds of milliseconds, it's unlikely
> that the function is so performance critical that it requires writel_relaxed().
>
> Just use writel() here.

The issue is not writel_relaxed vs. writel. After I issue reset, I need 
wait for some time to confirm reset was done. I can use readl_polling 
instead of mdelay if we don't like mdelay.

>> +/*
>> + * The interrupt handler for HIDMA will try to consume as many pending
>> + * EVRE from the event queue as possible. Each EVRE has an associated
>> + * TRE that holds the user interface parameters. EVRE reports the
>> + * result of the transaction. Hardware guarantees ordering between EVREs
>> + * and TREs. We use last processed offset to figure out which TRE is
>> + * associated with which EVRE. If two TREs are consumed by HW, the EVREs
>> + * are in order in the event ring.
>> + * This handler will do a one pass for consuming EVREs. Other EVREs may
>> + * be delivered while we are working. It will try to consume incoming
>> + * EVREs one more time and return.
>> + * For unprocessed EVREs, hardware will trigger another interrupt until
>> + * all the interrupt bits are cleared.
>> + */
>> +static void hidma_ll_int_handler_internal(struct hidma_lldev *lldev)
>> +{
>> +	u32 status;
>> +	u32 enable;
>> +	u32 cause;
>> +	int repeat = 2;
>> +	unsigned long timeout;
>> +
>> +	status = readl_relaxed(lldev->evca + EVCA_IRQ_STAT_OFFSET);
>> +	enable = readl_relaxed(lldev->evca + EVCA_IRQ_EN_OFFSET);
>> +	cause = status & enable;
>> +
>
> Reading the status probably requires a readl() rather than readl_relaxed()
> to guarantee that the DMA data has arrived in memory by the time that the
> register data is seen by the CPU. If using readl_relaxed() here is a valid
> and required optimization, please add a comment to explain why it works
> and how much you gain.

I will add some description. This is a high speed peripheral. I don't 
like spreading barriers as candies inside the readl and writel unless I 
have to.

According to the barriers video, I watched on youtube this should be the 
rule for ordering.

"if you do two relaxed reads and check the results of the returned 
variables, ARM architecture guarantees that these two relaxed variables 
will get observed during the check."

this is called implied ordering or something of that sort.

>
>> +		/* Another interrupt might have arrived while we are
>> +		 * processing this one. Read the new cause.
>> +		 */
>> +		status = readl_relaxed(lldev->evca + EVCA_IRQ_STAT_OFFSET);
>> +		enable = readl_relaxed(lldev->evca + EVCA_IRQ_EN_OFFSET);
>> +		cause = status & enable;
>> +
>> +		repeat--;
>> +	}
>
> Same here.
>

comment above.

>
>> +}
>> +
>> +
>> +static int hidma_ll_enable(struct hidma_lldev *lldev)
>> +{
>> +	u32 val;
>> +
>> +	val = readl_relaxed(lldev->evca + EVCA_CTRLSTS_OFFSET);
>> +	val &= ~(CH_CONTROL_MASK << 16);
>> +	val |= (CH_ENABLE << 16);
>> +
>> +	writel_relaxed(val, lldev->evca + EVCA_CTRLSTS_OFFSET);
>> +
>> +	/* wait until channel is enabled */
>> +	wmb();
>> +
>> +	mdelay(1);
>> +
>> +	val = readl_relaxed(lldev->evca + EVCA_CTRLSTS_OFFSET);
>> +	lldev->evch_state = (val >> CH_STATE_BIT_POS) & CH_STATE_MASK;
>> +	if ((lldev->evch_state != CH_ENABLED) &&
>> +		(lldev->evch_state != CH_RUNNING)) {
>> +		dev_err(lldev->dev,
>> +			"event channel did not get enabled\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	val = readl_relaxed(lldev->trca + TRCA_CTRLSTS_OFFSET);
>> +	val = val & ~(CH_CONTROL_MASK << 16);
>> +	val = val | (CH_ENABLE << 16);
>> +	writel_relaxed(val, lldev->trca + TRCA_CTRLSTS_OFFSET);
>> +
>> +	/* wait until channel is enabled */
>> +	wmb();
>> +
>> +	mdelay(1);
>
> Another workqueue? You should basically never call mdelay().

I'll use polled read instead.

>
>> +static int hidma_ll_hw_start(void *llhndl)
>> +{
>> +	int rc = 0;
>> +	struct hidma_lldev *lldev = llhndl;
>> +	unsigned long irqflags;
>> +
>> +	spin_lock_irqsave(&lldev->lock, irqflags);
>> +	writel_relaxed(lldev->tre_write_offset,
>> +			lldev->trca + TRCA_DOORBELL_OFFSET);
>> +	spin_unlock_irqrestore(&lldev->lock, irqflags);
>
> How does this work? The writel_relaxed() won't synchronize with either
> the DMA data or the spinlock.

mutex and spinlocks have barriers inside. See the youtube video.

https://www.youtube.com/watch?v=6ORn6_35kKo


>
>> +int hidma_ll_init(void **lldevp, struct device *dev, u32 nr_tres,
>> +			void __iomem *trca, void __iomem *evca,
>> +			u8 evridx)
>
> How about returning the pointer rather than passing in an indirect pointer?

ok

>
> Also, your abstraction seem to go a little too far if the upper driver
> doesn't know what the lower driver calls its main device structure.
>
> Or you can go further and just embed the struct hidma_lldev within the
> struct hidma_dev to save one?

That's how it was before. It got too complex and variables/spinlocks got 
intermixed. I borrowed the upper layer and it worked as it is. I rather 
keep all hardware stuff in another file and do not mix and match for safety.

>
>> +void hidma_ll_chstats(struct seq_file *s, void *llhndl, u32 tre_ch)
>> +{
>> +	struct hidma_lldev *lldev = llhndl;
>> +	struct hidma_tre *tre;
>> +	u32 length;
>> +	dma_addr_t src_start;
>> +	dma_addr_t dest_start;
>> +	u32 *tre_local;
>> +
>> +	if (unlikely(tre_ch >= lldev->nr_tres)) {
>> +		dev_err(lldev->dev, "invalid TRE number in chstats:%d",
>> +			tre_ch);
>> +		return;
>> +	}
>> +	tre = &lldev->trepool[tre_ch];
>> +	seq_printf(s, "------Channel %d -----\n", tre_ch);
>> +	seq_printf(s, "allocated=%d\n", atomic_read(&tre->allocated));
>> +	HIDMA_CHAN_SHOW(tre, queued);
>> +	seq_printf(s, "err_info=0x%x\n",
>> +		   lldev->tx_status_list[tre->chidx].err_info);
>> +	seq_printf(s, "err_code=0x%x\n",
>> +		   lldev->tx_status_list[tre->chidx].err_code);
>> +	HIDMA_CHAN_SHOW(tre, status);
>> +	HIDMA_CHAN_SHOW(tre, chidx);
>> +	HIDMA_CHAN_SHOW(tre, dma_sig);
>> +	seq_printf(s, "dev_name=%s\n", tre->dev_name);
>> +	seq_printf(s, "callback=%p\n", tre->callback);
>> +	seq_printf(s, "data=%p\n", tre->data);
>> +	HIDMA_CHAN_SHOW(tre, tre_index);
>> +
>> +	tre_local = &tre->tre_local[0];
>> +	src_start = tre_local[TRE_SRC_LOW_IDX];
>> +	src_start = ((u64)(tre_local[TRE_SRC_HI_IDX]) << 32) + src_start;
>> +	dest_start = tre_local[TRE_DEST_LOW_IDX];
>> +	dest_start += ((u64)(tre_local[TRE_DEST_HI_IDX]) << 32);
>> +	length = tre_local[TRE_LEN_IDX];
>> +
>> +	seq_printf(s, "src=%pap\n", &src_start);
>> +	seq_printf(s, "dest=%pap\n", &dest_start);
>> +	seq_printf(s, "length=0x%x\n", length);
>> +}
>> +EXPORT_SYMBOL_GPL(hidma_ll_chstats);
>
> Remove all the pointers here. I guess you can remove the entire debugfs
> file really ;-)

ok, I need some facility to print out stuff when problems happened. 
Would you rather use sysfs?

>
> This looks like it is better done using ftrace for the low-level internals
> of the driver.

I'll look at ftrace.

>
> 	Arnd
>

thanks for the review again.

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
