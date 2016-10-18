From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: usb: atmel: fix a couple of copy-paste style
 typos
Date: Tue, 18 Oct 2016 13:58:44 +0200
Message-ID: <52ad1387-49fe-1b20-435f-9c77e460b69f@atmel.com>
References: <1476788718-21143-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476788718-21143-1-git-send-email-peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 18/10/2016 à 13:05, Peter Rosin a écrit :
> Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

We may take it in a future at91-x.y-dt branch which will go through arm-soc.

Thanks

> ---
>  Documentation/devicetree/bindings/usb/atmel-usb.txt | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> index f4262ed60582..ad8ea56a9ed3 100644
> --- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> @@ -6,9 +6,9 @@ Required properties:
>   - compatible: Should be "atmel,at91rm9200-ohci" for USB controllers
>     used in host mode.
>   - reg: Address and length of the register set for the device
> - - interrupts: Should contain ehci interrupt
> + - interrupts: Should contain ohci interrupt
>   - clocks: Should reference the peripheral, host and system clocks
> - - clock-names: Should contains two strings
> + - clock-names: Should contain three strings
>  		"ohci_clk" for the peripheral clock
>  		"hclk" for the host clock
>  		"uhpck" for the system clock
> @@ -35,7 +35,7 @@ Required properties:
>   - reg: Address and length of the register set for the device
>   - interrupts: Should contain ehci interrupt
>   - clocks: Should reference the peripheral and the UTMI clocks
> - - clock-names: Should contains two strings
> + - clock-names: Should contain two strings
>  		"ehci_clk" for the peripheral clock
>  		"usb_clk" for the UTMI clock
>  
> @@ -58,7 +58,7 @@ Required properties:
>   - reg: Address and length of the register set for the device
>   - interrupts: Should contain macb interrupt
>   - clocks: Should reference the peripheral and the AHB clocks
> - - clock-names: Should contains two strings
> + - clock-names: Should contain two strings
>  		"pclk" for the peripheral clock
>  		"hclk" for the AHB clock
>  
> @@ -85,7 +85,7 @@ Required properties:
>   - reg: Address and length of the register set for the device
>   - interrupts: Should contain usba interrupt
>   - clocks: Should reference the peripheral and host clocks
> - - clock-names: Should contains two strings
> + - clock-names: Should contain two strings
>  		"pclk" for the peripheral clock
>  		"hclk" for the host clock
>   - ep childnode: To specify the number of endpoints and their properties.
> 


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
