From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] kernel/resource: Add new flag IORESOURCE_SHARED
Date: Tue, 9 Jun 2015 14:33:57 +0200
Message-ID: <CAPybu_2Av-EM0wTwjR=Se6GOny=5D8wfhuG+x4mK1LzuwmW+xA@mail.gmail.com>
References: <1433501478-15164-1-git-send-email-ricardo.ribalda@gmail.com>
 <20150608182310.1F13FC406AA@trevor.secretlab.ca> <CAPybu_2-EZoMEkWR9BoRfzGBevxCp-sd+CiVK2DhRjLoy5Pfyg@mail.gmail.com>
 <20150609111320.F299FC40580@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150609111320.F299FC40580-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Cliff Wickman <cpw-sJ/iWh9BUns@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Grant



On Tue, Jun 9, 2015 at 1:13 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> On Mon, 8 Jun 2015 22:02:06 +0200
> , Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  wrote:
> > Hello Grant
> >
> > On Mon, Jun 8, 2015 at 8:23 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > > On Fri,  5 Jun 2015 12:51:17 +0200
> > > , Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > >  wrote:
> > >> Some device tree platforms have not defined correctly their memory
> > >> resources (i.e. Overlapping or duplication of resources).
> > >> To avoid this issue we have historically avoided to add their resources to
> > >> the resource tree. This leads to code duplication and oops when trying to
> > >> unload dynamically a device tree (feature introduced recently).
> > >>
> > >> This new flag tells the resource system that a resource can be shared by
> > >> multiple owners, so we can support device trees with problems at the
> > >> same time that we do not duplicate code or crash when unloading the
> > >> device tree.
> > >>
> > >> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > >> ---
> > >
> > > I'm really not comfortable with this change. The resource tree code is
> > > complicated enough as is. Adding this exception case quite probably adds
> > > corner cases that aren't property dealt with. If two regions overlay,
> > > and then request_region is called? Which region does it become a child
> > > of? And that's just off the top of my head. I don't want to hack in
> > > changes to the resource code for what is a corner case.
> >
> > I see your concern, perhaps you could provide a testcase and we can
> > find out if it fails or not. So far I have tested a device tree with
> > two devices on the same memory region, each device managed by a
> > driver.
>
> Actually, you need to provide the test case. You need to show that
> you've thought through all the implications and corner cases on the
> resource code. This is a non-trivial change to the how the resource code
> works, and you need to demonstrate that your really understand the
> implications of what you are doing.



On non broken platforms:

 it will work exactly as it works today.

On broken platforms:

I have tried with  duplicated devices: Both requesting the region via
devm_ioremap_resource

a0000000-dfffffff : PCI Bus 0000:00
  b0000000-cfffffff : PCI Bus 0000:01
      b0030000-b003ffff : /axi1/pcie_bridge_1
        b0030000-b003ffff : /axi1/pcie_bridge
          b0030000-b003ffff : /axi1/pcie_bridge
        b0030000-b003ffff : /axi1/pcie_bridge_1


pcie_bridge_0: pcie_bridge {
#address-cells = <1>;
#size-cells = <1>;
compatible = "xlnx,axi-pcie-1.00.a";
reg = < 0x30030000 0x10000 >;
interrupt-parent = <&xps_intc_0>;
interrupts = < 0 2 >;
qtec,apertures =<
0x80000000 0x20000000
0xa0000000 0x20000000
0xc0000000 0x20000000
0xe0000000 0x20000000
>;
};

pcie_bridge_1: pcie_bridge_1 {
#address-cells = <1>;
#size-cells = <1>;
compatible = "xlnx,axi-pcie-1.00.a";
reg = < 0x30030000 0x10000 >;
interrupt-parent = <&xps_intc_0>;
interrupts = < 31 2 >;
qtec,apertures =<
0x80000000 0x20000000
0xa0000000 0x20000000
0xc0000000 0x20000000
0xe0000000 0x20000000
>;
};

And for two devices requesting the same region via devm_ioremap_resource()



a0000000-dfffffff : PCI Bus 0000:00
  b0000000-cfffffff : PCI Bus 0000:01
      b0030000-b003ffff : /axi1/pcie_bridge
        b0030000-b003ffff : /axi1/pcie_bridge
        b0030000-b003ffff : /axi1/pcie_bridge

pcie_bridge_0: pcie_bridge {
#address-cells = <1>;
#size-cells = <1>;
compatible = "xlnx,axi-pcie-1.00.a";
reg = < 0x30030000 0x10000 >;
interrupt-parent = <&xps_intc_0>;
interrupts = < 0 2 >;
qtec,apertures =<
0x80000000 0x20000000
0xa0000000 0x20000000
0xc0000000 0x20000000
0xe0000000 0x20000000
>;
};

packer_0: packer_0{
#address-cells = <1>;
#size-cells = <1>;
      compatible = "qtec,axi_matrix_packer-1.00.a";
reg = < 0x30060000 0x10000 >;
qtec,pcie_bridge= <&pcie_bridge_0>;
};


If you can think of any other corner case, please let me know, and I
will try it, now I have a setup for this.


>
>
> Start with the example I pointed out. When a driver does a
> request_mem_region(), which resource does it end up being a parent of if
> the regions overlap? Can you write a unittest that demonstrates the code
> has the correct behaviour? Will a driver end up getting the wrong
> device's resource structure as the parent? (hint: yes it will)
>
> > I can load and unload the device tree perfectly.
>
> Merely making it work for your use-case isn't the issue. It's whether or
> not making this change will break the core behavour of the resource
> code.
>
> g.




-- 
Ricardo Ribalda
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
