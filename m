Return-Path: <SRS0=Cn1m=RC=linux.intel.com=heikki.krogerus@kernel.org>
Date: Wed, 27 Feb 2019 11:40:31 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 2/2] usb: typec: add typec switch via GPIO control
Message-ID: <20190227094031.GD27730@kuha.fi.intel.com>
References: <1551078369-1654-1-git-send-email-jun.li@nxp.com>
 <1551078369-1654-2-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551078369-1654-2-git-send-email-jun.li@nxp.com>
To: Jun Li <jun.li@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 25, 2019 at 07:27:08AM +0000, Jun Li wrote:
> This patch adds a simple typec switch driver which only needs
> a GPIO to switch the super speed active channel according to
> typec orientation.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/typec/mux/Kconfig       |   6 +++
>  drivers/usb/typec/mux/Makefile      |   1 +
>  drivers/usb/typec/mux/gpio-switch.c | 105 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 112 insertions(+)
>  create mode 100644 drivers/usb/typec/mux/gpio-switch.c
> 
> diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> index 01ed0d5..bc7d3c7 100644
> --- a/drivers/usb/typec/mux/Kconfig
> +++ b/drivers/usb/typec/mux/Kconfig
> @@ -9,4 +9,10 @@ config TYPEC_MUX_PI3USB30532
>  	  Say Y or M if your system has a Pericom PI3USB30532 Type-C cross
>  	  switch / mux chip found on some devices with a Type-C port.
>  
> +config TYPEC_SWITCH_GPIO
> +	tristate "Simple Super Speed Active Switch via GPIO"

depends on GPIOLIB?

> +	help
> +	  Say Y or M if your system has a typec super speed channel
> +	  switch via a simple GPIO control.
> +

thanks,

-- 
heikki
