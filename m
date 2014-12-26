From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Device Tree Child Node Parsing Question
Date: Fri, 26 Dec 2014 13:40:47 -0600
Message-ID: <CAL_JsqLzbEuQgNZoBbzr4R=Nj9_Qs=60uLhzENbZzTaaTgxnZg@mail.gmail.com>
References: <549999A7.2010608@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <549999A7.2010608-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 23, 2014 at 10:34 AM, Thor Thayer
<tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
> Hi,
>
> What is the best way to queue devicetree child nodes so the node is passed
> in the platform_device pointer to the probe() function?
>
> Documentation/devicetree/usage-model.txt has the following:
>
> "For Linux DT support, the generic behaviour is for child devices to be
> registered by the parent's device driver at driver .probe() time."
>
> "Actually, it turns out that registering children of some platform_devices
> as more platform_devices is a common pattern, and the
> device tree support code reflects that and makes the above example
> simpler.  The second argument to of_platform_populate() is an
> of_device_id table, and any node that matches an entry in that table
> will also get its child nodes registered."
>
>
> I tried calling of_platform_populate() in the probe of the a10_sysctl node
> but it doesn't appear to setup the platform device data properly for the
> sub-child nodes.
>
> The top child node (a10_sysctl) is probed properly and has a valid of_node
> passed in. However, the sub-child nodes such as gpio4 have null passed in
> for pdev->dev.of_node (gpio4 probe prototype is int
> a10sycon_gpio_probe(struct platform_device *pdev).
>
> My current solution is to call of_find_matching_node() in
> a10sycon_gpio_probe() to get a valid node pointer but other examples tend to
> dereference pdev->dev.of_node.
>
> Thank you in advance for your insight.

This should work. There are quite a few users already including unit
tests. Can you tell what you are doing differently from those users?

Rob

>
> Thor
>
>
> My device tree looks like this:
>
> / {
>     soc {
>         spi0: spi@fff00000 {
>              compatible = "snps,dw-spi-mmio";
>              #address-cells = <1>;
>              #size-cells = <0>;
>              reg = <0xfff00000 0x1000>;
>              interrupts = <0 154 4>;
>              num-chipselect = <4>;
>              clocks = <&per_base_clk>;
>              status = "okay";
>
>              a10_sysctl: a10_sysctl@0 {
>                 compatible = "altr,a10sycon";
>                 reg = <0>;
>                 interrupt-parent = <&gpio2>;
>                 /* low-level active IRQ at GPIO2_24 */
>                 interrupts = <24 0x8>;
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
>                 spi-max-frequency = <100000>;
>
>                 gpio4: gpio-controller {
>                         compatible = "altr,a10sycon-gpio";
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         ngpios = <16>;
>                 };
>
>                 a10rst: a10rst {
>                         compatible = "altr,a10sycon-reset";
>                         #reset-cells = <1>;
>                 };
>             };
>         };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
