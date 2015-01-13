From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v2 2/5] irqchip: Add DT binding doc for dumb demuxer
 chips
Date: Tue, 13 Jan 2015 14:00:50 -0500
Message-ID: <20150113190050.GZ24989@titan.lakedaemon.net>
References: <1421174781-4340-1-git-send-email-boris.brezillon@free-electrons.com>
 <1421174781-4340-3-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421174781-4340-3-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Boris,

On Tue, Jan 13, 2015 at 07:46:18PM +0100, Boris Brezillon wrote:
> Add documentation for the dumb demuxer.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../bindings/interrupt-controller/dumb-demux.txt   | 34 ++++++++++++=
++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-contr=
oller/dumb-demux.txt
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/d=
umb-demux.txt b/Documentation/devicetree/bindings/interrupt-controller/=
dumb-demux.txt
> new file mode 100644
> index 0000000..1c777ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/dumb-dem=
ux.txt
> @@ -0,0 +1,34 @@
> +* Generic Dumb Interrupt Demultiplexer
> +
> +This Dumb demultiplixer simply forward all incoming interrupts to it=
s
> +enabled/unmasked children.

Please forgive the potentially na=EFve question, but what hardware is t=
his
describing?

thx,

Jason.

> +
> +Required properties:
> +- compatible: Should be "irqchip-dumb-demux".
> +- interrupt-controller: Identifies the node as an interrupt controll=
er.
> +- interrupts-extended or interrupt-parent and interrupts: Reference =
the source
> +  interrupt connected to this dumb demuxer.
> +- #interrupt-cells: The number of cells to define the interrupts (sh=
ould be 1).
> +  The only cell is the IRQ number.
> +- irqs: u32 bitfield specifying the interrupts provided by the demux=
er.
> +
> +Examples:
> +	/*
> +	 * Dumb demuxer controller
> +	 */
> +	dumb_irq1_demux: dumb-irq-demux@1 {
> +		compatible =3D "irqchip-dumb-demux";
> +		interrupt-controller;
> +		#interrupt-cells =3D <1>;
> +		interrupts-extended =3D <&aic 1 IRQ_TYPE_LEVEL_HIGH 7>;
> +		irqs =3D <0x3f>;
> +	};
> +
> +	/*
> +	 * Device connected on this dumb demuxer
> +	 */
> +	dma: dma-controller@ffffec00 {
> +		compatible =3D "atmel,at91sam9g45-dma";
> +		reg =3D <0xffffec00 0x200>;
> +		interrupts-extended =3D <&dumb_irq1_demux 0>;
> +	};
> --=20
> 1.9.1
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
