From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 1/3] iio: add IIO_MASSCONCENTRATION channel type
Date: Sun, 16 Dec 2018 13:15:59 +0000
Message-ID: <20181216131559.42367e5a@archlinux>
References: <20181214182803.9006-1-tduszyns@gmail.com>
        <20181214182803.9006-2-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181214182803.9006-2-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Duszynski <tduszyns@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, a.brauchli@elementarea.net
List-Id: devicetree@vger.kernel.org

On Fri, 14 Dec 2018 19:28:01 +0100
Tomasz Duszynski <tduszyns@gmail.com> wrote:

> Measuring particulate matter in ug / m3 (micro-grams per cubic meter)
> is de facto standard. Existing air quality sensors usually follow
> this convention and are capable of returning measurements using
> this unit.
> 
> IIO currently does not offer suitable channel type for this
> type of measurements hence this patch adds this.
> 
> In addition, extra modifiers are introduced used for distinguishing
> between fine pm1, pm2p5 and coarse pm4, pm10 particle measurements, i.e
> IIO_MOD_PM1, IIO_MOD_PM25 and IIO_MOD_PM4, IIO_MOD_PM10.
> 
> pmX consists of particles with aerodynamic diameter less or equal to
> X micrometers.
> 
> Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
Applied, with Matt's Ack that cross with this.

Thanks,

Jonathan
> ---
>  Documentation/ABI/testing/sysfs-bus-iio | 17 ++++++++++++++++-
>  drivers/iio/industrialio-core.c         |  5 +++++
>  include/uapi/linux/iio/types.h          |  5 +++++
>  tools/iio/iio_event_monitor.c           | 10 ++++++++++
>  4 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
> index 8127a08e366d..67fd88bf7910 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio
> +++ b/Documentation/ABI/testing/sysfs-bus-iio
> @@ -1684,4 +1684,19 @@ KernelVersion:	4.18
>  Contact:	linux-iio@vger.kernel.org
>  Description:
>  		Raw (unscaled) phase difference reading from channel Y
> -		that can be processed to radians.
> \ No newline at end of file
> +		that can be processed to radians.
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_massconcentration_pm1_input
> +What:		/sys/bus/iio/devices/iio:deviceX/in_massconcentrationY_pm1_input
> +What:		/sys/bus/iio/devices/iio:deviceX/in_massconcentration_pm2p5_input
> +What:		/sys/bus/iio/devices/iio:deviceX/in_massconcentrationY_pm2p5_input
> +What:		/sys/bus/iio/devices/iio:deviceX/in_massconcentration_pm4_input
> +What:		/sys/bus/iio/devices/iio:deviceX/in_massconcentrationY_pm4_input
> +What:		/sys/bus/iio/devices/iio:deviceX/in_massconcentration_pm10_input
> +What:		/sys/bus/iio/devices/iio:deviceX/in_massconcentrationY_pm10_input
> +KernelVersion:	4.22
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		Mass concentration reading of particulate matter in ug / m3.
> +		pmX consists of particles with aerodynamic diameter less or
> +		equal to X micrometers.
> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> index 4f5cd9f60870..4700fd5d8c90 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -87,6 +87,7 @@ static const char * const iio_chan_type_name_spec[] = {
>  	[IIO_GRAVITY]  = "gravity",
>  	[IIO_POSITIONRELATIVE]  = "positionrelative",
>  	[IIO_PHASE] = "phase",
> +	[IIO_MASSCONCENTRATION] = "massconcentration",
>  };
>  
>  static const char * const iio_modifier_names[] = {
> @@ -127,6 +128,10 @@ static const char * const iio_modifier_names[] = {
>  	[IIO_MOD_Q] = "q",
>  	[IIO_MOD_CO2] = "co2",
>  	[IIO_MOD_VOC] = "voc",
> +	[IIO_MOD_PM1] = "pm1",
> +	[IIO_MOD_PM2P5] = "pm2p5",
> +	[IIO_MOD_PM4] = "pm4",
> +	[IIO_MOD_PM10] = "pm10",
>  };
>  
>  /* relies on pairs of these shared then separate */
> diff --git a/include/uapi/linux/iio/types.h b/include/uapi/linux/iio/types.h
> index 92baabc103ac..c59adac24b1c 100644
> --- a/include/uapi/linux/iio/types.h
> +++ b/include/uapi/linux/iio/types.h
> @@ -46,6 +46,7 @@ enum iio_chan_type {
>  	IIO_GRAVITY,
>  	IIO_POSITIONRELATIVE,
>  	IIO_PHASE,
> +	IIO_MASSCONCENTRATION,
>  };
>  
>  enum iio_modifier {
> @@ -87,6 +88,10 @@ enum iio_modifier {
>  	IIO_MOD_VOC,
>  	IIO_MOD_LIGHT_UV,
>  	IIO_MOD_LIGHT_DUV,
> +	IIO_MOD_PM1,
> +	IIO_MOD_PM2P5,
> +	IIO_MOD_PM4,
> +	IIO_MOD_PM10,
>  };
>  
>  enum iio_event_type {
> diff --git a/tools/iio/iio_event_monitor.c b/tools/iio/iio_event_monitor.c
> index ac2de6b7e89f..f6b8003fbe3c 100644
> --- a/tools/iio/iio_event_monitor.c
> +++ b/tools/iio/iio_event_monitor.c
> @@ -60,6 +60,7 @@ static const char * const iio_chan_type_name_spec[] = {
>  	[IIO_GRAVITY] = "gravity",
>  	[IIO_POSITIONRELATIVE] = "positionrelative",
>  	[IIO_PHASE] = "phase",
> +	[IIO_MASSCONCENTRATION] = "massconcentration",
>  };
>  
>  static const char * const iio_ev_type_text[] = {
> @@ -115,6 +116,10 @@ static const char * const iio_modifier_names[] = {
>  	[IIO_MOD_Q] = "q",
>  	[IIO_MOD_CO2] = "co2",
>  	[IIO_MOD_VOC] = "voc",
> +	[IIO_MOD_PM1] = "pm1",
> +	[IIO_MOD_PM2P5] = "pm2p5",
> +	[IIO_MOD_PM4] = "pm4",
> +	[IIO_MOD_PM10] = "pm10",
>  };
>  
>  static bool event_is_known(struct iio_event_data *event)
> @@ -156,6 +161,7 @@ static bool event_is_known(struct iio_event_data *event)
>  	case IIO_GRAVITY:
>  	case IIO_POSITIONRELATIVE:
>  	case IIO_PHASE:
> +	case IIO_MASSCONCENTRATION:
>  		break;
>  	default:
>  		return false;
> @@ -200,6 +206,10 @@ static bool event_is_known(struct iio_event_data *event)
>  	case IIO_MOD_Q:
>  	case IIO_MOD_CO2:
>  	case IIO_MOD_VOC:
> +	case IIO_MOD_PM1:
> +	case IIO_MOD_PM2P5:
> +	case IIO_MOD_PM4:
> +	case IIO_MOD_PM10:
>  		break;
>  	default:
>  		return false;
