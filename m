From: Biwen Li <biwen.li@nxp.com>
Subject: RE: [v2,1/3] soc: fsl: fix that flextimer cannot wakeup system in
 deep sleep on LS1021A
Date: Tue, 17 Sep 2019 05:18:49 +0000
Message-ID: <DB7PR04MB4490FE75A61224ACD6B8D75A8F8F0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190917044119.21895-1-biwen.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190917044119.21895-1-biwen.li@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Biwen Li <biwen.li@nxp.com>, Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi all,
	the linux patches depended by RCPM driver,FlexTimer driver and FlexTimer dts, need apply these patches as follows:

	1. RCPM driver:

		https://patchwork.kernel.org/series/162731/mbox/ (https://patchwork.kernel.org/patch/11105279/)

	2. FlexTimer dts:

		https://lore.kernel.org/patchwork/series/405653/mbox/ (https://lore.kernel.org/patchwork/patch/1112493/)

	3. FlexTimer driver:

		https://patchwork.ozlabs.org/series/124718/mbox/ (https://patchwork.ozlabs.org/patch/1145999/)

		https://patchwork.ozlabs.org/series/126942/mbox/ (https://patchwork.ozlabs.org/patch/1152085/)

	4. Adjust drivers/soc/fsl/Makefile:

   		remove the line 'obj-y += ftm_alarm.o' in drivers/soc/fsl/Makefile to resolve a compilation error

> Why:
>     - Cannot write register RCPM_IPPDEXPCR1 on LS1021A,
>       Register RCPM_IPPDEXPCR1's default value is zero.
>       So the register value that reading from register
>       RCPM_IPPDEXPCR1 is always zero.
> 
> How:
>     - Save register RCPM_IPPDEXPCR1's value to
>       register SCFG_SPARECR8.(uboot's psci also
>       need reading value from the register SCFG_SPARECR8
>       to set register RCPM_IPPDEXPCR1)
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v2:
> 	- fix stype problems
> 
>  drivers/soc/fsl/rcpm.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c index
> 82c0ad5e663e..0b710c24999c 100644
> --- a/drivers/soc/fsl/rcpm.c
> +++ b/drivers/soc/fsl/rcpm.c
> @@ -13,6 +13,8 @@
>  #include <linux/slab.h>
>  #include <linux/suspend.h>
>  #include <linux/kernel.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> 
>  #define RCPM_WAKEUP_CELL_MAX_SIZE	7
> 
> @@ -63,6 +65,31 @@ static int rcpm_pm_prepare(struct device *dev)
>  					tmp |= value[i + 1];
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
> +					struct regmap *rcpm_scfg_regmap = NULL;
> +					u32 reg_offset[RCPM_WAKEUP_CELL_MAX_SIZE + 1];
> +					u32 reg_value = 0;
> +
> +					rcpm_scfg_regmap =
> syscon_regmap_lookup_by_phandle(np, "fsl,rcpm-scfg");
> +					if (rcpm_scfg_regmap) {
> +						if (of_property_read_u32_array(dev->of_node,
> +						    "fsl,rcpm-scfg", reg_offset,
> rcpm->wakeup_cells + 1)) {
> +							rcpm_scfg_regmap = NULL;
> +							continue;
> +						}
> +						regmap_read(rcpm_scfg_regmap, reg_offset[i + 1],
> &reg_value);
> +						/* Write value to register SCFG_SPARECR8 */
> +						regmap_write(rcpm_scfg_regmap, reg_offset[i +
> 1], tmp | reg_value);
> +					}
> +				}
> +				#endif //CONFIG_SOC_LS1021A
>  			}
>  		}
>  	} while (ws = wakeup_source_get_next(ws));
> --
> 2.17.1
