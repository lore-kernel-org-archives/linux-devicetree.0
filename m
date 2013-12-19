From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: Re: [PATCH] mmc: atmel-mci: document clock properties
Date: Thu, 19 Dec 2013 09:04:18 +0100
Message-ID: <20131219080418.GB3842@ldesroches-Latitude-E6320>
References: <1387272977-4523-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1387272977-4523-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris BREZILLON <b.brezillon@overkiz.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Landley <rob@landley.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 17, 2013 at 10:36:17AM +0100, Boris BREZILLON wrote:
> Document the clock properties required by the atmel-mci driver.
> 
> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
Acked-by: Ludovic Desroches <ludovic.desroches@atmel.com>

> ---
>  .../devicetree/bindings/mmc/atmel-hsmci.txt        |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/atmel-hsmci.txt b/Documentation/devicetree/bindings/mmc/atmel-hsmci.txt
> index 0a85c70..07ad020 100644
> --- a/Documentation/devicetree/bindings/mmc/atmel-hsmci.txt
> +++ b/Documentation/devicetree/bindings/mmc/atmel-hsmci.txt
> @@ -13,6 +13,9 @@ Required properties:
>  - #address-cells: should be one. The cell is the slot id.
>  - #size-cells: should be zero.
>  - at least one slot node
> +- clock-names: tuple listing input clock names.
> +	Required elements: "mci_clk"
> +- clocks: phandles to input clocks.
>  
>  The node contains child nodes for each slot that the platform uses
>  
> @@ -24,6 +27,8 @@ mmc0: mmc@f0008000 {
>  	interrupts = <12 4>;
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> +	clock-names = "mci_clk";
> +	clocks = <&mci0_clk>;
>  
>  	[ child node definitions...]
>  };
> -- 
> 1.7.9.5
> 
