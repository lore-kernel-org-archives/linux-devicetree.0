From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v6 3/5] misc: fastrpc: Add support for context Invoke
 method
Date: Fri, 8 Feb 2019 14:55:14 +0100
Message-ID: <20190208135514.GA23406@kroah.com>
References: <20190208132306.12571-1-srinivas.kandagatla@linaro.org>
 <20190208132306.12571-4-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190208132306.12571-4-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: arnd@arndb.de, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, bkumar@qti.qualcomm.com, linux-arm-msm@vger.kernel.org, Thierry Escande <thierry.escande@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 08, 2019 at 01:23:04PM +0000, Srinivas Kandagatla wrote:
> +static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
> +{
> +	struct fastrpc_invoke_args *args = NULL;
> +	struct fastrpc_invoke inv;
> +	u32 nscalars;
> +	int err;
> +
> +	if (copy_from_user(&inv, argp, sizeof(inv)))
> +		return -EFAULT;
> +
> +	nscalars = REMOTE_SCALARS_LENGTH(inv.sc);
> +
> +	if (nscalars > MAX_REMOTE_SCALARS)
> +		return -EINVAL;
> +
> +	if (nscalars) {
> +		args = kcalloc(nscalars, sizeof(*args), GFP_KERNEL);
> +		if (!args)
> +			return -ENOMEM;
> +
> +		if (copy_from_user(args, (void __user *)(uintptr_t)inv.args,
> +				   nscalars * sizeof(*args))) {
> +			kfree(args);
> +			return -EFAULT;
> +		}
> +
> +		/* Make sure reserved field is set to 0 */
> +		if (args->reserved) {
> +			kfree(args);
> +			return -EINVAL;

Am I wrong in that you are only checking the first reserved field in
this array of args?  Don't you have a whole bunch of them here (nscalars
of them)?  Don't you need to check them all and not just the first one?

thanks,

greg k-h
