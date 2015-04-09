From: Philippe De Muyter <phdm-vQo90/bmh3WzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] Documentation: bindings: add abracon,abx80x
Date: Thu, 9 Apr 2015 15:25:23 +0200
Message-ID: <20150409132523.GA4421__15866.8049531572$1428586867$gmane$org@frolo.macqel>
References: <1427856743-26625-1-git-send-email-alexandre.belloni@free-electrons.com> <1427856743-26625-2-git-send-email-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1427856743-26625-2-git-send-email-alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

when I look into Documentation/devicetree/bindings/rtc, it seems that
all rtc but a few (mainly old ones) have the "-rtc" suffix in the
"compatible" property.

Would it not be better to keep it here also, like what I had written ?

Best regards

Philippe


On Wed, Apr 01, 2015 at 04:52:22AM +0200, Alexandre Belloni wrote:
> Document the bindings for abracon,abx80x and related compatibles.
> 
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Signed-off-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../devicetree/bindings/rtc/abracon,abx80x.txt     | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> new file mode 100644
> index 000000000000..6f0d3b2cdd89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> @@ -0,0 +1,32 @@
> +Abracon ABX80X I2C ultra low power RTC/Alarm chip
> +
> +The Abracon ABX80X family consist of the ab0801, ab0803, ab0804, ab0805, ab1801,
> +ab1803, ab1804 and ab1805. The ab0805 is the superset of ab080x and the ab1805
> +is the superset of ab180x.
> +
> +Required properties:
> +
> + - "compatible": should one of:
> +        "abracon,abx80x"
> +        "abracon,ab0801"
> +        "abracon,ab0803"
> +        "abracon,ab0804"
> +        "abracon,ab0805"
> +        "abracon,ab1801"
> +        "abracon,ab1803"
> +        "abracon,ab1804"
> +        "abracon,ab1805"
> +	Using "abracon,abx80x" will enable chip autodetection.
> + - "reg": I2C bus address of the device
> +
> +Optional properties:
> +
> +The abx804 and abx805 have a trickle charger that is able to charge the
> +connected battery or supercap. Both the following properties have to be defined
> +and valid to enable charging:
> +
> + - "abracon,tc-diode": should be "standard" (0.6V) or "schottky" (0.3V)
> + - "abracon,tc-resistor": should be <0>, <3>, <6> or <11>. 0 disables the output
> +                          resistor, the other values are in ohm.
> +
> +
> -- 
> 2.1.0

-- 
Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Bruxelles
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
