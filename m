From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4 3/5] misc: fastrpc: Add support for context Invoke
 method
Date: Thu, 31 Jan 2019 17:55:17 +0000
Message-ID: <c60cd4ba-af1c-537a-2ee4-b80b61408625@linaro.org>
References: <20190124152412.10503-1-srinivas.kandagatla@linaro.org>
 <20190124152412.10503-4-srinivas.kandagatla@linaro.org>
 <20190131153419.GA18667@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190131153419.GA18667@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: robh+dt@kernel.org, arnd@arndb.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, bkumar@qti.qualcomm.com, linux-arm-msm@vger.kernel.org, thierry.escande@linaro.org
List-Id: devicetree@vger.kernel.org

Thanks for the review,

I will fix them and send new version!

On 31/01/2019 15:34, Greg KH wrote:
> On Thu, Jan 24, 2019 at 03:24:10PM +0000, Srinivas Kandagatla wrote:
>> This patch adds support to compute context invoke method
>> on the remote processor (DSP).
>> This involves setting up the functions input and output arguments,
>> input and output handles and mapping the dmabuf fd for the
>> argument/handle buffers.
>>
> 
> This says _what_ this code does, but not why.  What about all of that
> explaination you had in the 0/5 patch, shouldn't that be here, or on
> patch 2/5?
> 
Yes, I will add more details in to the log.

> Some nits below:
> 
>> +static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
>> +{
>> +	struct fastrpc_invoke_args *args = NULL;
>> +	struct fastrpc_invoke inv;
>> +	u32 nscalars;
>> +	int err;
>> +
>> +	if (copy_from_user(&inv, argp, sizeof(inv)))
>> +		return -EFAULT;
>> +
>> +	nscalars = REMOTE_SCALARS_LENGTH(inv.sc);
>> +	if (nscalars) {
>> +		args = kcalloc(nscalars, sizeof(*args), GFP_KERNEL);
> 
> Yeah, let's not bounds check the input variables and suck up all of the
> kernel memory!
> 
> Remember:
> 	ALL INPUT IS EVIL

I will add more checks here and other such instances in next version....
>> +static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>> +				 unsigned long arg)
>> +{
>> +	struct fastrpc_user *fl = (struct fastrpc_user *)file->private_data;
>> +	char __user *argp = (char __user *)arg;
>> +	int err;
>> +
>> +	switch (cmd) {
>> +	case FASTRPC_IOCTL_INVOKE:
>> +		err = fastrpc_invoke(fl, argp);
>> +		break;
>> +	default:
>> +		err = -ENOTTY;
>> +		dev_err(fl->sctx->dev, "bad ioctl: %d\n", cmd);
> 
> Don't spam the syslog if someone sends you an invalid ioctl.  That's a
> sure way to DoS the system.
will fix this in next version.
> 
>> +		break;
>> +	}
>> +
>> +	if (err)
>> +		dev_dbg(fl->sctx->dev, "Error: IOCTL Failed with %d\n", err);
>> +
>> +	return err;
>> +}
>> +
>>   static const struct file_operations fastrpc_fops = {
>>   	.open = fastrpc_device_open,
>>   	.release = fastrpc_device_release,
>> +	.unlocked_ioctl = fastrpc_device_ioctl,
>> +	.compat_ioctl = fastrpc_device_ioctl,
>>   };
>>   
>>   static int fastrpc_cb_probe(struct platform_device *pdev)
>> @@ -260,9 +932,25 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   	return of_platform_populate(rdev->of_node, NULL, NULL, rdev);
>>   }
>>   
>> +static void fastrpc_notify_users(struct fastrpc_user *user)
>> +{
>> +	struct fastrpc_invoke_ctx *ctx, *n;
>> +
>> +	spin_lock(&user->lock);
>> +	list_for_each_entry_safe(ctx, n, &user->pending, node)
>> +		complete(&ctx->work);
> 
> Why safe?  You aren't deleting the list here.
> 
Not sure why it ended up with safe here, does not make sense unless am 
deleting it.. will fix this in next version.

...>> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
>> new file mode 100644
>> index 000000000000..a69ef33dc37e
>> --- /dev/null
>> +++ b/include/uapi/misc/fastrpc.h
>> @@ -0,0 +1,23 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef __QCOM_FASTRPC_H__
>> +#define __QCOM_FASTRPC_H__
>> +
>> +#include <linux/types.h>
>> +
>> +#define FASTRPC_IOCTL_INVOKE		_IOWR('R', 3, struct fastrpc_invoke)
>> +
>> +struct fastrpc_invoke_args {
>> +	__u64 ptr;
>> +	__u64 length;
>> +	__s32 fd;
>> +	__u32 reserved;
> 
> Are you checking that reserved is all 0 now?

No, I should add the checks!

> 
>> +};
>> +
>> +struct fastrpc_invoke {
>> +	__u32 handle;
>> +	__u32 sc;
>> +	__u64 args;
>> +};
> 
> Do you need packed here?  What about endian issues?
We do not need this packed here, as this is not the actual structure 
that the passed to the DSP.

Thanks,
srini

> 
> thanks,
> 
> greg k-h
> 
