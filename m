From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCH net-next] bindings: net: stmmac: correctify note about
 LPI interrupt
Date: Sat, 11 Nov 2017 19:29:47 +0900 (KST)
Message-ID: <20171111.192947.1434990343306413974.davem@davemloft.net>
References: <20171109170928.15496-1-niklas.cassel@axis.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171109170928.15496-1-niklas.cassel-VrBV9hrLPhE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: niklas.cassel-VrBV9hrLPhE@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Joao.Pinto-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, niklass-VrBV9hrLPhE@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, peppe.cavallaro-qxv4g6HH51o@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>
Date: Thu,  9 Nov 2017 18:09:26 +0100

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

Applied.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
