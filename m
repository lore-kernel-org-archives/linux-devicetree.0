From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: userspace-consumer: add DT binding details
Date: Wed, 30 Jul 2014 16:53:03 +0100
Message-ID: <20140730155302.GE20162@leverpostej>
References: <1406728440-17837-1-git-send-email-ldewangan@nvidia.com>
 <1406728440-17837-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1406728440-17837-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 30, 2014 at 02:54:00PM +0100, Laxman Dewangan wrote:
> Add DT binding document and details DT binding for the driver
> regulator/userspace-consumer.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/regulator/userspace-consumer.txt      | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/userspace-consumer.txt
> 
> diff --git a/Documentation/devicetree/bindings/regulator/userspace-consumer.txt b/Documentation/devicetree/bindings/regulator/userspace-consumer.txt
> new file mode 100644
> index 0000000..73c651c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/userspace-consumer.txt
> @@ -0,0 +1,26 @@
> +Userspace consumer regulators
> +
> +Required properties:
> +- compatible		: Must be "reg-userspace-consumer".

I would never expect to see "userspace" in a DT beinding string; this is
entirely a software abstraction description and has nothing to do with
the interaction of HW components.

Why do you think we need this in the DT?

Thanks,
Mark.

> +- regulator-supplies: Supply names for this regulator. This can be
> +	multiple strings.
> +
> +Optional properties:
> +- regulator-name: Name of the consumer line.
> +- regulator-boot-on: Enable regulator on booting.
> +
> +With all supply names, there should be <supply-name>-supply to pass regulators
> +handle as defined in regulator.txt.
> +
> +Example:
> +
> +	userspace-consumer {
> +		compatible = "reg-userspace-consumer";
> +
> +		regulator-name = "gps-consumer";
> +		regulator-boot-on;
> +		regulator-supplies = "vdd", "vcc", "vdd-3v3";
> +		vdd-supply = <&reg1>;
> +		vcc-supply = <&reg2>;
> +		vdd-3v3-supply = <&reg3>;
> +	};
> -- 
> 1.8.1.5
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
