From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v6 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
Date: Thu, 1 Aug 2019 07:57:25 +0200
Message-ID: <20190801075725.4f23e0f5@collabora.com>
References: <1564631710-30276-1-git-send-email-masonccyang@mxic.com.tw>
        <1564631710-30276-3-git-send-email-masonccyang@mxic.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564631710-30276-3-git-send-email-masonccyang@mxic.com.tw>
Sender: linux-kernel-owner@vger.kernel.org
To: Mason Yang <masonccyang@mxic.com.tw>
Cc: miquel.raynal@bootlin.com, marek.vasut@gmail.com, bbrezillon@kernel.org, dwmw2@infradead.org, computersforpeace@gmail.com, vigneshr@ti.com, richard@nod.at, robh+dt@kernel.org, stefan@agner.ch, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, juliensu@mxic.com.tw, paul.burton@mips.com, liang.yang@amlogic.com, lee.jones@linaro.org, anders.roxell@linaro.org, christophe.kerello@st.com, paul@crapouillou.net, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu,  1 Aug 2019 11:55:10 +0800
Mason Yang <masonccyang@mxic.com.tw> wrote:

> Document the bindings used by the Macronix raw NAND controller.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  Documentation/devicetree/bindings/mtd/mxic-nand.txt | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mxic-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> new file mode 100644
> index 0000000..de37d60
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> @@ -0,0 +1,19 @@
> +Macronix Raw NAND Controller Device Tree Bindings
> +-------------------------------------------------
> +
> +Required properties:
> +- compatible: should be "mxicy,multi-itfc-v009-nand-morph"
> +- reg: should contain 1 entry for the registers
> +- interrupts: interrupt line connected to this raw NAND controller
> +- clock-names: should contain "ps", "send" and "send_dly"
> +- clocks: should contain 3 phandles for the "ps", "send" and
> +	 "send_dly" clocks
> +
> +Example:
> +
> +	nand: nand-controller@43c30000 {
> +		compatible = "mxicy,multi-itfc-v009-nand-morph";
> +		reg = <0x43c30000 0x10000>;
> +		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
> +		clock-names = "send", "send_dly", "ps";

You should have subnodes describing the NAND connected to the
controller (see [1]).

[1]https://elixir.bootlin.com/linux/v5.3-rc2/source/Documentation/devicetree/bindings/mtd/nand-controller.yaml#L131

> +	};
