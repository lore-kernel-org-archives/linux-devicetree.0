From: Rob Herring <robherring2@gmail.com>
Subject: Re: [RFC 2/2] usb: gadget: composite: parse dt overrides
Date: Mon, 25 Jun 2012 18:49:31 -0500
Message-ID: <4FE8F90B.2010303@gmail.com>
References: <1340655832-30447-1-git-send-email-aletes.xgr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1340655832-30447-1-git-send-email-aletes.xgr@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Cc: Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 06/25/2012 03:23 PM, Alexandre Pereira da Silva wrote:
> Grab the devicetree node properties to override VendorId, ProductId,
> bcdDevice, Manucacturer, Product and SerialNumber
> 
> Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
> ---
>  drivers/usb/gadget/composite.c |   31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Are these bindings documented? I think they should be less generic.
Perhaps prefixed with 'usb-'.

> 
> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> index 390749b..f3b480e 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -17,6 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/device.h>
>  #include <linux/utsname.h>
> +#include <linux/of.h>
>  
>  #include <linux/usb/composite.h>
>  #include <asm/unaligned.h>
> @@ -1423,6 +1424,7 @@ static int composite_bind(struct usb_gadget *gadget)
>  {
>  	struct usb_composite_dev	*cdev;
>  	int				status = -ENOMEM;
> +	struct device_node		*np = gadget->dev.of_node;
>  
>  	cdev = kzalloc(sizeof *cdev, GFP_KERNEL);
>  	if (!cdev)
> @@ -1470,6 +1472,35 @@ static int composite_bind(struct usb_gadget *gadget)
>  
>  	cdev->desc = *composite->dev;
>  
> +	/* grab overrides from devicetree */

Reading the code, it looks more like the DT entries are defaults rather
than overrides.

> +	if (np) {
> +		u32 reg;
> +
> +		if (!idVendor &&
> +			of_property_read_u32(np, "vendor_id", &reg) == 0)
> +			idVendor = reg;

if (!idVendor)
	of_property_read_u32(np, "vendor_id", &idVendor);

Rob

> +
> +		if (!idProduct &&
> +			of_property_read_u32(np, "product_id", &reg) == 0)
> +			idProduct = reg;
> +
> +		if (!bcdDevice &&
> +			of_property_read_u32(np, "bcd_device", &reg) == 0)
> +			bcdDevice = reg;
> +
> +		if (!iManufacturer)
> +			of_property_read_string(np, "manufacturer",
> +				&iManufacturer);
> +
> +		if (!iProduct)
> +			of_property_read_string(np, "product",
> +				&iProduct);
> +
> +		if (!iSerialNumber)
> +			of_property_read_string(np, "serial_number",
> +				&iSerialNumber);
> +	}
> +
>  	/* standardized runtime overrides for device ID data */
>  	if (idVendor)
>  		cdev->desc.idVendor = cpu_to_le16(idVendor);
