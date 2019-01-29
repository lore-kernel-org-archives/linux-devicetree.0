From: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: nand: Add Cadence NAND controller
 driver
Date: Tue, 29 Jan 2019 18:21:00 +0100
Message-ID: <20190129182100.2fcb4e9f@bbrezillon>
References: <20190129160337.24350-1-piotrs@cadence.com>
        <20190129161040.20299-1-piotrs@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129161040.20299-1-piotrs@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Piotr Sroka <piotrs@cadence.com>
Cc: linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, BrianNorris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Piotr,

On Tue, 29 Jan 2019 16:10:40 +0000
Piotr Sroka <piotrs@cadence.com> wrote:

> Signed-off-by: Piotr Sroka <piotrs@cadence.com>
> ---
>  .../devicetree/bindings/mtd/cadence-nand.txt       | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cadence-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cadence-nand.txt b/Documentation/devicetree/bindings/mtd/cadence-nand.txt
> new file mode 100644
> index 000000000000..82afa34d5652
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/cadence-nand.txt
> @@ -0,0 +1,35 @@
> +* Cadence NAND controller
> +
> +Required properties:
> +  - compatible : "cdns,hpnfc-nand"

"nfc" already means nand flash controller, no need to suffix it with
-nand, "cdns,hpnfc" should be enough. 

> +  - reg : Contains two entries, each of which is a tuple consisting of a
> +	  physical address and length. The first entry is the address and
> +	  length of the controller register set. The second entry is the
> +	  address and length of the Slave DMA data port.

Please name the register ranges.

> +  - interrupts : The interrupt number.
> +  - clocks: phandle of the controller core clock (nf_clk).
> +
> +Optional properties:
> +Driver calculates controller timings base on NAND flash memory timings and
> +the following delays in picoseconds.
> +  - cdns,if-skew : Skew value of the output signals of the NAND Flash interface
> +  - cdns,nand2-delay : Delay value of one NAND2 gate from which
> +    the delay element is build
> +  - cdns,board-delay : Estimated Board delay. The value includes the total
> +    round trip delay for the signals and is used for deciding on values
> +    associated with data read capture. The example formula for SDR mode is
> +    the following:
> +    board_delay = RE#PAD_delay + PCB trace to device + PCB trace from device
> +    + DQ PAD delay

The unit of those props is not defined, and if possible I'd like to
avoid specifying custom timing adjustment values in the DT. Looks like
some of these values are SoC specific (depends on the integration of
this IP in a SoC) and others are board specific. For SoC specific
values, this should be attached to the SoC specific compatible at the
driver level. For board-specific values, I'd prefer to have a generic
way to describe boards constraints. 

Please point to the generic bindings to describe NAND chip
representation under the NAND controller node.

> +
> +Example
> +
> +nand: nand@60000000 {

nand_controller: nand-controller@60000000 { 

> +	  compatible = "cdns,hpnfc-nand";
> +	  reg = <0x60000000 0x10000>, <0x80000000 0x10000>;
> +	  clocks = <&nf_clk>;
> +	  cdns,if-skew = <50>;
> +	  cdns,nand2-delay = <37>;
> +	  cdns,board-delay = <4830>;
> +	  interrupts = <2 0>;

Add a NAND chip in the example.

> +};

Regards,

Boris
