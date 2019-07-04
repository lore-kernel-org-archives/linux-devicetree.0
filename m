From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
Date: Thu, 4 Jul 2019 11:29:01 +0300
Message-ID: <93e86083-7f8a-402d-db4b-26263719be25@cogentembedded.com>
References: <1562138144-2212-1-git-send-email-masonccyang@mxic.com.tw>
 <1562138144-2212-3-git-send-email-masonccyang@mxic.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562138144-2212-3-git-send-email-masonccyang@mxic.com.tw>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mason Yang <masonccyang@mxic.com.tw>, miquel.raynal@bootlin.com, marek.vasut@gmail.com, bbrezillon@kernel.org, dwmw2@infradead.org, computersforpeace@gmail.com, vigneshr@ti.com, richard@nod.at, robh+dt@kernel.org, stefan@agner.ch, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, anders.roxell@linaro.org, juliensu@mxic.com.tw, linux-kernel@vger.kernel.org, paul@crapouillou.net, paul.burton@mips.com, liang.yang@amlogic.com, linux-mtd@lists.infradead.org, christophe.kerello@st.com, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

Hello!

On 03.07.2019 10:15, Mason Yang wrote:

> Document the bindings used by the Macronix raw NAND controller.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>   Documentation/devicetree/bindings/mtd/mxic-nand.txt | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mtd/mxic-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> new file mode 100644
> index 0000000..ddd7660
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> @@ -0,0 +1,20 @@
> +Macronix Raw NAND Controller Device Tree Bindings
> +-------------------------------------------------
> +
> +Required properties:
> +- compatible: should be "macronix,nand-controller"
> +- reg: should contain 1 entrie for the registers
> +- interrupts: interrupt line connected to this raw NAND controller
> +- clock-names: should contain "ps_clk", "send_clk" and "send_dly_clk"
> +- clocks: should contain 3 phandles for the "ps_clk", "send_clk" and
> +	 "send_dly_clk" clocks
> +
> +Example:
> +
> +	nand: mxic-nfc@43c30000 {

    The node names should be generic, and the DT spec 0.2 (section 2.2.2) even 
has documented "nand-controller", please rename.

> +		compatible = "macronix,nand-controller";
> +		reg = <0x43c30000 0x10000>;
> +		reg-names = "regs";
> +		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
> +		clock-names = "send_clk", "send_dly_clk", "ps_clk";
> +	};
> 

MBR, Sergei
