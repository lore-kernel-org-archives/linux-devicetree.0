From: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Subject: Re: [PATCH v5 2/4] fpga pr ip: Core driver support for Altera Partial
 Reconfiguration IP.
Date: Mon, 20 Mar 2017 16:49:32 -0700 (PDT)
Message-ID: <alpine.DEB.2.20.1703201644110.2531@mgerlach-VirtualBox>
References: <1489174827-6033-1-git-send-email-matthew.gerlach@linux.intel.com> <1489174827-6033-3-git-send-email-matthew.gerlach@linux.intel.com> <20170318195356.19269415@crub>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170318195356.19269415@crub>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Cc: atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Sat, 18 Mar 2017, Anatolij Gustschin wrote:

> Hi Matthew,
>

Hi Anatolij,

More good feedback.  See below.


> thanks for the patches. Please see some comments below.
>
> On Fri, 10 Mar 2017 11:40:25 -0800
> matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:
>
> ...
>> +	if (!(info->flags & FPGA_MGR_PARTIAL_RECONFIG)) {
>> +		pr_err("%s Partial Reconfiguration flag not set\n", __func__);
>
> please use dev_err() here.
>
> ...
>> +	if (val & ALT_PR_CSR_PR_START) {
>> +		pr_err("%s Partial Reconfiguration already started\n",
>
> dev_err(), too.

Good catch on both of these pr_err().  dev_err() would be better.
>
> ...
>> +static int alt_pr_fpga_write_complete(struct fpga_manager *mgr,
>> +				      struct fpga_image_info *info)
>> +{
>> +	u32 i;
>> +
>> +	for (i = 0; i < info->config_complete_timeout_us; i++) {
>> +		switch (alt_pr_fpga_state(mgr)) {
>> +		case FPGA_MGR_STATE_WRITE_ERR:
>> +			return -EIO;
>> +
>> +		case FPGA_MGR_STATE_OPERATING:
>> +			dev_info(&mgr->dev,
>> +				 "successful partial reconfiguration\n");
>> +			return 0;
>> +
>> +		default:
>> +			break;
>> +		}
>> +		udelay(1);
>> +	}
>> +	dev_err(&mgr->dev, "timed out waiting for write to complete\n");
>> +	return -ETIMEDOUT;
>> +}
>
> we will always get timed out error if info->config_complete_timeout_us
> is zero. Can we change to
> 	u32 i = 0;
> 	...
> 	do {
> 		...
> 	} while (info->config_complete_timeout_us > i++);
> ?

This seems more than reasonable to me.

>
> ...
>> diff --git a/drivers/fpga/altera-pr-ip-core.h b/drivers/fpga/altera-pr-ip-core.h
>> new file mode 100644
>> index 0000000..3810a90
>> --- /dev/null
>> +++ b/drivers/fpga/altera-pr-ip-core.h
>
> Should we move this header to include/linux/? We can use register/
> unregister functions in other drivers (PCIe) outside drivers/fpga
> then.
>
> Thanks,
>
> Anatolij
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
