From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC v2 PATCH 2/2] mtd: davinci - remove DaVinci architecture
 depedency
Date: Wed, 07 Nov 2012 13:08:57 -0700
Message-ID: <509ABFD9.8090704@wwwdotorg.org>
References: <1352238427-26085-1-git-send-email-m-karicheri2@ti.com> <1352238427-26085-3-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1352238427-26085-3-git-send-email-m-karicheri2@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Murali Karicheri <m-karicheri2@ti.com>
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, dwmw2@infradead.org, artem.bityutskiy@linux.intel.com, hs@denx.de, nsekhar@ti.com, mikedunn@newsguy.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, davinci-linux-open-source@linux.davincidsp.com, gregkh@linuxfoundation.org, hdoyu@nvidia.com, santosh.shilimkar@ti.com
List-Id: devicetree@vger.kernel.org

On 11/06/2012 02:47 PM, Murali Karicheri wrote:
> DaVinci NAND driver is a controller driver based on the AEMIF hardware
> IP found on TI SoCs. It is also used on SoCs that are not DaVinci based. This
> patch removes the driver dependency on DaVinci architecture so that it
> can be used on other architectures such as c6x, keystone etc.
> 
> Also migrate the driver to use the new AEMIF platform driver API and
> moving Documentation to Documentation/devicetree/bindings/mtd/davinci-nand.txt
> as this is expected to be used outside of arm/davinci.

>  delete mode 100644 Documentation/devicetree/bindings/arm/davinci/nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/davinci-nand.txt
>  create mode 100644 include/linux/platform_data/davinci-nand.h

Using "git format-patch -M" might show this as a file move/rename rather
than a delete/add, which would be useful to highlight any changes you
made at the same time.

> diff --git a/Documentation/devicetree/bindings/mtd/davinci-nand.txt b/Documentation/devicetree/bindings/mtd/davinci-nand.txt

> +Example (enbw_cmc board):
> +aemif@60000000 {
> +	compatible = "ti,davinci-aemif";
> +	#address-cells = <2>;
> +	#size-cells = <1>;
> +	reg = <0x68000000 0x80000>;
> +	ranges = <2 0 0x60000000 0x02000000
> +		  3 0 0x62000000 0x02000000
> +		  4 0 0x64000000 0x02000000
> +		  5 0 0x66000000 0x02000000
> +		  6 0 0x68000000 0x02000000>;
> +	nand@3,0 {

Here, isn't 3,0 the aemif chip-select ID that is decoding the NAND accesses?

> +		compatible = "ti,davinci-nand";
> +		reg = <3 0x0 0x807ff
> +			6 0x0 0x8000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ti,davinci-chipselect = <1>;

So I don't understand why that chipselect property is needed, or has a
different value. Is this muxing the AEMIF output chip-selects onto
different SoC package pins or something? Seems like a job for pinctrl
perhaps?

