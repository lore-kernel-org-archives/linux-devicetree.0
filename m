Return-Path: <SRS0=4RP9=JN=linux.intel.com=heikki.krogerus@kernel.org>
Date: Wed, 27 Jun 2018 11:15:54 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v8 14/14] staging: typec: tcpci: move tcpci drivers out
 of staging
Message-ID: <20180627081554.GA2307@kuha.fi.intel.com>
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
 <1530056732-9640-15-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530056732-9640-15-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, linux@roeck-us.net, a.hajda@samsung.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 27, 2018 at 07:45:32AM +0800, Li Jun wrote:
> Move TCPCI(Typec port controller interface) driver and rt1711h
> driver out of staging.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

Thanks Li!

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/staging/Kconfig                        |  2 --
>  drivers/staging/Makefile                       |  1 -
>  drivers/staging/typec/Kconfig                  | 22 ----------------------
>  drivers/staging/typec/Makefile                 |  2 --
>  drivers/staging/typec/TODO                     |  5 -----
>  drivers/usb/typec/Kconfig                      | 15 +++++++++++++++
>  drivers/usb/typec/Makefile                     |  2 ++
>  drivers/{staging => usb}/typec/tcpci.c         |  0
>  drivers/{staging => usb}/typec/tcpci.h         |  0
>  drivers/{staging => usb}/typec/tcpci_rt1711h.c |  0
>  10 files changed, 17 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
> index 75a4804..af9a82f 100644
> --- a/drivers/staging/Kconfig
> +++ b/drivers/staging/Kconfig
> @@ -106,8 +106,6 @@ source "drivers/staging/greybus/Kconfig"
>  
>  source "drivers/staging/vc04_services/Kconfig"
>  
> -source "drivers/staging/typec/Kconfig"
> -
>  source "drivers/staging/vboxvideo/Kconfig"
>  
>  source "drivers/staging/pi433/Kconfig"
> diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
> index e84959a..8479d47 100644
> --- a/drivers/staging/Makefile
> +++ b/drivers/staging/Makefile
> @@ -2,7 +2,6 @@
>  # Makefile for staging directory
>  
>  obj-y				+= media/
> -obj-y				+= typec/
>  obj-$(CONFIG_PRISM2_USB)	+= wlan-ng/
>  obj-$(CONFIG_COMEDI)		+= comedi/
>  obj-$(CONFIG_FB_OLPC_DCON)	+= olpc_dcon/
> diff --git a/drivers/staging/typec/Kconfig b/drivers/staging/typec/Kconfig
> deleted file mode 100644
> index 3aa981f..0000000
> --- a/drivers/staging/typec/Kconfig
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -menu "USB Power Delivery and Type-C drivers"
> -
> -if TYPEC_TCPM
> -
> -config TYPEC_TCPCI
> -	tristate "Type-C Port Controller Interface driver"
> -	depends on I2C
> -	select REGMAP_I2C
> -	help
> -	  Type-C Port Controller driver for TCPCI-compliant controller.
> -
> -config TYPEC_RT1711H
> -	tristate "Richtek RT1711H Type-C chip driver"
> -	select TYPEC_TCPCI
> -	help
> -	  Richtek RT1711H Type-C chip driver that works with
> -	  Type-C Port Controller Manager to provide USB PD and USB
> -	  Type-C functionalities.
> -
> -endif
> -
> -endmenu
> diff --git a/drivers/staging/typec/Makefile b/drivers/staging/typec/Makefile
> deleted file mode 100644
> index 7803d48..0000000
> --- a/drivers/staging/typec/Makefile
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -obj-$(CONFIG_TYPEC_TCPCI)	+= tcpci.o
> -obj-$(CONFIG_TYPEC_RT1711H)	+= tcpci_rt1711h.o
> diff --git a/drivers/staging/typec/TODO b/drivers/staging/typec/TODO
> deleted file mode 100644
> index 53fe2f7..0000000
> --- a/drivers/staging/typec/TODO
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -tcpci:
> -- Test with real hardware
> -
> -Please send patches to Guenter Roeck <linux@roeck-us.net> and copy
> -Heikki Krogerus <heikki.krogerus@linux.intel.com>.
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index 2c8eab1..972fd19 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -56,6 +56,21 @@ config TYPEC_TCPM
>  
>  if TYPEC_TCPM
>  
> +config TYPEC_TCPCI
> +	tristate "Type-C Port Controller Interface driver"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  Type-C Port Controller driver for TCPCI-compliant controller.
> +
> +config TYPEC_RT1711H
> +	tristate "Richtek RT1711H Type-C chip driver"
> +	select TYPEC_TCPCI
> +	help
> +	  Richtek RT1711H Type-C chip driver that works with
> +	  Type-C Port Controller Manager to provide USB PD and USB
> +	  Type-C functionalities.
> +
>  source "drivers/usb/typec/fusb302/Kconfig"
>  
>  config TYPEC_WCOVE
> diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
> index 1f599a6..46f86ee 100644
> --- a/drivers/usb/typec/Makefile
> +++ b/drivers/usb/typec/Makefile
> @@ -7,3 +7,5 @@ obj-$(CONFIG_TYPEC_WCOVE)	+= typec_wcove.o
>  obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
>  obj-$(CONFIG_TYPEC_TPS6598X)	+= tps6598x.o
>  obj-$(CONFIG_TYPEC)		+= mux/
> +obj-$(CONFIG_TYPEC_TCPCI)	+= tcpci.o
> +obj-$(CONFIG_TYPEC_RT1711H)	+= tcpci_rt1711h.o
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/usb/typec/tcpci.c
> similarity index 100%
> rename from drivers/staging/typec/tcpci.c
> rename to drivers/usb/typec/tcpci.c
> diff --git a/drivers/staging/typec/tcpci.h b/drivers/usb/typec/tcpci.h
> similarity index 100%
> rename from drivers/staging/typec/tcpci.h
> rename to drivers/usb/typec/tcpci.h
> diff --git a/drivers/staging/typec/tcpci_rt1711h.c b/drivers/usb/typec/tcpci_rt1711h.c
> similarity index 100%
> rename from drivers/staging/typec/tcpci_rt1711h.c
> rename to drivers/usb/typec/tcpci_rt1711h.c

-- 
heikki
