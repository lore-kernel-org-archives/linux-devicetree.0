From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: drm/bridge: adv7511: Add regulator bindings
Date: Tue, 29 Nov 2016 08:33:47 +0200
Message-ID: <2390919.s2CzTWN1li@avalon>
References: <1474622430-6704-1-git-send-email-architt@codeaurora.org> <1480399662-8858-1-git-send-email-architt@codeaurora.org> <1480399662-8858-2-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480399662-8858-2-git-send-email-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Archit,

Thank you for the patch.

On Tuesday 29 Nov 2016 11:37:41 Archit Taneja wrote:
> Add the regulator supply properties needed by ADV7511 and ADV7533.
> 
> The regulators are specified as optional properties since there can
> be boards which have a fixed supply directly routed to the pins, and
> these may not be modelled as regulator supplies.

That's why we have support for dummy supplies in the kernel, isn't it ? Isn't 
it better to make the supplies mandatory in the bindings (and obviously 
handling them as optional in the driver for backward-compatibility) ?

Apart from that,

Acked-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
> v3:
> - Revert back to having a common avdd-supply property for the 1.8V
>   supplies
> 
> Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt | 9 ++++++
> 1 file changed, 9 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
> b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt index
> 6532a59..13d53bc 100644
> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
> @@ -56,6 +56,15 @@ Optional properties:
>  - adi,disable-timing-generator: Only for ADV7533. Disables the internal
> timing generator. The chip will rely on the sync signals in the DSI data
> lanes, rather than generate its own timings for HDMI output.
> +- avdd-supply: A common 1.8V supply that powers up the AVDD, DVDD and PVDD
> +  pins. On ADV7511, it also feeds to the BGVDD pin. On ADV7533, it also
> powers
> +  up the A2VDD pin.
> +- v3p3-supply: A 3.3V supply that powers up the pin called DVDD_3V on
> +  ADV7511 and V3P3 on ADV7533.
> +
> +ADV7533 specific supplies:
> +- v1p2-supply: A supply that powers up the V1P2 pin on the chip. It can be
> +  either 1.2V or 1.8V.
> 
>  Required nodes:

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
