From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 net-next 3/6] dt-bindings: net: Add lantiq,xrx200-net
 DT bindings
Date: Mon, 10 Sep 2018 14:53:08 +0200
Message-ID: <20180910125308.GC30395@lunn.ch>
References: <20180909201647.32727-1-hauke@hauke-m.de>
 <20180909201647.32727-4-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180909201647.32727-4-hauke@hauke-m.de>
Sender: netdev-owner@vger.kernel.org
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: davem@davemloft.net, netdev@vger.kernel.org, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 09, 2018 at 10:16:44PM +0200, Hauke Mehrtens wrote:
> This adds the binding for the PMAC core between the CPU and the GSWIP
> switch found on the xrx200 / VR9 Lantiq / Intel SoC.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/net/lantiq,xrx200-net.txt   | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt b/Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt
> new file mode 100644
> index 000000000000..8a2fe5200cdc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt
> @@ -0,0 +1,21 @@
> +Lantiq xRX200 GSWIP PMAC Ethernet driver
> +==================================
> +
> +Required properties:
> +
> +- compatible	: "lantiq,xrx200-net" for the PMAC of the embedded
> +		: GSWIP in the xXR200
> +- reg		: memory range of the PMAC core inside of the GSWIP core
> +- interrupts	: TX and RX DMA interrupts. Use interrupt-names "tx" for
> +		: the TX interrupt and "rx" for the RX interrupt.
> +
> +Example:
> +
> +eth0: eth@E10B308 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	compatible = "lantiq,xrx200-net";
> +	reg = <0xE10B308 0x30>;

Hi Hauke

This binding itself looks fine. I just find this address range a bit
odd. What are 0xe10b300-0xe10b307 used for? Are all 0x30 bytes used in
the range? The address range ending at 0xe10b338 seems a bit
odd. 0xe10b33f would be more typical.

I'm asking because it can be messy when you find out you need to
change the address range, and not break backwards compatibility.

     Andrew
