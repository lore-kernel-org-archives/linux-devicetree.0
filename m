From: Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: PCIE device tree bindings - Could you help me to understand?
Date: Thu, 7 Mar 2013 15:04:16 +0530
Message-ID: <CA+V-a8vY_qfh0-4yyFW4JgWanjycPcbc1LzgL2HhQVEzwxOHMg@mail.gmail.com>
References: <513785EF.7000508@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <513785EF.7000508-l0cyMroinI0@public.gmane.org>
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
To: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Cc: device-tree <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Murali,

On Wed, Mar 6, 2013 at 11:37 PM, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org> wrote:
> Hello All,
>
> I am working to develop a PCIE driver that requires DT bindings. Could
> someone point me to a documentation or code or explain how to interpret the
> following device tree bindings. I understand the reg property only. There is
> outbound PCIE memory and inbound PCIE memory. But can't understand the below
> bindings for the same. Also how the interrupt mapping works? Below dts

Refer the following links [1] [2] it gives the good explanation for
your above query.

[1] http://devicetree.org/Device_Tree_Usage#PCI_Host_Bridge
[2] http://devicetree.org/MPC5200:PCI

Regards,
--Prabhakar Lad

> bindings is copied from powerpc/boot/dts/ep405.dts. Surprisingly I am not
> seeing any example pcie bindings on ARM architecture even though there PCI
> or PCIE drivers available on ARM. Your help is appreciated.
>
>                 PCI0: pci@ec000000 {
>                         device_type = "pci";
>                         #interrupt-cells = <1>;
>                         #size-cells = <2>;
>                         #address-cells = <3>;
>                         compatible = "ibm,plb405gp-pci", "ibm,plb-pci";
>                         primary;
>                         reg = <0xeec00000 0x00000008    /* Config space
> access */
>                                0xeed80000 0x00000004    /* IACK */
>                                0xeed80000 0x00000004    /* Special cycle */
>                                0xef480000 0x00000040>;  /* Internal
> registers */
>
>                         /* Outbound ranges, one memory and one IO,
>                          * later cannot be changed. Chip supports a second
>                          * IO range but we don't use it for now
>                          */
>                         ranges = <0x02000000 0x00000000 0x80000000
> 0x80000000 0x00000000 0x20000000
>                                   0x01000000 0x00000000 0x00000000
> 0xe8000000 0x00000000 0x00010000>;
>
>                         /* Inbound 2GB range starting at 0 */
>                         dma-ranges = <0x42000000 0x0 0x0 0x0 0x0
> 0x80000000>;
>
>                         /* That's all I know about IRQs on that thing ... */
>                         interrupt-map-mask = <0xf800 0x0 0x0 0x0>;
>                         interrupt-map = <
>                                 /* USB */
>                                 0x7000 0x0 0x0 0x0 &UIC0 0x1e 0x8 /* IRQ5 */
>                         >;
>                 };
>
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
