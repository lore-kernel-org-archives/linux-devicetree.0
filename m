From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v1 2/3] mtd: probe: probe dual die entry from devicetree
 binding
Date: Thu, 22 Feb 2018 14:02:53 +0100
Message-ID: <20180222140253.1773d3ce@bbrezillon>
References: <1519241514-6466-1-git-send-email-beanhuo@outlook.com>
 <DM2PR12MB001471EC3E5B6841C61ED9FEA6CE0@DM2PR12MB0014.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <DM2PR12MB001471EC3E5B6841C61ED9FEA6CE0@DM2PR12MB0014.namprd12.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Bean Huo <beanhuo@outlook.com>
Cc: "boris.brezillon@free-elections.com" <boris.brezillon@free-elections.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "richard@nod.at" <richard@nod.at>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, beanhuo <beanhuo@micron.com>
List-Id: devicetree@vger.kernel.org

On Wed, 21 Feb 2018 19:32:34 +0000
Bean Huo <beanhuo@outlook.com> wrote:

> From: beanhuo <beanhuo@micron.com>
> 
> The device_stack property now will be initialized when devicetree
> has an entry compatible with "dual_die_stack".
> 
> Signed-off-by: beanhuo <beanhuo@micron.com>
> ---
>  drivers/mtd/chips/cfi_probe.c | 7 +++++++
>  include/linux/mtd/cfi.h       | 8 ++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
> index e8d0164..6182406 100644
> --- a/drivers/mtd/chips/cfi_probe.c
> +++ b/drivers/mtd/chips/cfi_probe.c
> @@ -17,6 +17,7 @@
>  #include <linux/mtd/map.h>
>  #include <linux/mtd/cfi.h>
>  #include <linux/mtd/gen_probe.h>
> +#include <linux/of_platform.h>
>  
>  //#define DEBUG_CFI
>  
> @@ -159,6 +160,7 @@ static int __xipram cfi_chip_setup(struct map_info *map,
>  	int num_erase_regions = cfi_read_query(map, base + (0x10 + 28)*ofs_factor);
>  	int i;
>  	int addr_unlock1 = 0x555, addr_unlock2 = 0x2AA;
> +	struct device_node __maybe_unused *np = map->device_node;

You can drop this variable...

>  
>  	xip_enable(base, map, cfi);
>  #ifdef DEBUG_CFI
> @@ -177,6 +179,11 @@ static int __xipram cfi_chip_setup(struct map_info *map,
>  
>  	cfi->sector_erase_cmd = CMD(0x30);
>  
> +	cfi->device_stack = CFI_DEVICESTACK_1DIE;
> +#ifdef CONFIG_OF
> +	if (np && of_property_read_bool(np, "dual-die-stack"))
> +		cfi->device_stack = CFI_DEVICESTACK_2DIE;
> +#endif

and simply do:

	if (of_property_read_bool(map->device_node, "dual-die-stack"))
		cfi->device_stack = CFI_DEVICESTACK_2DIE;

>  	/* Read the CFI info structure */
>  	xip_disable_qry(base, map, cfi);
>  	for (i=0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); i++)
> diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
> index 9b57a9b..bda37a4 100644
> --- a/include/linux/mtd/cfi.h
> +++ b/include/linux/mtd/cfi.h
> @@ -277,11 +277,19 @@ struct cfi_bri_query {
>  #define CFI_MODE_CFI	1
>  #define CFI_MODE_JEDEC	0
>  
> +/* These values represent the die count of chip stack.
> + * So far, there only exists two type of stack device,
> + * single or dual die.
> + */
> +#define CFI_DEVICESTACK_1DIE	1
> +#define CFI_DEVICESTACK_2DIE	2

Why are these macros needed?

> +
>  struct cfi_private {
>  	uint16_t cmdset;
>  	void *cmdset_priv;
>  	int interleave;
>  	int device_type;
> +	int device_stack;	/* Device stack type, single die or dual die. */

Why not simply:

	int num_dies;

which would contain the number of dies.

>  	int cfi_mode;		/* Are we a JEDEC device pretending to be CFI? */
>  	int addr_unlock1;
>  	int addr_unlock2;



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
