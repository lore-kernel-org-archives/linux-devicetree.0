From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: Re: [PATCH 2/3] devicetree: add binding for Aurora VLSI NB8800
 Ethernet controller
Date: Fri, 23 Oct 2015 14:10:33 +0200
Message-ID: <562A23B9.3090208@sigmadesigns.com>
References: <1445522558-5808-1-git-send-email-mans@mansr.com>
 <1445522558-5808-2-git-send-email-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445522558-5808-2-git-send-email-mans@mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Cc: Mans Rullgard <mans@mansr.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Sebastian Frias <sebastian_frias@sigmadesigns.com>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, Mason <slash.tmp@free.fr>
List-Id: devicetree@vger.kernel.org

On 22/10/2015 16:02, Mans Rullgard wrote:

> This adds a binding for the Aurora VLSI NB8800 Ethernet controller
> using the "aurora,nb8800" compatible string.  When used in Sigma
> Designs chips a few additional control registers are available.
> This variant is indicated by the "sigma,smp8640-ethernet" compatible
> string.
> 
> Signed-off-by: Mans Rullgard <mans@mansr.com>
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
> +	The latter indicates presence of extra features added by Sigma Designs.

I've been meaning to ask a noob question to the devicetree group
about how names for compatible strings are chosen.

Sigma Designs has two active SoC families, Tango3 (which consists of
about a dozen MIPS-based SoCs, typically named SMP86xx) and Tango4
(a few ARM-based SoCs, typically named SMP87xx). I should note that
there is no SMP8640 SoC AFAIK, rather SMP864x is a Tango3 sub-family
(I could locate 42,43,44,45,46).

AFAIK, all our SoCs are using the same Aurora NB8800 Ethernet MAC,
along with the extra features. I find it odd to use a specific SoC
model to refer to this device, instead of a more generic name.
(It's weird having to mention smp8640 in the tango4 DT.)

Would it be possible to have a compatible string which makes it
clear that it is an Aurora MAC with vendor-specific tweaks?
Something like "sigma,aurora-nb8800-mac" ?

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
> +	compatible = "aurora,nb8800";
> +	reg = <0x10000 0x800>;
> +	interrupts = <42>;

I thought one had to specify also whether the device sent "edge"
or "level" IRQs?

> +	clocks = <&sys_clk>;
> +	max-speed = <1000>;
> +	phy-connection-type = "rgmii";
> +};

Regards.
