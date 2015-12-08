From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v9 3/3] MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND
 device tree nodes
Date: Tue, 8 Dec 2015 15:20:48 +0100
Message-ID: <20151208152048.0e298fc1@bbrezillon>
References: <1449144142-24004-1-git-send-email-harvey.hunt@imgtec.com>
	<1449144142-24004-4-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449144142-24004-4-git-send-email-harvey.hunt@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Alex Smith <alex.smith@imgtec.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 3 Dec 2015 12:02:22 +0000
Harvey Hunt <harvey.hunt@imgtec.com> wrote:

> From: Alex Smith <alex.smith@imgtec.com>
> 
> Add device tree nodes for the NEMC and BCH to the JZ4780 device tree,
> and make use of them in the Ci20 device tree to add a node for the
> board's NAND.
> 
> Note that since the pinctrl driver is not yet upstream, this includes
> neither pin configuration nor busy/write-protect GPIO pins for the
> NAND. Use of the NAND relies on the boot loader to have left the pins
> configured in a usable state, which should be the case when booted
> from the NAND.
> 
> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Paul Burton <paul.burton@imgtec.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mips@linux-mips.org
> Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
> ---
> v8 -> v9:
>  - Represent the partition table as a subnode of a NAND chip. 
> 
> v7 -> v8:
>  - Describe the NAND chips as children nodes of the NAND controller.
>  - Remove ingenic, prefix from ECC settings.
>  - Renamed some ECC settings.
> 
> v6 -> v7:
>  - Add nand-ecc-mode to DT.
>  - Add nand-on-flash-bbt to DT.
> 
> v4 -> v5:
>  - New patch adding DT nodes for the NAND so that the driver can be
>    tested.
> 
>  arch/mips/boot/dts/ingenic/ci20.dts    | 63 ++++++++++++++++++++++++++++++++++
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 26 ++++++++++++++
>  2 files changed, 89 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
> index 9fcb9e7..782258c 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -42,3 +42,66 @@
>  &uart4 {
>  	status = "okay";
>  };
> +
> +&nemc {
> +	status = "okay";
> +
> +	nandc: nand-controller@1 {
> +		compatible = "ingenic,jz4780-nand";
> +		reg = <1 0 0x1000000>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ingenic,bch-controller = <&bch>;
> +
> +		ingenic,nemc-tAS = <10>;
> +		ingenic,nemc-tAH = <5>;
> +		ingenic,nemc-tBP = <10>;
> +		ingenic,nemc-tAW = <15>;
> +		ingenic,nemc-tSTRV = <100>;

I guess those are encoding controller specific timings. Maybe they
could be automatically deduced from nand_timings information (I'm not
asking to implement that right now, but keep it in the back of your
mind as possible future improvements).


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
