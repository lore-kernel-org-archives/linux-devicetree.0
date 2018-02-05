From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 1/2] of_pci_irq: add a check to fallback to standard
 device tree parsing
Date: Tue, 06 Feb 2018 08:36:24 +1100
Message-ID: <1517866584.2312.140.camel@kernel.crashing.org>
References: <31c765c53e85e41bfc001d110d69e46c9967f4e7.1516961656.git.ryder.lee@mediatek.com>
         <CAL_JsqLZqrxxpuEnoWEGkT2WCuyjqn0bM1DP8PdAwnQsso8kOA@mail.gmail.com>
         <1517563970.24622.9.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517563970.24622.9.camel@mtkswgap22>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2018-02-02 at 17:32 +0800, Ryder Lee wrote:
> On Wed, 2018-01-31 at 10:02 -0600, Rob Herring wrote:
> > On Wed, Jan 31, 2018 at 1:41 AM, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > > A root complex usually consist of a host bridge and multiple P2P bridges,
> > > and someone may express that in the form of a root node with many subnodes
> > > and list all four interrupts for each slot (child node) in the root node
> > > like this:
> > > 
> > >          pcie-controller {
> > >                  ...
> > >                  interrupt-map-mask = <0xf800 0 0 7>;
> > >                  interrupt-map = <0x0000 0 0 {INTx} &{interrupt parent} ...>
> > >                                   0x0800 0 0 {INTx} &{interrupt parent} ...>;
> > > 
> > >                  pcie@0,0 {
> > >                          reg = <0x0000 0 0 0 0>;
> > >                          ...
> > >                  };
> > > 
> > >                  pcie@1,0 {
> > >                          reg = <0x0800 0 0 0 0>;
> > >                          ...
> > >                  };
> > >          };
> > > 
> > > As shown above, we'd like to propagate IRQs from a root port to the devices
> > > in the hierarchy below it in this way.  However, it seems that the current
> > > parser couldn't handle such cases and will get something unexpected below:
> > > 
> > >          pcieport 0000:00:01.0: assign IRQ: got 213
> > >          igb 0000:01:00.0: assign IRQ: got 212
> > > 
> > > There is a device which is connected to 2nd slot, but the port doesn't share
> > > the same IRQ with its downstream devices.  The problem here is that, if the
> > > loop found a P2P bridge, it wouldn't check whether the reg property exists
> > > in ppnode or not but just pass the subordinate devfn to of_irq_parse_raw(),
> > > thus the subsequent flow couldn't correctly resolve them.

I don't really understand the problem explanation here. Something
doesn't look right as you shouldn't have to change that function, but I
just don't get what you a

Cheers,
Ben.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
