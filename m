From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] dt/bindings: add documentation on standard property unit
 suffixes
Date: Mon, 8 Feb 2016 17:08:59 +0000
Message-ID: <20160208170858.GA15443@leverpostej>
References: <1454951044-18223-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1454951044-18223-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 08, 2016 at 11:04:04AM -0600, Rob Herring wrote:
> A common review comment is to add units to DT property names. The naming
> convention is inconsistent unfortunately although there are clear
> majorities in use already. This makes it hard to remember the exact name
> preferred, so I'm documenting this to provide an easy point of
> reference.

This looks good to me. FWIW:

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Mark.

> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  .../devicetree/bindings/property-units.txt         | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/property-units.txt
> 
> diff --git a/Documentation/devicetree/bindings/property-units.txt b/Documentation/devicetree/bindings/property-units.txt
> new file mode 100644
> index 0000000..f8231ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/property-units.txt
> @@ -0,0 +1,35 @@
> +Standard Unit Suffixes for Property names
> +
> +Properties which have a unit of measure are recommended to have a unit
> +suffix appended to the property name. The list below contains the
> +recommended suffixes. Other variations exist in bindings, but should not
> +be used in new bindings or added here. The inconsistency in the unit
> +prefixes is due to selecting the most commonly used variants.
> +
> +It is also recommended to use the units listed here and not add additional
> +unit prefixes.
> +
> +Time/Frequency
> +----------------------------------------
> +-mhz		: megahertz
> +-hz		: Hertz (preferred)
> +-sec		: seconds
> +-ms		: milliseconds
> +-us		: microseconds
> +-ns		: nanoseconds
> +
> +Electricity
> +----------------------------------------
> +-microamp	: micro amps
> +-ohms		: Ohms
> +-micro-ohms	: micro Ohms
> +-microvolt	: micro volts
> +
> +Temperature
> +----------------------------------------
> +-celsius	: Degrees Celsius
> +-millicelsius	: Degreee milli-Celsius
> +
> +Pressure
> +----------------------------------------
> +-kpascal	: kiloPascal
> -- 
> 2.5.0
> 
