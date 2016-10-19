From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH] mcp3021: rework for DT support of reference-voltage
Date: Tue, 18 Oct 2016 18:24:42 -0700
Message-ID: <20161019012442.GA30552@roeck-us.net>
References: <20161018224444.11225-1-clemens.gruber@pqgruber.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161018224444.11225-1-clemens.gruber-lZxf/j91sTNWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Clemens Gruber <clemens.gruber-lZxf/j91sTNWk0Htik3J/w@public.gmane.org>
Cc: linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 19, 2016 at 12:44:44AM +0200, Clemens Gruber wrote:
> Support setting the reference voltage in the device tree.
> Rework of driver structure, put chip specific data in a separate
> structure and assign it depending on device id from platform data or
> DT match.
> Extend the device documentation and add new documentation for the
> devicetree bindings.
> Also change S_IRUGO to the better readable 0444, which fixes a
> checkpatch warning.
> 
> Signed-off-by: Clemens Gruber <clemens.gruber-lZxf/j91sTNWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/hwmon/mcp3021.txt          |  21 +++

This needs to be a separate patch.

...

> +static int mcp3021_probe(struct i2c_client *client,
> +	const struct i2c_device_id *id);
> +static int mcp3021_remove(struct i2c_client *client);
>  

We are trying hard to get rid of functions declarations like this.
Adding it means that the code is rearranged for no good reason.
Please limit the changes to nececessary changes, and please refrain
from rearranging it and from introducing your personal style.

> -enum chips {
> +enum {

Another indication that you are making changes for no good reason.
You may not like named enums, others do. That doesn't mean you can
change the code to your liking. Please don't do that.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
