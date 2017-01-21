From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH linux v3 3/6] hwmon: occ: Add I2C transport implementation
 for SCOM operations
Date: Sat, 21 Jan 2017 10:11:21 -0800
Message-ID: <b47e5359-5587-cc89-43e2-379eb9e95fc8@roeck-us.net>
References: <1484601219-30196-1-git-send-email-eajames.ibm@gmail.com>
 <1484601219-30196-4-git-send-email-eajames.ibm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484601219-30196-4-git-send-email-eajames.ibm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: eajames.ibm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/16/2017 01:13 PM, eajames.ibm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
>
> Add functions to send SCOM operations over I2C bus. The BMC can
> communicate with the Power8 host processor over I2C, but needs to use SCOM
> operations in order to access the OCC register space.
>
> Signed-off-by: Edward A. James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> ---
>  drivers/hwmon/occ/occ_scom_i2c.c | 72 ++++++++++++++++++++++++++++++++++++++++
>  drivers/hwmon/occ/occ_scom_i2c.h | 26 +++++++++++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
>  create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h
>
> diff --git a/drivers/hwmon/occ/occ_scom_i2c.c b/drivers/hwmon/occ/occ_scom_i2c.c
> new file mode 100644
> index 0000000..8b4ca13
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_scom_i2c.c
> @@ -0,0 +1,72 @@
> +/*
> + * occ_scom_i2c.c - hwmon OCC driver
> + *
> + * This file contains the functions for performing SCOM operations over I2C bus
> + * to access the OCC.
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "occ_scom_i2c.h"
> +#include "scom.h"
> +
> +int occ_i2c_getscom(void *bus, u32 address, u64 *data)
> +{
> +	ssize_t rc;
> +	u64 buf;
> +	struct i2c_client *client = bus;
> +
> +	rc = i2c_master_send(client, (const char *)&address, sizeof(u32));
> +	if (rc < 0)
> +		return rc;
> +	else if (rc != sizeof(u32))
> +		return -EIO;
> +
> +	rc = i2c_master_recv(client, (char *)&buf, sizeof(u64));
> +	if (rc < 0)
> +		return rc;
> +	else if (rc != sizeof(u64))
> +		return -EIO;
> +
> +	*data = be64_to_cpu(buf);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(occ_i2c_getscom);
> +
> +int occ_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1)
> +{
> +	u32 buf[3];
> +	ssize_t rc;
> +	struct i2c_client *client = bus;
> +
> +	buf[0] = address;
> +	buf[1] = data1;
> +	buf[2] = data0;
> +

Receive data is converted from be64 to host byte order, transmit data is sent as-is.
Yet, if I recall correctly, some of the calling code passes in constants. Are you sure
this works on both little and big endian systems ?

> +	rc = i2c_master_send(client, (const char *)buf, sizeof(u32) * 3);
> +	if (rc < 0)
> +		return rc;
> +	else if (rc != sizeof(u32) * 3)
> +		return -EIO;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(occ_i2c_putscom);
> +
> +MODULE_AUTHOR("Eddie James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>");
> +MODULE_DESCRIPTION("I2C OCC SCOM transport");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/occ/occ_scom_i2c.h b/drivers/hwmon/occ/occ_scom_i2c.h
> new file mode 100644
> index 0000000..945739c
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_scom_i2c.h
> @@ -0,0 +1,26 @@
> +/*
> + * occ_scom_i2c.h - hwmon OCC driver
> + *
> + * This file contains function protoypes for peforming SCOM operations over I2C
> + * bus to access the OCC.
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __OCC_SCOM_I2C_H__
> +#define __OCC_SCOM_I2C_H__
> +
> +int occ_i2c_getscom(void *bus, u32 address, u64 *data);
> +int occ_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1);
> +
> +#endif /* __OCC_SCOM_I2C_H__ */
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
