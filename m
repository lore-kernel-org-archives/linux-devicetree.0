From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/2] hwmon: (brcmstb) Add driver for Broadcom STB DPFE
Date: Tue, 18 Apr 2017 13:58:39 -0700
Message-ID: <20170418205839.GA3554@roeck-us.net>
References: <20170418201702.57019-1-code@mmayer.net>
 <20170418201702.57019-3-code@mmayer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-hwmon-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170418201702.57019-3-code@mmayer.net>
Sender: linux-hwmon-owner@vger.kernel.org
To: Markus Mayer <code@mmayer.net>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Markus Mayer <mmayer@broadcom.com>, Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, Linux HWMON List <linux-hwmon@vger.kernel.org>, Device Tree List <devicetree@vger.kernel.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Markus,

On Tue, Apr 18, 2017 at 01:17:02PM -0700, Markus Mayer wrote:
> From: Markus Mayer <mmayer@broadcom.com>
> 
> This driver allows access to DRAM properties, such as the refresh rate,
> via the Broadcom STB DDR PHY Front End (DPFE). The refresh rate can be
> used as indirect indicator of the DRAM temperature.
> 
> The driver also allows setting of the sampling interval.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
[ ... ]

> +
> +static SENSOR_DEVICE_ATTR(dpfe_info, 0444, show_info, NULL, 1000);
> +static SENSOR_DEVICE_ATTR(dpfe_refresh, 0644, show_refresh, store_refresh,
> +			  1000);
> +static SENSOR_DEVICE_ATTR(dpfe_vendor, 0444, show_vendor, NULL, 1000);
> +static struct attribute *dpfe_attrs[] = {
> +	&sensor_dev_attr_dpfe_info.dev_attr.attr,
> +	&sensor_dev_attr_dpfe_refresh.dev_attr.attr,
> +	&sensor_dev_attr_dpfe_vendor.dev_attr.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(dpfe);
> +

There is not a single standard hwmon attribute. I don't know how
to classify this driver, and where it should reside, but it is not
a hwmon driver. 

Thanks,
Guenter
