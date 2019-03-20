Return-Path: <SRS0=FcdI=RX=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 20 Mar 2019 10:38:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/3] hwmon: Add convience macro to define simple static
 sensors
Message-ID: <20190320173849.GA17363@roeck-us.net>
References: <20190320145818.30644-1-ckeepax@opensource.cirrus.com>
 <20190320145818.30644-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190320145818.30644-2-ckeepax@opensource.cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-hwmon@vger.kernel.org, corbet@lwn.net, devicetree@vger.kernel.org, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 20, 2019 at 02:58:17PM +0000, Charles Keepax wrote:
> It takes a fair amount of boiler plate code to add new sensors, add a
> macro that can be used to specify simple static sensors.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Great idea!

Applied to hwmon-next; no need to resend.

Thanks,
Guenter

> ---
>  include/linux/hwmon.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index 99e0c1b0b5fb3..7a8cc06a0d61d 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
> @@ -365,6 +365,14 @@ struct hwmon_channel_info {
>  	const u32 *config;
>  };
>  
> +#define HWMON_CHANNEL_INFO(stype, ...)	\
> +	(&(struct hwmon_channel_info) {	\
> +		.type = hwmon_##stype,	\
> +		.config = (u32 []) {	\
> +			__VA_ARGS__, 0	\
> +		}			\
> +	})
> +
>  /**
>   * Chip configuration
>   * @ops:	Pointer to hwmon operations.
> -- 
> 2.11.0
> 
