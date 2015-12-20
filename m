From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5] mtd: support BB SRAM on ICP DAS LP-8x4x
Date: Sat, 19 Dec 2015 21:38:07 -0600
Message-ID: <20151220033807.GC9883@rob-hp-laptop>
References: <1397668667-27328-4-git-send-email-ynvich@gmail.com>
 <1450205941-15593-1-git-send-email-ynvich@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450205941-15593-1-git-send-email-ynvich@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Ianovich <ynvich@gmail.com>
Cc: linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Jeremy Kerr <jk@ozlabs.org>, Cyril Bur <cyrilbur@gmail.com>, Neelesh Gupta <neelegup@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Joel Stanley <joel@jms.id.au>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 15, 2015 at 09:58:53PM +0300, Sergei Ianovich wrote:
> This provides an MTD device driver for 512kB of battery backed up SRAM
> on ICPDAS LP-8X4X programmable automation controllers.
> 
> SRAM chip is connected via FPGA and is not accessible without a driver,
> unlike flash memory which is wired to CPU MMU.
> 
> This SRAM becomes an excellent persisent storage of volatile process
> data like counter values and sensor statuses. Storing those data in
> flash or mmc card is not a viable solution.
> 
> Signed-off-by: Sergei Ianovich <ynvich@gmail.com>
> Reviewed-by: Brian Norris <computersforpeace@gmail.com>
> ---
>    v4..v5
>    * remove .owner from struct platform_driver
>    * constify struct of_device_id
>     for further Brian Norris comments:
>    * drop unused property from doc file
>    * move defconfig update to a different file
>    * drop extra match w/ of_match_device()
> 
>    v3..v4 for Brian Norris 'Reviewed-by'
>    * add doc file for DT binding
>    * move DTS binding to a different patch (8/21)
>    * drop unused include directive
>    * drop safely unused callback
>    * drop non-default partion probe types
>    * drop duplicate error checks
>    * drop duplicate error reporting
>    * fixed error message on MTD registeration
>    * fixed module removal routine
> 
>    v2..v3
>    * no changes (except number 08/16 -> 10/21)
> 
>    v0..v2
>    * use device tree
>    * use devm helpers where possible
> 
>  .../devicetree/bindings/mtd/sram-lp8x4x.txt        |  20 +++
>  drivers/mtd/devices/Kconfig                        |  14 ++
>  drivers/mtd/devices/Makefile                       |   1 +
>  drivers/mtd/devices/sram_lp8x4x.c                  | 199 +++++++++++++++++++++
>  4 files changed, 234 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/sram-lp8x4x.txt
>  create mode 100644 drivers/mtd/devices/sram_lp8x4x.c
> 
> diff --git a/Documentation/devicetree/bindings/mtd/sram-lp8x4x.txt b/Documentation/devicetree/bindings/mtd/sram-lp8x4x.txt
> new file mode 100644
> index 0000000..476934f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/sram-lp8x4x.txt
> @@ -0,0 +1,20 @@
> +512kB battery backed up SRAM on LP-8x4x industrial computers
> +
> +Required properties:
> +- compatible : should be "icpdas,sram-lp8x4x"

No wildcards please. Otherwise looks fine.

> +
> +- reg: physical base addresses and region lengths of
> +       * IO memory range
> +       * SRAM page selector
> +
> +SRAM chip is connected via FPGA and is not accessible without a driver,
> +unlike flash memory which is wired to CPU MMU. Driver is essentially
> +an address translation routine.
> +
> +Example:
> +
> +	sram@a000 {
> +		compatible = "icpdas,sram-lp8x4x";
> +		reg = <0xa000 0x1000
> +		       0x901e 0x1>;
> +	};
