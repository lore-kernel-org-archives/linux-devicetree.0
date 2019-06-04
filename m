From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: fix isp iommu clocks and power domain
Date: Tue, 04 Jun 2019 15:37:12 +0200
Message-ID: <5083973.35ftUdt9Su@phil>
References: <20190603142214.24686-1-helen.koike@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603142214.24686-1-helen.koike@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Helen Koike <helen.koike@collabora.com>
Cc: linux-rockchip@lists.infradead.org, kernel@collabora.com, ezequiel@collabora.com, laurent.pinchart@ideasonboard.com, manivannan.sadhasivam@linaro.org, linux-arm-kernel@lists.infradead.org, Vicente Bergas <vicencb@gmail.com>, devicetree@vger.kernel.org, Klaus Goger <klaus.goger@theobroma-systems.com>, linux-kernel@vger.kernel.org, Christoph Muellner <christoph.muellner@theobroma-systems.com>, Randy Li <ayaka@soulik.info>, Philipp Tomsich <philipp.tomsich@theobroma-systems.com>, Rob Herring <robh+dt@kernel.org>, Tony Xie <tony.xie@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: devicetree@vger.kernel.org

Am Montag, 3. Juni 2019, 16:22:15 CEST schrieb Helen Koike:
> isp iommu requires wrapper variants of the clocks.
> noc variants are always on and using the wrapper variants will activate
> {A,H}CLK_ISP{0,1} due to the hierarchy.
> 
> Also add the respective power domain.
> 
> Refer:
>  RK3399 TRM v1.4 Fig. 2-4 RK3399 Clock Architecture Diagram
>  RK3399 TRM v1.4 Fig. 8-1 RK3399 Power Domain Partition
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>

applied for 5.3 with the received Tested-tag and I also moved
parts of the comment into the commit message making it:

"isp iommu requires wrapper variants of the clocks.
noc variants are always on and using the wrapper variants will activate
{A,H}CLK_ISP{0,1} due to the hierarchy.

Tested using the pending isp patch set (which is not upstream
yet). Without this patch, streaming from the isp stalls.
    
Also add the respective power domain and remove the "disabled" status.
    
Refer:
 RK3399 TRM v1.4 Fig. 2-4 RK3399 Clock Architecture Diagram
 RK3399 TRM v1.4 Fig. 8-1 RK3399 Power Domain Partition"

Thanks
Heiko
