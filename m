From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 1/3] dma: add Qualcomm Technologies HIDMA management driver
Date: Tue, 3 Nov 2015 12:22:44 +0200
Message-ID: <CAHp75Vf3OjSoqxdYCz6ZFiTo2gjbZq_D=F7PRtj8yU+KFrkOtg@mail.gmail.com>
References: <1446444460-21600-1-git-send-email-okaya@codeaurora.org>
	<1446444460-21600-2-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446444460-21600-2-git-send-email-okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dmaengine <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 2, 2015 at 8:07 AM, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> The Qualcomm Technologies HIDMA device has been designed
> to support virtualization technology. The driver has been
> divided into two to follow the hardware design. The management
> driver is executed in hypervisor context and is the main
> management entity for all channels provided by the device.
> The channel driver is executed in the hypervisor/guest OS
> context.
>
> All channel devices get probed in the hypervisor
> context during power up. They show up as DMA engine
> channels. Then, before starting the virtualization; each
> channel device is unbound from the hypervisor by VFIO
> and assigned to the guest machine for control.
>
> This management driver will be used by the system
> admin to monitor/reset the execution state of the DMA
> channels. This will be the management interface.


> +static ssize_t qcom_hidma_mgmt_evtena(struct file *file,
> +       const char __user *user_buf, size_t count, loff_t *ppos)
> +{
> +       char temp_buf[16+1];

16 is a magic number. Make it defined constant.

> +       struct qcom_hidma_mgmt_dev *mgmtdev = file->f_inode->i_private;
> +       u32 event;
> +       ssize_t ret;
> +       unsigned long val;
> +
> +       temp_buf[16] = '\0';
> +       if (copy_from_user(temp_buf, user_buf, min_t(int, count, 16)))
> +               goto out;
> +
> +       ret = kstrtoul(temp_buf, 16, &val);

kstrtoul_from_user?

> +       if (ret) {
> +               dev_warn(&mgmtdev->pdev->dev, "unknown event\n");
> +               goto out;
> +       }
> +
> +       event = (u32)val & HW_EVENTS_CFG_MASK;
> +
> +       pm_runtime_get_sync(&mgmtdev->pdev->dev);
> +       writel(event, mgmtdev->dev_virtaddr + HW_EVENTS_CFG_OFFSET);
> +       pm_runtime_mark_last_busy(&mgmtdev->pdev->dev);
> +       pm_runtime_put_autosuspend(&mgmtdev->pdev->dev);
> +out:
> +       return count;
> +}
> +
> +static const struct file_operations qcom_hidma_mgmt_evtena_fops = {
> +       .write = qcom_hidma_mgmt_evtena,
> +};
> +
> +struct fileinfo {
> +       char *name;
> +       int mode;
> +       const struct file_operations *ops;
> +};
> +
> +static struct fileinfo files[] = {
> +       {"info", S_IRUGO, &qcom_hidma_mgmt_fops},
> +       {"err", S_IRUGO,  &qcom_hidma_mgmt_err_fops},
> +       {"mhiderrclr", S_IWUSR, &qcom_hidma_mgmt_mhiderr_clrfops},
> +       {"evterrclr", S_IWUSR, &qcom_hidma_mgmt_evterr_clrfops},
> +       {"ideerrclr", S_IWUSR, &qcom_hidma_mgmt_ideerr_clrfops},
> +       {"odeerrclr", S_IWUSR, &qcom_hidma_mgmt_odeerr_clrfops},
> +       {"msierrclr", S_IWUSR, &qcom_hidma_mgmt_msierr_clrfops},
> +       {"treerrclr", S_IWUSR, &qcom_hidma_mgmt_treerr_clrfops},
> +       {"evtena", S_IWUSR, &qcom_hidma_mgmt_evtena_fops},
> +};
> +
> +static void qcom_hidma_mgmt_debug_uninit(struct qcom_hidma_mgmt_dev *mgmtdev)
> +{
> +       debugfs_remove_recursive(mgmtdev->debugfs);
> +}
> +
> +static int qcom_hidma_mgmt_debug_init(struct qcom_hidma_mgmt_dev *mgmtdev)
> +{
> +       int rc = 0;
> +       u32 i;
> +       struct dentry   *fs_entry;
> +
> +       mgmtdev->debugfs = debugfs_create_dir(dev_name(&mgmtdev->pdev->dev),
> +                                               NULL);
> +       if (!mgmtdev->debugfs) {
> +               rc = -ENODEV;
> +               return rc;
> +       }
> +
> +       for (i = 0; i < ARRAY_SIZE(files); i++) {
> +               fs_entry = debugfs_create_file(files[i].name,
> +                                       files[i].mode, mgmtdev->debugfs,
> +                                       mgmtdev, files[i].ops);
> +               if (!fs_entry) {
> +                       rc = -ENOMEM;
> +                       goto cleanup;
> +               }
> +       }
> +
> +       return 0;
> +cleanup:
> +       qcom_hidma_mgmt_debug_uninit(mgmtdev);
> +       return rc;
> +}
> +#else
> +static void qcom_hidma_mgmt_debug_uninit(struct qcom_hidma_mgmt_dev *mgmtdev)
> +{
> +}
> +static int qcom_hidma_mgmt_debug_init(struct qcom_hidma_mgmt_dev *mgmtdev)
> +{
> +       return 0;
> +}
> +#endif
> +
> +static int qcom_hidma_mgmt_setup(struct qcom_hidma_mgmt_dev *mgmtdev)
> +{
> +       u32 val;
> +       u32 i;
> +
> +       val = readl(mgmtdev->dev_virtaddr + MAX_BUS_REQ_LEN_OFFSET);
> +       val = val &
> +               ~(MAX_BUS_REQ_LEN_MASK << MAX_BUS_WR_REQ_BIT_POS);
> +       val = val |
> +               (mgmtdev->max_write_request << MAX_BUS_WR_REQ_BIT_POS);
> +       val = val & ~(MAX_BUS_REQ_LEN_MASK);
> +       val = val | (mgmtdev->max_read_request);
> +       writel(val, mgmtdev->dev_virtaddr + MAX_BUS_REQ_LEN_OFFSET);
> +
> +       val = readl(mgmtdev->dev_virtaddr + MAX_XACTIONS_OFFSET);
> +       val = val &
> +               ~(MAX_WR_XACTIONS_MASK << MAX_WR_XACTIONS_BIT_POS);
> +       val = val |
> +               (mgmtdev->max_wr_xactions << MAX_WR_XACTIONS_BIT_POS);
> +       val = val & ~(MAX_RD_XACTIONS_MASK);
> +       val = val | (mgmtdev->max_rd_xactions);
> +       writel(val, mgmtdev->dev_virtaddr + MAX_XACTIONS_OFFSET);
> +
> +       mgmtdev->sw_version = readl(mgmtdev->dev_virtaddr + SW_VERSION_OFFSET);
> +
> +       for (i = 0; i < mgmtdev->dma_channels; i++) {
> +               val = readl(mgmtdev->dev_virtaddr + QOS_N_OFFSET + (4 * i));
> +               val = val & ~(1 << PRIORITY_BIT_POS);
> +               val = val |
> +                       ((mgmtdev->priority[i] & 0x1) << PRIORITY_BIT_POS);
> +               val = val & ~(WEIGHT_MASK << WRR_BIT_POS);
> +               val = val
> +                       | ((mgmtdev->weight[i] & WEIGHT_MASK) << WRR_BIT_POS);
> +               writel(val, mgmtdev->dev_virtaddr + QOS_N_OFFSET + (4 * i));
> +       }
> +
> +       val = readl(mgmtdev->dev_virtaddr + CHRESET_TIMEOUT_OFFSET);
> +       val = val & ~CHRESET_TIMEOUUT_MASK;
> +       val = val | (mgmtdev->chreset_timeout & CHRESET_TIMEOUUT_MASK);
> +       writel(val, mgmtdev->dev_virtaddr + CHRESET_TIMEOUT_OFFSET);
> +
> +       val = readl(mgmtdev->dev_virtaddr + CFG_OFFSET);
> +       val = val | 1;
> +       writel(val, mgmtdev->dev_virtaddr + CFG_OFFSET);
> +
> +       return 0;
> +}
> +
> +static int qcom_hidma_mgmt_probe(struct platform_device *pdev)
> +{
> +       struct resource *dma_resource;
> +       int irq;
> +       int rc;
> +       u32 i;
> +       struct qcom_hidma_mgmt_dev *mgmtdev;

Better move this line to the top of definition block.

> +
> +       pm_runtime_set_autosuspend_delay(&pdev->dev, AUTOSUSPEND_TIMEOUT);
> +       pm_runtime_use_autosuspend(&pdev->dev);
> +       pm_runtime_set_active(&pdev->dev);
> +       pm_runtime_enable(&pdev->dev);
> +       dma_resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!dma_resource) {
> +               dev_err(&pdev->dev, "No memory resources found\n");
> +               rc = -ENODEV;
> +               goto out;
> +       }

Consolidate with devm_ioremap_resource()

> +
> +       irq = platform_get_irq(pdev, 0);
> +       if (irq < 0) {
> +               dev_err(&pdev->dev, "irq resources not found\n");
> +               rc = -ENODEV;
> +               goto out;
> +       }
> +
> +       mgmtdev = devm_kzalloc(&pdev->dev, sizeof(*mgmtdev), GFP_KERNEL);
> +       if (!mgmtdev) {
> +               rc = -ENOMEM;
> +               goto out;
> +       }
> +
> +       mgmtdev->pdev = pdev;
> +
> +       pm_runtime_get_sync(&mgmtdev->pdev->dev);
> +       mgmtdev->dev_addrsize = resource_size(dma_resource);
> +       mgmtdev->dev_virtaddr = devm_ioremap_resource(&pdev->dev,
> +                                                       dma_resource);
> +       if (IS_ERR(mgmtdev->dev_virtaddr)) {
> +               dev_err(&pdev->dev, "can't map i/o memory at %pa\n",
> +                       &dma_resource->start);
> +               rc = -ENOMEM;
> +               goto out;
> +       }
> +
> +       if (device_property_read_u32(&pdev->dev, "dma-channels",
> +               &mgmtdev->dma_channels)) {
> +               dev_err(&pdev->dev, "number of channels missing\n");
> +               rc = -EINVAL;
> +               goto out;
> +       }
> +
> +       if (device_property_read_u32(&pdev->dev, "channel-reset-timeout",
> +               &mgmtdev->chreset_timeout)) {
> +               dev_err(&pdev->dev, "channel reset timeout missing\n");
> +               rc = -EINVAL;
> +               goto out;
> +       }
> +
> +       if (device_property_read_u32(&pdev->dev, "max-write-burst-bytes",
> +               &mgmtdev->max_write_request)) {
> +               dev_err(&pdev->dev, "max-write-burst-bytes missing\n");
> +               rc = -EINVAL;
> +               goto out;
> +       }
> +       if ((mgmtdev->max_write_request != 128) &&
> +               (mgmtdev->max_write_request != 256) &&
> +               (mgmtdev->max_write_request != 512) &&
> +               (mgmtdev->max_write_request != 1024)) {

is_power_of_2()  && min/max ?

> +               dev_err(&pdev->dev, "invalid write request %d\n",
> +                       mgmtdev->max_write_request);
> +               rc = -EINVAL;
> +               goto out;
> +       }
> +
> +       if (device_property_read_u32(&pdev->dev, "max-read-burst-bytes",
> +               &mgmtdev->max_read_request)) {
> +               dev_err(&pdev->dev, "max-read-burst-bytes missing\n");
> +               rc = -EINVAL;
> +               goto out;
> +       }
> +
> +       if ((mgmtdev->max_read_request != 128) &&
> +               (mgmtdev->max_read_request != 256) &&
> +               (mgmtdev->max_read_request != 512) &&
> +               (mgmtdev->max_read_request != 1024)) {

Ditto.

> +               dev_err(&pdev->dev, "invalid read request %d\n",
> +                       mgmtdev->max_read_request);
> +               rc = -EINVAL;
> +               goto out;
> +       }
> +
> +       if (device_property_read_u32(&pdev->dev, "max-write-transactions",
> +               &mgmtdev->max_wr_xactions)) {
> +               dev_err(&pdev->dev, "max-write-transactions missing\n");
> +               rc = -EINVAL;
> +               goto out;
> +       }
> +
> +       if (device_property_read_u32(&pdev->dev, "max-read-transactions",
> +               &mgmtdev->max_rd_xactions)) {
> +               dev_err(&pdev->dev, "max-read-transactions missing\n");
> +               rc = -EINVAL;
> +               goto out;
> +       }
> +
> +       mgmtdev->priority = devm_kcalloc(&pdev->dev,
> +               mgmtdev->dma_channels, sizeof(*mgmtdev->priority), GFP_KERNEL);
> +       if (!mgmtdev->priority) {
> +               rc = -ENOMEM;
> +               goto out;
> +       }
> +
> +       mgmtdev->weight = devm_kcalloc(&pdev->dev,
> +               mgmtdev->dma_channels, sizeof(*mgmtdev->weight), GFP_KERNEL);
> +       if (!mgmtdev->weight) {
> +               rc = -ENOMEM;
> +               goto out;
> +       }
> +
> +       if (device_property_read_u32_array(&pdev->dev, "channel-priority",
> +                               mgmtdev->priority, mgmtdev->dma_channels)) {
> +               dev_err(&pdev->dev, "channel-priority missing\n");
> +               rc = -EINVAL;
> +               goto out;
> +       }
> +
> +       if (device_property_read_u32_array(&pdev->dev, "channel-weight",
> +                               mgmtdev->weight, mgmtdev->dma_channels)) {
> +               dev_err(&pdev->dev, "channel-weight missing\n");
> +               rc = -EINVAL;
> +               goto out;
> +       }
> +
> +       for (i = 0; i < mgmtdev->dma_channels; i++) {
> +               if (mgmtdev->weight[i] > 15) {

15 is magic.

> +                       dev_err(&pdev->dev,
> +                               "max value of weight can be 15.\n");
> +                       rc = -EINVAL;
> +                       goto out;
> +               }
> +
> +               /* weight needs to be at least one */
> +               if (mgmtdev->weight[i] == 0)
> +                       mgmtdev->weight[i] = 1;
> +       }
> +
> +       rc = qcom_hidma_mgmt_setup(mgmtdev);
> +       if (rc) {
> +               dev_err(&pdev->dev, "setup failed\n");
> +               goto out;
> +       }
> +
> +       rc = qcom_hidma_mgmt_debug_init(mgmtdev);
> +       if (rc) {
> +               dev_err(&pdev->dev, "debugfs init failed\n");
> +               goto out;
> +       }
> +
> +       dev_info(&pdev->dev,
> +               "HI-DMA engine management driver registration complete\n");

You may put some useful information here, otherwise looks like a debug message.

> +       platform_set_drvdata(pdev, mgmtdev);
> +       pm_runtime_mark_last_busy(&mgmtdev->pdev->dev);
> +       pm_runtime_put_autosuspend(&mgmtdev->pdev->dev);
> +       return 0;
> +out:
> +       pm_runtime_disable(&pdev->dev);
> +       pm_runtime_put_sync_suspend(&pdev->dev);
> +       return rc;
> +}
> +
> +static int qcom_hidma_mgmt_remove(struct platform_device *pdev)
> +{
> +       struct qcom_hidma_mgmt_dev *mgmtdev = platform_get_drvdata(pdev);
> +
> +       pm_runtime_get_sync(&mgmtdev->pdev->dev);
> +       qcom_hidma_mgmt_debug_uninit(mgmtdev);
> +       pm_runtime_put_sync_suspend(&pdev->dev);
> +       pm_runtime_disable(&pdev->dev);
> +
> +       dev_info(&pdev->dev, "HI-DMA engine management driver removed\n");

Useless message.

> +       return 0;
> +}
> +
> +#if IS_ENABLED(CONFIG_ACPI)
> +static const struct acpi_device_id qcom_hidma_mgmt_acpi_ids[] = {
> +       {"QCOM8060"},
> +       {},
> +};
> +#endif
> +
> +static const struct of_device_id qcom_hidma_mgmt_match[] = {
> +       { .compatible = "qcom,hidma-mgmt-1.0", },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, qcom_hidma_mgmt_match);
> +
> +static struct platform_driver qcom_hidma_mgmt_driver = {
> +       .probe = qcom_hidma_mgmt_probe,
> +       .remove = qcom_hidma_mgmt_remove,
> +       .driver = {
> +               .name = "hidma-mgmt",
> +               .of_match_table = qcom_hidma_mgmt_match,
> +               .acpi_match_table = ACPI_PTR(qcom_hidma_mgmt_acpi_ids),
> +       },
> +};
> +module_platform_driver(qcom_hidma_mgmt_driver);
> +MODULE_LICENSE("GPL v2");
> --
> Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/



-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
