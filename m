From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 10/15] Group related CSR definitions together.
Date: Fri, 2 Sep 2016 14:40:34 -0700
Message-ID: <20160902214034.GB31011@roeck-us.net>
References: <20160902154501.8650.99790.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <20160902155518.8650.89467.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160902155518.8650.89467.stgit-1RhO1Y9PlrlHTL0Zs8A6p/gx64E7kk8eUsxypvmhUTTZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 02, 2016 at 10:55:19AM -0500, Bjorn Helgaas wrote:
> 
> ---
>  drivers/pci/host/pcie-rockchip.c |  148 +++++++++++++++++++-------------------
>  1 file changed, 74 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/pci/host/pcie-rockchip.c b/drivers/pci/host/pcie-rockchip.c
> index 6edfce5..fe1b52f 100644
> --- a/drivers/pci/host/pcie-rockchip.c
> +++ b/drivers/pci/host/pcie-rockchip.c
> @@ -37,21 +37,27 @@
>  #include <linux/reset.h>
>  #include <linux/regmap.h>
>  
> -#define PCIE_CLIENT_BASE			0x0
> -#define PCIE_RC_CONFIG_BASE			0xa00000
> -#define PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2	(PCIE_RC_CONFIG_BASE + 0x90c)
> -#define PCIE_RC_CONFIG_LCS			(PCIE_RC_CONFIG_BASE + 0x0d0)
> -#define  PCIE_RC_CONFIG_LCS_RETRAIN_LINK	BIT(5)
> -#define  PCIE_RC_CONFIG_LCS_LBMIE		BIT(10)
> -#define  PCIE_RC_CONFIG_LCS_LABIE		BIT(11)
> -#define  PCIE_RC_CONFIG_LCS_LBMS		BIT(30)
> -#define  PCIE_RC_CONFIG_LCS_LAMS		BIT(31)
> -#define PCIE_CORE_CTRL_MGMT_BASE		0x900000
> -#define PCIE_CORE_AXI_CONF_BASE			0xc00000
> -#define PCIE_CORE_AXI_INBOUND_BASE		0xc00800
> -#define PCIE_CLIENT_BASIC_STATUS1		(PCIE_CLIENT_BASE + 0x48)
> -#define PCIE_CLIENT_INT_MASK			(PCIE_CLIENT_BASE + 0x4c)
> -#define PCIE_CLIENT_INT_STATUS			(PCIE_CLIENT_BASE + 0x50)
> +/*
> + * The upper 16 bits of PCIE_CLIENT_BASE are a write mask for the lower 16
> + * bits.  This allows atomic updates of the register without locking.
> + */
> +#define HIWORD_UPDATE(mask, val)	((mask << 16) | val)
> +
(mask), (val)

> +#define ENCODE_LANES(x)			(((x >> 1) & 3) << 4)

(x)

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
