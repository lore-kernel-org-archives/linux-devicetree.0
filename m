From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH] arm64: dts: marvell: mark CP110 ahci as dma-coherent
Date: Fri, 06 Apr 2018 11:37:56 +0200
Message-ID: <87k1tkisjv.fsf@bootlin.com>
References: <20180331144406.23030-1-kettenis@openbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180331144406.23030-1-kettenis@openbsd.org> (Mark Kettenis's
 message of "Sat, 31 Mar 2018 16:44:06 +0200")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Kettenis <kettenis@openbsd.org>
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, andrew@lunn.ch, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Mark,
 
 On sam., mars 31 2018, Mark Kettenis <kettenis@openbsd.org> wrote:

> The hardware is clearly DMA coherent and not marking it as such leads
> to cache coherency problems, at least with the OpenBSD kernel.

The reason to not having this flag from the beginning was that there was
some issue around it in the very first revision (A0) of the SoC. But now
all the SoC publicly released belongs to a newer revision that don't
have anymore this issue, so your patch make sense.

Applied on mvebu/dt64-for-4.18

Thanks,

Gregory


>
> Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
> ---
>  arch/arm64/boot/dts/marvell/armada-cp110.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
> index a8af4136dbe7..7e9177ef7b7d 100644
> --- a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
> @@ -231,6 +231,7 @@
>  			compatible = "marvell,armada-8k-ahci",
>  			"generic-ahci";
>  			reg = <0x540000 0x30000>;
> +			dma-coherent;
>  			interrupts = <ICU_GRP_NSR 107 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&CP110_LABEL(clk) 1 15>;
>  			status = "disabled";
> -- 
> 2.16.2
>

-- 
Gregory Clement, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
