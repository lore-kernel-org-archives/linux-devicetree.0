From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 2/5] arm64: dts: renesas: r8a77980: add VSPD support
Date: Fri, 8 Jun 2018 15:54:56 +0200
Message-ID: <20180608135456.cathgcuyp24csbwx@verge.net.au>
References: <390fabf0-4caf-1600-3780-1893207d94f7@cogentembedded.com>
 <5f151ec5-bec7-ed06-cb94-4f0cfe8e43dc@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <5f151ec5-bec7-ed06-cb94-4f0cfe8e43dc@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

[CC Laurent, Geert]

On Thu, Jun 07, 2018 at 11:20:47PM +0300, Sergei Shtylyov wrote:
> Describe VSPD0 in the R8A77980 device tree; it will be used by DU in
> the next patch...
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |   10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -653,6 +653,16 @@
>  			resets = <&cpg 408>;
>  		};
>  
> +		vspd0: vsp@fea20000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfea20000 0 0x4000>;

As per "[PATCH] arm64: dts: renesas: Fix VSPD registers range"
I think the width of the range should be 0x5000.

> +			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 623>;
> +			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
> +			resets = <&cpg 623>;
> +			renesas,fcp = <&fcpvd0>;
> +		};
> +
>  		fcpvd0: fcp@fea27000 {
>  			compatible = "renesas,fcpv";
>  			reg = <0 0xfea27000 0 0x200>;
> 
