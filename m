Return-Path: <jic23@kernel.org>
Date: Sun, 8 Sep 2019 13:17:08 +0100
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/2] iio: core: Add optional symbolic label to device
 attributes
Message-ID: <20190908131708.79bfbc60@archlinux>
In-Reply-To: <1566876924-63608-3-git-send-email-preid@electromag.com.au>
References: <1566876924-63608-1-git-send-email-preid@electromag.com.au>
	<1566876924-63608-3-git-send-email-preid@electromag.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Phil Reid <preid@electromag.com.au>
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, michal.simek@xilinx.com
List-ID: <devicetree@vger.kernel.org>

On Tue, 27 Aug 2019 11:35:24 +0800
Phil Reid <preid@electromag.com.au> wrote:

> If a label is defined in the device tree for this device add that
> to the device specific attributes. This is useful for userspace to
> be able to identify an individual device when multiple identical
> chips are present in the system.
> 
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Looks good to me.  I like this as it finally gets us around some
perhaps slightly dubious decisions I made about the name attribute
a long time ago and the bunch of uses that don't actually conform
even to what I had in mind back then.

I'll pick it up for the 5.5 cycle once you've respun to give
more example friendly names in patch 1 and Rob is happy with it.

Thanks,

Jonathan

> ---
>  drivers/iio/industrialio-core.c | 17 +++++++++++++++++
>  include/linux/iio/iio.h         |  1 +
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> index 8303639963d7..2d7fb7629095 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -1300,6 +1300,16 @@ static ssize_t iio_show_dev_name(struct device *dev,
>  
>  static DEVICE_ATTR(name, S_IRUGO, iio_show_dev_name, NULL);
>  
> +static ssize_t iio_show_dev_label(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
> +	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
> +	return snprintf(buf, PAGE_SIZE, "%s\n", indio_dev->label);
> +}
> +
> +static DEVICE_ATTR(label, S_IRUGO, iio_show_dev_label, NULL);
> +
>  static ssize_t iio_show_timestamp_clock(struct device *dev,
>  					struct device_attribute *attr,
>  					char *buf)
> @@ -1416,6 +1426,8 @@ static int iio_device_register_sysfs(struct iio_dev *indio_dev)
>  
>  	if (indio_dev->name)
>  		attrcount++;
> +	if (indio_dev->label)
> +		attrcount++;
>  	if (clk)
>  		attrcount++;
>  
> @@ -1438,6 +1450,8 @@ static int iio_device_register_sysfs(struct iio_dev *indio_dev)
>  		indio_dev->chan_attr_group.attrs[attrn++] = &p->dev_attr.attr;
>  	if (indio_dev->name)
>  		indio_dev->chan_attr_group.attrs[attrn++] = &dev_attr_name.attr;
> +	if (indio_dev->label)
> +		indio_dev->chan_attr_group.attrs[attrn++] = &dev_attr_label.attr;
>  	if (clk)
>  		indio_dev->chan_attr_group.attrs[attrn++] = clk;
>  
> @@ -1709,6 +1723,9 @@ int __iio_device_register(struct iio_dev *indio_dev, struct module *this_mod)
>  	if (!indio_dev->dev.of_node && indio_dev->dev.parent)
>  		indio_dev->dev.of_node = indio_dev->dev.parent->of_node;
>  
> +	indio_dev->label = of_get_property(indio_dev->dev.of_node, "label",
> +					   NULL);
> +
>  	ret = iio_check_unique_scan_index(indio_dev);
>  	if (ret < 0)
>  		return ret;
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index a74cb177dc6f..3f89db50d3f6 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -556,6 +556,7 @@ struct iio_dev {
>  	struct list_head		channel_attr_list;
>  	struct attribute_group		chan_attr_group;
>  	const char			*name;
> +	const char			*label;
>  	const struct iio_info		*info;
>  	clockid_t			clock_id;
>  	struct mutex			info_exist_lock;
