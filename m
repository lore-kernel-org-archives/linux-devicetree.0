From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH v3 11/11] misc: pci_endpoint_test: Add LS1088a in
 pci_device_id table
Date: Thu, 12 Sep 2019 13:59:40 +0100
Message-ID: <20190912125939.GE9720@e119886-lin.cambridge.arm.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
 <20190902031716.43195-12-xiaowei.bao@nxp.com>
 <20190902125454.GK9720@e119886-lin.cambridge.arm.com>
 <AM5PR04MB3299D598229952C13C492B48F5B90@AM5PR04MB3299.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM5PR04MB3299D598229952C13C492B48F5B90@AM5PR04MB3299.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xiaowei Bao <xiaowei.bao@nxp.com>, helgaas@kernel.org
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "kishon@ti.com" <kishon@ti.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.o>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 03, 2019 at 01:52:30AM +0000, Xiaowei Bao wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Murray <andrew.murray@arm.com>
> > Sent: 2019年9月2日 20:55
> > To: Xiaowei Bao <xiaowei.bao@nxp.com>
> > Cc: robh+dt@kernel.org; mark.rutland@arm.com; shawnguo@kernel.org; Leo
> > Li <leoyang.li@nxp.com>; kishon@ti.com; lorenzo.pieralisi@arm.com; M.h.
> > Lian <minghuan.lian@nxp.com>; Mingkai Hu <mingkai.hu@nxp.com>; Roy
> > Zang <roy.zang@nxp.com>; jingoohan1@gmail.com;
> > gustavo.pimentel@synopsys.com; linux-pci@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linuxppc-dev@lists.ozlabs.org;
> > arnd@arndb.de; gregkh@linuxfoundation.org; Z.q. Hou
> > <zhiqiang.hou@nxp.com>
> > Subject: Re: [PATCH v3 11/11] misc: pci_endpoint_test: Add LS1088a in
> > pci_device_id table
> > 
> > On Mon, Sep 02, 2019 at 11:17:16AM +0800, Xiaowei Bao wrote:
> > > Add LS1088a in pci_device_id table so that pci-epf-test can be used
> > > for testing PCIe EP in LS1088a.
> > >
> > > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > > ---
> > > v2:
> > >  - No change.
> > > v3:
> > >  - No change.
> > >
> > >  drivers/misc/pci_endpoint_test.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/misc/pci_endpoint_test.c
> > > b/drivers/misc/pci_endpoint_test.c
> > > index 6e208a0..d531951 100644
> > > --- a/drivers/misc/pci_endpoint_test.c
> > > +++ b/drivers/misc/pci_endpoint_test.c
> > > @@ -793,6 +793,7 @@ static const struct pci_device_id
> > pci_endpoint_test_tbl[] = {
> > >  	{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_DRA74x) },
> > >  	{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_DRA72x) },
> > >  	{ PCI_DEVICE(PCI_VENDOR_ID_FREESCALE, 0x81c0) },
> > > +	{ PCI_DEVICE(PCI_VENDOR_ID_FREESCALE, 0x80c0) },
> > 
> > The Freescale PCI devices are the only devices in this table that don't have a
> > define for their device ID. I think a define should be created for both of the
> > device IDs above.
> 
> OK, but I only define in this file, I am not sure this can define in include/linux/pci_ids.h
> file 

This file seems a little inconsistent...

 - Two of the TI device IDs are defined in pci_ids.h and only used in pci_endpoint_test.c
 - One of the TI device IDs are defined in pci_endpoint_test.c and only used there
 - The Freescale device ID is hardcoded and only used in pci_endpoint_test.c

The header in pci_ids.h has a comment suggestion definitions are only added where used
in multiple files - yet I don't think this holds true.

Bjorn - do you have a suggestion?

Thanks,

Andrew Murray

> 
> Thanks 
> Xiaowei
> 
> > 
> > Thanks,
> > 
> > Andrew Murray
> > 
> > >  	{ PCI_DEVICE_DATA(SYNOPSYS, EDDA, NULL) },
> > >  	{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_AM654),
> > >  	  .driver_data = (kernel_ulong_t)&am654_data
> > > --
> > > 2.9.5
> > >
