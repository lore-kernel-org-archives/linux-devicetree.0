From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2] mtd: nand: document the NAND controller/NAND chip DT
 representation
Date: Mon, 4 Apr 2016 23:48:26 +0200
Message-ID: <20160404234826.767b582f@bbrezillon>
References: <1459513595-14308-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459513595-14308-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Harvey Hunt <harvey.hunt@imgtec.com>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri,  1 Apr 2016 14:26:35 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Standardize the NAND controller/NAND chip DT representation. Now, all new
> NAND controller drivers should comply with this representation, even if
> they are only supporting a single NAND chip.
> 
> Existing drivers can keep support for the old representation (where only
> the NAND chip was described), but are encouraged to also support the new
> one.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Applied.

> ---
> Changes since v1:
> - fix typo
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt | 37 +++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
> index b53f92e..a17662b 100644
> --- a/Documentation/devicetree/bindings/mtd/nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> @@ -1,4 +1,23 @@
> -* MTD generic binding
> +* NAND chip and NAND controller generic binding
> +
> +NAND controller/NAND chip representation:
> +
> +The NAND controller should be represented with its own DT node, and all
> +NAND chips attached to this controller should be defined as children nodes
> +of the NAND controller. This representation should be enforced even for
> +simple controllers supporting only one chip.
> +
> +Mandatory NAND controller properties:
> +- #address-cells: depends on your controller. Should at least be 1 to
> +		  encode the CS line id.
> +- #size-cells: depends on your controller. Put zero unless you need a
> +	       mapping between CS lines and dedicated memory regions
> +
> +Optional NAND controller properties
> +- ranges: only needed if you need to define a mapping between CS lines and
> +	  memory regions
> +
> +Optional NAND chip properties:
>  
>  - nand-ecc-mode : String, operation mode of the NAND ecc mode.
>    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
> @@ -19,3 +38,19 @@ errors per {size} bytes".
>  The interpretation of these parameters is implementation-defined, so not all
>  implementations must support all possible combinations. However, implementations
>  are encouraged to further specify the value(s) they support.
> +
> +Example:
> +
> +	nand-controller {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* controller specific properties */
> +
> +		nand@0 {
> +			reg = <0>;
> +			nand-ecc-mode = "soft_bch";
> +
> +			/* controller specific properties */
> +		};
> +	};



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
