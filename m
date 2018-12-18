From: Thor Thayer <thor.thayer@linux.intel.com>
Subject: Re: [PATCH v2 net-next 05/10] net: eth: altera: Move common functions
 to altera_utils
Date: Tue, 18 Dec 2018 09:37:41 -0600
Message-ID: <82ca2c48-ec33-315e-dbdb-71ec01b6b9e9@linux.intel.com>
References: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
 <20181213175252.21143-6-dalon.westergreen@linux.intel.com>
Reply-To: thor.thayer@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181213175252.21143-6-dalon.westergreen@linux.intel.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: dwesterg@gmail.com, netdev@vger.kernel.org, dinguyen@kernel.org, richardcochran@gmail.com, davem@davemloft.net, vbridger@opensource.altera.com, robh+dt@kernel.org, "mark.rutland@arm.commark.rutland"@arm.com, devicetree@vger.kernel.org, hean.loong.ong@intel.com
Cc: Dalon Westergreen <dalon.westergreen@intel.com>
List-Id: devicetree@vger.kernel.org

On 12/13/18 11:52 AM, dwesterg@gmail.com wrote:
> From: Dalon Westergreen <dalon.westergreen@intel.com>
> 
> Move request_and_map and other shared functions to altera_utils. This
> is the first step to moving common code out of tse specific code so
> that it can be shared with future altera ethernet ip.
> 
> Signed-off-by: Dalon Westergreen <dalon.westergreen@intel.com>
> ---
>   drivers/net/ethernet/altera/altera_tse.h      | 45 ------------------
>   .../net/ethernet/altera/altera_tse_ethtool.c  |  1 +
>   drivers/net/ethernet/altera/altera_tse_main.c | 32 +------------
>   drivers/net/ethernet/altera/altera_utils.c    | 30 ++++++++++++
>   drivers/net/ethernet/altera/altera_utils.h    | 46 +++++++++++++++++++
>   5 files changed, 78 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/net/ethernet/altera/altera_tse.h b/drivers/net/ethernet/altera/altera_tse.h
> index 7f246040135d..f435fb0eca90 100644
> --- a/drivers/net/ethernet/altera/altera_tse.h
> +++ b/drivers/net/ethernet/altera/altera_tse.h
> @@ -500,49 +500,4 @@ struct altera_tse_private {
>    */
>   void altera_tse_set_ethtool_ops(struct net_device *);
>   
> -static inline
> -u32 csrrd32(void __iomem *mac, size_t offs)
> -{
> -	void __iomem *paddr = (void __iomem *)((uintptr_t)mac + offs);
> -	return readl(paddr);
> -}
> -
> -static inline
> -u16 csrrd16(void __iomem *mac, size_t offs)
> -{
> -	void __iomem *paddr = (void __iomem *)((uintptr_t)mac + offs);
> -	return readw(paddr);
> -}
> -
> -static inline
> -u8 csrrd8(void __iomem *mac, size_t offs)
> -{
> -	void __iomem *paddr = (void __iomem *)((uintptr_t)mac + offs);
> -	return readb(paddr);
> -}
> -
> -static inline
> -void csrwr32(u32 val, void __iomem *mac, size_t offs)
> -{
> -	void __iomem *paddr = (void __iomem *)((uintptr_t)mac + offs);
> -
> -	writel(val, paddr);
> -}
> -
> -static inline
> -void csrwr16(u16 val, void __iomem *mac, size_t offs)
> -{
> -	void __iomem *paddr = (void __iomem *)((uintptr_t)mac + offs);
> -
> -	writew(val, paddr);
> -}
> -
> -static inline
> -void csrwr8(u8 val, void __iomem *mac, size_t offs)
> -{
> -	void __iomem *paddr = (void __iomem *)((uintptr_t)mac + offs);
> -
> -	writeb(val, paddr);
> -}
> -
>   #endif /* __ALTERA_TSE_H__ */
> diff --git a/drivers/net/ethernet/altera/altera_tse_ethtool.c b/drivers/net/ethernet/altera/altera_tse_ethtool.c
> index 7c367713c3e6..2998655ab316 100644
> --- a/drivers/net/ethernet/altera/altera_tse_ethtool.c
> +++ b/drivers/net/ethernet/altera/altera_tse_ethtool.c
> @@ -33,6 +33,7 @@
>   #include <linux/phy.h>
>   
>   #include "altera_tse.h"
> +#include "altera_utils.h"
>   
>   #define TSE_STATS_LEN	31
>   #define TSE_NUM_REGS	128
> diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
> index f6b6a14b1ce9..b25d03506470 100644
> --- a/drivers/net/ethernet/altera/altera_tse_main.c
> +++ b/drivers/net/ethernet/altera/altera_tse_main.c
> @@ -34,7 +34,6 @@
>   #include <linux/if_vlan.h>
>   #include <linux/init.h>
>   #include <linux/interrupt.h>
> -#include <linux/io.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/mii.h>
> @@ -44,7 +43,7 @@
>   #include <linux/of_net.h>
>   #include <linux/of_platform.h>
>   #include <linux/phy.h>
> -#include <linux/platform_device.h>
> +#include <linux/ptp_classify.h>
>   #include <linux/skbuff.h>
>   #include <asm/cacheflush.h>
>   
> @@ -1332,35 +1331,6 @@ static struct net_device_ops altera_tse_netdev_ops = {
>   	.ndo_validate_addr	= eth_validate_addr,
>   };
>   
> -static int request_and_map(struct platform_device *pdev, const char *name,
> -			   struct resource **res, void __iomem **ptr)
> -{
> -	struct resource *region;
> -	struct device *device = &pdev->dev;
> -
> -	*res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> -	if (*res == NULL) {
> -		dev_err(device, "resource %s not defined\n", name);
> -		return -ENODEV;
> -	}
> -
> -	region = devm_request_mem_region(device, (*res)->start,
> -					 resource_size(*res), dev_name(device));
> -	if (region == NULL) {
> -		dev_err(device, "unable to request %s\n", name);
> -		return -EBUSY;
> -	}
> -
> -	*ptr = devm_ioremap_nocache(device, region->start,
> -				    resource_size(region));
> -	if (*ptr == NULL) {
> -		dev_err(device, "ioremap_nocache of %s failed!", name);
> -		return -ENOMEM;
> -	}
> -
> -	return 0;
> -}
> -
>   /* Probe Altera TSE MAC device
>    */
>   static int altera_tse_probe(struct platform_device *pdev)
> diff --git a/drivers/net/ethernet/altera/altera_utils.c b/drivers/net/ethernet/altera/altera_utils.c
> index d7eeb1713ad2..bc33b7f0b0c5 100644
> --- a/drivers/net/ethernet/altera/altera_utils.c
> +++ b/drivers/net/ethernet/altera/altera_utils.c
> @@ -42,3 +42,33 @@ int tse_bit_is_clear(void __iomem *ioaddr, size_t offs, u32 bit_mask)
>   	u32 value = csrrd32(ioaddr, offs);
>   	return (value & bit_mask) ? 0 : 1;
>   }
> +
> +int request_and_map(struct platform_device *pdev, const char *name,
> +		    struct resource **res, void __iomem **ptr)
> +{
> +	struct resource *region;
> +	struct device *device = &pdev->dev;
> +
> +	*res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> +	if (!*res) {
> +		dev_err(device, "resource %s not defined\n", name);
> +		return -ENODEV;
> +	}
> +
> +	region = devm_request_mem_region(device, (*res)->start,
> +					 resource_size(*res), dev_name(device));
> +	if (!region) {
> +		dev_err(device, "unable to request %s\n", name);
> +		return -EBUSY;
> +	}
> +
> +	*ptr = devm_ioremap_nocache(device, region->start,
> +				    resource_size(region));
> +	if (!*ptr) {
> +		dev_err(device, "ioremap_nocache of %s failed!", name);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> diff --git a/drivers/net/ethernet/altera/altera_utils.h b/drivers/net/ethernet/altera/altera_utils.h
> index baf100ccf587..bb7eff792bb7 100644
> --- a/drivers/net/ethernet/altera/altera_utils.h
> +++ b/drivers/net/ethernet/altera/altera_utils.h
> @@ -14,7 +14,9 @@
>    * this program.  If not, see <http://www.gnu.org/licenses/>.
>    */
>   
> +#include <linux/io.h>
>   #include <linux/kernel.h>
> +#include <linux/platform_device.h>
>   
>   #ifndef __ALTERA_UTILS_H__
>   #define __ALTERA_UTILS_H__
> @@ -23,5 +25,49 @@ void tse_set_bit(void __iomem *ioaddr, size_t offs, u32 bit_mask);
>   void tse_clear_bit(void __iomem *ioaddr, size_t offs, u32 bit_mask);
>   int tse_bit_is_set(void __iomem *ioaddr, size_t offs, u32 bit_mask);
>   int tse_bit_is_clear(void __iomem *ioaddr, size_t offs, u32 bit_mask);
> +int request_and_map(struct platform_device *pdev, const char *name,
> +		    struct resource **res, void __iomem **ptr);
> +
> +static inline u32 csrrd32(void __iomem *mac, size_t offs)
> +{
> +	void __iomem *paddr = (void __iomem *)((uintptr_t)mac + offs);
> +
> +	return readl(paddr);
> +}
> +
> +static inline u16 csrrd16(void __iomem *mac, size_t offs)
> +{
> +	void __iomem *paddr = (void __iomem *)((uintptr_t)mac + offs);
> +
> +	return readw(paddr);
> +}
> +
> +static inline u8 csrrd8(void __iomem *mac, size_t offs)
> +{
> +	void __iomem *paddr = (void __iomem *)((uintptr_t)mac + offs);
> +
> +	return readb(paddr);
> +}
> +
> +static inline void csrwr32(u32 val, void __iomem *mac, size_t offs)
> +{
> +	void __iomem *paddr = (void __iomem *)((uintptr_t)mac + offs);
> +
> +	writel(val, paddr);
> +}
> +
> +static inline void csrwr16(u16 val, void __iomem *mac, size_t offs)
> +{
> +	void __iomem *paddr = (void __iomem *)((uintptr_t)mac + offs);
> +
> +	writew(val, paddr);
> +}
> +
> +static inline void csrwr8(u8 val, void __iomem *mac, size_t offs)
> +{
> +	void __iomem *paddr = (void __iomem *)((uintptr_t)mac + offs);
> +
> +	writeb(val, paddr);
> +}
>   
>   #endif /* __ALTERA_UTILS_H__*/
> 
Acked-by: Thor Thayer <thor.thayer@linux.intel.com>
