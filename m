From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 2/2][v7] driver: mtd: update struct map_info's swap as
 per map requirement
Date: Thu, 29 Mar 2018 22:23:34 +0200
Message-ID: <20180329222334.47015bdd@bbrezillon>
References: <20180328054552.2884-1-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180328054552.2884-1-prabhakar.kushwaha@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, boris.brezillon@free-electrons.com, poonam.aggrwal@nxp.com, leoyang.li@nxp.com, oss@buserror.net, linux-mtd@lists.infradead.org, Jagdish Gediya <jagdish.gediya@nxp.com>, computersforpeace@gmail.com, shawnguo@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 28 Mar 2018 11:15:52 +0530
Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:

> It is not necessary for all device's maps to be CFI_HOST_ENDIAN.
> Maps device can be Big endian or little endian.
> 
> Currently it is being taken care using CONFIG_MTD_CFI_LE_BYTE_SWAP or
> CONFIG_MTD_CFI_BE_BYTE_SWAP i.e. compile time.
> 
> Now update struct map_info's swap field based on device characteristics
> defined in device tree.
> 
> Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>

Applied.

Thanks,

Boris

> ---
> Changes for v2: Incorporated review comments from Boris Brezillon
> http://patchwork.ozlabs.org/patch/758381/
> Changes for v3: None
> Changes for v4: Updated code as per new defined binding of physmap.txt
> Changes for v5: Avoid map.swap set in case of endiannes not defined in dts file
> Changes for v6: Sending as it is
> Changes for v7: Sending as it is
> 
>  drivers/mtd/maps/physmap_of_core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/maps/physmap_of_core.c b/drivers/mtd/maps/physmap_of_core.c
> index b1bd4faecfb2..527b1682381f 100644
> --- a/drivers/mtd/maps/physmap_of_core.c
> +++ b/drivers/mtd/maps/physmap_of_core.c
> @@ -20,6 +20,7 @@
>  #include <linux/mtd/map.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/mtd/concat.h>
> +#include <linux/mtd/cfi_endian.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
> @@ -233,6 +234,11 @@ static int of_flash_probe(struct platform_device *dev)
>  		info->list[i].map.bankwidth = be32_to_cpup(width);
>  		info->list[i].map.device_node = dp;
>  
> +		if (of_property_read_bool(dp, "big-endian"))
> +			info->list[i].map.swap = CFI_BIG_ENDIAN;
> +		else if (of_property_read_bool(dp, "little-endian"))
> +			info->list[i].map.swap = CFI_LITTLE_ENDIAN;
> +
>  		err = of_flash_probe_gemini(dev, dp, &info->list[i].map);
>  		if (err)
>  			goto err_out;



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
