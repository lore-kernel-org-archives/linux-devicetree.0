From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCHv3 0/4] dts/layerscape-pci: removed unsuitable compatible
 string
Date: Fri, 23 Nov 2018 11:48:16 +0000
Message-ID: <20181123114816.GA3564@e107981-ln.cambridge.arm.com>
References: <20181107053500.13575-1-Zhiqiang.Hou@nxp.com>
 <20181119120123.GQ5829@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181119120123.GQ5829@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "Z.q. Hou" <zhiqiang.hou@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Leo Li <leoyang.li@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 19, 2018 at 08:01:25PM +0800, Shawn Guo wrote:
> On Wed, Nov 07, 2018 at 05:35:12AM +0000, Z.q. Hou wrote:
> > From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > 
> > Removed the compatible string "snps,dw-pcie" from FSL layerscape-pci compatible
> > string list.
> > 
> > Hou Zhiqiang (4):
> >   dt-bindings: pci: layerscape-pci: add compatible strings
> >     "fsl,ls1043a-pcie"
> >   dt-bindings: pci: layerscape-pci: removed compatible string
> >     "snps,dw-pcie"
> >   ARM: dts: ls1021a: removed compatible string "snps,dw-pcie"
> >   arm64: dts: layerscape: removed compatible string "snps,dw-pcie"
> 
> Applied all, thanks.

Ok, thanks, patches dropped from PCI patch queue.

Lorenzo
