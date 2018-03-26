Return-Path: <SRS0=K8ep=GQ=gmail.com=andyshrk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1518091958-3672-1-git-send-email-andy.yan@rock-chips.com>
References: <1518091958-3672-1-git-send-email-andy.yan@rock-chips.com>
From: Andy Yan <andyshrk@gmail.com>
Date: Mon, 26 Mar 2018 16:45:51 +0800
Message-ID: <CANbgqATUeBas=nLZ6EKbW4iHDSrEBEKJZT3AEHDTg6XprBJw5Q@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] Add Rockchip SFC(serial flash controller) support
Content-Type: multipart/alternative; boundary="f403043d0f881e6da205684ccd3f"
To: marek.vasut@gmail.com
Cc: cyrille.pitchen@wedev4u.fr, mchehab@kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org, shawn.lin@rock-chips.com, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com, Andy Yan <andy.yan@rock-chips.com>
List-ID: <devicetree@vger.kernel.org>

--f403043d0f881e6da205684ccd3f
Content-Type: text/plain; charset="UTF-8"

Hi Boris, Marek:
     Since Cyrille has been offline for spi-nor for a long time, would you
please give some advice for this driver?

2018-02-08 20:12 GMT+08:00 Andy Yan <andy.yan@rock-chips.com>:

>
> This is try to support SFC found on Rockchip RV1108 platform.
> Thanks for Cyrille's review, this version trys to address all
> his concern in V7 [0].
>
> Feature:
> (1) Support x1, x2, x4 data bits mode
> (2) Support up to 4 chip select
> (3) Support two independent clock domain: AHB clock and SPI clock
> (4) Support DMA master up to 16KB - 1 transfer
>
> Test environment:
> This patchset was tested on RK1108 evb boards with Winboud w25q256,
> Gigadevice GD25Q256, working fine with squashfs and jffs2.
>
> [0] http://patchwork.ozlabs.org/patch/793292/
>
> Changes in v8:
> - remove unused macro SFC_CMD_TRAN_BYTES_MASK
> - set max transfer length to 15.5KB
> - remove unnecessary buffer align check
> - remove the duplicate logic what spi-nor.c already does for spi_nor_write
> - add spi_nor_erase, as the SFC should get the erase address.
>
> Changes in v7:
> - correct the fifo status check in pio read/write mode.
> - copy data from user buffer to dma buffer
>
> Changes in v6:
> - fold in Andy's improvement for checking fifo level
>   before pio read
> - rename the controller to rv1108 since offically it's
>   renamed and acked by Rob.
> - use dma_coerce_mask_and_coherent suggested by Andy.
>
> Changes in v5:
> - check if the buf is aligned to 32bit
> - check if the buf for dma comes from vmalloc
> - fix to use 1-1-n according to the current framework
> - avoid bytes cnt overflow
>
> Changes in v4:
> - use uppercase DMA for description
> - simplify the code of get_if_type
> - use dma_dir to simplify the code
> - simplify the rockchip_sfc_do_rd_wr
> - some minor improvements
> - add reset controller when doing resume
>
> Changes in v3:
> - use io{read32,write32}_rep to simplify the corner cases
> - remove more unnecessary bit definitions
> - some minor comment fixes and improvement
> - fix wrong unregister function
> - unify more code
> - use nor to avoid constantly replicating the whole
>   sfc->flash[sfc->num_chip].nor
> - add email for MODULE_AUTHOR
> - remove #if 1 --- #endif
> - extract DMA code to imporve the code structure
> - reset all when failing to do dma
> - pass sfc to get_if_type
> - rename sfc-no-dma to sfc-no-DMA
>
> Changes in v2:
> - fix typos
> - add some comment for buffer and others operations
> - rename SFC_MAX_CHIP_NUM to MAX_CHIPSELECT_NUM
> - use u8 for cs
> - return -EINVAL for default case of get_if_type
> - use readl_poll_*() to check timeout cases
> - simplify and clarify some condition checks
> - rework the bitshifts to simplify the code
> - define SFC_CMD_DUMMY(x)
> - fix ummap for dma read path and finish all the
>   cache maintenance.
> - rename to rockchip_sfc_chip_priv and embed struct spi_nor
>   in it.
> - add MODULE_AUTHOR
> - add runtime PM and general PM support.
> - Thanks for Marek's comments. Link:
>   http://lists.infradead.org/pipermail/linux-mtd/2016-November/070321.html
>
> Andy Yan (1):
>   ARM: dts: rockchip: enable sfc for rv1108 evb
>
> Shawn Lin (2):
>   mtd: spi-nor: Bindings for Rockchip serial flash controller
>   mtd: spi-nor: add rockchip serial flash controller driver
>
>  .../devicetree/bindings/mtd/rockchip-sfc.txt       |  31 +
>  MAINTAINERS                                        |   9 +
>  arch/arm/boot/dts/rv1108-evb.dts                   |  10 +
>  arch/arm/boot/dts/rv1108.dtsi                      |  13 +
>  drivers/mtd/spi-nor/Kconfig                        |   7 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/rockchip-sfc.c                 | 942
> +++++++++++++++++++++
>  7 files changed, 1013 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
>  create mode 100644 drivers/mtd/spi-nor/rockchip-sfc.c
>
> --
> 2.7.4
>
>
>

--f403043d0f881e6da205684ccd3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Boris, Marek:<div>=C2=A0 =C2=A0 =C2=A0Since Cyrille has=
 been offline for spi-nor for a long time, would you please give some advic=
e for this driver?</div></div><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">2018-02-08 20:12 GMT+08:00 Andy Yan <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:andy.yan@rock-chips.com" target=3D"_blank">andy.yan@rock-chip=
s.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
This is try to support SFC found on Rockchip RV1108 platform.<br>
Thanks for Cyrille&#39;s review, this version trys to address all<br>
his concern in V7 [0].<br>
<br>
Feature:<br>
(1) Support x1, x2, x4 data bits mode<br>
(2) Support up to 4 chip select<br>
(3) Support two independent clock domain: AHB clock and SPI clock<br>
(4) Support DMA master up to 16KB - 1 transfer<br>
<br>
Test environment:<br>
This patchset was tested on RK1108 evb boards with Winboud w25q256,<br>
Gigadevice GD25Q256, working fine with squashfs and jffs2.<br>
<br>
[0] <a href=3D"http://patchwork.ozlabs.org/patch/793292/" rel=3D"noreferrer=
" target=3D"_blank">http://patchwork.ozlabs.org/<wbr>patch/793292/</a><br>
<br>
Changes in v8:<br>
- remove unused macro SFC_CMD_TRAN_BYTES_MASK<br>
- set max transfer length to 15.5KB<br>
- remove unnecessary buffer align check<br>
- remove the duplicate logic what spi-nor.c already does for spi_nor_write<=
br>
- add spi_nor_erase, as the SFC should get the erase address.<br>
<br>
Changes in v7:<br>
- correct the fifo status check in pio read/write mode.<br>
- copy data from user buffer to dma buffer<br>
<br>
Changes in v6:<br>
- fold in Andy&#39;s improvement for checking fifo level<br>
=C2=A0 before pio read<br>
- rename the controller to rv1108 since offically it&#39;s<br>
=C2=A0 renamed and acked by Rob.<br>
- use dma_coerce_mask_and_coherent suggested by Andy.<br>
<br>
Changes in v5:<br>
- check if the buf is aligned to 32bit<br>
- check if the buf for dma comes from vmalloc<br>
- fix to use 1-1-n according to the current framework<br>
- avoid bytes cnt overflow<br>
<br>
Changes in v4:<br>
- use uppercase DMA for description<br>
- simplify the code of get_if_type<br>
- use dma_dir to simplify the code<br>
- simplify the rockchip_sfc_do_rd_wr<br>
- some minor improvements<br>
- add reset controller when doing resume<br>
<br>
Changes in v3:<br>
- use io{read32,write32}_rep to simplify the corner cases<br>
- remove more unnecessary bit definitions<br>
- some minor comment fixes and improvement<br>
- fix wrong unregister function<br>
- unify more code<br>
- use nor to avoid constantly replicating the whole<br>
=C2=A0 sfc-&gt;flash[sfc-&gt;num_chip].nor<br>
- add email for MODULE_AUTHOR<br>
- remove #if 1 --- #endif<br>
- extract DMA code to imporve the code structure<br>
- reset all when failing to do dma<br>
- pass sfc to get_if_type<br>
- rename sfc-no-dma to sfc-no-DMA<br>
<br>
Changes in v2:<br>
- fix typos<br>
- add some comment for buffer and others operations<br>
- rename SFC_MAX_CHIP_NUM to MAX_CHIPSELECT_NUM<br>
- use u8 for cs<br>
- return -EINVAL for default case of get_if_type<br>
- use readl_poll_*() to check timeout cases<br>
- simplify and clarify some condition checks<br>
- rework the bitshifts to simplify the code<br>
- define SFC_CMD_DUMMY(x)<br>
- fix ummap for dma read path and finish all the<br>
=C2=A0 cache maintenance.<br>
- rename to rockchip_sfc_chip_priv and embed struct spi_nor<br>
=C2=A0 in it.<br>
- add MODULE_AUTHOR<br>
- add runtime PM and general PM support.<br>
- Thanks for Marek&#39;s comments. Link:<br>
=C2=A0 <a href=3D"http://lists.infradead.org/pipermail/linux-mtd/2016-Novem=
ber/070321.html" rel=3D"noreferrer" target=3D"_blank">http://lists.infradea=
d.org/<wbr>pipermail/linux-mtd/2016-<wbr>November/070321.html</a><br>
<br>
Andy Yan (1):<br>
=C2=A0 ARM: dts: rockchip: enable sfc for rv1108 evb<br>
<br>
Shawn Lin (2):<br>
=C2=A0 mtd: spi-nor: Bindings for Rockchip serial flash controller<br>
=C2=A0 mtd: spi-nor: add rockchip serial flash controller driver<br>
<br>
=C2=A0.../devicetree/bindings/mtd/<wbr>rockchip-sfc.txt=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 31 +<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A09 +<br>
=C2=A0arch/arm/boot/dts/rv1108-evb.<wbr>dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +<br>
=C2=A0arch/arm/boot/dts/rv1108.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 +<br>
=C2=A0drivers/mtd/spi-nor/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
=C2=A0drivers/mtd/spi-nor/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0drivers/mtd/spi-nor/rockchip-<wbr>sfc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 942 +++++++++++++++++++++<br>
=C2=A07 files changed, 1013 insertions(+)<br>
=C2=A0create mode 100644 Documentation/devicetree/<wbr>bindings/mtd/rockchi=
p-sfc.txt<br>
=C2=A0create mode 100644 drivers/mtd/spi-nor/rockchip-<wbr>sfc.c<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
<br>
</font></span></blockquote></div><br></div>

--f403043d0f881e6da205684ccd3f--
