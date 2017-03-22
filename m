From: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Subject: Re: [PATCH v5 2/4] fpga pr ip: Core driver support for Altera Partial
 Reconfiguration IP.
Date: Wed, 22 Mar 2017 09:08:18 -0700 (PDT)
Message-ID: <alpine.DEB.2.20.1703220852030.2728@mgerlach-VirtualBox>
References: <1489174827-6033-1-git-send-email-matthew.gerlach@linux.intel.com>        <1489174827-6033-3-git-send-email-matthew.gerlach@linux.intel.com> <20170321220437.1fa7efaa@crub>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170321220437.1fa7efaa@crub>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Cc: atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Tue, 21 Mar 2017, Anatolij Gustschin wrote:

> Hi Matthew,

Hi Anatolij,

>
> On Fri, 10 Mar 2017 11:40:25 -0800
> matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:
> ...
>> +int alt_pr_unregister(struct device *dev)
>> +{
>> +	dev_dbg(dev, "%s\n", __func__);
>> +
>> +	fpga_mgr_unregister(dev);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(alt_pr_unregister);
>
> Can we also add a function for registering a PCIe device with
> PR IP here? Something like:

If we have an alt_pr_pcie_register function, we will need the 
corresponding alt_pr_pcie_unregister function.  Both of these functions 
should go into their own file like alt_pr_platform_probe() and 
alt_pr_platform_remove().

>
> /**
> * alt_pr_pcie_register - register PCIe device with PR-IP core
> * @pci_dev:    PCI device with PR-IP
> * @bar:        PR-IP BAR number
> * @pr_offset:  offset of the PR-IP core registers
> *
> * Return: 0 on success, negative error code otherwise.
> *
> * To unregister the PCIe device, use alt_pr_unregister(&pdev->dev).
> */
> int alt_pr_pcie_register(struct pci_dev *pdev, int bar, int pr_offset)
> {
>        void __iomem *base;
>        int ret;
>
>        if (!pci_is_enabled(pdev)) {
>                ret = pci_enable_device(pdev);
>                if (ret < 0) {
>                        dev_err(&pdev->dev, "can't enable device: %d\n", ret);
>                        return ret;
>                }
>        }
>
>        base = devm_ioremap_resource(&pdev->dev, &pdev->resource[bar]);

Does this remap the whole bar?  If it does, what happens if other 
components are also connected to the bar?  How do those corresponding 
drivers get access to the mapped memory?


>        if (IS_ERR(base)) {
>                dev_warn(&pdev->dev, "mapping PR-IP BAR failed\n");
>                return -ENOMEM;
>        }
>
>        return alt_pr_register(&pdev->dev, base + pr_offset);
> }
> EXPORT_SYMBOL_GPL(alt_pr_pcie_register);
>
> Thanks,
> Anatolij
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fpga" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
