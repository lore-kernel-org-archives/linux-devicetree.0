From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
Date: Thu, 27 Jun 2019 19:26:09 +0200
Message-ID: <20190627192609.0965f6d5@xps13>
References: <1561443056-13766-1-git-send-email-masonccyang@mxic.com.tw>
        <1561443056-13766-3-git-send-email-masonccyang@mxic.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561443056-13766-3-git-send-email-masonccyang@mxic.com.tw>
Sender: linux-kernel-owner@vger.kernel.org
To: Mason Yang <masonccyang@mxic.com.tw>
Cc: marek.vasut@gmail.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, bbrezillon@kernel.org, dwmw2@infradead.org, computersforpeace@gmail.com, vigneshr@ti.com, paul.burton@mips.com, liang.yang@amlogic.com, richard@nod.at, anders.roxell@linaro.org, christophe.kerello@st.com, paul@crapouillou.net, jianxin.pan@amlogic.com, stefan@agner.ch, devicetree@vger.kernel.org, juliensu@mxic.com.tw, lee.jones@linaro.org, broonie@kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mason,

Mason Yang <masonccyang@mxic.com.tw> wrote on Tue, 25 Jun 2019 14:10:56
+0800:

> Document the bindings used by the Macronix raw NAND controller.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  .../devicetree/bindings/mtd/mxic-nand.txt          | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mxic-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> new file mode 100644
> index 0000000..3d198e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> @@ -0,0 +1,26 @@
> +Macronix Raw NAND Controller Device Tree Bindings
> +-------------------------------------------------
> +
> +Required properties:
> +- compatible: should be "mxic,raw-nand-ctlr"

I would prefer "macronix,nand-controller"

> +- reg: should contain 1 entrie for the registers

                           entry

> +- reg-names: should contain "regs"

Not sure you need that?

> +- interrupts: interrupt line connected to this NAND controller
> +- clock-names: should contain "ps_clk", "send_clk" and "send_dly_clk"
> +- clocks: should contain 3 entries for the "ps_clk", "send_clk" and
> +	 "send_dly_clk" clocks

s/entries/phandles/ ?

> +
> +Example:
> +
> +	nand: mxic-nfc@43c30000 {
> +		compatible = "mxic,raw-nand-ctlr";
> +		reg = <0x43c30000 0x10000>;
> +		reg-names = "regs";
> +		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
> +		clock-names = "send_clk", "send_dly_clk", "ps_clk";
> +
> +		nand-ecc-mode = "soft";
> +		nand-ecc-algo = "bch";
> +		nand-ecc-step-size = <512>;
> +		nand-ecc-strength = <8>;

The last 4 lines are probably not needed.

> +	};

Thanks,
Miquèl
