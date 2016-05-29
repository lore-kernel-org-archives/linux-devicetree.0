Return-Path: <bjdooks@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1464520323-19531-2-git-send-email-carlo@caione.org>
References: <1464520323-19531-1-git-send-email-carlo@caione.org>
	<1464520323-19531-2-git-send-email-carlo@caione.org>
Date: Sun, 29 May 2016 12:27:37 +0100
Message-ID: <CANe6Qb8ECk_1S=pyJBACUwSRyNUi7ROF-GvybcpYLTks4L38fg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] firmware: Amlogic: Add secure monitor driver
From: Ben Dooks <bjdooks@googlemail.com>
Content-Type: multipart/alternative; boundary=089e011609da58e1230533f96d7f
To: Carlo Caione <carlo@caione.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com, linux@endlessm.com, linux-arm-kernel@lists.infradead.org, Carlo Caione <carlo@endlessm.com>, robh+dt@kernel.org, linux-amlogic@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--089e011609da58e1230533f96d7f
Content-Type: text/plain; charset=UTF-8

On 29 May 2016 12:13, "Carlo Caione" <carlo@caione.org> wrote:
>
> From: Carlo Caione <carlo@endlessm.com>
>
> Introduce a driver to provide calls into secure monitor mode.
>
> In the Amlogic SoCs these calls are used for multiple reasons: access to
> NVMEM, set USB boot, enable JTAG, etc...
>
> Signed-off-by: Carlo Caione <carlo@endlessm.com>
> ---
>  drivers/firmware/Kconfig                |   1 +
>  drivers/firmware/Makefile               |   1 +
>  drivers/firmware/meson/Kconfig          |   8 ++
>  drivers/firmware/meson/Makefile         |   1 +
>  drivers/firmware/meson/meson_sm.c       | 223
++++++++++++++++++++++++++++++++
>  include/linux/firmware/meson/meson_sm.h |  32 +++++
>  6 files changed, 266 insertions(+)
>  create mode 100644 drivers/firmware/meson/Kconfig
>  create mode 100644 drivers/firmware/meson/Makefile
>  create mode 100644 drivers/firmware/meson/meson_sm.c
>  create mode 100644 include/linux/firmware/meson/meson_sm.h
>
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index 6664f11..686e395 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -199,5 +199,6 @@ config HAVE_ARM_SMCCC
>  source "drivers/firmware/broadcom/Kconfig"
>  source "drivers/firmware/google/Kconfig"
>  source "drivers/firmware/efi/Kconfig"
> +source "drivers/firmware/meson/Kconfig"
>
>  endmenu
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 474bada..fc4bb09 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_QCOM_SCM_32)     += qcom_scm-32.o
>  CFLAGS_qcom_scm-32.o :=$(call as-instr,.arch armv7-a\n.arch_extension
sec,-DREQUIRES_SEC=1) -march=armv7-a
>
>  obj-y                          += broadcom/
> +obj-y                          += meson/
>  obj-$(CONFIG_GOOGLE_FIRMWARE)  += google/
>  obj-$(CONFIG_EFI)              += efi/
>  obj-$(CONFIG_UEFI_CPER)                += efi/
> diff --git a/drivers/firmware/meson/Kconfig
b/drivers/firmware/meson/Kconfig
> new file mode 100644
> index 0000000..fff11a3
> --- /dev/null
> +++ b/drivers/firmware/meson/Kconfig
> @@ -0,0 +1,8 @@
> +#
> +# Amlogic Secure Monitor driver
> +#
> +config MESON_SM
> +       bool
> +       default ARCH_MESON
> +       help
> +         Say y here to enable the Amlogic secure monitor driver
> diff --git a/drivers/firmware/meson/Makefile
b/drivers/firmware/meson/Makefile
> new file mode 100644
> index 0000000..9ab3884
> --- /dev/null
> +++ b/drivers/firmware/meson/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_MESON_SM) +=      meson_sm.o
> diff --git a/drivers/firmware/meson/meson_sm.c
b/drivers/firmware/meson/meson_sm.c
> new file mode 100644
> index 0000000..e1ce487
> --- /dev/null
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -0,0 +1,223 @@
> +/*
> + * Amlogic Secure Monitor driver
> + *
> + * Copyright (C) 2016 Endless Mobile, Inc.
> + * Author: Carlo Caione <carlo@endlessm.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * version 2 as published by the Free Software Foundation.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <stdarg.h>
> +#include <asm/cacheflush.h>
> +#include <asm/compiler.h>
> +#include <linux/arm-smccc.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/smp.h>
> +#include <linux/firmware/meson/meson_sm.h>
> +
> +struct meson_sm_cmd {
> +       unsigned int index;
> +       u32 smc_id;
> +};
> +#define CMD(d, s) { .index = (d), .smc_id = (s), }
> +
> +struct meson_sm_chip {
> +       unsigned int shmem_size;
> +       u32 cmd_shmem_in_base;
> +       u32 cmd_shmem_out_base;
> +       struct meson_sm_cmd cmd[];
> +};
> +
> +struct meson_sm_firmware {
> +       struct device *dev;
> +       const struct meson_sm_chip *chip;
> +       void __iomem *sm_shmem_in_base;
> +       void __iomem *sm_shmem_out_base;
> +};
> +
> +struct meson_sm_chip gxbb_chip = {
> +       .shmem_size             = 0x1000,
> +       .cmd_shmem_in_base      = 0x82000020,
> +       .cmd_shmem_out_base     = 0x82000021,
> +       .cmd = {
> +               CMD(SM_EFUSE_READ,      0x82000030),
> +               CMD(SM_EFUSE_WRITE,     0x82000031),
> +               CMD(SM_EFUSE_USER_MAX,  0x82000033),
> +               { /* sentinel */ },
> +       },
> +};
> +
> +static u32 meson_sm_get_cmd(const struct meson_sm_chip *chip, unsigned
int cmd_index)
> +{
> +       unsigned int i;
> +
> +       for (i = 0; chip->cmd[i].smc_id; i++)
> +               if (chip->cmd[i].index == cmd_index)
> +                       return chip->cmd[i].smc_id;
> +
> +       return 0;
> +}
> +
> +static u32 __meson_sm_call(u32 cmd, u32 arg0, u32 arg1, u32 arg2, u32
arg3, u32 arg4)
> +{
> +       struct arm_smccc_res res;
> +
> +       arm_smccc_smc(cmd, arg0, arg1, arg2, arg3, arg4, 0, 0, &res);
> +       return res.a0;
> +}
> +
> +u32 meson_sm_call(struct meson_sm_firmware *fw, unsigned int cmd_index,
> +                 u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4)
> +{
> +       u32 cmd;
> +
> +       if (!fw)
> +               return -EINVAL;
> +
> +       cmd = meson_sm_get_cmd(fw->chip, cmd_index);
> +       if (!cmd)
> +               return -EINVAL;
> +
> +       return __meson_sm_call(cmd, arg0, arg1, arg2, arg3, arg4);
> +}
> +EXPORT_SYMBOL(meson_sm_call);
> +
> +u32 meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
> +                      unsigned int cmd_index, u32 arg0, u32 arg1,
> +                      u32 arg2, u32 arg3, u32 arg4)
> +{
> +       u32 size;
> +
> +       if (!fw->chip->cmd_shmem_out_base)
> +               return -EINVAL;
> +
> +       size = meson_sm_call(fw, cmd_index, arg0, arg1, arg2, arg3, arg4);
> +       if (size <= 0 || size > fw->chip->shmem_size)
> +               return -EINVAL;
> +
u32 cannot be less than 0

> +       memcpy(buffer, fw->sm_shmem_out_base, size);
> +
> +       return size;
> +}
> +EXPORT_SYMBOL(meson_sm_call_read);
> +
> +u32 meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,
> +                       unsigned int b_size, unsigned int cmd_index,
> +                       u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4)
> +{
> +       u32 size;
> +
> +       if (b_size > fw->chip->shmem_size)
> +               return -EINVAL;
> +
> +       if (!fw->chip->cmd_shmem_in_base)
> +               return -EINVAL;
> +
> +       memcpy(fw->sm_shmem_in_base, buffer, b_size);
> +
> +       size = meson_sm_call(fw, cmd_index, arg0, arg1, arg2, arg3, arg4);
> +       if (size <= 0)
> +               return -EINVAL;
> +
> +       return size;
> +}
> +EXPORT_SYMBOL(meson_sm_call_write);
> +
> +static void __iomem *meson_sm_map_shmem(u32 cmd_shmem, unsigned int size)
> +{
> +       u32 sm_phy_base;
> +
> +       sm_phy_base = __meson_sm_call(cmd_shmem, 0, 0, 0, 0, 0);
> +       if (!sm_phy_base)
> +               return 0;
> +
> +       return ioremap_cache(sm_phy_base, size);
> +}
> +
> +static int meson_sm_probe(struct platform_device *pdev)
> +{
> +       const struct meson_sm_chip *chip;
> +       struct meson_sm_firmware *fw;
> +
> +       fw = devm_kzalloc(&pdev->dev, sizeof(*fw), GFP_KERNEL);
> +       if (!fw)
> +               return -ENOMEM;
> +
> +       fw->dev = &pdev->dev;
> +
> +       chip = of_device_get_match_data(fw->dev);
> +       if (!chip) {
> +               dev_err(fw->dev, "Unable to setup secure-monitor data\n");
> +               return -ENODEV;
> +       }
-ENODEV not best return here. Return -EINVAL better. -ENODEV won't get
reported by device layer

> +       if (chip->cmd_shmem_in_base) {
> +               fw->sm_shmem_in_base =
meson_sm_map_shmem(chip->cmd_shmem_in_base,
> +
 chip->shmem_size);
> +               if (!fw->sm_shmem_in_base)
> +                       goto out;
> +       }
  Maybe use WarnOn here
> +       if (chip->cmd_shmem_out_base) {
> +               fw->sm_shmem_out_base =
meson_sm_map_shmem(chip->cmd_shmem_out_base,
> +
chip->shmem_size);
> +               if (!fw->sm_shmem_out_base)
> +                       goto out;
> +       }
> +
> +       fw->chip = chip;
> +       platform_set_drvdata(pdev, fw);
> +
> +       dev_info(fw->dev, "secure-monitor enabled\n");
> +
> +       return 0;
> +
> +out:
> +       if (fw->sm_shmem_in_base)
> +               iounmap(fw->sm_shmem_in_base);
> +
> +       return -EINVAL;
> +}
> +
> +struct meson_sm_firmware *meson_sm_get_fw(struct device_node
*firmware_node)
> +{
> +       struct platform_device *pdev =
of_find_device_by_node(firmware_node);
> +
> +       /*
> +        * Returns NULL is the firmware device is not ready.
> +        */
> +       if (!pdev)
> +               return NULL;
> +
> +       return platform_get_drvdata(pdev);
> +}
> +EXPORT_SYMBOL(meson_sm_get_fw);
> +
> +static const struct of_device_id meson_sm_ids[] = {
> +       { .compatible = "amlogic,meson-gxbb-sm", .data = &gxbb_chip },
> +       { /* sentinel */},
> +};
> +MODULE_DEVICE_TABLE(of, meson_sm_ids);
> +
> +static struct platform_driver meson_sm_platform_driver = {
> +       .probe  = meson_sm_probe,
> +       .driver = {
> +               .name           = "secure-monitor",
> +               .of_match_table = meson_sm_ids,
> +       },
> +};
> +module_platform_driver(meson_sm_platform_driver);
> +
> +MODULE_AUTHOR("Carlo Caione <carlo@endlessm.com>");
> +MODULE_DESCRIPTION("Amlogic secure monitor driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/firmware/meson/meson_sm.h
b/include/linux/firmware/meson/meson_sm.h
> new file mode 100644
> index 0000000..f653916
> --- /dev/null
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -0,0 +1,32 @@
> +/*
> + * Copyright (C) 2016 Endless Mobile, Inc.
> + * Author: Carlo Caione <carlo@endlessm.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * version 2 as published by the Free Software Foundation.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef _MESON_SM_FW_H_
> +#define _MESON_SM_FW_H_
> +
> +#define SM_EFUSE_READ          0
> +#define SM_EFUSE_WRITE         1
> +#define SM_EFUSE_USER_MAX      2
> +
> +struct meson_sm_firmware;
> +
> +u32 meson_sm_call(struct meson_sm_firmware *fw, unsigned int cmd_index,
> +                 u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4);
> +u32 meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,
> +                       unsigned int b_size, unsigned int cmd_index,
> +                       u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4);
> +u32 meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
> +                      unsigned int cmd_index, u32 arg0, u32 arg1,
> +                      u32 arg2, u32 arg3, u32 arg4);
> +struct meson_sm_firmware *meson_sm_get_fw(struct device_node
*firmware_node);
> +
> +#endif /* _MESON_SM_FW_H_ */
> --
> 2.7.4
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

--089e011609da58e1230533f96d7f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 29 May 2016 12:13, &quot;Carlo Caione&quot; &lt;<a href=3D"mailto:carlo@=
caione.org">carlo@caione.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Carlo Caione &lt;<a href=3D"mailto:carlo@endlessm.com">carlo@end=
lessm.com</a>&gt;<br>
&gt;<br>
&gt; Introduce a driver to provide calls into secure monitor mode.<br>
&gt;<br>
&gt; In the Amlogic SoCs these calls are used for multiple reasons: access =
to<br>
&gt; NVMEM, set USB boot, enable JTAG, etc...<br>
&gt;<br>
&gt; Signed-off-by: Carlo Caione &lt;<a href=3D"mailto:carlo@endlessm.com">=
carlo@endlessm.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0drivers/firmware/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; =C2=A0drivers/firmware/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; =C2=A0drivers/firmware/meson/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A08 ++<br>
&gt; =C2=A0drivers/firmware/meson/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
&gt; =C2=A0drivers/firmware/meson/meson_sm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 22=
3 ++++++++++++++++++++++++++++++++<br>
&gt; =C2=A0include/linux/firmware/meson/meson_sm.h |=C2=A0 32 +++++<br>
&gt; =C2=A06 files changed, 266 insertions(+)<br>
&gt; =C2=A0create mode 100644 drivers/firmware/meson/Kconfig<br>
&gt; =C2=A0create mode 100644 drivers/firmware/meson/Makefile<br>
&gt; =C2=A0create mode 100644 drivers/firmware/meson/meson_sm.c<br>
&gt; =C2=A0create mode 100644 include/linux/firmware/meson/meson_sm.h<br>
&gt;<br>
&gt; diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig<br>
&gt; index 6664f11..686e395 100644<br>
&gt; --- a/drivers/firmware/Kconfig<br>
&gt; +++ b/drivers/firmware/Kconfig<br>
&gt; @@ -199,5 +199,6 @@ config HAVE_ARM_SMCCC<br>
&gt; =C2=A0source &quot;drivers/firmware/broadcom/Kconfig&quot;<br>
&gt; =C2=A0source &quot;drivers/firmware/google/Kconfig&quot;<br>
&gt; =C2=A0source &quot;drivers/firmware/efi/Kconfig&quot;<br>
&gt; +source &quot;drivers/firmware/meson/Kconfig&quot;<br>
&gt;<br>
&gt; =C2=A0endmenu<br>
&gt; diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile<br>
&gt; index 474bada..fc4bb09 100644<br>
&gt; --- a/drivers/firmware/Makefile<br>
&gt; +++ b/drivers/firmware/Makefile<br>
&gt; @@ -21,6 +21,7 @@ obj-$(CONFIG_QCOM_SCM_32)=C2=A0 =C2=A0 =C2=A0+=3D qc=
om_scm-32.o<br>
&gt; =C2=A0CFLAGS_qcom_scm-32.o :=3D$(call as-instr,.arch armv7-a\n.arch_ex=
tension sec,-DREQUIRES_SEC=3D1) -march=3Darmv7-a<br>
&gt;<br>
&gt; =C2=A0obj-y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D broadcom/<br>
&gt; +obj-y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D meson/<br>
&gt; =C2=A0obj-$(CONFIG_GOOGLE_FIRMWARE)=C2=A0 +=3D google/<br>
&gt; =C2=A0obj-$(CONFIG_EFI)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 +=3D efi/<br>
&gt; =C2=A0obj-$(CONFIG_UEFI_CPER)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 +=3D efi/<br>
&gt; diff --git a/drivers/firmware/meson/Kconfig b/drivers/firmware/meson/K=
config<br>
&gt; new file mode 100644<br>
&gt; index 0000000..fff11a3<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/firmware/meson/Kconfig<br>
&gt; @@ -0,0 +1,8 @@<br>
&gt; +#<br>
&gt; +# Amlogic Secure Monitor driver<br>
&gt; +#<br>
&gt; +config MESON_SM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default ARCH_MESON<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Say y here to enable the Amlogic se=
cure monitor driver<br>
&gt; diff --git a/drivers/firmware/meson/Makefile b/drivers/firmware/meson/=
Makefile<br>
&gt; new file mode 100644<br>
&gt; index 0000000..9ab3884<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/firmware/meson/Makefile<br>
&gt; @@ -0,0 +1 @@<br>
&gt; +obj-$(CONFIG_MESON_SM) +=3D=C2=A0 =C2=A0 =C2=A0 meson_sm.o<br>
&gt; diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meso=
n/meson_sm.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..e1ce487<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/firmware/meson/meson_sm.c<br>
&gt; @@ -0,0 +1,223 @@<br>
&gt; +/*<br>
&gt; + * Amlogic Secure Monitor driver<br>
&gt; + *<br>
&gt; + * Copyright (C) 2016 Endless Mobile, Inc.<br>
&gt; + * Author: Carlo Caione &lt;<a href=3D"mailto:carlo@endlessm.com">car=
lo@endlessm.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or<br>
&gt; + * modify it under the terms of the GNU General Public License<br>
&gt; + * version 2 as published by the Free Software Foundation.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License<=
br>
&gt; + * along with this program. If not, see &lt;<a href=3D"http://www.gnu=
.org/licenses/">http://www.gnu.org/licenses/</a>&gt;.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;stdarg.h&gt;<br>
&gt; +#include &lt;asm/cacheflush.h&gt;<br>
&gt; +#include &lt;asm/compiler.h&gt;<br>
&gt; +#include &lt;linux/arm-smccc.h&gt;<br>
&gt; +#include &lt;linux/io.h&gt;<br>
&gt; +#include &lt;linux/ioport.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +#include &lt;linux/of.h&gt;<br>
&gt; +#include &lt;linux/of_device.h&gt;<br>
&gt; +#include &lt;linux/smp.h&gt;<br>
&gt; +#include &lt;linux/firmware/meson/meson_sm.h&gt;<br>
&gt; +<br>
&gt; +struct meson_sm_cmd {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int index;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 smc_id;<br>
&gt; +};<br>
&gt; +#define CMD(d, s) { .index =3D (d), .smc_id =3D (s), }<br>
&gt; +<br>
&gt; +struct meson_sm_chip {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int shmem_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 cmd_shmem_in_base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 cmd_shmem_out_base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct meson_sm_cmd cmd[];<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct meson_sm_firmware {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct meson_sm_chip *chip;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *sm_shmem_in_base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *sm_shmem_out_base;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct meson_sm_chip gxbb_chip =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.shmem_size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D 0x1000,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.cmd_shmem_in_base=C2=A0 =C2=A0 =C2=A0 =3D=
 0x82000020,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.cmd_shmem_out_base=C2=A0 =C2=A0 =C2=A0=3D=
 0x82000021,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.cmd =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CMD(SM_EFUSE_R=
EAD,=C2=A0 =C2=A0 =C2=A0 0x82000030),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CMD(SM_EFUSE_W=
RITE,=C2=A0 =C2=A0 =C2=A00x82000031),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CMD(SM_EFUSE_U=
SER_MAX,=C2=A0 0x82000033),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ /* sentinel =
*/ },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +static u32 meson_sm_get_cmd(const struct meson_sm_chip *chip, unsigne=
d int cmd_index)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; chip-&gt;cmd[i].smc_id; i++)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (chip-&gt;c=
md[i].index =3D=3D cmd_index)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return chip-&gt;cmd[i].smc_id;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u32 __meson_sm_call(u32 cmd, u32 arg0, u32 arg1, u32 arg2, u32=
 arg3, u32 arg4)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct arm_smccc_res res;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0arm_smccc_smc(cmd, arg0, arg1, arg2, arg3,=
 arg4, 0, 0, &amp;res);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return res.a0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +u32 meson_sm_call(struct meson_sm_firmware *fw, unsigned int cmd_inde=
x,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 arg=
0, u32 arg1, u32 arg2, u32 arg3, u32 arg4)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 cmd;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fw)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D meson_sm_get_cmd(fw-&gt;chip, cmd_=
index);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cmd)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return __meson_sm_call(cmd, arg0, arg1, ar=
g2, arg3, arg4);<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL(meson_sm_call);<br>
&gt; +<br>
&gt; +u32 meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 unsigned int cmd_index, u32 arg0, u32 arg1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 u32 arg2, u32 arg3, u32 arg4)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fw-&gt;chip-&gt;cmd_shmem_out_base)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D meson_sm_call(fw, cmd_index, arg0=
, arg1, arg2, arg3, arg4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (size &lt;=3D 0 || size &gt; fw-&gt;chi=
p-&gt;shmem_size)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
u32 cannot be less than 0</p>
<p dir=3D"ltr">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(buffer, fw-&gt;sm_sh=
mem_out_base, size);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return size;<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL(meson_sm_call_read);<br>
&gt; +<br>
&gt; +u32 meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0unsigned int b_size, unsigned int cmd_index,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (b_size &gt; fw-&gt;chip-&gt;shmem_size=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fw-&gt;chip-&gt;cmd_shmem_in_base)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(fw-&gt;sm_shmem_in_base, buffer, b_=
size);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D meson_sm_call(fw, cmd_index, arg0=
, arg1, arg2, arg3, arg4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (size &lt;=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return size;<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL(meson_sm_call_write);<br>
&gt; +<br>
&gt; +static void __iomem *meson_sm_map_shmem(u32 cmd_shmem, unsigned int s=
ize)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 sm_phy_base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sm_phy_base =3D __meson_sm_call(cmd_shmem,=
 0, 0, 0, 0, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!sm_phy_base)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return ioremap_cache(sm_phy_base, size);<b=
r>
&gt; +}<br>
&gt; +<br>
&gt; +static int meson_sm_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct meson_sm_chip *chip;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct meson_sm_firmware *fw;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fw =3D devm_kzalloc(&amp;pdev-&gt;dev, siz=
eof(*fw), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fw)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fw-&gt;dev =3D &amp;pdev-&gt;dev;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip =3D of_device_get_match_data(fw-&gt;d=
ev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!chip) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(fw-&gt=
;dev, &quot;Unable to setup secure-monitor data\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-ENODEV not best return here. Return -EINVAL better. -ENODEV won&#39;t get =
reported by device layer</p>
<p dir=3D"ltr">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (chip-&gt;cmd_shmem_in_b=
ase) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fw-&gt;sm_shme=
m_in_base =3D meson_sm_map_shmem(chip-&gt;cmd_shmem_in_base,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;shmem_s=
ize);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fw-&gt;sm=
_shmem_in_base)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 Maybe use WarnOn here <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (chip-&gt;cmd_shmem_out_base) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fw-&gt;sm_shme=
m_out_base =3D meson_sm_map_shmem(chip-&gt;cmd_shmem_out_base,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chip-&gt;shmem_=
size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fw-&gt;sm=
_shmem_out_base)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fw-&gt;chip =3D chip;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, fw);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(fw-&gt;dev, &quot;secure-monitor =
enabled\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +out:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fw-&gt;sm_shmem_in_base)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(fw-&gt=
;sm_shmem_in_base);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +}<br>
&gt; +<br>
&gt; +struct meson_sm_firmware *meson_sm_get_fw(struct device_node *firmwar=
e_node)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D of_find_d=
evice_by_node(firmware_node);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Returns NULL is the firmware device is =
not ready.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pdev)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return platform_get_drvdata(pdev);<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL(meson_sm_get_fw);<br>
&gt; +<br>
&gt; +static const struct of_device_id meson_sm_ids[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;amlogic,meson-gxbb=
-sm&quot;, .data =3D &amp;gxbb_chip },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ /* sentinel */},<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, meson_sm_ids);<br>
&gt; +<br>
&gt; +static struct platform_driver meson_sm_platform_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =3D meson_sm_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;secure-monitor&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_tabl=
e =3D meson_sm_ids,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +module_platform_driver(meson_sm_platform_driver);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Carlo Caione &lt;<a href=3D"mailto:carlo@endlessm=
.com">carlo@endlessm.com</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;Amlogic secure monitor driver&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL&quot;);<br>
&gt; diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/f=
irmware/meson/meson_sm.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..f653916<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/linux/firmware/meson/meson_sm.h<br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2016 Endless Mobile, Inc.<br>
&gt; + * Author: Carlo Caione &lt;<a href=3D"mailto:carlo@endlessm.com">car=
lo@endlessm.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or<br>
&gt; + * modify it under the terms of the GNU General Public License<br>
&gt; + * version 2 as published by the Free Software Foundation.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License<=
br>
&gt; + * along with this program. If not, see &lt;<a href=3D"http://www.gnu=
.org/licenses/">http://www.gnu.org/licenses/</a>&gt;.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef _MESON_SM_FW_H_<br>
&gt; +#define _MESON_SM_FW_H_<br>
&gt; +<br>
&gt; +#define SM_EFUSE_READ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
&gt; +#define SM_EFUSE_WRITE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
&gt; +#define SM_EFUSE_USER_MAX=C2=A0 =C2=A0 =C2=A0 2<br>
&gt; +<br>
&gt; +struct meson_sm_firmware;<br>
&gt; +<br>
&gt; +u32 meson_sm_call(struct meson_sm_firmware *fw, unsigned int cmd_inde=
x,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 arg=
0, u32 arg1, u32 arg2, u32 arg3, u32 arg4);<br>
&gt; +u32 meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0unsigned int b_size, unsigned int cmd_index,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4);<br>
&gt; +u32 meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 unsigned int cmd_index, u32 arg0, u32 arg1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 u32 arg2, u32 arg3, u32 arg4);<br>
&gt; +struct meson_sm_firmware *meson_sm_get_fw(struct device_node *firmwar=
e_node);<br>
&gt; +<br>
&gt; +#endif /* _MESON_SM_FW_H_ */<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; linux-amlogic mailing list<br>
&gt; <a href=3D"mailto:linux-amlogic@lists.infradead.org">linux-amlogic@lis=
ts.infradead.org</a><br>
&gt; <a href=3D"http://lists.infradead.org/mailman/listinfo/linux-amlogic">=
http://lists.infradead.org/mailman/listinfo/linux-amlogic</a><br>
</p>

--089e011609da58e1230533f96d7f--
