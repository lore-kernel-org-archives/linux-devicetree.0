From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: [PATCH 1/3] arm64: dts: berlin4ct: add missing unit name to
 /soc node
Date: Tue, 6 Sep 2016 18:20:48 +0800
Message-ID: <20160906182048.222cec2f@xhacker>
References: <20160906085557.4019-1-jszhang@marvell.com>
        <20160906085557.4019-2-jszhang@marvell.com>
        <20160906102208.GB1425@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160906102208.GB1425@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Tue, 6 Sep 2016 11:22:08 +0100 Mark Rutland wrote:

> On Tue, Sep 06, 2016 at 04:55:55PM +0800, Jisheng Zhang wrote:
> > This patch fixes the following DTC warning with W=1:
> > 
> > "Node /soc has a reg or ranges property, but no unit name"
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@marvell.com>  
> 
> The node is only compatible with simple-bus, and so shouldn't have a
> reg.

IIUC, the warning is caused by "ranges = <0 0 0xf7000000 0x1000000>;"

Thanks,
Jisheng

> 
> Why not remove the reg?
> 
> Mark
> 
> > ---
> >  arch/arm64/boot/dts/marvell/berlin4ct.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> > index 099ad93..2d6f91f 100644
> > --- a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> > +++ b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> > @@ -134,7 +134,7 @@
> >  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> >  	};
> >  
> > -	soc {
> > +	soc@f7000000 {
> >  		compatible = "simple-bus";
> >  		#address-cells = <1>;
> >  		#size-cells = <1>;
> > -- 
> > 2.9.3
> >   
