From: Anup Patel <Anup.Patel@wdc.com>
Subject: RE: [PATCH] riscv: dts: fu540-c000: Add "status" property to cpu node
Date: Fri, 5 Jul 2019 03:58:58 +0000
Message-ID: <MN2PR04MB60611BD1B89E3D76ABFBE94A8DF50@MN2PR04MB6061.namprd04.prod.outlook.com>
References: <1562298766-25066-1-git-send-email-bmeng.cn@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <1562298766-25066-1-git-send-email-bmeng.cn@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Bin Meng <bmeng.cn@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of Bin
> Meng
> Sent: Friday, July 5, 2019 9:23 AM
> To: linux-riscv <linux-riscv@lists.infradead.org>; devicetree
> <devicetree@vger.kernel.org>; Rob Herring <robh+dt@kernel.org>; Mark
> Rutland <mark.rutland@arm.com>; Albert Ou <aou@eecs.berkeley.edu>;
> Paul Walmsley <paul.walmsley@sifive.com>; Palmer Dabbelt
> <palmer@sifive.com>; Yash Shah <yash.shah@sifive.com>
> Subject: [PATCH] riscv: dts: fu540-c000: Add "status" property to cpu node
> 
> Per device tree spec, the "status" property property shall be present for
> nodes representing CPUs in a SMP configuration. This property is currently
> missing in cpu 1/2/3/4 node in the fu540-c000.dtsi.

We don't need explicit "status = okay" for SOC internal devices
(such as PLIC, INTC, etc) which are always enabled by default.

Absence of "status" DT prop is treated as enabled by default.

Regards,
Anup

> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> index 4098349..0fff2a4 100644
> --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> @@ -53,6 +53,7 @@
>  			mmu-type = "riscv,sv39";
>  			reg = <1>;
>  			riscv,isa = "rv64imafdc";
> +			status = "okay";
>  			tlb-split;
>  			cpu1_intc: interrupt-controller {
>  				#interrupt-cells = <1>;
> @@ -77,6 +78,7 @@
>  			mmu-type = "riscv,sv39";
>  			reg = <2>;
>  			riscv,isa = "rv64imafdc";
> +			status = "okay";
>  			tlb-split;
>  			cpu2_intc: interrupt-controller {
>  				#interrupt-cells = <1>;
> @@ -101,6 +103,7 @@
>  			mmu-type = "riscv,sv39";
>  			reg = <3>;
>  			riscv,isa = "rv64imafdc";
> +			status = "okay";
>  			tlb-split;
>  			cpu3_intc: interrupt-controller {
>  				#interrupt-cells = <1>;
> @@ -125,6 +128,7 @@
>  			mmu-type = "riscv,sv39";
>  			reg = <4>;
>  			riscv,isa = "rv64imafdc";
> +			status = "okay";
>  			tlb-split;
>  			cpu4_intc: interrupt-controller {
>  				#interrupt-cells = <1>;
> --
> 2.7.4
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
