From: Honghui Zhang <honghui.zhang@mediatek.com>
Subject: Re: [PATCH v2 2/2] PCI: mediatek: Fixup class type for MT7622
Date: Thu, 21 Dec 2017 15:01:12 +0800
Message-ID: <1513839672.25872.13.camel@mhfsdcap03>
References: <1513822277-18329-1-git-send-email-honghui.zhang@mediatek.com>
         <1513822277-18329-3-git-send-email-honghui.zhang@mediatek.com>
         <1513838476.23174.3.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1513838476.23174.3.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Wu <yong.wu@mediatek.com>
Cc: bhelgaas@google.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, ryder.lee@mediatek.com, lorenzo.pieralisi@arm.com, hongkun.cao@mediatek.com, youlin.pei@mediatek.com, yt.shen@mediatek.com, sean.wang@mediatek.com, xinping.qian@mediatek.com, yu.yu@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, 2017-12-21 at 14:41 +0800, Yong Wu wrote:
> On Thu, 2017-12-21 at 10:11 +0800, honghui.zhang@mediatek.com wrote:
> > From: Honghui Zhang <honghui.zhang@mediatek.com>
> > 
> > The host bridge of MT7622 has hardware code the class code to an
> > arbitrary, meaningless value, fix that.
> > 
> > Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>
> > ---
> >  drivers/pci/host/pcie-mediatek.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/pci/host/pcie-mediatek.c b/drivers/pci/host/pcie-mediatek.c
> > index 3248771..ae8d367 100644
> > --- a/drivers/pci/host/pcie-mediatek.c
> > +++ b/drivers/pci/host/pcie-mediatek.c
> > @@ -1174,3 +1174,15 @@ static struct platform_driver mtk_pcie_driver = {
> >  	},
> >  };
> >  builtin_platform_driver(mtk_pcie_driver);
> > +
> > +/* The host bridge of MT7622 advertises the wrong device class. */
> > +static void mtk_fixup_class(struct pci_dev *dev)
> > +{
> > +	dev->class = PCI_CLASS_BRIDGE_PCI << 8;
> > +}
> > +
> > +/*
> > + * The HW default value of vendor id and device id for mt7622 are 0x0e8d,
> > + * 0x3258, which are arbitrary, meaningless values.
> > + */
> 
> What's the right vendor id and device id? is it possible to fix them
> too?

Vendor ID is managed by PCI-SIG, you may get the assigned vendor ID
from:
https://pci-ids.ucw.cz/read/PC?restrict=

The vendor ID for Mediatek Corp. should be 14c3.
Device ID is something like vendor-defined.
Those values are in the configuration space and are read-only defined by
spec, it's been stored at the pci_dev, we may change the vendor and
device values in pci_dev, but I don't think it's necessary to change
that.
BTW, Does anyone really cares about the vendor ID and device ID except
the device's driver?

thanks.

> 
> > +DECLARE_PCI_FIXUP_EARLY(0x0e8d, 0x3258, mtk_fixup_class);
> 
> 
