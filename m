From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: Re: [PATCH] mtd: nand: document the NAND controller/NAND chip DT
 representation
Date: Thu, 31 Mar 2016 16:15:26 +0100
Message-ID: <56FD3F0E.9080306@imgtec.com>
References: <1459432633-23162-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459432633-23162-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Boris,

On 31/03/16 14:57, Boris Brezillon wrote:
> Standardize the NAND controller/NAND chip DT representation. Now, all new
> NAND controller drivers should comply with this representation, even if
> they are only supporting a single NAND chip.
>
> Existing drivers can keep support for the old representation (where only
> the NAND chip was described), but are encouraged to also support the new
> one.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>   Documentation/devicetree/bindings/mtd/nand.txt | 37 +++++++++++++++++++++++++-
>   1 file changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
> index b53f92e..fbf5677 100644
> --- a/Documentation/devicetree/bindings/mtd/nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> @@ -1,4 +1,23 @@
> -* MTD generic binding
> +* NAND chip and NAND controller generic binding
> +
> +NAND controller/NAND chip representation:
> +
> +The NAND controller should be represented with it's own DT node, and all

s/it's/its/

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
>   - nand-ecc-mode : String, operation mode of the NAND ecc mode.
>     Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
> @@ -19,3 +38,19 @@ errors per {size} bytes".
>   The interpretation of these parameters is implementation-defined, so not all
>   implementations must support all possible combinations. However, implementations
>   are encouraged to further specify the value(s) they support.
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

Did you mean "chip specific properties"?

> +		};
> +	};
>

Thanks,

Harvey
