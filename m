From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RESEND PATCH 8/8] arm64: dts: rockchip: move the rk3368 thermal data into rk3368.dtsi
Date: Mon, 25 Apr 2016 09:57:56 +0200
Message-ID: <1669183.h99KHesK9J@diego>
References: <1461319374-10024-1-git-send-email-wxt@rock-chips.com> <1461319374-10024-9-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461319374-10024-9-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>
Cc: edubezval@gmail.com, dianders@chromium.org, briannorris@google.com, smbarber@google.com, linux-rockchip@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Matthias Brugger <mbrugger@suse.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 22. April 2016, 18:02:54 schrieb Caesar Wang:
> In order to be standard to manage for rockchip SoCs,  move the thermal
> data into rk3368 dtsi, we needn't to add a new file for thermal.
> 
> Fixes commit f990238f859e
> ("arm64: dts: rockchip: Add main thermal info to rk3368.dtsi")
> 
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Eduardo Valentin <edubezval@gmail.com>
> Cc: Heiko Stuebner <heiko@sntech.de>

completely independent of the thermal changes above, so I've picked this one 
up for 4.7


Thanks
Heiko
