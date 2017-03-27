From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 5/5] firmware: google memconsole: Add ARM/ARM64 support
Date: Mon, 27 Mar 2017 09:56:31 -0700
Message-ID: <20170327165630.GA128943@google.com>
References: <1490303069-13230-1-git-send-email-thierry.escande@collabora.com>
 <1490303069-13230-6-git-send-email-thierry.escande@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490303069-13230-6-git-send-email-thierry.escande-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Escande <thierry.escande-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thierry,

In case this wasn't obvious from the build report:

On Thu, Mar 23, 2017 at 10:04:29PM +0100, Thierry Escande wrote:
> --- a/drivers/firmware/google/Kconfig
> +++ b/drivers/firmware/google/Kconfig
> @@ -1,6 +1,5 @@
>  menuconfig GOOGLE_FIRMWARE
>  	bool "Google Firmware Drivers"
> -	depends on X86

The build bots complained: you're relaxing the compile-time restriction
here, so you should probably move it to the GOOGLE_SMI symbol, since
that file uses X86 assembly.

>  	default n
>  	help
>  	  These firmware drivers are used by Google's servers.  They are
> @@ -21,7 +20,7 @@ config GOOGLE_SMI
>  
>  config GOOGLE_COREBOOT_TABLE
>  	tristate
> -	depends on GOOGLE_COREBOOT_TABLE_ACPI
> +	depends on GOOGLE_COREBOOT_TABLE_ACPI || GOOGLE_COREBOOT_TABLE_OF
>  
>  config GOOGLE_COREBOOT_TABLE_ACPI
>  	tristate "Coreboot Table Access - ACPI"
> @@ -33,6 +32,16 @@ config GOOGLE_COREBOOT_TABLE_ACPI
>  	  pointer is accessed through the ACPI "GOOGCB00" object.
>  	  If unsure say N.
>  
> +config GOOGLE_COREBOOT_TABLE_OF
> +	tristate "Coreboot Table Access - Device Tree"
> +	depends on OF
> +	select GOOGLE_COREBOOT_TABLE
> +	help
> +	  This option enable the coreboot_table module, which provide other
> +	  firmware modules to access coreboot table. The coreboot table pointer
> +	  is accessed through the device tree node /firmware/coreboot.
> +	  If unsure say N.
> +
>  config GOOGLE_MEMCONSOLE
>  	tristate
>  	depends on GOOGLE_MEMCONSOLE_X86_LEGACY || GOOGLE_MEMCONSOLE_COREBOOT

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
