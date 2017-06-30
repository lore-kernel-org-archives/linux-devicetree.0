From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: r8a7796: Add DRIF support
Date: Fri, 30 Jun 2017 12:17:20 +0200
Message-ID: <20170630101720.GH26710@verge.net.au>
References: <20170627125438.44491-1-ramesh.shanmugasundaram@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170627125438.44491-1-ramesh.shanmugasundaram@bp.renesas.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, chris.paterson2@renesas.com, geert+renesas@glider.be, catalin.marinas@arm.com, magnus.damm@gmail.com, will.deacon@arm.com, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 27, 2017 at 01:54:38PM +0100, Ramesh Shanmugasundaram wrote:
> Adds the DRIF controller nodes for r8a7796.
> 
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
> ---
> Hi Simon,
> 
>    This patch is based on renesas-devel-20170626-v4.12-rc7 tag.
>    It is verified on M3 ES1.0. I also verified there are no regression issues
>    with this addition.
> 
>    The driver[1] is pushed into the media_tree. The bindings[2] are ACK'ed
>    by Geert & Rob and in the media_tree queue.
> 
>    [1] https://git.linuxtv.org/media_tree.git/commit/?id=7625ee981af166ddb569e2e6c0006e2af471326f
>    [2] https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg15602.html
> 
> Thanks,
> Ramesh.
> 
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 120 +++++++++++++++++++++++++++++++
>  1 file changed, 120 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index 1f6710912045..df04d132a127 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -639,6 +639,126 @@
>  			};
>  		};
>  
> +		drif00: rif@e6f40000 {
> +			compatible = "renesas,r8a7796-drif",
> +				     "renesas,rcar-gen3-drif";
> +			reg = <0 0xe6f40000 0 0x64>;
> +			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 515>;
> +			clock-names = "fck";
> +			dmas = <&dmac1 0x20>, <&dmac2 0x20>;

The dmas property seems a little strange. I would have expected to allow
ether dmac1 or dmac2 to be used for both tx and rx:

			dmas = <&dmac1 0x20>, <&dmac1 0x20>,
			       <&dmac2 0x20>, <&dmac2 0x20>;


> +			dma-names = "rx", "rx";
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			resets = <&cpg 515>;
> +			renesas,bonding = <&drif01>;
> +			status = "disabled";
> +		};

...
