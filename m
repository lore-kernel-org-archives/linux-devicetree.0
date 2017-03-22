From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH v5 2/4] fpga pr ip: Core driver support for Altera
 Partial Reconfiguration IP.
Date: Wed, 22 Mar 2017 17:39:16 +0100
Message-ID: <20170322173916.6c55b259@crub>
References: <1489174827-6033-1-git-send-email-matthew.gerlach@linux.intel.com>
        <1489174827-6033-3-git-send-email-matthew.gerlach@linux.intel.com>
        <20170321220437.1fa7efaa@crub>
        <alpine.DEB.2.20.1703220852030.2728@mgerlach-VirtualBox>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1703220852030.2728@mgerlach-VirtualBox>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.gerlach@linux.intel.com
Cc: atull@kernel.org, moritz.fischer@ettus.com, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

Hi Matthew,

On Wed, 22 Mar 2017 09:08:18 -0700 (PDT)
matthew.gerlach@linux.intel.com matthew.gerlach@linux.intel.com wrote:
...
>> Can we also add a function for registering a PCIe device with
>> PR IP here? Something like:  
>
>If we have an alt_pr_pcie_register function, we will need the 
>corresponding alt_pr_pcie_unregister function.  Both of these functions 
>should go into their own file like alt_pr_platform_probe() and 
>alt_pr_platform_remove().

Okay, thanks.

>> /**
>> * alt_pr_pcie_register - register PCIe device with PR-IP core
>> * @pci_dev:    PCI device with PR-IP
>> * @bar:        PR-IP BAR number
>> * @pr_offset:  offset of the PR-IP core registers
>> *
>> * Return: 0 on success, negative error code otherwise.
>> *
>> * To unregister the PCIe device, use alt_pr_unregister(&pdev->dev).
>> */
>> int alt_pr_pcie_register(struct pci_dev *pdev, int bar, int pr_offset)
>> {
>>        void __iomem *base;
>>        int ret;
>>
>>        if (!pci_is_enabled(pdev)) {
>>                ret = pci_enable_device(pdev);
>>                if (ret < 0) {
>>                        dev_err(&pdev->dev, "can't enable device: %d\n", ret);
>>                        return ret;
>>                }
>>        }
>>
>>        base = devm_ioremap_resource(&pdev->dev, &pdev->resource[bar]);  
>
>Does this remap the whole bar?  If it does, what happens if other 
>components are also connected to the bar?  How do those corresponding 
>drivers get access to the mapped memory?

yes, it remaps the whole bar. I do not know the details of the PR IP,
my assumption was that PR IP it is only one component in the bar.
Then I could use devm_ioremap() instead. Thanks for the hint!

Anatolij
