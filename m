From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv4 1/2] dt-bindings: cadence-quadspi: add options reset
 property
Date: Mon, 13 May 2019 10:28:09 -0500
Message-ID: <20190513152809.GA28897@bogus>
References: <20190508134338.20565-1-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190508134338.20565-1-dinguyen@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-mtd@lists.infradead.org, marex@denx.de, tudor.ambarus@microchip.com, dwmw2@infradead.org, computersforpeace@gmail.com, bbrezillon@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 08, 2019 at 08:43:37AM -0500, Dinh Nguyen wrote:
> The QSPI module can have an optional reset signals that will hold the
> module in a reset state.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v4: no change
> v3: created base on review comments
> v2: did not exist
> v1: did not exist
> ---
>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> index 4345c3a6f530..b6264323a03c 100644
> --- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> @@ -35,6 +35,8 @@ custom properties:
>  		  (qspi_n_ss_out).
>  - cdns,tslch-ns : Delay in nanoseconds between setting qspi_n_ss_out low
>                    and first bit transfer.
> +- resets	: Must contain an entry for each entry in reset-names.
> +		  See ../reset/reset.txt for details.

reset-names needs to be documented with the values and order.

>  
>  Example:
>  
> @@ -50,6 +52,8 @@ Example:
>  		cdns,fifo-depth = <128>;
>  		cdns,fifo-width = <4>;
>  		cdns,trigger-address = <0x00000000>;
> +		resets = <&rst QSPI_RESET>, <&rst QSPI_OCP_RESET>;
> +		reset-names = "qspi", "qspi-ocp";
>  
>  		flash0: n25q00@0 {
>  			...
> -- 
> 2.20.0
> 
