From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH net-next] bindings: net: stmmac: correctify note about LPI
 interrupt
Date: Fri, 10 Nov 2017 11:47:29 +0100
Message-ID: <bf749c8c-8a4b-6ecb-c979-60113252d909@st.com>
References: <20171109170928.15496-1-niklas.cassel@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171109170928.15496-1-niklas.cassel-VrBV9hrLPhE@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Joao Pinto <Joao.Pinto-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Niklas Cassel <niklass-VrBV9hrLPhE@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 11/09/2017 06:09 PM, Niklas Cassel wrote:
> There are two different combined signal for various interrupt events:
> In EQOS-CORE and EQOS-MTL configurations, mci_intr_o is the interrupt
> signal.
> In EQOS-DMA, EQOS-AHB and EQOS-AXI configurations, these interrupt events
> are combined with the events in the DMA on the sbd_intr_o signal.
> 
> Depending on configuration, the device tree irq "macirq" will refer to
> either mci_intr_o or sbd_intr_o.
> 
> The databook states:
> "The MAC generates the LPI interrupt when the Tx or Rx side enters or exits
> the LPI state. The interrupt mci_intr_o (sbd_intr_o in certain
> configurations) is asserted when the LPI interrupt status is set.
> 
> When the MAC exits the Rx LPI state, then in addition to the mci_intr_o
> (sbd_intr_o in certain configurations), the sideband signal lpi_intr_o is
> asserted.
> 
> If you do not want to gate-off the application clock during the Rx LPI
> state, you can leave the lpi_intr_o signal unconnected and use the
> mci_intr_o (sbd_intr_o in certain configurations) signal to detect Rx LPI
> exit."
> 
> Since the "macirq" is always raised when Tx or Rx enters/exits the LPI
> state, "eth_lpi" must therefore refer to lpi_intr_o, which is only raised
> when Rx exits the LPI state. Update the DT binding description to reflect
> reality.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>
> ---
>   Documentation/devicetree/bindings/net/stmmac.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/stmmac.txt b/Documentation/devicetree/bindings/net/stmmac.txt
> index c3a7be6615c5..3a28a5d8857d 100644
> --- a/Documentation/devicetree/bindings/net/stmmac.txt
> +++ b/Documentation/devicetree/bindings/net/stmmac.txt
> @@ -12,7 +12,7 @@ Required properties:
>   	Valid interrupt names are:
>     - "macirq" (combined signal for various interrupt events)
>     - "eth_wake_irq" (the interrupt to manage the remote wake-up packet detection)
> -  - "eth_lpi" (the interrupt that occurs when Tx or Rx enters/exits LPI state)
> +  - "eth_lpi" (the interrupt that occurs when Rx exits the LPI state)
>   - phy-mode: See ethernet.txt file in the same directory.
>   - snps,reset-gpio 	gpio number for phy reset.
>   - snps,reset-active-low boolean flag to indicate if phy reset is active low.
> 
Acked-by: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
