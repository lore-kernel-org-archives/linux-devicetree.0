From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 2/2][v5] driver: mtd: update struct map_info's swap as
 per map requirement
Date: Tue, 6 Mar 2018 09:14:11 +0100
Message-ID: <20180306091411.64023af1@bbrezillon>
References: <20180228073335.1758-1-prabhakar.kushwaha@nxp.com>
 <20180228073335.1758-2-prabhakar.kushwaha@nxp.com>
 <HE1PR04MB1241B7EE0E3905E20214C2A797D90@HE1PR04MB1241.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <HE1PR04MB1241B7EE0E3905E20214C2A797D90@HE1PR04MB1241.eurprd04.prod.outlook.com>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>, Leo Li <leoyang.li@nxp.com>, "oss@buserror.net" <oss@buserror.net>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Jagdish Gediya <jagdish.gediya@nxp.com>, "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Prabhakar,

On Tue, 6 Mar 2018 06:02:08 +0000
Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:

> Dear Boris,
> 
> > -----Original Message-----
> > From: Prabhakar Kushwaha
> > Sent: Wednesday, February 28, 2018 1:04 PM
> > To: linux-mtd@lists.infradead.org; devicetree@vger.kernel.org;
> > robh@kernel.org; mark.rutland@arm.com; shawnguo@kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org; boris.brezillon@free-
> > electrons.com; cyrille.pitchen@wedev4u.fr; computersforpeace@gmail.com;
> > oss@buserror.net; Leo Li <leoyang.li@nxp.com>; Prabhakar Kushwaha
> > <prabhakar.kushwaha@nxp.com>; Jagdish Gediya
> > <jagdish.gediya@nxp.com>
> > Subject: [PATCH 2/2][v5] driver: mtd: update struct map_info's swap as per
> > map requirement
> > 
> > It is not necessary for all device's maps to be CFI_HOST_ENDIAN.
> > Maps device can be Big endian or little endian.
> > 
> > Currently it is being taken care using CONFIG_MTD_CFI_LE_BYTE_SWAP or
> > CONFIG_MTD_CFI_BE_BYTE_SWAP i.e. compile time.
> > 
> > Now update struct map_info's swap field based on device characteristics
> > defined in device tree.
> > 
> > Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
> > Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> > ---
> > Changes for v2: Incorporated review comments from Boris Brezillon
> > http://patchwork.ozlabs.org/patch/758381/
> > Changes for v3: None
> > Changes for v4: Updated code as per new defined binding of physmap.txt
> > Changes for v5: Avoid map.swap set in case of endiannes not defined in dts
> > file
> > 
> >  drivers/mtd/maps/physmap_of_core.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/mtd/maps/physmap_of_core.c
> > b/drivers/mtd/maps/physmap_of_core.c
> > index b1bd4faecfb2..527b1682381f 100644
> > --- a/drivers/mtd/maps/physmap_of_core.c
> > +++ b/drivers/mtd/maps/physmap_of_core.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/mtd/map.h>
> >  #include <linux/mtd/partitions.h>
> >  #include <linux/mtd/concat.h>
> > +#include <linux/mtd/cfi_endian.h>
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_platform.h>
> > @@ -233,6 +234,11 @@ static int of_flash_probe(struct platform_device
> > *dev)
> >  		info->list[i].map.bankwidth = be32_to_cpup(width);
> >  		info->list[i].map.device_node = dp;
> > 
> > +		if (of_property_read_bool(dp, "big-endian"))
> > +			info->list[i].map.swap = CFI_BIG_ENDIAN;
> > +		else if (of_property_read_bool(dp, "little-endian"))
> > +			info->list[i].map.swap = CFI_LITTLE_ENDIAN;
> > +
> >  		err = of_flash_probe_gemini(dev, dp, &info->list[i].map);
> >  		if (err)
> >  			goto err_out;
> > --
> > 2.14.1  
> 
> Is this patch correct with respect to device binding (http://patchwork.ozlabs.org/patch/878974/)

This patch looks good, but patch 1 is not describing what really
happens when the xxx-endian props are missing.

> May I go ahead and send device tree patches for other NXP platforms

Nope, please wait till we sorted out the last issues I pointed on patch
1.

> 
> will http://patchwork.ozlabs.org/patch/878974/  along with this patch be send via linux-mtd repo?

Yes, once you've fixed the description or explained why you think the
current description is valid.

Regards,

Boris

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
