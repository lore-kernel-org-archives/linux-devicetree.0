From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/5] Documentation: Add device tree binding for
 Goldfish PIC driver
Date: Thu, 26 Oct 2017 22:08:56 -0500
Message-ID: <20171027030856.a2mahvhipy5vly26@rob-hp-laptop>
References: <1508510055-6167-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1508510055-6167-2-git-send-email-aleksandar.markovic@rt-rk.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1508510055-6167-2-git-send-email-aleksandar.markovic@rt-rk.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Cc: linux-mips@linux-mips.org, Miodrag Dinic <miodrag.dinic@mips.com>, Goran Ferenc <goran.ferenc@mips.com>, Aleksandar Markovic <aleksandar.markovic@mips.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Douglas Leung <douglas.leung@mips.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, James Hogan <james.hogan@mips.com>, Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Paul Burton <paul.burton@mips.com>, Petar Jovanovic <petar.jovanovic@mips.com>, Raghu Gandham <raghu.gandham@mips.com>, Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 20, 2017 at 04:33:34PM +0200, Aleksandar Markovic wrote:
> From: Miodrag Dinic <miodrag.dinic@mips.com>
> 
> Add documentation for DT binding of Goldfish PIC driver. The compatible
> string used by OS for binding the driver is "google,goldfish-pic".
> 
> Signed-off-by: Miodrag Dinic <miodrag.dinic@mips.com>
> Signed-off-by: Goran Ferenc <goran.ferenc@mips.com>
> Signed-off-by: Aleksandar Markovic <aleksandar.markovic@mips.com>
> ---
>  .../interrupt-controller/google,goldfish-pic.txt   | 30 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt b/Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt
> new file mode 100644
> index 0000000..295bf97
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt
> @@ -0,0 +1,30 @@
> +Android Goldfish PIC
> +
> +Android Goldfish programmable interrupt device used by Android
> +emulator.
> +
> +Required properties:
> +
> +- compatible : should contain "google,goldfish-pic"
> +- reg        : <registers mapping>
> +- interrupts : <interrupt mapping>
> +
> +Example for mips when used in cascade mode:
> +
> +        cpuintc {
> +                #interrupt-cells = <0x1>;
> +                #address-cells = <0>;
> +                interrupt-controller;
> +                compatible = "mti,cpu-interrupt-controller";
> +        };
> +
> +        goldfish_pic@1f000000 {

interrupt-controller@...

With that,

Acked-by: Rob Herring <robh@kernel.org>

> +                compatible = "google,goldfish-pic";
> +                reg = <0x1f000000 0x0 0x1000>;
> +
> +                interrupt-controller;
> +                #interrupt-cells = <0x1>;
> +
> +                interrupt-parent = <&cpuintc>;
> +                interrupts = <0x2>;
> +        };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4a3de82..4d5108f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -872,6 +872,11 @@ S:	Supported
>  F:	drivers/android/
>  F:	drivers/staging/android/
>  
> +ANDROID GOLDFISH PIC DRIVER
> +M:	Miodrag Dinic <miodrag.dinic@mips.com>
> +S:	Supported
> +F:	Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt
> +
>  ANDROID GOLDFISH RTC DRIVER
>  M:	Miodrag Dinic <miodrag.dinic@mips.com>
>  S:	Supported
> -- 
> 2.7.4
> 
