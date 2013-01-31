From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] Document: devicetree: add OF documents for MIPS
 interrupt controller
Date: Thu, 31 Jan 2013 09:07:09 -0800
Message-ID: <510AA4BD.2030000@gmail.com>
References: <1359638444-8891-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1359638444-8891-1-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/31/2013 05:20 AM, John Crispin wrote:
> Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Acked-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

> ---
>   Documentation/devicetree/bindings/mips/cpu_irq.txt |   47 ++++++++++++++++++++
>   1 file changed, 47 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mips/cpu_irq.txt
>
> diff --git a/Documentation/devicetree/bindings/mips/cpu_irq.txt b/Documentation/devicetree/bindings/mips/cpu_irq.txt
> new file mode 100644
> index 0000000..13aa4b6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/cpu_irq.txt
> @@ -0,0 +1,47 @@
> +MIPS CPU interrupt controller
> +
> +On MIPS the mips_cpu_intc_init() helper can be used to initialize the 8 CPU
> +IRQs from a devicetree file and create a irq_domain for IRQ controller.
> +
> +With the irq_domain in place we can describe how the 8 IRQs are wired to the
> +platforms internal interrupt controller cascade.
> +
> +Below is an example of a platform describing the cascade inside the devicetree
> +and the code used to load it inside arch_init_irq().
> +
> +Required properties:
> +- compatible : Should be "mti,cpu-interrupt-controller"
> +
> +Example devicetree:
> +	cpu-irq: cpu-irq@0 {
> +		#address-cells = <0>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +
> +		compatible = "mti,cpu-interrupt-controller";
> +	};
> +
> +	intc: intc@200 {
> +		compatible = "ralink,rt2880-intc";
> +		reg = <0x200 0x100>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +
> +		interrupt-parent = <&cpu-irq>;
> +		interrupts = <2>;
> +	};
> +
> +
> +Example platform irq.c:
> +static struct of_device_id __initdata of_irq_ids[] = {
> +	{ .compatible = "mti,cpu-interrupt-controller", .data = mips_cpu_intc_init },
> +	{ .compatible = "ralink,rt2880-intc", .data = intc_of_init },
> +	{},
> +};
> +
> +void __init arch_init_irq(void)
> +{
> +	of_irq_init(of_irq_ids);
> +}
>
