From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v3 0/2] Support for eMMC in AM65x-evm
Date: Thu, 24 Jan 2019 06:40:32 -0600
Message-ID: <20190124124032.aqp4ctqkpozbttwl@kahuna>
References: <20190117094424.7683-1-faiz_abbas@ti.com>
 <d75a123b-9e97-a3d1-1e3c-41ef6942dffb@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d75a123b-9e97-a3d1-1e3c-41ef6942dffb@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Faiz Abbas <faiz_abbas@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, robh+dt@kernel.org, t-kristo@ti.com
List-Id: devicetree@vger.kernel.org

On 13:43-20190124, Faiz Abbas wrote:
> Hi,
> 
> On 17/01/19 3:14 PM, Faiz Abbas wrote:
> > The following patches add eMMC support on TI's AM65x-evm.
> > 
> > v3:
> >  1. Fixed patch titles to only include eMMC
> >  2. Added dma-coherent to the sdhci0 node.
> > 
> > v2:
> >  1. The SD card node is under debug for some usecases.
> >     Only upstreaming eMMC support for now.
> >  2. Rebased to latest mainline.
> >  3. Removed status = "disabled" from dtsi patch
> >  4. Fixed node name to not include '_'s
> > 
> > Faiz Abbas (2):
> >   arm64: dts: ti: k3-am654: Add Support for eMMC host controller
> >   arm64: dts: ti: k3-am654-base-board: Add eMMC Support
> > 
> >  arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 14 +++++++++++
> >  .../arm64/boot/dts/ti/k3-am654-base-board.dts | 25 +++++++++++++++++++
> >  2 files changed, 39 insertions(+)
> > 
> 
> Gentle ping.


OK With me. Tero: are you publishing a next branch? could you
pick this up please?

-- 
Regards,
Nishanth Menon
