From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 net-next 4/7] dt-bindings: net: Add lantiq,xrx200-net
 DT bindings
Date: Mon, 3 Sep 2018 12:46:04 -0700
Message-ID: <5866e89f-ac9a-8c6c-bf53-3b1206171e31@gmail.com>
References: <20180901114535.9070-1-hauke@hauke-m.de>
 <20180901120407.9912-1-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180901120407.9912-1-hauke@hauke-m.de>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Hauke Mehrtens <hauke@hauke-m.de>, davem@davemloft.net
Cc: netdev@vger.kernel.org, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 9/1/2018 5:04 AM, Hauke Mehrtens wrote:
> This adds the binding for the PMAC core between the CPU and the GSWIP
> switch found on the xrx200 / VR9 Lantiq / Intel SoC.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> Cc: devicetree@vger.kernel.org
> ---
>   .../devicetree/bindings/net/lantiq,xrx200-net.txt   | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt
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

You would likely want to document that the order should be strict, that 
is TX interrupt first and RX interrupt second, but other than that:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
