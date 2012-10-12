From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 3/3] ARM: SPEAr13xx: Pass DW DMAC platform data from DT
Date: Fri, 12 Oct 2012 11:14:42 +0530
Message-ID: <841baa20a4af90761928b77ba59653cbcc29c18b.1350020375.git.viresh.kumar@linaro.org>
References: <91e41b4cc972d298f714cbd6f400569a9710304c.1350020375.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <91e41b4cc972d298f714cbd6f400569a9710304c.1350020375.git.viresh.kumar@linaro.org>
In-Reply-To: <142ef9170a2c69657d8a05ac127a9970d7b04965.1350020375.git.viresh.kumar@linaro.org>
References: <142ef9170a2c69657d8a05ac127a9970d7b04965.1350020375.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com
Cc: linux-kernel@vger.kernel.org, spear-devel@list.st.com, andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Viresh Kumar <viresh.kumar@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds dw_dmac's platform data to DT node. It also creates slave i=
nfo
node for SPEAr13xx, for the devices which were using dw_dmac.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/boot/dts/spear1340.dtsi             | 19 ++++++++++
 arch/arm/boot/dts/spear13xx.dtsi             | 38 ++++++++++++++++++++
 arch/arm/mach-spear13xx/include/mach/spear.h |  2 --
 arch/arm/mach-spear13xx/spear1310.c          |  4 +--
 arch/arm/mach-spear13xx/spear1340.c          | 27 +++-----------
 arch/arm/mach-spear13xx/spear13xx.c          | 54 ++----------------------=
----
 6 files changed, 65 insertions(+), 79 deletions(-)

diff --git a/arch/arm/boot/dts/spear1340.dtsi b/arch/arm/boot/dts/spear1340=
.dtsi
index d71fe2a..8ea3f66 100644
--- a/arch/arm/boot/dts/spear1340.dtsi
+++ b/arch/arm/boot/dts/spear1340.dtsi
@@ -24,6 +24,25 @@
 =09=09=09status =3D "disabled";
 =09=09};
=20
+=09=09dma@ea800000 {
+=09=09=09slave_info {
+=09=09=09=09uart1_tx {
+=09=09=09=09=09bus_id =3D "uart1_tx";
+=09=09=09=09=09cfg_hi =3D <0x6000>;=09/* 0xC << 11 */
+=09=09=09=09=09cfg_lo =3D <0>;
+=09=09=09=09=09src_master =3D <0>;
+=09=09=09=09=09dst_master =3D <1>;
+=09=09=09=09};
+=09=09=09=09uart1_tx {
+=09=09=09=09=09bus_id =3D "uart1_tx";
+=09=09=09=09=09cfg_hi =3D <0x680>;=09/* 0xD << 7 */
+=09=09=09=09=09cfg_lo =3D <0>;
+=09=09=09=09=09src_master =3D <1>;
+=09=09=09=09=09dst_master =3D <0>;
+=09=09=09=09};
+=09=09=09};
+=09=09};
+
 =09=09spi1: spi@5d400000 {
 =09=09=09compatible =3D "arm,pl022", "arm,primecell";
 =09=09=09reg =3D <0x5d400000 0x1000>;
diff --git a/arch/arm/boot/dts/spear13xx.dtsi b/arch/arm/boot/dts/spear13xx=
.dtsi
index f7b84ac..f06bb50 100644
--- a/arch/arm/boot/dts/spear13xx.dtsi
+++ b/arch/arm/boot/dts/spear13xx.dtsi
@@ -91,6 +91,37 @@
 =09=09=09reg =3D <0xea800000 0x1000>;
 =09=09=09interrupts =3D <0 19 0x4>;
 =09=09=09status =3D "disabled";
+
+=09=09=09nr_channels =3D <8>;
+=09=09=09chan_allocation_order =3D <1>;
+=09=09=09chan_priority =3D <1>;
+=09=09=09block_size =3D <0xfff>;
+=09=09=09nr_masters =3D <2>;
+=09=09=09data_width =3D <3 3 0 0>;
+
+=09=09=09slave_info {
+=09=09=09=09ssp0_tx {
+=09=09=09=09=09bus_id =3D "ssp0_tx";
+=09=09=09=09=09cfg_hi =3D <0x2000>;=09/* 0x4 << 11 */
+=09=09=09=09=09cfg_lo =3D <0>;
+=09=09=09=09=09src_master =3D <0>;
+=09=09=09=09=09dst_master =3D <0>;
+=09=09=09=09};
+=09=09=09=09ssp0_rx {
+=09=09=09=09=09bus_id =3D "ssp0_rx";
+=09=09=09=09=09cfg_hi =3D <0x280>;=09/* 0x5 << 7 */
+=09=09=09=09=09cfg_lo =3D <0>;
+=09=09=09=09=09src_master =3D <0>;
+=09=09=09=09=09dst_master =3D <0>;
+=09=09=09=09};
+=09=09=09=09cf {
+=09=09=09=09=09bus_id =3D "cf";
+=09=09=09=09=09cfg_hi =3D <0>;
+=09=09=09=09=09cfg_lo =3D <0>;
+=09=09=09=09=09src_master =3D <0>;
+=09=09=09=09=09dst_master =3D <0>;
+=09=09=09=09};
+=09=09=09};
 =09=09};
=20
 =09=09dma@eb000000 {
@@ -98,6 +129,13 @@
 =09=09=09reg =3D <0xeb000000 0x1000>;
 =09=09=09interrupts =3D <0 59 0x4>;
 =09=09=09status =3D "disabled";
+
+=09=09=09nr_channels =3D <8>;
+=09=09=09chan_allocation_order =3D <1>;
+=09=09=09chan_priority =3D <1>;
+=09=09=09block_size =3D <0xfff>;
+=09=09=09nr_masters =3D <2>;
+=09=09=09data_width =3D <3 3 0 0>;
 =09=09};
=20
 =09=09fsmc: flash@b0000000 {
diff --git a/arch/arm/mach-spear13xx/include/mach/spear.h b/arch/arm/mach-s=
pear13xx/include/mach/spear.h
index 07d90ac..71bf5b6 100644
--- a/arch/arm/mach-spear13xx/include/mach/spear.h
+++ b/arch/arm/mach-spear13xx/include/mach/spear.h
@@ -43,8 +43,6 @@
 #define VA_L2CC_BASE=09=09=09=09IOMEM(UL(0xFB000000))
=20
 /* others */
-#define DMAC0_BASE=09=09=09=09UL(0xEA800000)
-#define DMAC1_BASE=09=09=09=09UL(0xEB000000)
 #define MCIF_CF_BASE=09=09=09=09UL(0xB2800000)
=20
 /* Devices present in SPEAr1310 */
diff --git a/arch/arm/mach-spear13xx/spear1310.c b/arch/arm/mach-spear13xx/=
spear1310.c
index 9fbbfc5..0e60195 100644
--- a/arch/arm/mach-spear13xx/spear1310.c
+++ b/arch/arm/mach-spear13xx/spear1310.c
@@ -36,9 +36,7 @@ static struct pl022_ssp_controller ssp1_plat_data =3D {
=20
 /* Add SPEAr1310 auxdata to pass platform data */
 static struct of_dev_auxdata spear1310_auxdata_lookup[] __initdata =3D {
-=09OF_DEV_AUXDATA("arasan,cf-spear1340", MCIF_CF_BASE, NULL, &cf_dma_priv)=
,
-=09OF_DEV_AUXDATA("snps,dma-spear1340", DMAC0_BASE, NULL, &dmac_plat_data)=
,
-=09OF_DEV_AUXDATA("snps,dma-spear1340", DMAC1_BASE, NULL, &dmac_plat_data)=
,
+=09OF_DEV_AUXDATA("arasan,cf-spear1340", MCIF_CF_BASE, NULL, "cf"),
 =09OF_DEV_AUXDATA("arm,pl022", SSP_BASE, NULL, &pl022_plat_data),
=20
 =09OF_DEV_AUXDATA("arm,pl022", SPEAR1310_SSP1_BASE, NULL, &ssp1_plat_data)=
,
diff --git a/arch/arm/mach-spear13xx/spear1340.c b/arch/arm/mach-spear13xx/=
spear1340.c
index 081014f..4ea4546 100644
--- a/arch/arm/mach-spear13xx/spear1340.c
+++ b/arch/arm/mach-spear13xx/spear1340.c
@@ -20,7 +20,6 @@
 #include <linux/of_platform.h>
 #include <asm/hardware/gic.h>
 #include <asm/mach/arch.h>
-#include <mach/dma.h>
 #include <mach/generic.h>
 #include <mach/spear.h>
=20
@@ -78,26 +77,10 @@
 =09=09=09(SPEAR1340_MIPHY_OSC_BYPASS_EXT | \
 =09=09=09SPEAR1340_MIPHY_PLL_RATIO_TOP(25))
=20
-static struct dw_dma_slave uart1_dma_param[] =3D {
-=09{
-=09=09/* Tx */
-=09=09.cfg_hi =3D DWC_CFGH_DST_PER(SPEAR1340_DMA_REQ_UART1_TX),
-=09=09.cfg_lo =3D 0,
-=09=09.src_master =3D DMA_MASTER_MEMORY,
-=09=09.dst_master =3D SPEAR1340_DMA_MASTER_UART1,
-=09}, {
-=09=09/* Rx */
-=09=09.cfg_hi =3D DWC_CFGH_SRC_PER(SPEAR1340_DMA_REQ_UART1_RX),
-=09=09.cfg_lo =3D 0,
-=09=09.src_master =3D SPEAR1340_DMA_MASTER_UART1,
-=09=09.dst_master =3D DMA_MASTER_MEMORY,
-=09}
-};
-
 static struct amba_pl011_data uart1_data =3D {
-=09.dma_filter =3D dw_dma_filter,
-=09.dma_tx_param =3D &uart1_dma_param[0],
-=09.dma_rx_param =3D &uart1_dma_param[1],
+=09.dma_filter =3D dw_generic_filter,
+=09.dma_tx_param =3D "uart1_tx",
+=09.dma_rx_param =3D "uart1_rx",
 };
=20
 /* SATA device registration */
@@ -158,9 +141,7 @@ static struct ahci_platform_data sata_pdata =3D {
=20
 /* Add SPEAr1340 auxdata to pass platform data */
 static struct of_dev_auxdata spear1340_auxdata_lookup[] __initdata =3D {
-=09OF_DEV_AUXDATA("arasan,cf-spear1340", MCIF_CF_BASE, NULL, &cf_dma_priv)=
,
-=09OF_DEV_AUXDATA("snps,dma-spear1340", DMAC0_BASE, NULL, &dmac_plat_data)=
,
-=09OF_DEV_AUXDATA("snps,dma-spear1340", DMAC1_BASE, NULL, &dmac_plat_data)=
,
+=09OF_DEV_AUXDATA("arasan,cf-spear1340", MCIF_CF_BASE, NULL, "cf"),
 =09OF_DEV_AUXDATA("arm,pl022", SSP_BASE, NULL, &pl022_plat_data),
=20
 =09OF_DEV_AUXDATA("snps,spear-ahci", SPEAR1340_SATA_BASE, NULL,
diff --git a/arch/arm/mach-spear13xx/spear13xx.c b/arch/arm/mach-spear13xx/=
spear13xx.c
index 5633d69..90ec4ad 100644
--- a/arch/arm/mach-spear13xx/spear13xx.c
+++ b/arch/arm/mach-spear13xx/spear13xx.c
@@ -22,67 +22,19 @@
 #include <asm/hardware/gic.h>
 #include <asm/mach/map.h>
 #include <asm/smp_twd.h>
-#include <mach/dma.h>
 #include <mach/generic.h>
 #include <mach/spear.h>
=20
-/* common dw_dma filter routine to be used by peripherals */
-bool dw_dma_filter(struct dma_chan *chan, void *slave)
-{
-=09struct dw_dma_slave *dws =3D (struct dw_dma_slave *)slave;
-
-=09if (chan->device->dev =3D=3D dws->dma_dev) {
-=09=09chan->private =3D slave;
-=09=09return true;
-=09} else {
-=09=09return false;
-=09}
-}
-
 /* ssp device registration */
-static struct dw_dma_slave ssp_dma_param[] =3D {
-=09{
-=09=09/* Tx */
-=09=09.cfg_hi =3D DWC_CFGH_DST_PER(DMA_REQ_SSP0_TX),
-=09=09.cfg_lo =3D 0,
-=09=09.src_master =3D DMA_MASTER_MEMORY,
-=09=09.dst_master =3D DMA_MASTER_SSP0,
-=09}, {
-=09=09/* Rx */
-=09=09.cfg_hi =3D DWC_CFGH_SRC_PER(DMA_REQ_SSP0_RX),
-=09=09.cfg_lo =3D 0,
-=09=09.src_master =3D DMA_MASTER_SSP0,
-=09=09.dst_master =3D DMA_MASTER_MEMORY,
-=09}
-};
-
 struct pl022_ssp_controller pl022_plat_data =3D {
 =09.bus_id =3D 0,
 =09.enable_dma =3D 1,
-=09.dma_filter =3D dw_dma_filter,
-=09.dma_rx_param =3D &ssp_dma_param[1],
-=09.dma_tx_param =3D &ssp_dma_param[0],
+=09.dma_filter =3D dw_generic_filter,
+=09.dma_rx_param =3D "ssp0_rx",
+=09.dma_tx_param =3D "ssp0_tx",
 =09.num_chipselect =3D 3,
 };
=20
-/* CF device registration */
-struct dw_dma_slave cf_dma_priv =3D {
-=09.cfg_hi =3D 0,
-=09.cfg_lo =3D 0,
-=09.src_master =3D 0,
-=09.dst_master =3D 0,
-};
-
-/* dmac device registeration */
-struct dw_dma_platform_data dmac_plat_data =3D {
-=09.nr_channels =3D 8,
-=09.chan_allocation_order =3D CHAN_ALLOCATION_DESCENDING,
-=09.chan_priority =3D CHAN_PRIORITY_DESCENDING,
-=09.block_size =3D 4095U,
-=09.nr_masters =3D 2,
-=09.data_width =3D { 3, 3, 0, 0 },
-};
-
 void __init spear13xx_l2x0_init(void)
 {
 =09/*
--=20
1.7.12.rc2.18.g61b472e
