From: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/2] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Mon, 2 Nov 2015 23:45:17 -0500
Message-ID: <56383BDD.9090903@codeaurora.org>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
 <4548985.gMZJhM3R1p@wuerfel> <56346502.5070600@codeaurora.org>
 <9016417.z9Hz6MbmvQ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9016417.z9Hz6MbmvQ@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 11/2/2015 4:30 PM, Arnd Bergmann wrote:
> On Saturday 31 October 2015 02:51:46 Sinan Kaya wrote:
>> On 10/30/2015 5:34 AM, Arnd Bergmann wrote:
>>> On Thursday 29 October 2015 23:08:12 Sinan Kaya wrote:
>>>> diff --git a/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
>>>> +
>>>> +static int qcom_hidma_mgmt_err_open(struct inode *inode, struct file *file)
>>>> +{
>>>> +	return single_open(file, qcom_hidma_mgmt_err, inode->i_private);
>>>> +}
>>>> +
>>>> +static const struct file_operations qcom_hidma_mgmt_err_fops = {
>>>> +	.open = qcom_hidma_mgmt_err_open,
>>>> +	.read = seq_read,
>>>> +	.llseek = seq_lseek,
>>>> +	.release = single_release,
>>>> +};
>>>> +
>>>> +static ssize_t qcom_hidma_mgmt_mhiderr_clr(struct file *file,
>>>> +	const char __user *user_buf, size_t count, loff_t *ppos)
>>>> +{
>>>> +	struct qcom_hidma_mgmt_dev *mgmtdev = file->f_inode->i_private;
>>>> +
>>>> +	HIDMA_RUNTIME_GET(mgmtdev);
>>>> +	writel(1, mgmtdev->dev_virtaddr + MHID_BUS_ERR_CLR_OFFSET);
>>>> +	HIDMA_RUNTIME_SET(mgmtdev);
>>>> +	return count;
>>>> +}
>>>> +
>>>> +static const struct file_operations qcom_hidma_mgmt_mhiderr_clrfops = {
>>>> +	.write = qcom_hidma_mgmt_mhiderr_clr,
>>>> +};
>>>
>>> Is this really just a debugging interface? If anyone would do this
>>> for normal operation, it needs to be a proper API.
>>>
>> This will be used by the system admin to monitor/reset the execution
>> state of the DMA channels. This will be the management interface.
>> Debugfs is probably not the right choice. I originally had sysfs but
>> than had some doubts. I'm open to suggestions.
>
> User interface design is unfortunately always hard, and I don't have
> an obvious answer for you.
>
> Using debugfs by definition means that you don't expect users to
> rely on ABI stability, so they should not write any automated scripts
> against the contents of the files.
>
> With sysfs, the opposite is true: you need to maintain compatibility
> for as long as anyone might rely on the current interface, and it
> needs to be reviewed properly and documented in Documentation/ABI/.
>
> Other options are to use ioctl(), netlink or your own virtual file
> system, but each of them has the same ABI requirements as sysfs.
>
> Regardless of what you pick, you also need to consider how other drivers
> would use the same interface: If someone else has hardware that does
> the same thing, we want to be able to use the same tools to access
> it, so you should avoid having any hardware specific data in it and
> keep it as generic and extensible as possible. In this particular
> case, that probably means you should implement the user interfaces in
> the dmaengine core driver, and let the specific DMA driver provide
> callback function pointers along with the normal ones to fill that
> data.
>
Thanks, I'll think about this. I'm inclined towards sysfs.

>>>> +	dev_info(&pdev->dev,
>>>> +		"HI-DMA engine management driver registration complete\n");
>>>> +	platform_set_drvdata(pdev, mgmtdev);
>>>> +	HIDMA_RUNTIME_SET(mgmtdev);
>>>> +	return 0;
>>>> +out:
>>>> +	pm_runtime_disable(&pdev->dev);
>>>> +	pm_runtime_put_sync_suspend(&pdev->dev);
>>>> +	return rc;
>>>> +}
>>>
>>> The rest of the probe function does not register any user interface aside from
>>> the debugging stuff. Can you explain in the changelog how you expect the
>>> driver to be used in a real system? Is there another driver coming?
>>
>> I expect this driver to grow in functionality over time. Right now, it
>> does the global init for the DMA. After that all channels execute on
>> their own without depending on each other. Global init has to be done
>> first before attempting to do any channel initialization.
>>
>> There is also implied startup ordering requirements. I was doing this by
>> using channel driver with the late binding to guarantee that.
>>
>> As soon as I use module_platform_driver, the ordering gets reversed for
>> some reason.
>
> For the ordering requirements, it's probably best to export a symbol
> with the entry point and let the normal driver call into that. Using
> separate initcall levels is not something you should do in a normal
> device driver like this.
>
I figured this out. If the channel driver starts before the management 
driver; then channel reset fails. I'm handling this in the channel 
driver and am returning -EPROBE_DEFER. After that, management driver 
gets its chance to work. Then, the channel driver again. This change is 
in the v2 series.

> What is the relation between the device nodes for the two kinds of
> devices? Does it make sense to model the other one as a child device
> of this one? That way you would trivially do the ordering by not marking
> this one as 'compatible="simple-bus"' and triggering the registration
> of the child from the parent probe function.
>

The required order is management driver first, channel drivers next. If 
the order is reversed, channel init fails. I handle this with deferred 
probing.

I tried to keep loose binding between the management driver due to QEMU.

QEMU auto-generates the devicetree entries. The guest machine just sees 
one devicetree object for the DMA channel but guest machine device-tree 
kernel does not have any management driver entity.

This requires DMA channel driver to work independently in the guest 
machine without dependencies.

> 	Arnd
>

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
