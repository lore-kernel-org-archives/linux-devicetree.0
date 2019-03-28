From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive L2
 cache Controller
Date: Thu, 28 Mar 2019 08:16:57 -0500
Message-ID: <20190328131657.GA9056@bogus>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-2-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1552382461-13051-2-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yash Shah <yash.shah@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, palmer@sifive.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, bp@alien8.de, mchehab@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 12, 2019 at 02:51:00PM +0530, Yash Shah wrote:
> DT documentation for L2 cache controller added.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/edac/sifive-edac-l2.txt    | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
> 
> diff --git a/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
> new file mode 100644
> index 0000000..abce09f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
> @@ -0,0 +1,31 @@
> +SiFive L2 Cache EDAC driver device tree bindings
> +-------------------------------------------------
> +This driver uses the EDAC framework to report L2 cache controller ECC errors.

Bindings are for h/w blocks, not drivers. (And Boris may want a single 
driver, but bindings should reflect the h/w, not what Linux (currently) 
wants.

Are the only controls for ECC? Are all the cache attributes discoverable 
(size, ways, line size, level, etc.)? 

> +
> +- compatible: Should be "sifive,<chip>-ccache" and "sifive,ccache<version>".
> +  Supported compatible strings are:
> +  "sifive,fu540-c000-ccache" for the SiFive cache controller v0 as integrated
> +  onto the SiFive FU540 chip, and "sifive,ccache0" for the SiFive
> +  cache controller v0 IP block with no chip integration tweaks.
> +  Please refer to sifive-blocks-ip-versioning.txt for details
> +
> +- interrupts: Must contain 3 entries for FU540 (DirError, DataError, and
> +  DataFail signals) or 4 entries for other chips (DirError, DirFail, DataError,
> +  and DataFail signals)

3 or 4, but you only have 1 chip compatible defined?

> +
> +- interrupt-parent: Must be core interrupt controller

This is implied and could be in a parent node.

> +
> +- reg: Physical base address and size of L2 cache controller registers map
> +  A second range can indicate L2 Loosely Integrated Memory
> +
> +- reg-names: Names for the cells of reg, must contain "control" and "sideband"
> +
> +Example:
> +
> +cache-controller@2010000 {
> +	compatible = "sifive,fu540-c000-ccache", "sifive,ccache0";
> +	interrupt-parent = <&plic>;
> +	interrupts = <1 2 3>;
> +	reg = <0x0 0x2010000 0x0 0x1000 0x0 0x8000000 0x0 0x2000000>;
> +	reg-names = "control", "sideband";
> +};
> -- 
> 1.9.1
> 
