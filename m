From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 02/16] mfd: da8xx-cfgchip: New header file for CFGCHIP
 registers.
Date: Fri, 25 Mar 2016 20:22:59 +0300
Message-ID: <56F573F3.90500@cogentembedded.com>
References: <1458863503-31121-1-git-send-email-david@lechnology.com>
 <1458863503-31121-3-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458863503-31121-3-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:USB SUBSYSTEM" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/25/2016 02:51 AM, David Lechner wrote:

> We will be using a generic syscon device for the TI DA8XX SoC CFGCHIPx
> retisters. This will be used by a number of planned drivers including a
> new USB PHY driver and common clock framework drivers.
>
> The same defines are removed from the platform_data header file since they
> are now redundant and they didn't really belong there anyway.
>
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---
>
> v3 changes: This is a new patch. It replaces the previous patch that just added
> some missing CFGCHIP2 registers to the platform_data/usb-davinci.h file.
> I took David Laight's advice and included all of the possible registers.
>
> Many of these registers will be used for clocks - hopefully in the near future.
>
>
> include/linux/mfd/da8xx-cfgchip.h         | 160 ++++++++++++++++++++++++++++++
>   include/linux/platform_data/usb-davinci.h |  23 -----
>   2 files changed, 160 insertions(+), 23 deletions(-)
>   create mode 100644 include/linux/mfd/da8xx-cfgchip.h
>
> diff --git a/include/linux/mfd/da8xx-cfgchip.h b/include/linux/mfd/da8xx-cfgchip.h
> new file mode 100644
> index 0000000..6940cf9
> --- /dev/null
> +++ b/include/linux/mfd/da8xx-cfgchip.h
> @@ -0,0 +1,160 @@
[...]
> +/* register offsets */
> +#define CFGCHIP_REG(n)				(n * 4)
> +#define CFGCHIP0_REG				CFGCHIP_REG(0)
> +#define CFGCHIP1_REG				CFGCHIP_REG(1)
> +#define CFGCHIP2_REG				CFGCHIP_REG(2)
> +#define CFGCHIP3_REG				CFGCHIP_REG(3)
> +#define CFGCHIP4_REG				CFGCHIP_REG(4)

    Why not just use CFGCHIP_REG(n) directly?

[...]
> diff --git a/include/linux/platform_data/usb-davinci.h b/include/linux/platform_data/usb-davinci.h
> index e0bc4ab..7c6ce24 100644
> --- a/include/linux/platform_data/usb-davinci.h
> +++ b/include/linux/platform_data/usb-davinci.h
[...]
> @@ -53,7 +31,6 @@ struct	da8xx_ohci_root_hub {
>   	/* Time from power on to power good (in 2 ms units) */
>   	u8	potpgt;
>   };
> -

    Why?

>   void davinci_setup_usb(unsigned mA, unsigned potpgt_ms);
>
>   #endif	/* ifndef __ASM_ARCH_USB_H */

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
