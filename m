From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v7 0/3] add support for Mediatek High-Speed DMA
 controller on MT7622 and MT7623 SoC
Date: Tue, 27 Mar 2018 17:31:46 +0530
Message-ID: <20180327120146.GI15443@localhost>
References: <cover.1521098171.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1521098171.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: dan.j.williams@intel.com, robh+dt@kernel.org, mark.rutland@arm.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 15, 2018 at 03:40:34PM +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> 
> This patchset introduces support for MediaTek High-Speed DMA controller
> (MTK-HSDMA) Currently, the driver is already tested successfully with
> dmatest module on MT7622 and MT7623 SoC. 
> 
> MTK-HSDMA on MT7622/23 SoC has a single ring which is dedicated for
> doing memory-to-memory transfer through ring-based descriptor management.
> Even though there is only a single ring available inside HSDMA, the
> driver is being extended to the support for multiple virtual channels
> processing simultaneously by means of DMA_VIRTUAL_CHANNELS.

Applied all, thanks

-- 
~Vinod
