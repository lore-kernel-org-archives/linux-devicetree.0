From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/2] reset: img: Add pistachio reset controller binding
 document
Date: Fri, 15 Jan 2016 16:57:19 +0100
Message-ID: <1452873439.6067.86.camel@pengutronix.de>
References: <1452869073-27608-1-git-send-email-james.hartley@imgtec.com>
	 <1452869073-27608-2-git-send-email-james.hartley@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452869073-27608-2-git-send-email-james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Damien Horsley <damien.horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Govindraj Raja <govindraj.raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Freitag, den 15.01.2016, 14:44 +0000 schrieb James Hartley:
> From: "Damien.Horsley" <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> 
> Add binding document for the Pistachio SoC reset controller
> 
> Signed-off-by: Damien.Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/reset/img,pistachio-reset.txt         |   51 ++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/img,pistachio-reset.txt
> 
> diff --git a/Documentation/devicetree/bindings/reset/img,pistachio-reset.txt b/Documentation/devicetree/bindings/reset/img,pistachio-reset.txt
> new file mode 100644
> index 0000000..12558d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/img,pistachio-reset.txt
> @@ -0,0 +1,51 @@
> +Pistachio Reset Controller
> +=============================================================================
> +
> +This binding describes a reset controller device that is used to enable and
> +disable individual IP blocks within the Pistachio SoC using "soft reset"
> +control bits found in the Pistachio SoC top level registers.
> +
> +The actual action taken when soft reset is asserted is hardware dependent.
> +However, when asserted it may not be possible to access the hardware's
> +registers, and following an assert/deassert sequence the hardware's previous
> +state may no longer be valid.
> +
> +Please refer to Documentation/devicetree/bindings/reset/reset.txt
> +for common reset controller binding usage.
> +
> +Required properties:
> +
> +- compatible: Contains "img,pistachio-reset"
> +
> +- img,cr-periph: Contains a phandle to the peripheral control syscon
> +                    node which contains the soft reset register
> +
> +- #reset-cells: Contains 1
> +
> +Example:
> +
> +	pistachio_reset: reset-controller {
> +		compatible = "img,pistachio-reset";
> +		img,cr-periph = <&cr_periph>;
> +		#reset-cells = <1>;
> +	};

If this is just a register in the cr_periph syscon, why not put the
reset-controller node inside the cr_periph node:

    cr_periph: syscon@xyz {
        compatible = "syscon", "simple-mfd";
        pistachio_reset: reset-controller {
            compatible = "img,pistachio-reset";
            #reset-cells = <1>;
        };
    };

And in the driver use 
    syscon_node_to_regmap(np->parent);
instead of
    syscon_regmap_lookup_by_phandle(np, "img,cr-periph");
?

Do you need a reg property, or is will the register offset be 0 in all
pistachio variants?

> +Specifying reset control of devices
> +=======================================
> +
> +Device nodes should specify the reset channel required in their "resets"
> +property, containing a phandle to the pistachio reset device node and an
> +index specifying which reset to use, as described in
> +Documentation/devicetree/bindings/reset/reset.txt.
> +
> +Example:
> +
> +	spdif_out: spdif-out@18100d00 {
> +		...
> +		resets = <&pistachio_reset PISTACHIO_RESET_SPDIF_OUT>;
> +		reset-names = "rst";

reset-names is not needed for devices that only have one reset.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
