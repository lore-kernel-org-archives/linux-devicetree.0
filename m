From: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 1/5] arm/dt: add basic mx51 device tree support
Date: Wed, 16 Mar 2011 11:34:24 +0800
Message-ID: <AANLkTimJUcsAc6Y2nf7fMWu=H1JW9ybrWZMtP3swWsu=@mail.gmail.com>
References: <1299733185-2172-1-git-send-email-jason.hui@linaro.org>
	<1299733185-2172-2-git-send-email-jason.hui@linaro.org>
	<20110315070342.GB23050@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <20110315070342.GB23050-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Grant,

On Tue, Mar 15, 2011 at 3:03 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> Hi Jason,
>
> Minor comments below.
>
> On Thu, Mar 10, 2011 at 12:59:41PM +0800, Jason Liu wrote:
>> Signed-off-by: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>
> This looks wrong. =A0You should only have one s-o-b line. =A0Use one email
> addr or the other. =A0Not both.

I just take the same approach as this link: https://lkml.org/lkml/2010/12/1=
7/363
If you think it's not applicable, I can change it.

>
>> ---
>> =A0arch/arm/mach-mx5/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A08 ++++
>> =A0arch/arm/mach-mx5/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
>> =A0arch/arm/mach-mx5/board-dt.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 65 ++++++++=
+++++++++++++++++++++++
>> =A0arch/arm/mach-mx5/clock-mx51-mx53.c =A0 =A0 | =A0 43 ++++++++++++++++=
++++-
>> =A0arch/arm/plat-mxc/include/mach/common.h | =A0 =A01 +
>> =A05 files changed, 117 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-mx5/Kconfig b/arch/arm/mach-mx5/Kconfig
>> index de4fa99..6438f87 100644
>> --- a/arch/arm/mach-mx5/Kconfig
>> +++ b/arch/arm/mach-mx5/Kconfig
>> @@ -47,6 +47,14 @@ config MACH_MX51_BABBAGE
>> =A0 =A0 =A0 =A0 u-boot. This includes specific configurations for the bo=
ard and its
>> =A0 =A0 =A0 =A0 peripherals.
>>
>> +config MACH_MX51_DT
>> + =A0 =A0 bool "Generic MX51 board (FDT support)"
>> + =A0 =A0 select USE_OF
>> + =A0 =A0 select SOC_IMX51
>> + =A0 =A0 help
>> + =A0 =A0 =A0Support for generic Freescale i.MX51 boards using Flattened=
 Device
>> + =A0 =A0 =A0Tree.
>> +
>> =A0config MACH_MX51_3DS
>> =A0 =A0 =A0 bool "Support MX51PDK (3DS)"
>> =A0 =A0 =A0 select SOC_IMX51
>> diff --git a/arch/arm/mach-mx5/Makefile b/arch/arm/mach-mx5/Makefile
>> index 0d43be9..540697e 100644
>> --- a/arch/arm/mach-mx5/Makefile
>> +++ b/arch/arm/mach-mx5/Makefile
>> @@ -18,3 +18,4 @@ obj-$(CONFIG_MACH_EUKREA_CPUIMX51SD) +=3D board-cpuimx=
51sd.o
>> =A0obj-$(CONFIG_MACH_EUKREA_MBIMXSD51_BASEBOARD) +=3D eukrea_mbimxsd-bas=
eboard.o
>> =A0obj-$(CONFIG_MACH_MX51_EFIKAMX) +=3D board-mx51_efikamx.o
>> =A0obj-$(CONFIG_MACH_MX50_RDP) +=3D board-mx50_rdp.o
>> +obj-$(CONFIG_MACH_MX51_DT) +=3D board-dt.o
>> diff --git a/arch/arm/mach-mx5/board-dt.c b/arch/arm/mach-mx5/board-dt.c
>> new file mode 100644
>> index 0000000..19c60a4
>> --- /dev/null
>> +++ b/arch/arm/mach-mx5/board-dt.c
>> @@ -0,0 +1,65 @@
>> +/*
>> + * Copyright 2011 Linaro Ltd.
>> + * Copyright 2011 Freescale Semiconductor, Inc.
>> + *
>> + * The code contained herein is licensed under the GNU General Public
>> + * License. You may obtain a copy of the GNU General Public License
>> + * Version 2 or later at the following locations:
>> + *
>> + * http://www.opensource.org/licenses/gpl-license.html
>> + * http://www.gnu.org/copyleft/gpl.html
>> + */
>> +
>> +#include <linux/err.h>
>> +#include <linux/init.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/of_fdt.h>
>> +
>> +#include <mach/common.h>
>> +#include <mach/hardware.h>
>> +#include <mach/imx-uart.h>
>> +#include <mach/iomux-mx51.h>
>> +
>> +#include <asm/irq.h>
>> +#include <asm/setup.h>
>> +#include <asm/mach-types.h>
>> +#include <asm/mach/arch.h>
>> +#include <asm/mach/time.h>
>> +
>> +#include "devices.h"
>> +
>> +static struct of_device_id mx51_dt_match_table[] __initdata =3D {
>> + =A0 =A0 { .compatible =3D "simple-bus", },
>> + =A0 =A0 {}
>> +};
>> +
>> +static void __init mx51_dt_board_init(void)
>> +{
>> + =A0 =A0 of_platform_bus_probe(NULL, mx51_dt_match_table, NULL);
>> +}
>> +
>> +static void __init mx51_dt_timer_init(void)
>> +{
>> + =A0 =A0 mx51_clocks_init(32768, 24000000, 22579200, 0);
>> + =A0 =A0 mx5_clk_dt_init();
>> +}
>> +
>> +static struct sys_timer mxc_timer =3D {
>> + =A0 =A0 .init =3D mx51_dt_timer_init,
>> +};
>> +
>> +static const char *mx51_dt_board_compat[] =3D {
>> + =A0 =A0 "fsl,mx51-babbage",
>> + =A0 =A0 NULL
>> +};
>> +
>> +DT_MACHINE_START(MX51_DT, "Freescale MX51 (Flattened Device Tree)")
>> + =A0 =A0 .boot_params =A0=3D PHYS_OFFSET + 0x100,
>
> You should be able to drop the .boot_params line.

OK,

>
>> + =A0 =A0 .map_io =A0 =A0 =A0 =3D mx51_map_io,
>> + =A0 =A0 .init_irq =A0 =A0 =3D mx51_init_irq,
>> + =A0 =A0 .init_machine =3D mx51_dt_board_init,
>> + =A0 =A0 .dt_compat =A0 =A0=3D mx51_dt_board_compat,
>> + =A0 =A0 .timer =A0 =A0 =A0 =A0=3D &mxc_timer,
>> +MACHINE_END
>> diff --git a/arch/arm/mach-mx5/clock-mx51-mx53.c b/arch/arm/mach-mx5/clo=
ck-mx51-mx53.c
>> index 0a19e75..dedb7f9 100644
>> --- a/arch/arm/mach-mx5/clock-mx51-mx53.c
>> +++ b/arch/arm/mach-mx5/clock-mx51-mx53.c
>> @@ -15,13 +15,19 @@
>> =A0#include <linux/clk.h>
>> =A0#include <linux/io.h>
>> =A0#include <linux/clkdev.h>
>> -
>> +#include <linux/err.h>
>> =A0#include <asm/div64.h>
>>
>> =A0#include <mach/hardware.h>
>> =A0#include <mach/common.h>
>> =A0#include <mach/clock.h>
>>
>> +#ifdef CONFIG_OF
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of_clk.h>
>> +#endif /* CONFIG_OF */
>
> You can drop the #ifdef CONFIG_OF here. =A0linux/of*.h is safe to
> include when CONFIG_OF is not selected.

OK,

>
>> +
>> =A0#include "crm_regs.h"
>>
>> =A0/* External clock values passed-in by the board code */
>> @@ -1432,3 +1438,38 @@ int __init mx53_clocks_init(unsigned long ckil, u=
nsigned long osc,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 MX53_INT_GPT);
>> =A0 =A0 =A0 return 0;
>> =A0}
>> +
>> +#ifdef CONFIG_OF
>> +static struct clk *mx5_dt_clk_get(struct device_node *np,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 const char *output_id, void *data)
>> +{
>> + =A0 =A0 return data;
>> +}
>> +
>> +static __init void mx5_dt_scan_clks(void)
>> +{
>> + =A0 =A0 struct device_node *node;
>> + =A0 =A0 struct clk *clk;
>> + =A0 =A0 const char *id;
>> + =A0 =A0 int rc;
>> +
>> + =A0 =A0 for_each_compatible_node(node, NULL, "clock") {
>> + =A0 =A0 =A0 =A0 =A0 =A0 id =3D of_get_property(node, "clock-outputs", =
NULL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!id)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 clk =3D clk_get_sys(id, NULL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (IS_ERR(clk))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 rc =3D of_clk_add_provider(node, mx5_dt_clk_ge=
t, clk);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (rc)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("error adding fixed clk=
 %s\n", node->name);
>> + =A0 =A0 }
>> +}
>> +
>> +void __init mx5_clk_dt_init(void)
>> +{
>> + =A0 =A0 mx5_dt_scan_clks();
>> +}
>> +#endif
>
> Nitpick: Would it make sense for these 3 functions to be in a separate .c=
 file?

I will do it. please check the new patch.

>
>> diff --git a/arch/arm/plat-mxc/include/mach/common.h b/arch/arm/plat-mxc=
/include/mach/common.h
>> index aea2cd3..a28e84a 100644
>> --- a/arch/arm/plat-mxc/include/mach/common.h
>> +++ b/arch/arm/plat-mxc/include/mach/common.h
>> @@ -58,4 +58,5 @@ extern void mxc91231_arch_reset(int, const char *);
>> =A0extern void mxc91231_prepare_idle(void);
>> =A0extern void mx51_efikamx_reset(void);
>> =A0extern int mx53_revision(void);
>> +extern void mx5_clk_dt_init(void);
>> =A0#endif
>> --
>> 1.7.1
>>
>>
>> _______________________________________________
>> linaro-dev mailing list
>> linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
>> http://lists.linaro.org/mailman/listinfo/linaro-dev
>
