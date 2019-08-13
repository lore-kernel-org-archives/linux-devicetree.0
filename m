Return-Path: <SRS0=ix5Z=WJ=outlook.com=leiwang_git@kernel.org>
From: Lei Wang <leiwang_git@outlook.com>
Subject: Re: [PATCH v5 2/2] EDAC: add EDAC driver for DMC520
Date: Tue, 13 Aug 2019 01:05:02 +0000
Message-ID: 
 <BY5PR04MB659914AC91EBB3EAF72977BD86D20@BY5PR04MB6599.namprd04.prod.outlook.com>
References: 
 <BN6PR04MB1107CE3C2D666A806E62851B86C10@BN6PR04MB1107.namprd04.prod.outlook.com>
 <20190807144016.GA24328@zn.tnic>
In-Reply-To: <20190807144016.GA24328@zn.tnic>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <995CAA378AEA0D459C8171419A02686A@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Borislav Petkov <bp@alien8.de>
Cc: "james.morse@arm.com" <james.morse@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "sashal@kernel.org" <sashal@kernel.org>, "hangl@microsoft.com" <hangl@microsoft.com>, "lewan@microsoft.com" <lewan@microsoft.com>, "ruizhao@microsoft.com" <ruizhao@microsoft.com>
List-ID: <devicetree@vger.kernel.org>

Thanks Borislav! I addressed most of your comments. There are a few that=20
need your further feedback. Thanks!

>> +++ b/drivers/edac/dmc520_edac.c
>> @@ -0,0 +1,632 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/* EDAC driver for DMC-520 */
>=20
> That comment is kinda useless.
>=20

Added some more comments for the file:

/*
  * dmc520_edac.c, EDAC driver for DMC-520 memory controller
  *
  * Authors:	Rui Zhao <ruizhao@microsoft.com>
  * 		Lei Wang <lewan@microsoft.com>
  */

>=20
>> +{ \
>> +	struct mem_ctl_info *mci; \
>> +	struct dmc520_edac *edac; \
>> +	mci =3D data; \
>> +	edac =3D mci->pvt_info; \
>> +	return dmc520_edac_dram_all_isr(irq, mci, edac->interrupt_masks[index]=
); \
>> +}
>> +
>> +DECLARE_ISR(0)
>> +DECLARE_ISR(1)
>> +/* More DECLARE_ISR(index) can be added to support more interrupt lines=
. */
>> +
>> +irq_handler_t dmc520_isr_array[] =3D {
>> +	dmc520_isr_0,
>> +	dmc520_isr_1
>> +	/* More dmc520_isr_index can be added to support more interrupt lines.=
 */
>=20
> What are those comments really for?
>=20

These comments tell how to potentially expand the driver functions to=20
support more interrupts besides what are already here.

>> +
>> +	/* If in the future there are more supported interrupts in a different
>> +	 * platform, more condition statements can be added here for each
>> +	 * interrupt flag, together with its corresponding isr implementations=
.
>> +	 */
>=20
> This comment above is useless.
>=20
> Also, kernel comments style is:
>=20
> 	/*
> 	 * A sentence ending with a full-stop.
> 	 * Another sentence. ...
> 	 * More sentences. ...
> 	 */
>

As above comments, this comment is to guide potential future adding to=20
this driver to support other interrupts. I modified the comment format.

>> +
>> +	mci =3D edac_mc_alloc(dmc520_mc_idx++, ARRAY_SIZE(layers), layers,
>> +			    sizeof(struct dmc520_edac) + sizeof(u32) * nintr);
>> +	if (!mci) {
>> +		edac_printk(KERN_ERR, EDAC_MOD_NAME,
>> +			    "Failed to allocate memory for mc instance\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	edac =3D mci->pvt_info;
>> +	edac->reg_base =3D reg_base;
>> +	edac->nintr =3D nintr;
>> +	edac->interrupt_mask_all =3D 0;
>> +	spin_lock_init(&edac->ecc_lock);
>=20
> Move that checking...
>=20
>> +
>> +	ret =3D of_property_read_u32_array(dev->of_node, "interrupt-config",
>> +			edac->interrupt_masks, nintr);
>> +	if (ret) {
>> +		edac_printk(KERN_ERR, EDAC_MOD_NAME,
>> +			"Failed to get interrupt-config arrays.\n");
>> +		goto err_free_mc;
>> +	}
>> +
>> +	for (intr_index =3D 0; intr_index < nintr; ++intr_index) {
>> +		if (edac->interrupt_mask_all & edac->interrupt_masks[intr_index]) {
>> +			edac_printk(KERN_ERR, EDAC_MC,
>> +				"interrupt-config error: "
>> +				"element %d's interrupt mask %d has overlap.\n",
>> +				intr_index, edac->interrupt_masks[intr_index]);
>> +			goto err_free_mc;
>> +		}
>> +
>> +		edac->interrupt_mask_all |=3D edac->interrupt_masks[intr_index];
>> +	}
>> +
>> +	if ((edac->interrupt_mask_all | ALL_INT_MASK) !=3D ALL_INT_MASK) {
>> +		edac_printk(KERN_WARNING, EDAC_MOD_NAME,
>> +			"interrupt-config warning: "
>> +			"interrupt mask (0x%x) is not supported by dmc520 (0x%lx).\n",
>> +			edac->interrupt_mask_all, ALL_INT_MASK);
>> +	}
>> +	edac->interrupt_mask_all &=3D ALL_INT_MASK;
>> +
>> +	platform_set_drvdata(pdev, mci);
>=20
> ... up-to-here before the edac_mc_alloc() call so that you don't have to
> needlessly goto err_free_mc and free the memory you just allocated if
> any of those properties reading fails. IOW, do all your hw init first
> and then call edac_mc_alloc(), when you have everything needed.
>=20

After edac_mc_alloc(), if succeeds, the above code updates dmc520_edac=20
struct data. If moving edac_mc_alloc as suggested, I will need to use=20
local variables to store the data, and then after edac_mc_alloc() update=20
the dmc520_edac. By ordering this way, the dmc520_edac can be updated=20
directly.

Planning not fix.

>> +
>> +	mci->pdev =3D dev;
>> +	mci->mtype_cap =3D MEM_FLAG_DDR3 | MEM_FLAG_DDR4;
>> +	mci->edac_ctl_cap =3D EDAC_FLAG_NONE | EDAC_FLAG_SECDED;
>> +	mci->edac_cap =3D EDAC_FLAG_SECDED;
>> +	mci->scrub_cap =3D SCRUB_FLAG_HW_SRC;
>> +	mci->scrub_mode =3D dmc520_get_scrub_type(edac);
>> +	mci->ctl_name =3D EDAC_CTL_NAME;
>> +	mci->dev_name =3D dev_name(mci->pdev);
>> +	mci->mod_name =3D EDAC_MOD_NAME;
>> +	mci->ctl_page_to_phys =3D NULL;
>> +
>> +	edac_op_state =3D EDAC_OPSTATE_INT;
>> +
>> +	dmc520_init_csrow(mci);
>> +
>> +	ret =3D edac_mc_add_mc(mci);
>> +	if (ret) {
>> +		edac_printk(KERN_ERR, EDAC_MOD_NAME,
>> +			"Failed to register with EDAC core\n");
>> +		goto err_free_mc;
>> +	}
>> +
>> +	/* Clear interrupts, not affecting other unrelated interrupts */
>> +	reg_val =3D dmc520_read_reg(edac, REG_OFFSET_INTERRUPT_CONTROL);
>> +	dmc520_write_reg(edac, reg_val & (~(edac->interrupt_mask_all)),
>> +			REG_OFFSET_INTERRUPT_CONTROL);
>> +	dmc520_write_reg(edac, edac->interrupt_mask_all,
>> +			REG_OFFSET_INTERRUPT_CLR);
>> +
>> +	for (intr_index =3D 0; intr_index < nintr; ++intr_index) {
>> +		int irq_id =3D platform_get_irq(pdev, intr_index);
>> +
>> +		if (irq_id < 0) {
>> +			edac_printk(KERN_ERR, EDAC_MC,
>> +				    "Failed to get irq #%d\n", intr_index);
>> +			ret =3D -ENODEV;
>> +			goto err_free_irq;
>> +		}
>> +
>> +		ret =3D devm_request_irq(&pdev->dev, irq_id,
>> +				dmc520_isr_array[intr_index], IRQF_SHARED,
>> +				dev_name(&pdev->dev), mci);
>> +		if (ret < 0) {
>> +			edac_printk(KERN_ERR, EDAC_MC,
>> +				    "Failed to request irq %d\n", irq_id);
>> +			goto err_free_irq;
>> +		}
>> +
>> +		++nintr_registered;
>> +	}
>=20
> The same with this IRQ requesting and you'll save yourself the err_free_i=
rq too.

Do you mean having an array to keep all the irq_id, and then only=20
devm_request_irq on them if all of the platform_get_irq are success? Yes=20
that was one option I was thinking too when writing this part. But the #=20
of interrupts are not fixed and are read from the dt configuration and I=20
didn't want to use a fixed MAX array size for it. Also it adds a local=20
array to store the irq_id's. So eventually I favored this=20
implementation: platform_get_irq one interrupt, and devm_request_irq one=20
interrupt, in a loop.

Planning not fix.



Thanks again!

-Lei
