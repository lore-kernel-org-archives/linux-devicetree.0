From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH 3/3] arm64: dts: mark lx2160a esdhc controllers dma
 coherent
Date: Mon, 23 Sep 2019 11:00:07 -0500
Message-ID: <CADRPPNT-hKbO_8Y0PKg-FLsJ_GKE2nbZob6BGagpATMyYPdNsw@mail.gmail.com>
References: <20190922102341.GO25745@shell.armlinux.org.uk>
 <E1iBz55-0008Mj-CX@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1iBz55-0008Mj-CX@rmk-PC.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, dann frazier <dann.frazier@canonical.com>, Will Deacon <will.deacon@arm.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Y.b. Lu" <yangbo.lu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 22, 2019 at 2:26 PM Russell King <rmk+kernel@armlinux.org.uk> wrote:
>
> The LX2160A esdhc controllers are setup by the driver to be DMA
> coherent, but without marking them as such in DT, Linux thinks they
> are not.  This can lead to random sporadic DMA errors, even to the
> extent of preventing boot, such as:
>
> mmc0: ADMA error
> mmc0: sdhci: ============ SDHCI REGISTER DUMP ===========
> mmc0: sdhci: Sys addr:  0x00000000 | Version:  0x00002202
> mmc0: sdhci: Blk size:  0x00000008 | Blk cnt:  0x00000001
> mmc0: sdhci: Argument:  0x00000000 | Trn mode: 0x00000013
> mmc0: sdhci: Present:   0x01f50008 | Host ctl: 0x00000038
> mmc0: sdhci: Power:     0x00000003 | Blk gap:  0x00000000
> mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x000040d8
> mmc0: sdhci: Timeout:   0x00000003 | Int stat: 0x00000001
> mmc0: sdhci: Int enab:  0x037f108f | Sig enab: 0x037f108b
> mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00002202
> mmc0: sdhci: Caps:      0x35fa0000 | Caps_1:   0x0000af00
> mmc0: sdhci: Cmd:       0x0000333a | Max curr: 0x00000000
> mmc0: sdhci: Resp[0]:   0x00000920 | Resp[1]:  0x001d8a33
> mmc0: sdhci: Resp[2]:   0x325b5900 | Resp[3]:  0x3f400e00
> mmc0: sdhci: Host ctl2: 0x00000000
> mmc0: sdhci: ADMA Err:  0x00000009 | ADMA Ptr: 0x000000236d43820c
> mmc0: sdhci: ============================================
> mmc0: error -5 whilst initialising SD card
>
> These are caused by the device's descriptor fetch hitting speculatively
> loaded CPU cache lines that the CPU does not see through the normal,
> non-cacheable DMA coherent mapping that it uses for non-coherent
> devices.
>
> DT and the device must agree wrt whether the device is DMA coherent or
> not.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Acked-by: Li Yang <leoyang.li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> index 36b153e3da47..508af23edef0 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> @@ -593,6 +593,7 @@
>                         reg = <0x0 0x2140000 0x0 0x10000>;
>                         interrupts = <0 28 0x4>; /* Level high type */
>                         clocks = <&clockgen 4 1>;
> +                       dma-coherent;
>                         voltage-ranges = <1800 1800 3300 3300>;
>                         sdhci,auto-cmd12;
>                         little-endian;
> @@ -605,6 +606,7 @@
>                         reg = <0x0 0x2150000 0x0 0x10000>;
>                         interrupts = <0 63 0x4>; /* Level high type */
>                         clocks = <&clockgen 4 1>;
> +                       dma-coherent;
>                         voltage-ranges = <1800 1800 3300 3300>;
>                         sdhci,auto-cmd12;
>                         broken-cd;
> --
> 2.7.4
>
