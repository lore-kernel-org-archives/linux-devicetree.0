From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH] dts-bindings: usb-uhci: Document newly added properties
Date: Thu, 18 Jan 2018 14:15:19 -0600
Message-ID: <CACPK8XfgWAr_gi9AAsE1qPbG93pE-gAVVQFSPE1h8YB2p4C4+w@mail.gmail.com>
References: <1516061175.31850.140.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516061175.31850.140.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 15, 2018 at 6:06 PM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> Commit 4642d34a439f80e16af0d56ed6258a33abae257a
> "usb/uhci: Add support for Aspeed BMC SoCs" added
> support for a new #ports property, along with
> Aspeed specific compatible strings. This adds
> documentation for them.
>
> Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>

Acked-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>


> ---
>  Documentation/devicetree/bindings/usb/usb-uhci.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/usb-uhci.txt b/Documentation/devicetree/bindings/usb/usb-uhci.txt
> index 298133416c97..c1153eb38a9a 100644
> --- a/Documentation/devicetree/bindings/usb/usb-uhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-uhci.txt
> @@ -3,8 +3,14 @@ Generic Platform UHCI Controller
>
>  Required properties:
>  - compatible : "generic-uhci" (deprecated: "platform-uhci")
> +  supports additional Aspeed specific workarounds by also
> +  including the "aspeed,ast2400-uhci" or "aspeed,ast2500-uhci"
> +  string.
>  - reg : Should contain 1 register ranges(address and length)
>  - interrupts : UHCI controller interrupt
> +- #ports: (optional) 1 cell, number of ports (overrides
> +  auto-detection which is needed among others on some Aspeed
> +  parts).
>
>  Example:
>
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
