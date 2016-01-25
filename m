From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 07/15] dmaengine: dw: revisit data_width property
Date: Mon, 25 Jan 2016 10:42:21 +0200
Message-ID: <1453711341.2521.206.camel@linux.intel.com>
References: <1453663322-14474-1-git-send-email-mans@mansr.com>
	 <1453663322-14474-8-git-send-email-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453663322-14474-8-git-send-email-mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>, Viresh Kumar <vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 2016-01-24 at 19:21 +0000, Mans Rullgard wrote:
> From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>=20
> There are several changes are done here:
>=20
> =C2=A0- Convert the property to be in bytes
>=20
> =C2=A0=C2=A0=C2=A0Much more convenient than keeping encoded value.
>=20
> =C2=A0- Use one value for all AHB masters for now
>=20
> =C2=A0=C2=A0=C2=A0It seems in practice we have no controllers where m=
asters have
> different
> =C2=A0=C2=A0=C2=A0data bus width, we still might return to distinct v=
alues when
> there is a use
> =C2=A0=C2=A0=C2=A0case.
>=20
> =C2=A0- Rename data_width to data-width in the device tree bindings.
>=20
> =C2=A0- While here, replace dwc_fast_ffs() by __ffs().
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
> ---
> This patch changes the DT binding, so it should probably be amended
> for
> compatibility with old device trees.=C2=A0=C2=A0I've included it as i=
s since I
> think
> the change as such is good.

So, since all users have at least one master defined, we may easily to
use similar line for old DT variable

if (!of_property_read_u32(np, "data_width", &tmp)) /* removeme: old */
=09
pdata->data_width =3D tmp;
else if (!of_property_read_u32(np, "data-
width", &tmp)) /* removeme: new */
	pdata->data_width =3D tmp;

I any case Viresh might comment on this since it was his code regarding
to support SPEAr SoCs.

> ---
> =C2=A0Documentation/devicetree/bindings/dma/snps-dma.txt |=C2=A0=C2=A0=
5 ++-
> =C2=A0arch/arc/boot/dts/abilis_tb10x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=
=C2=A02 +-
> =C2=A0arch/arm/boot/dts/spear13xx.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0|=C2=A0=C2=A04 +--
> =C2=A0drivers/dma/dw/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 40 =
+++---------
> ----------
> =C2=A0drivers/dma/dw/platform.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A08 ++---
> =C2=A0drivers/dma/dw/regs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=
=C2=A02 +-
> =C2=A0include/linux/platform_data/dma-dw.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A05 ++-
> =C2=A07 files changed, 16 insertions(+), 50 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/snps-dma.txt
> b/Documentation/devicetree/bindings/dma/snps-dma.txt
> index c99c1ffac199..fe7f7710a6b4 100644
> --- a/Documentation/devicetree/bindings/dma/snps-dma.txt
> +++ b/Documentation/devicetree/bindings/dma/snps-dma.txt
> @@ -13,8 +13,7 @@ Required properties:
> =C2=A0- chan_priority: priority of channels. 0 (default): increase fr=
om
> chan 0->n, 1:
> =C2=A0=C2=A0=C2=A0increase from chan n->0
> =C2=A0- block_size: Maximum block size supported by the controller
> -- data_width: Maximum data width supported by hardware per AHB
> master
> -=C2=A0=C2=A0(0 - 8bits, 1 - 16bits, ..., 5 - 256bits)
> +- data-width: Maximum data width supported by hardware (in bytes)
> =C2=A0
> =C2=A0
> =C2=A0Optional properties:
> @@ -38,7 +37,7 @@ Example:
> =C2=A0		chan_allocation_order =3D <1>;
> =C2=A0		chan_priority =3D <1>;
> =C2=A0		block_size =3D <0xfff>;
> -		data_width =3D <3 3>;
> +		data-width =3D <8>;
> =C2=A0	};
> =C2=A0
> =C2=A0DMA clients connected to the Designware DMA controller must use=
 the
> format
> diff --git a/arch/arc/boot/dts/abilis_tb10x.dtsi
> b/arch/arc/boot/dts/abilis_tb10x.dtsi
> index cfb5052239a1..2f53bedb0cde 100644
> --- a/arch/arc/boot/dts/abilis_tb10x.dtsi
> +++ b/arch/arc/boot/dts/abilis_tb10x.dtsi
> @@ -112,7 +112,7 @@
> =C2=A0			chan_allocation_order =3D <0>;
> =C2=A0			chan_priority =3D <1>;
> =C2=A0			block_size =3D <0x7ff>;
> -			data_width =3D <2>;
> +			data-width =3D <4>;
> =C2=A0			clocks =3D <&ahb_clk>;
> =C2=A0			clock-names =3D "hclk";
> =C2=A0		};
> diff --git a/arch/arm/boot/dts/spear13xx.dtsi
> b/arch/arm/boot/dts/spear13xx.dtsi
> index 14594ce8c18a..474b66fa6a32 100644
> --- a/arch/arm/boot/dts/spear13xx.dtsi
> +++ b/arch/arm/boot/dts/spear13xx.dtsi
> @@ -117,7 +117,7 @@
> =C2=A0			chan_priority =3D <1>;
> =C2=A0			block_size =3D <0xfff>;
> =C2=A0			dma-masters =3D <2>;
> -			data_width =3D <3 3>;
> +			data-width =3D <8>;
> =C2=A0		};
> =C2=A0
> =C2=A0		dma@eb000000 {
> @@ -133,7 +133,7 @@
> =C2=A0			chan_allocation_order =3D <1>;
> =C2=A0			chan_priority =3D <1>;
> =C2=A0			block_size =3D <0xfff>;
> -			data_width =3D <3 3>;
> +			data-width =3D <8>;
> =C2=A0		};
> =C2=A0
> =C2=A0		fsmc: flash@b0000000 {
> diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
> index 140ea59ec882..28278e4c77ad 100644
> --- a/drivers/dma/dw/core.c
> +++ b/drivers/dma/dw/core.c
> @@ -168,21 +168,6 @@ static void dwc_initialize(struct dw_dma_chan
> *dwc)
> =C2=A0
> =C2=A0/*-------------------------------------------------------------=
---
> ------*/
> =C2=A0
> -static inline unsigned int dwc_fast_ffs(unsigned long long v)
> -{
> -	/*
> -	=C2=A0* We can be a lot more clever here, but this should take
> care
> -	=C2=A0* of the most common optimization.
> -	=C2=A0*/
> -	if (!(v & 7))
> -		return 3;
> -	else if (!(v & 3))
> -		return 2;
> -	else if (!(v & 1))
> -		return 1;
> -	return 0;
> -}
> -
> =C2=A0static inline void dwc_dump_chan_regs(struct dw_dma_chan *dwc)
> =C2=A0{
> =C2=A0	dev_err(chan2dev(&dwc->chan),
> @@ -712,7 +697,6 @@ dwc_prep_dma_memcpy(struct dma_chan *chan,
> dma_addr_t dest, dma_addr_t src,
> =C2=A0	size_t			offset;
> =C2=A0	unsigned int		src_width;
> =C2=A0	unsigned int		dst_width;
> -	unsigned int		data_width;
> =C2=A0	u32			ctllo;
> =C2=A0
> =C2=A0	dev_vdbg(chan2dev(chan),
> @@ -726,10 +710,7 @@ dwc_prep_dma_memcpy(struct dma_chan *chan,
> dma_addr_t dest, dma_addr_t src,
> =C2=A0
> =C2=A0	dwc->direction =3D DMA_MEM_TO_MEM;
> =C2=A0
> -	data_width =3D dw->data_width[dwc->m_master];
> -
> -	src_width =3D dst_width =3D min_t(unsigned int, data_width,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dwc_fast_ffs(src | dest |
> len));
> +	src_width =3D dst_width =3D __ffs(dw->data_width | src | dest |
> len);
> =C2=A0
> =C2=A0	ctllo =3D DWC_DEFAULT_CTLLO(chan)
> =C2=A0			| DWC_CTLL_DST_WIDTH(dst_width)
> @@ -792,7 +773,6 @@ dwc_prep_slave_sg(struct dma_chan *chan, struct
> scatterlist *sgl,
> =C2=A0	dma_addr_t		reg;
> =C2=A0	unsigned int		reg_width;
> =C2=A0	unsigned int		mem_width;
> -	unsigned int		data_width;
> =C2=A0	unsigned int		i;
> =C2=A0	struct scatterlist	*sg;
> =C2=A0	size_t			total_len =3D 0;
> @@ -818,8 +798,6 @@ dwc_prep_slave_sg(struct dma_chan *chan, struct
> scatterlist *sgl,
> =C2=A0		ctllo |=3D sconfig->device_fc ?
> DWC_CTLL_FC(DW_DMA_FC_P_M2P) :
> =C2=A0			DWC_CTLL_FC(DW_DMA_FC_D_M2P);
> =C2=A0
> -		data_width =3D dw->data_width[dwc->m_master];
> -
> =C2=A0		for_each_sg(sgl, sg, sg_len, i) {
> =C2=A0			struct dw_desc	*desc;
> =C2=A0			u32		len, dlen, mem;
> @@ -827,8 +805,7 @@ dwc_prep_slave_sg(struct dma_chan *chan, struct
> scatterlist *sgl,
> =C2=A0			mem =3D sg_dma_address(sg);
> =C2=A0			len =3D sg_dma_len(sg);
> =C2=A0
> -			mem_width =3D min_t(unsigned int,
> -					=C2=A0=C2=A0data_width,
> dwc_fast_ffs(mem | len));
> +			mem_width =3D __ffs(dw->data_width | mem |
> len);
> =C2=A0
> =C2=A0slave_sg_todev_fill_desc:
> =C2=A0			desc =3D dwc_desc_get(dwc);
> @@ -874,8 +851,6 @@ slave_sg_todev_fill_desc:
> =C2=A0		ctllo |=3D sconfig->device_fc ?
> DWC_CTLL_FC(DW_DMA_FC_P_P2M) :
> =C2=A0			DWC_CTLL_FC(DW_DMA_FC_D_P2M);
> =C2=A0
> -		data_width =3D dw->data_width[dwc->m_master];
> -
> =C2=A0		for_each_sg(sgl, sg, sg_len, i) {
> =C2=A0			struct dw_desc	*desc;
> =C2=A0			u32		len, dlen, mem;
> @@ -883,8 +858,7 @@ slave_sg_todev_fill_desc:
> =C2=A0			mem =3D sg_dma_address(sg);
> =C2=A0			len =3D sg_dma_len(sg);
> =C2=A0
> -			mem_width =3D min_t(unsigned int,
> -					=C2=A0=C2=A0data_width,
> dwc_fast_ffs(mem | len));
> +			mem_width =3D __ffs(dw->data_width | mem |
> len);
> =C2=A0
> =C2=A0slave_sg_fromdev_fill_desc:
> =C2=A0			desc =3D dwc_desc_get(dwc);
> @@ -1531,10 +1505,7 @@ int dw_dma_probe(struct dw_dma_chip *chip,
> struct dw_dma_platform_data *pdata)
> =C2=A0		/* Get hardware configuration parameters */
> =C2=A0		pdata->nr_channels =3D (dw_params >> DW_PARAMS_NR_CHAN
> & 7) + 1;
> =C2=A0		pdata->nr_masters =3D (dw_params >>
> DW_PARAMS_NR_MASTER & 3) + 1;
> -		for (i =3D 0; i < pdata->nr_masters; i++) {
> -			pdata->data_width[i] =3D
> -				(dw_params >>
> DW_PARAMS_DATA_WIDTH(i) & 3) + 2;
> -		}
> +		pdata->data_width =3D 4 << (dw_params >>
> DW_PARAMS_DATA_WIDTH(0) & 3);
> =C2=A0		max_blk_size =3D dma_readl(dw, MAX_BLK_SIZE);
> =C2=A0
> =C2=A0		/* Fill platform data with the default values */
> @@ -1556,8 +1527,7 @@ int dw_dma_probe(struct dw_dma_chip *chip,
> struct dw_dma_platform_data *pdata)
> =C2=A0
> =C2=A0	/* Get hardware configuration parameters */
> =C2=A0	dw->nr_masters =3D pdata->nr_masters;
> -	for (i =3D 0; i < dw->nr_masters; i++)
> -		dw->data_width[i] =3D pdata->data_width[i];
> +	dw->data_width =3D pdata->data_width;
> =C2=A0
> =C2=A0	/* Calculate all channel mask before DMA setup */
> =C2=A0	dw->all_chan_mask =3D (1 << pdata->nr_channels) - 1;
> diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
> index d3e1abcebd7f..89d0461f5dcc 100644
> --- a/drivers/dma/dw/platform.c
> +++ b/drivers/dma/dw/platform.c
> @@ -102,8 +102,8 @@ dw_dma_parse_dt(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct device_node *np =3D pdev->dev.of_node;
> =C2=A0	struct dw_dma_platform_data *pdata;
> -	u32 tmp, arr[DW_DMA_MAX_NR_MASTERS];
> =C2=A0	u32 nr_channels;
> +	u32 tmp;
> =C2=A0
> =C2=A0	if (!np) {
> =C2=A0		dev_err(&pdev->dev, "Missing DT data\n");
> @@ -138,10 +138,8 @@ dw_dma_parse_dt(struct platform_device *pdev)
> =C2=A0		pdata->nr_masters =3D tmp;
> =C2=A0	}
> =C2=A0
> -	if (!of_property_read_u32_array(np, "data_width", arr,
> -				pdata->nr_masters))
> -		for (tmp =3D 0; tmp < pdata->nr_masters; tmp++)
> -			pdata->data_width[tmp] =3D arr[tmp];
> +	if (!of_property_read_u32(np, "data-width", &tmp))
> +		pdata->data_width =3D tmp;
> =C2=A0
> =C2=A0	return pdata;
> =C2=A0}
> diff --git a/drivers/dma/dw/regs.h b/drivers/dma/dw/regs.h
> index e4b277565165..87bc97fca084 100644
> --- a/drivers/dma/dw/regs.h
> +++ b/drivers/dma/dw/regs.h
> @@ -285,7 +285,7 @@ struct dw_dma {
> =C2=A0
> =C2=A0	/* hardware configuration */
> =C2=A0	unsigned char		nr_masters;
> -	unsigned char		data_width[DW_DMA_MAX_NR_MASTER
> S];
> +	unsigned char		data_width;
> =C2=A0};
> =C2=A0
> =C2=A0static inline struct dw_dma_regs __iomem *__dw_regs(struct dw_d=
ma
> *dw)
> diff --git a/include/linux/platform_data/dma-dw.h
> b/include/linux/platform_data/dma-dw.h
> index b881b978e486..4120a3eb71ca 100644
> --- a/include/linux/platform_data/dma-dw.h
> +++ b/include/linux/platform_data/dma-dw.h
> @@ -42,8 +42,7 @@ struct dw_dma_slave {
> =C2=A0 * @chan_priority: Set channel priority increasing from 0 to 7 =
or 7
> to 0.
> =C2=A0 * @block_size: Maximum block size supported by the controller
> =C2=A0 * @nr_masters: Number of AHB masters supported by the controll=
er
> - * @data_width: Maximum data width supported by hardware per AHB
> master
> - *		(0 - 8bits, 1 - 16bits, ..., 5 - 256bits)
> + * @data_width: Maximum data width supported by hardware (in bytes)
> =C2=A0 */
> =C2=A0struct dw_dma_platform_data {
> =C2=A0	unsigned int	nr_channels;
> @@ -57,7 +56,7 @@ struct dw_dma_platform_data {
> =C2=A0	unsigned char	chan_priority;
> =C2=A0	unsigned short	block_size;
> =C2=A0	unsigned char	nr_masters;
> -	unsigned char	data_width[DW_DMA_MAX_NR_MASTERS];
> +	unsigned char	data_width;
> =C2=A0};
> =C2=A0
> =C2=A0#endif /* _PLATFORM_DATA_DMA_DW_H */

--=20
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
