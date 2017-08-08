From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v3 5/6] PCI: mediatek: Add new generation controller
 support
Date: Tue, 8 Aug 2017 15:20:22 -0500
Message-ID: <20170808202022.GK16580@bhelgaas-glaptop.roam.corp.google.com>
References: <cover.1501846816.git.honghui.zhang@mediatek.com>
 <2adcb5f915eb8bd5817592ea32974eb25da02e4f.1501846816.git.honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2adcb5f915eb8bd5817592ea32974eb25da02e4f.1501846816.git.honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: honghui.zhang@mediatek.com
Cc: bhelgaas@google.com, robh@kerenl.org, robh+dt@kernel.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, ryder.lee@mediatek.com, youlin.pei@mediatek.com, hongkun.cao@mediatek.com, sean.wang@mediatek.com, xinping.qian@mediatek.com, yt.shen@mediatek.com, yong.wu@mediatek.com
List-Id: devicetree@vger.kernel.org

On Fri, Aug 04, 2017 at 08:06:41PM +0800, honghui.zhang@mediatek.com wrote:
> From: Ryder Lee <ryder.lee@mediatek.com>
> 
> MediaTek's PCIe host controller has two generation HWs, the new
> generation HW has two root ports, it shares most probing flow with the
> legacy controller. But the read/write config space logical is different
> from the legacy controller. The per-port register must be touched for
> read/write config space, And the per-port register base are in separate
> address space.

Can you also include the new controller IDs ("MT7622/MT2712"?) in the
subject line of this patch?

> Add support for new Gen2 controller which can be found on MT7622/MT2712.
