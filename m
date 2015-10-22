From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] devicetree: add binding for Aurora VLSI NB8800
 Ethernet controller
Date: Thu, 22 Oct 2015 09:34:55 -0500
Message-ID: <CAL_Jsq+UXdX3X4J6JLQhxzfgxm1ZBZ4fVMPsL5X_DzhP1dD+GQ@mail.gmail.com>
References: <1445522558-5808-1-git-send-email-mans@mansr.com> <1445522558-5808-2-git-send-email-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445522558-5808-2-git-send-email-mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 22, 2015 at 9:02 AM, Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org> wrote:
> This adds a binding for the Aurora VLSI NB8800 Ethernet controller
> using the "aurora,nb8800" compatible string.  When used in Sigma
> Designs chips a few additional control registers are available.
> This variant is indicated by the "sigma,smp8640-ethernet" compatible
> string.
>
> Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/net/aurora,nb8800.txt      | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/aurora,nb8800.txt
>
> diff --git a/Documentation/devicetree/bindings/net/aurora,nb8800.txt b/Documentation/devicetree/bindings/net/aurora,nb8800.txt
> new file mode 100644
> index 0000000..c19f615
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/aurora,nb8800.txt
> @@ -0,0 +1,26 @@
> +* Aurora VLSI AU-NB8800 Ethernet controller
> +
> +Required properties:
> +- compatible: Should be "aurora,nb8800", "sigma,smp8640-ethernet"
> +       The latter indicates presence of extra features added by Sigma Designs.

These should be in opposite order. Most specific comes first.

> +- reg: Should be MMIO address space of the device
> +- interrupts: Should contain the interrupt specifier for the device
> +- interrupt-parent: Should be a phandle for the interrupt controller
> +- clocks: Should be a phandle for the clock for the device
> +
> +Common properties described in ethernet.txt:
> +- local-mac-address
> +- mac-address
> +- max-speed
> +- phy-mode
> +
> +Example:
> +
> +ethernet@26000 {
> +       compatible = "aurora,nb8800";
> +       reg = <0x10000 0x800>;
> +       interrupts = <42>;
> +       clocks = <&sys_clk>;
> +       max-speed = <1000>;
> +       phy-connection-type = "rgmii";
> +};
> --
> 2.5.3
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
