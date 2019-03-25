From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive EDAC
 driver and subcomponent
Date: Sun, 24 Mar 2019 17:20:42 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1903241704210.8028@viisi.sifive.com>
References: <1553082728-9232-1-git-send-email-yash.shah@sifive.com> <1553082728-9232-2-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553082728-9232-2-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yash Shah <yash.shah@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, palmer@sifive.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, bp@alien8.de, mchehab@kernel.org, devicetree@vger.kernel.org, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

Hi Yash,

On Wed, 20 Mar 2019, Yash Shah wrote:

> DT documentation for EDAC driver added.
> DT documentation for subcomponent L2 cache controller also added.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/edac/sifive-edac.txt       | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/sifive-edac.txt
> 
> diff --git a/Documentation/devicetree/bindings/edac/sifive-edac.txt b/Documentation/devicetree/bindings/edac/sifive-edac.txt
> new file mode 100644
> index 0000000..c0e3ac7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/sifive-edac.txt
> @@ -0,0 +1,40 @@
> +SiFive ECC Manager
> +This driver uses the EDAC framework to implement the SiFive ECC Manager.
> +
> +Required Properties:
> +- compatible : Should be "sifive,ecc-manager"

As you've probably seen, this is being discussed in a separate thread with 
Borislav, but it would be ideal if we could avoid adding DT nodes for 
non-existent hardware.  Let's see what the outcome of that other thread 
will be.

> +L2 Cache ECC
> +Required Properties:
> +- compatible: Should be "sifive,<chip>-ccache" and "sifive,ccache<version>".

We should only use chip-specific compatible strings for this IP block, 
like "sifive,fu540-c000-ccache".  Let's not use "sifive,ccache*" here for 
now.

> +  Supported compatible strings are:
> +  "sifive,fu540-c000-ccache" for the SiFive cache controller v0 as integrated
> +  onto the SiFive FU540 chip, and "sifive,ccache0" for the SiFive
> +  cache controller v0 IP block with no chip integration tweaks.

Same comment here.

> +  Please refer to sifive-blocks-ip-versioning.txt for details
> +- interrupt-parent: Must be core interrupt controller
> +- interrupts: Must contain 3 entries (DirError, DataError and DataFail signals
> +- reg: Physical base address and size of L2 cache controller registers map
> +  A second range can indicate L2 Loosely Integrated Memory
> +
> +Example:
> +
> +eccmgr: eccmgr {
> +	compatible = "sifive,ecc-manager";

See above

> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +	ranges;
> +
> +	l2-ecc@2010000 {
> +		compatible = "sifive,fu540-c000-ccache", "sifive,ccache0";

And as above

> +		interrupt-parent = <&plic0>;
> +		interrupts = <1 2 3>;
> +		reg = <0x0 0x2010000 0x0 0x1000 0x0 0x8000000 0x0 0x2000000>;
> +	};
> +};

- Paul
