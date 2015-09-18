From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 5/9] ARM: dts: Move all Cygnus peripherals into soc bus
Date: Fri, 18 Sep 2015 23:34:30 +0200
Message-ID: <1929872.EmD9YkfFuv@wuerfel>
References: <1442611454-16331-1-git-send-email-rjui@broadcom.com> <1442611454-16331-6-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442611454-16331-6-git-send-email-rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 18 September 2015 14:24:10 Ray Jui wrote:
> +       soc {
> +               compatible = "simple-bus";
> +               ranges;
> +               #address-cells = <1>;
> +               #size-cells = <1>;

> +               pinctrl: pinctrl@0301d0c8 {
> 

Similarly to the core bus, this seems to have address ranges 0x03xxxxxx and
0x18xxxxxx on it, so put those into the ranges.

It probably also makes sense to name the bus according to what kind of
bus (axi, ahb, plb, ...) is used here. If the soc has nested buses
(e.g. an ahb connected to an axi bus,) then model both of them in the DT.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
