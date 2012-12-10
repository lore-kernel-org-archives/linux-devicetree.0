From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] mtd: nand: davinci: fix the binding documentation
Date: Mon, 10 Dec 2012 23:00:43 +0000
Message-ID: <20121210230043.150293E081F@localhost>
References: <1354871374-4984-1-git-send-email-anilkumar.v@ti.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1354871374-4984-1-git-send-email-anilkumar.v@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, davinci-linux-open-source@linux.davincidsp.com
Cc: rob@landley.net, nsekhar@ti.com, rob.herring@calxeda.com, hs@denx.de, David.Woodhouse@intel.com, artem.bityutskiy@linux.intel.com, "Kumar, Anil" <anilkumar.v@ti.com>
List-Id: devicetree@vger.kernel.org

On Fri, 7 Dec 2012 14:39:34 +0530, "Kumar, Anil" <anilkumar.v@ti.com> wrote:
> Since the aemif driver conversion to DT along with
> its movement to drivers/ folder is not yet done,
> fix NAND binding documentation to have NAND specific
> DT details only.
> 
> Signed-off-by: Kumar, Anil <anilkumar.v@ti.com>

Applied, thanks.

g.

> ---
> :100644 100644 e37241f... 49fc7ad... M	Documentation/devicetree/bindings/arm/davinci/nand.txt
>  .../devicetree/bindings/arm/davinci/nand.txt       |   37 ++++++-------------
>  1 files changed, 12 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/davinci/nand.txt b/Documentation/devicetree/bindings/arm/davinci/nand.txt
> index e37241f..49fc7ad 100644
> --- a/Documentation/devicetree/bindings/arm/davinci/nand.txt
> +++ b/Documentation/devicetree/bindings/arm/davinci/nand.txt
> @@ -23,29 +23,16 @@ Recommended properties :
>  - ti,davinci-nand-buswidth: buswidth 8 or 16
>  - ti,davinci-nand-use-bbt: use flash based bad block table support.
>  
> -Example (enbw_cmc board):
> -aemif@60000000 {
> -	compatible = "ti,davinci-aemif";
> -	#address-cells = <2>;
> -	#size-cells = <1>;
> -	reg = <0x68000000 0x80000>;
> -	ranges = <2 0 0x60000000 0x02000000
> -		  3 0 0x62000000 0x02000000
> -		  4 0 0x64000000 0x02000000
> -		  5 0 0x66000000 0x02000000
> -		  6 0 0x68000000 0x02000000>;
> -	nand@3,0 {
> -		compatible = "ti,davinci-nand";
> -		reg = <3 0x0 0x807ff
> -			6 0x0 0x8000>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ti,davinci-chipselect = <1>;
> -		ti,davinci-mask-ale = <0>;
> -		ti,davinci-mask-cle = <0>;
> -		ti,davinci-mask-chipsel = <0>;
> -		ti,davinci-ecc-mode = "hw";
> -		ti,davinci-ecc-bits = <4>;
> -		ti,davinci-nand-use-bbt;
> -	};
> +Example(da850 EVM ):
> +nand_cs3@62000000 {
> +	compatible = "ti,davinci-nand";
> +	reg = <0x62000000 0x807ff
> +		0x68000000 0x8000>;
> +	ti,davinci-chipselect = <1>;
> +	ti,davinci-mask-ale = <0>;
> +	ti,davinci-mask-cle = <0>;
> +	ti,davinci-mask-chipsel = <0>;
> +	ti,davinci-ecc-mode = "hw";
> +	ti,davinci-ecc-bits = <4>;
> +	ti,davinci-nand-use-bbt;
>  };
> -- 
> 1.7.4.1
> 

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
