From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/5] dt-binding: mtd: onenand/samsung: Add device tree
 support
Date: Wed, 1 May 2019 20:54:08 -0500
Message-ID: <20190502015408.GA11612@bogus>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
 <20190426164224.11327-5-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190426164224.11327-5-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: kyungmin.park@samsung.com, bbrezillon@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 26, 2019 at 06:42:23PM +0200, Paweł Chmiel wrote:
> From: Tomasz Figa <tomasz.figa@gmail.com>
> 
> This patch adds dt-bindings for Samsung OneNAND driver.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>  .../bindings/mtd/samsung-onenand.txt          | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/samsung-onenand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/samsung-onenand.txt b/Documentation/devicetree/bindings/mtd/samsung-onenand.txt
> new file mode 100644
> index 000000000000..341d97cc1513
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/samsung-onenand.txt
> @@ -0,0 +1,46 @@
> +Device tree bindings for Samsung SoC OneNAND controller
> +
> +Required properties:
> + - compatible : value should be either of the following.
> +   (a) "samsung,s3c6400-onenand" - for onenand controller compatible with
> +       S3C6400 SoC,
> +   (b) "samsung,s3c6410-onenand" - for onenand controller compatible with
> +       S3C6410 SoC,
> +   (c) "samsung,s5pc100-onenand" - for onenand controller compatible with
> +       S5PC100 SoC,
> +   (d) "samsung,s5pv210-onenand" - for onenand controller compatible with
> +       S5PC110/S5PV210 SoCs.
> +
> + - reg : two memory mapped register regions:
> +   - first entry: control registers.
> +   - second and next entries: memory windows of particular OneNAND chips;
> +     for variants a), b) and c) only one is allowed, in case of d) up to
> +     two chips can be supported.
> +
> + - interrupt-parent : phandle of interrupt controller to which the OneNAND
> +   controller is wired,

This is implied and can be removed.

> + - interrupts : specifier of interrupt signal to which the OneNAND controller
> +   is wired; should contain just one entry.
> + - clock-names : should contain two entries:
> +   - "bus" - bus clock of the controller,
> +   - "onenand" - clock supplied to OneNAND memory.

If the clock just goes to the OneNAND device, then it should be in the 
nand device node rather than the controller node.

> + - clock: should contain list of phandles and specifiers for all clocks listed
> +   in clock-names property.
> + - #address-cells : must be 1,
> + - #size-cells : must be 1.

This implies some child nodes. What are the child nodes?

> +
> +For partition table parsing (optional) please refer to:
> + [1] Documentation/devicetree/bindings/mtd/partition.txt
> +
> +Example for an s5pv210 board:
> +
> +	onenand@b0600000 {
> +		compatible = "samsung,s5pv210-onenand";
> +		reg = <0xb0600000 0x2000>, <0xb0000000 0x20000>;
> +		interrupt-parent = <&vic1>;
> +		interrupts = <31>;
> +		clock-names = "bus", "onenand";
> +		clocks = <&clocks NANDXL>, <&clocks DOUT_FLASH>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +	};
> -- 
> 2.20.1
> 
