From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 0/4][v4][RESEND] dt-bindings: mtd-physmap: Add
 endianness supports
Date: Thu, 22 Feb 2018 11:28:14 +0100
Message-ID: <20180222112814.3717af47@bbrezillon>
References: <20180222101511.29631-1-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180222101511.29631-1-prabhakar.kushwaha@nxp.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh@kernel.org, boris.brezillon@free-electrons.com, leoyang.li@nxp.com, oss@buserror.net, linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Prabhakar,

On Thu, 22 Feb 2018 15:45:05 +0530
Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:

> Connection between flash and controller is not necessary to be always
> of same type. It may varies from platform to platform.
> 
> Adding endianness (optional) property to provide connection type
> information. This endianness property is checked in physmap_of_core.c
> to decide swap type. 
> 
> This patch also set "big-endian" property for ls1021a, ls1043a
> and ls1046a device tree. here connection between IFC controller
> and NOR flash is big-endian.
> 
> Prabhakar Kushwaha (4):
>   dt-bindings: mtd-physmap: Add endianness supports
>   driver: mtd: update struct map_info's swap as per map requirement
>   ARM: dts: Add NOR connection type with IFC
>   ARM64: dts: Add NOR connection type with IFC

First of all, can you stop sending dts changes until we've agreed on
the dt-bindings/driver changes.

> 
> Resending as all patches of patchset never reaches to patchwork.

Hm, I think they reached patchwork, it's just that dts changes won't
be applied to the MTD tree, so I mark them as 'Not applicable'.

Regards,

Boris

> 
>  Documentation/devicetree/bindings/mtd/mtd-physmap.txt | 5 +++++
>  arch/arm/boot/dts/ls1021a-qds.dts                     | 1 +
>  arch/arm/boot/dts/ls1021a-twr.dts                     | 1 +
>  arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts     | 1 +
>  arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts     | 1 +
>  arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts     | 1 +
>  drivers/mtd/maps/physmap_of_core.c                    | 8 ++++++++
>  7 files changed, 18 insertions(+)
> 



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
