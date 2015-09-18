From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 4/9] ARM: dts: Put Cygnus core components under core bus
Date: Fri, 18 Sep 2015 23:30:05 +0200
Message-ID: <1472876.fGCm1r9KFG@wuerfel>
References: <1442611454-16331-1-git-send-email-rjui@broadcom.com> <1442611454-16331-5-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442611454-16331-5-git-send-email-rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 18 September 2015 14:24:09 Ray Jui wrote:
> 
> +       core {
> +               compatible = "simple-bus";
> +               ranges;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +
> +               timer@19020200 {
> +                       compatible = "arm,cortex-a9-global-timer";
> +                       reg = <0x19020200 0x100>;
> +                       interrupts = <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&periph_clk>;
> +               };
> +
> +               gic: interrupt-controller@19021000 {
> 

Could it be that all 'core' components are in the 0x19xxxxxx address range?
If so, please set up an appropriate ranges property for the bus. Also
add the address field for the bus according to which addresses are routed
to it.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
