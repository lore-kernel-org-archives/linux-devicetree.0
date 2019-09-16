From: Biwen Li <biwen.li@nxp.com>
Subject: RE: [1/3] soc: fsl: fix that flextimer cannot wakeup system in deep
 sleep on LS1021A
Date: Mon, 16 Sep 2019 10:48:44 +0000
Message-ID: <DB7PR04MB4490BF979AE65793A9C34E728F8C0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190916102556.16655-1-biwen.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190916102556.16655-1-biwen.li@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Biwen Li <biwen.li@nxp.com>, Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi all,
	the linux patch depended by RCPM driver,FlexTimer driver and FlexTimer dts=
, need apply these patches as follows:

	1. RCPM driver:

	https://patchwork.kernel.org/series/162731/mbox/ (https://patchwork.kernel=
.org/patch/11105279/)

	2. FlexTimer dts:

	https://lore.kernel.org/patchwork/series/405653/mbox/ (https://lore.kernel=
.org/patchwork/patch/1112493/)

	3. FlexTimer driver:

	https://patchwork.ozlabs.org/series/124718/mbox/ (https://patchwork.ozlabs=
.org/patch/1145999/)

	https://patchwork.ozlabs.org/series/126942/mbox/ (https://patchwork.ozlabs=
.org/patch/1152085/)

	4. Adjust drivers/soc/fsl/Makefile:

remove the line 'obj-y +=3D ftm_alarm.o' in drivers/soc/fsl/Makefile to res=
olve a compilation error=20
> Why:
>     - Cannot write register RCPM_IPPDEXPCR1 on LS1021A,
>       Register RCPM_IPPDEXPCR1's default value is zero.
>       So the register value that reading from register
>       RCPM_IPPDEXPCR1 is always zero.
>=20
> How:
>     - Save register RCPM_IPPDEXPCR1's value to
>       register SCFG_SPARECR8.(uboot's psci also
>       need reading value from the register SCFG_SPARECR8
>       to set register RCPM_IPPDEXPCR1)
>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  drivers/soc/fsl/rcpm.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c index
> 82c0ad5e663e..2bf37d38efe5 100644
> --- a/drivers/soc/fsl/rcpm.c
> +++ b/drivers/soc/fsl/rcpm.c
> @@ -13,6 +13,8 @@
>  #include <linux/slab.h>
>  #include <linux/suspend.h>
>  #include <linux/kernel.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
>=20
>  #define RCPM_WAKEUP_CELL_MAX_SIZE	7
>=20
> @@ -63,6 +65,33 @@ static int rcpm_pm_prepare(struct device *dev)
>  					tmp |=3D value[i + 1];
>  					iowrite32be(tmp, rcpm->ippdexpcr_base + i * 4);
>  				}
> +				#ifdef CONFIG_SOC_LS1021A
> +				/* Workaround: There is a bug of register ippdexpcr1,
> +				 * cannot write it but can read it.Tt's default value is zero,
> +				 * then read it will always returns zero.
> +				 * So save ippdexpcr1's value to register SCFG_SPARECR8.
> +				 * And the value of ippdexpcr1 will be read from
> SCFG_SPARECR8.
> +				 */
> +				{
> +					struct regmap * rcpm_scfg_regmap =3D NULL;
> +					u32 reg_offset[RCPM_WAKEUP_CELL_MAX_SIZE + 1];
> +					u32 reg_value =3D 0;
> +
> +					rcpm_scfg_regmap =3D
> syscon_regmap_lookup_by_phandle(np, "fsl,rcpm-scfg");
> +					if (rcpm_scfg_regmap) {
> +						if (of_property_read_u32_array(dev->of_node,
> +						    "fsl,rcpm-scfg", reg_offset,
> rcpm->wakeup_cells + 1)) {
> +							rcpm_scfg_regmap =3D NULL;
> +							continue;
> +						}
> +						regmap_read(rcpm_scfg_regmap, reg_offset[i + 1],
> &reg_value);
> +						/* Write value to register SCFG_SPARECR8 */
> +						regmap_write(rcpm_scfg_regmap, reg_offset[i +
> 1], tmp | reg_value);
> +					}
> +				}
> +				#endif
> +
> +
>  			}
>  		}
>  	} while (ws =3D wakeup_source_get_next(ws));
> --
> 2.17.1
