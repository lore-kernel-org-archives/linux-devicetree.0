From: Madalin-cristian Bucur <madalin.bucur@nxp.com>
Subject: RE: [PATCH v2 00/22] SMMU enablement for NXP LS1043A and LS1046A
Date: Thu, 27 Sep 2018 13:39:33 +0000
Message-ID: <AM6PR04MB400811E9B5AD3DD1646D1B9CEC140@AM6PR04MB4008.eurprd04.prod.outlook.com>
References: <20180926132247.10971-1-laurentiu.tudor@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180926132247.10971-1-laurentiu.tudor@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>, "davem@davemloft.net" <davem@davemloft.net>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Roy Pledge <roy.pledge@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>, Bharat Bhushan <bharat.bhushan@nxp.com>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: laurentiu.tudor@nxp.com [mailto:laurentiu.tudor@nxp.com]
> Sent: Wednesday, September 26, 2018 4:22 PM
> To: devicetree@vger.kernel.org; netdev@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Cc: Roy Pledge <roy.pledge@nxp.com>; Madalin-cristian Bucur
> <madalin.bucur@nxp.com>; davem@davemloft.net; shawnguo@kernel.org; Leo Li
> <leoyang.li@nxp.com>; robin.murphy@arm.com; Bharat Bhushan
> <bharat.bhushan@nxp.com>; Laurentiu Tudor <laurentiu.tudor@nxp.com>
> Subject: [PATCH v2 00/22] SMMU enablement for NXP LS1043A and LS1046A
>=20
> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
>=20
> This patch series adds SMMU support for NXP LS1043A and LS1046A chips
> and consists mostly in important driver fixes and the required device
> tree updates. It touches several subsystems and consists of three main
> parts:
>  - changes in soc/drivers/fsl/qbman drivers adding iommu mapping of
>    reserved memory areas, fixes and defered probe support
>  - changes in drivers/net/ethernet/freescale/dpaa_eth drivers
>    consisting in misc dma mapping related fixes and probe ordering
>  - addition of the actual arm smmu device tree node together with
>    various adjustments to the device trees
>=20
> Performance impact
>=20
>     Running iperf benchmarks in a back-to-back setup (both sides
>     having smmu enabled) on a 10GBps port show an important
>     networking performance degradation of around 40% (9.48Gbps
>     linerate vs 5.45Gbps) and around 30%-35% with iommu.strict=3D1.
>     If you need performance but without SMMU support you can use
>     "iommu.passthrough=3D1" to disable SMMU.
>=20
> The patch set is based on net-next so, if generally agreed, I'd suggest
> to get the patches through the netdev tree after getting all the Acks.
>=20
> Changes in v2:
>  - dropped confusing comments in smmu interrupt property (Robin)
>  - add an intermediate simple-bus for usb to fix dma size issue (Robin)
>  - use defines instead of numbers in smmu interrupt definition
>  - drop redundant double iommu_get_domain_for_dev() call in few qbman
>    patches
>=20
> Laurentiu Tudor (22):
>   soc/fsl/qman: fixup liodns only on ppc targets
>   soc/fsl/bman: map FBPR area in the iommu
>   soc/fsl/qman: map FQD and PFDR areas in the iommu
>   soc/fsl/qman-portal: map CENA area in the iommu
>   soc/fsl/qbman: add APIs to retrieve the probing status
>   soc/fsl/qman_portals: defer probe after qman's probe
>   soc/fsl/bman_portals: defer probe after bman's probe
>   soc/fsl/qbman_portals: add APIs to retrieve the probing status
>   fsl/fman: backup and restore ICID registers
>   fsl/fman: add API to get the device behind a fman port
>   dpaa_eth: defer probing after qbman
>   dpaa_eth: base dma mappings on the fman rx port
>   dpaa_eth: fix iova handling for contiguous frames
>   dpaa_eth: fix iova handling for sg frames
>   dpaa_eth: fix SG frame cleanup
>   arm64: dts: ls1046a: add smmu node
>   arm64: dts: ls1043a: add smmu node
>   arm64: dts: ls104xa: set mask to drop TBU ID from StreamID
>   arm64: dts: ls104x: add missing dma ranges property
>   arm64: dts: ls104x: add iommu-map to pci controllers
>   arm64: dts: ls104x: make dma-coherent global to the SoC
>   arm64: dts: ls104x: use a pseudo-bus to constrain usb dma size
>=20
>  .../arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 106 ++++++++++----
>  .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 102 ++++++++++---
>  .../net/ethernet/freescale/dpaa/dpaa_eth.c    | 136 ++++++++++++------
>  drivers/net/ethernet/freescale/fman/fman.c    |  35 ++++-
>  drivers/net/ethernet/freescale/fman/fman.h    |   4 +
>  .../net/ethernet/freescale/fman/fman_port.c   |  14 ++
>  .../net/ethernet/freescale/fman/fman_port.h   |   2 +
>  drivers/soc/fsl/qbman/bman_ccsr.c             |  22 +++
>  drivers/soc/fsl/qbman/bman_portal.c           |  20 ++-
>  drivers/soc/fsl/qbman/qman_ccsr.c             |  28 ++++
>  drivers/soc/fsl/qbman/qman_portal.c           |  35 +++++
>  include/soc/fsl/bman.h                        |  16 +++
>  include/soc/fsl/qman.h                        |  17 +++
>  13 files changed, 438 insertions(+), 99 deletions(-)
>=20
> --
> 2.17.1

For the fsl/fman and dpaa_eth:

Acked-by: Madalin Bucur <madalin.bucur@nxp.com>

Thank you
