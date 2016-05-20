From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: fixes the gic400 2nd region size for rk3368
Date: Fri, 20 May 2016 23:19:52 +0200
Message-ID: <2773450.t8WTDyMWXy@phil>
References: <1463582510-29156-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463582510-29156-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Olof Johansson <olof@lixom.net>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Will Deacon <will.deacon@arm.com>, Matthias Brugger <mbrugger@suse.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Eduardo Valentin <edubezval@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Caesar,

Am Mittwoch, 18. Mai 2016, 22:41:50 schrieb Caesar Wang:
> The 2nd additional region is the GIC virtual cpu interface register
> base and size.
> 
> As the gic400 of rk3368 says, the cpu interface register map as below
> 
> 
> 
> -0x0000 GICC_CTRL
> .
> .
> .
> -0x00fc GICC_IIDR
> -0x1000 GICC_IDR
> 
> Obviously, the region size should be greater than 0x1000.
> So we should make sure to include the GICC_IDR since the kernel will
> access it in some cases.
> 
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org

applied to a fixes branch for 4.7 with Shawn's review-tag.


Thanks for catching this
Heiko
