From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: dt confusion, for_each_matching_node...
Date: Thu, 28 Jul 2011 16:27:21 -0600
Message-ID: <20110728222721.GH4674@ponder.secretlab.ca>
References: <CA+03iojnhNU7ksPR=GBYgHo10juXXOTWcnxYH0F9h3kTtHSZzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CA+03iojnhNU7ksPR=GBYgHo10juXXOTWcnxYH0F9h3kTtHSZzw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Niklas Hernaeus <niklas.hernaeus-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 26, 2011 at 10:15:56PM +0200, Niklas Hernaeus wrote:
> Hi Grant.
> 
> I am afraid I am seriously confused about how the dt is supposed to work.
> Maybe I simply lack a detail, if I am lucky... perhaps it is to late in the
> day...
> 
> Problem:
> I cannot get the for_each_matching_node macro to give me anything, so the I
> guess the of_find_matching_node cannot find anything.
> I am using the uarts in the test code. With the test code below the snowball
> dies.
> Anyone see my mistake?
> 
> Thanks for any and all input.
> /Niklas.

The code looks fine, but as discussed on IRC, it looks like the dtb
isn't getting handed to the kernel in the first place, which would be
the root cause.  :-)

g.

> 
> Suggestion: I forgot some initialization somewhere?
> 
> In this device tree I have:
> 
> / {
>         model = "ST-Ericsson Snowball";
>         compatible = "snowball";
>         #address-cells = <1>;
>         #size-cells = <1>;
> 
>         #chosen {
>                 bootargs = "root=/dev/ram0 console=ttyAMA2,115200n8 debug
> earlyprintk";
>         };
> 
>         #memory {
>                 reg = <0x90000000 0x20000000>;
>         };
> 
>         #soc-u8500 {
>                 address-cells = <1>;
>                 size-cells = <1>;
>                 compatible = "simple-bus";
>                 periph1-base = <0x32000>;
> 
>                 cpus {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         cpu@0 {
>                                 compatible = "arm,cortex-a9";
>                                 reg = <0>;
>                         };
>                         cpu@1 {
>                                 compatible = "arm,cortex-a9";
>                                 reg = <1>;
>                         };
>                 };
>         };
> 
>         uart@80120000 {
>                 compatible = "arm,pl011";
>         };
>         uart@80121000 {
>                 compatible = "arm,pl011";
>         };
>         uart@80007000 {
>                 compatible = "arm,pl011";
>         };
>   };
> 
> 
> Test code:
> 
> static const struct of_device_id snowball_uarts[] __initconst={
>         {.compatible="arm,pl011"},
>         {},
> };
> 
> static void __init mop500_uart_init_dt(void)
> {
>         struct device_node *node;
>         u32 p0;
>         int ret;
> 
>         /* Get device info from device-tree */
>         for_each_matching_node(node, snowball_uarts) {
>                 goto doit;  /* Got something, all ok */
>         }
>         goto die;
> 
>  doit:
>         /* Standard init, no dt */
>         db8500_add_uart0(&uart0_plat);
>         db8500_add_uart1(&uart1_plat);
>         db8500_add_uart2(&uart2_plat);
> die:
>         ;
> };
