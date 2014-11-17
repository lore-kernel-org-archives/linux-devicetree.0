From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v5 5/6] Documentation: dt-bindings: Add binding info for X-Gene QMTM UIO driver
Date: Mon, 17 Nov 2014 12:17:16 +0100
Message-ID: <2279061.naADrHDgyn@wuerfel>
References: <1416220572-13381-1-git-send-email-ankit.jindal@linaro.org> <1416220572-13381-6-git-send-email-ankit.jindal@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416220572-13381-6-git-send-email-ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Anup Patel <anup-aa5cPYPs4nSSZfiimGR9Ow@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, patches-qTEPVZfXA3Y@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>, Tushar Jagad <tushar.jagad-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 17 November 2014 16:06:11 Ankit Jindal wrote:
> +
> +       qmtm1_uio: qmtm_uio@1f200000 {
> +               compatible = "apm,xgene-qmtm";
> +               status = "disabled";
> +               reg = <0x0 0x1f200000 0x0 0x10000>,
> +                     <0x0 0x1b000000 0x0 0x400000>;
> +               reg-names = "csr", "fabric";
> +               qpool-memory = <&qmtm1_uio_qpool>;
> +               clocks = <&qmtm1clk 0>;
> +               num-queues = <0x400>;
> +               devid = <1>;
> +       };
> +

To make my previous review comments clearer:

NAK

Do not create device nodes that are meant for a specific use case in
software and that are not usable for the common case. I don't think
it makes any sense to keep on submitting a UIO driver for this until
we have a proper network driver that uses this so we can make sure we
have a working binding.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
