From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 2/2] PCI: mediatek: Add controller support for MT7629
Date: Mon, 17 Dec 2018 08:32:47 -0600
Message-ID: <20181217143247.GK20725@google.com>
References: <1544058553-10936-1-git-send-email-jianjun.wang@mediatek.com>
 <1544058553-10936-3-git-send-email-jianjun.wang@mediatek.com>
 <20181213145517.GB4701@google.com>
 <1545034779.8528.8.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1545034779.8528.8.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: ryder.lee@mediatek.com, robh+dt@kernel.org, lorenzo.pieralisi@arm.com, matthias.bgg@gmail.com, linux-pci@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, youlin.pei@mediatek.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, honghui.zhang@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 17, 2018 at 04:19:39PM +0800, Jianjun Wang wrote:
> On Thu, 2018-12-13 at 08:55 -0600, Bjorn Helgaas wrote:
> > On Thu, Dec 06, 2018 at 09:09:13AM +0800, Jianjun Wang wrote:
> > > The read value of BAR0 is 0xffff_ffff, it's size will be calculated as 4GB
> > > in arm64 but bogus alignment values at arm32, the pcie device and devices
> > > behind this bridge will not be enabled. Fix it's BAR0 resource size to
> > > guarantee the pcie devices will be enabled correctly.
> > 
> > So this is a hardware erratum?  Per spec, a memory BAR has bit 0 hardwired
> > to 0, and an IO BAR has bit 1 hardwired to 0.
> 
> Yes, it only works properly on 64bit platform.

I don't understand.  BARs are supposed to work the same regardless of
whether it's a 32- or 64-bit platform.  If this is a workaround for a
hardware defect, please just say that explicitly.

Bjorn
