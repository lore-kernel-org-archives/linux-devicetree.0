From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] of_pci_irq: add a check to fallback to standard
 device tree parsing
Date: Tue, 6 Feb 2018 12:31:11 +0800
Message-ID: <1517891471.20869.6.camel@mtkswgap22>
References: <31c765c53e85e41bfc001d110d69e46c9967f4e7.1516961656.git.ryder.lee@mediatek.com>
         <CAL_JsqLZqrxxpuEnoWEGkT2WCuyjqn0bM1DP8PdAwnQsso8kOA@mail.gmail.com>
         <1517563970.24622.9.camel@mtkswgap22>
         <1517866584.2312.140.camel@kernel.crashing.org>
         <1517884738.16010.27.camel@mtkswgap22>
         <1517889903.2312.151.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517889903.2312.151.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2018-02-06 at 15:05 +1100, Benjamin Herrenschmidt wrote:
> On Tue, 2018-02-06 at 10:38 +0800, Ryder Lee wrote:
> > 
> > I think the code should look at the bridge address <0x0800 ...> we list
> > in bindings for resolving interrupts in this case, but it seems like it
> > use the 'pdev->defvn << 8' which is not really we want and will lead to
> > mismatch.
> > 
> > 		interrupt-map-mask = <0xf800 0 0 7>;
> > 		interrupt-map = <0x0000 0 0 1 ...>,
> > 				<0x0000 0 0 2 ...>,
> > 				<0x0000 0 0 3 ...>,
> > 				<0x0000 0 0 4 ...>,
> > 
> > 				 0x0800 0 0 1 ...>,
> > 				 0x0800 0 0 2 ...>,
> > 				 0x0800 0 0 3 ...>,
> > 				 0x0800 0 0 4 ...>;
> > 		...
> > 		pcie@1,0 {
> > 			reg = <0x0800 0 0 0 0>;
> > 			...
> > 		};
> > 
> > 
> > Or, alternatively, we could add a interrupt-map property in both child
> > and root node to solve this. The below example is my original version as
> > I don't want to change that function either.
> 
> The code looks at devfn because it's meant to work for PCI including
> when the devices dont have a device node in the DT.
> 
> What I'm trying to figure out is what is it that your parent and
> children are representing here. Which is/are the root complex ?

This is a single root complex with 2 root port (children in DT).

> What is the actual topology as visible on the PCIe bus (is lspci output
> basically) and how does that map to your representation ?

# lspci
00:00.0 Class 0604: 14c3:0801 //1st slot - pcie@0,0
00:01.0 Class 0604: 14c3:0801 //2nd slot - pcie@1,0

01:00.0 Class 0280: 14c3:7603 //A device which is connected to 1st slot
02:00.0 Class 0200: 8086:1521 //A 4 func device which is connected to
2nd slot
02:00.1 Class 0200: 8086:1521
02:00.2 Class 0200: 8086:1521
02:00.3 Class 0200: 8086:1521

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
