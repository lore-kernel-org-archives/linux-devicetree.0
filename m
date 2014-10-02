From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 2/4] pmbus: core: add helpers for byte write and read
 modify write
Date: Wed, 01 Oct 2014 21:05:49 -0700
Message-ID: <542CCF1D.5090609@roeck-us.net>
References: <1412190349-16343-1-git-send-email-atull@opensource.altera.com> <1412190349-16343-3-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412190349-16343-3-git-send-email-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, jdelvare-l3A5Bk7waGM@public.gmane.org
Cc: lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/01/2014 12:05 PM, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>
> Add two helper functions:
>   * pmbus_write_byte_data  = paged byte write
>   * pmbus_update_byte_data = paged byte read/modify/write
>
> Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
>   drivers/hwmon/pmbus/pmbus_core.c |   31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 291d11f..d6c3701 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -253,6 +253,37 @@ int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg)
>   }
>   EXPORT_SYMBOL_GPL(pmbus_read_byte_data);
>
> +int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
> +{
> +	int rv;
> +
> +	rv = pmbus_set_page(client, page);
> +	if (rv < 0)
> +		return rv;
> +
> +	return i2c_smbus_write_byte_data(client, reg, value);
> +}
> +EXPORT_SYMBOL_GPL(pmbus_write_byte_data);
> +
> +int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
> +			   u8 mask, u8 value)
> +{
> +	unsigned int tmp;
> +	int rv;
> +
> +	rv = pmbus_read_byte_data(client, page, reg);
> +	if (rv < 0)
> +		return rv;
> +
> +	tmp = (rv & ~mask) | (value & mask);
> +
> +	if (tmp != rv)
> +		rv = pmbus_write_byte_data(client, page, reg, tmp);
> +
> +	return rv;
> +}
> +EXPORT_SYMBOL_GPL(pmbus_update_byte_data);
> +
>   /*
>    * _pmbus_read_byte_data() is similar to pmbus_read_byte_data(), but checks if
>    * a device specific mapping function exists and calls it if necessary.
>

Results in:

drivers/hwmon/pmbus/pmbus_core.c:259:5: warning: symbol 'pmbus_write_byte_data' was not declared. Should it be static?
drivers/hwmon/pmbus/pmbus_core.c:271:5: warning: symbol 'pmbus_update_byte_data' was not declared. Should it be static?
drivers/hwmon/pmbus/pmbus_core.c:259:5: warning: no previous prototype for 'pmbus_write_byte_data' [-Wmissing-prototypes]
drivers/hwmon/pmbus/pmbus_core.c:271:5: warning: no previous prototype for 'pmbus_update_byte_data' [-Wmissing-prototypes]

No need to resubmit. I added a patch to un-export the functions
and merged patch 2 and 3 together in order to avoid a warning
after patch 2. We can always export the new helper functions
later if needed.

Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
