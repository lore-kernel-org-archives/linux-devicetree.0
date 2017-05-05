From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] powerpc/8xx: Adding support of IRQ in MPC8xx GPIO
Date: Fri, 5 May 2017 15:13:57 -0500
Message-ID: <20170505201357.bxbjo623uiey5vvu@rob-hp-laptop>
References: <20170501073813.7567549BED@pc13941vm.idsi0.si.c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170501073813.7567549BED-jKNfpIzOiMCZ2rhzPqGWdn/N20GrQ81gUBSOeVevoDU@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Leroy <christophe.leroy-GgN8y9CXRhA@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, May 01, 2017 at 09:38:13AM +0200, Christophe Leroy wrote:
> This patch allows the use of IRQ to notify the change of GPIO status
> on MPC8xx CPM IO ports. This then allows to associate IRQs to GPIOs
> in the Device Tree.

Wow, that's an old part.

> Ex:
> 	CPM1_PIO_C: gpio-controller@960 {
> 		#gpio-cells = <2>;
> 		compatible = "fsl,cpm1-pario-bank-c";
> 		reg = <0x960 0x10>;
> 		fsl,cpm1-gpio-irq-mask = <0x0fff>;
> 		interrupts = <1 2 6 9 10 11 14 15 23 24 26 31>;
> 		interrupt-parent = <&CPM_PIC>;
> 		gpio-controller;
> 	};
> 
> The property 'fsl,cpm1-gpio-irq-mask' defines which of the 16 GPIOs
> have the associated interrupts defined in the 'interrupts' property.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy-GgN8y9CXRhA@public.gmane.org>
> ---
>  v2: Updated the binding ; changed property 'interrupt-mask' to 'fsl,cpm1-gpio-irq-mask'
> 
>  .../devicetree/bindings/soc/fsl/cpm_qe/gpio.txt    | 21 +++++++++++++++++-

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  arch/powerpc/include/asm/cpm1.h                    |  2 ++
>  arch/powerpc/sysdev/cpm1.c                         | 25 ++++++++++++++++++++++
>  3 files changed, 47 insertions(+), 1 deletion(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
