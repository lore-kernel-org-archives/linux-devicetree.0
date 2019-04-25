From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCHv1 4/6] firmware: add Intel Stratix10 remote system update
 driver
Date: Thu, 25 Apr 2019 22:30:46 +0200
Message-ID: <20190425203046.GE22307@kroah.com>
References: <1554835562-25056-1-git-send-email-richard.gong@linux.intel.com>
 <1554835562-25056-5-git-send-email-richard.gong@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554835562-25056-5-git-send-email-richard.gong@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.gong@linux.intel.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 09, 2019 at 01:46:00PM -0500, richard.gong@linux.intel.com wrote:
> +/*
> + * This driver exposes some optional features of the Intel Stratix 10 SoC FPGA.
> + * The SysFS interfaces exposed here are FPGA Remote System Update (RSU)

It has never been "SysFS", it has always been "sysfs".

> + * related.  They allow user space software to query the configuration system
> + * status and to request optional reboot behavior specific to Intel FPGAs.
> + */
> +
> +static ssize_t current_image_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct stratix10_rsu_priv *priv = dev_get_drvdata(dev);
> +
> +	if (!priv)
> +		return -ENODEV;
> +
> +	return scnprintf(buf, PAGE_SIZE, "%ld", priv->status.current_image);

While it is all nice and fine to try to be "safe" and use scnprintf() it
turns out that if you EVER care about the size of a sysfs buffer, your
code is doing something wrong.  This can just be a simple sprintf()
call.

Same goes for everywhere in this file.

thanks,

greg k-h
