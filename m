From: Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 9/9] of/irq: create interrupts-extended property
Date: Tue, 12 Nov 2013 08:58:15 +1000
Message-ID: <CAEgOgz6=HhBkb2KtxcmHpNdE_0sNngw0NaL2SnLWj1opZkO3SA@mail.gmail.com>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org>
	<1381869563-16083-10-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381869563-16083-10-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Wed, Oct 16, 2013 at 6:39 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> The standard interrupts property in device tree can only handle
> interrupts coming from a single interrupt parent. If a device is wired
> to multiple interrupt controllers, then it needs to be attached to a
> node with an interrupt-map property to demux the interrupt specifiers
> which is confusing. It would be a lot easier if there was a form of the
> interrupts property that allows for a separate interrupt phandle for
> each interrupt specifier.
>
> This patch does exactly that by creating a new interrupts-extended
> property which reuses the phandle+arguments pattern used by GPIOs and
> other core bindings.
>
> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../bindings/interrupt-controller/interrupts.txt   | 29 +++++++--
>  arch/arm/boot/dts/testcases/tests-interrupts.dtsi  | 16 +++++
>  arch/arm/boot/dts/versatile-ab.dts                 |  2 +-
>  arch/arm/boot/dts/versatile-pb.dts                 |  2 +-
>  drivers/of/irq.c                                   | 16 +++--
>  drivers/of/selftest.c                              | 70 ++++++++++++++++++++++
>  6 files changed, 122 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> index 72a06c0..1486497 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> @@ -4,16 +4,33 @@ Specifying interrupt information for devices
>  1) Interrupt client nodes
>  -------------------------
>
> -Nodes that describe devices which generate interrupts must contain an
> -"interrupts" property. This property must contain a list of interrupt
> -specifiers, one per output interrupt. The format of the interrupt specifier is
> -determined by the interrupt controller to which the interrupts are routed; see
> -section 2 below for details.
> +Nodes that describe devices which generate interrupts must contain an either an
> +"interrupts" property or an "interrupts-extended" property. These properties
> +contain a list of interrupt specifiers, one per output interrupt. The format of
> +the interrupt specifier is determined by the interrupt controller to which the
> +interrupts are routed; see section 2 below for details.
> +
> +  Example:
> +       interrupt-parent = <&intc1>;
> +       interrupts = <5 0>, <6 0>;
>
>  The "interrupt-parent" property is used to specify the controller to which
>  interrupts are routed and contains a single phandle referring to the interrupt
>  controller node. This property is inherited, so it may be specified in an
> -interrupt client node or in any of its parent nodes.
> +interrupt client node or in any of its parent nodes. Interrupts listed in the
> +"interrupts" property are always in reference to the node's interrupt parent.
> +
> +The "interrupts-extended" property is a special form for use when a node needs
> +to reference multiple interrupt parents. Each entry in this property contains
> +both the parent phandle and the interrupt specifier. "interrupts-extended"
> +should only be used when a device has multiple interrupt parents.
> +
> +  Example:
> +       interrupts-extended = <&intc1 5 1>, <&intc2 1 0>;
> +

A slightly different but related problem I am trying to solve with
interrupt bindings, is to describe connection of a single device
interrupt line to multiple interrupts controller, whereas this binding
seems to be describing connection of different interrupt lines to
different controllers. Can this syntax accommodate my case is any way?

Bascially I think I'm asking for multiple interrupt specifiers for a
single IRQ output if that's possible.

Should I just be using the interrupt map syntax instead?

interrupt-map-mask = < 0 0 63>;
interrupt-map = < 0 0 25 &intc0 ... >, < 0 0 25 &intc1 ... >,

Regards,
Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
