From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 2/4] ARM64: dts: rockchip: add core dtsi file for RK3399 SoCs
Date: Wed, 27 Apr 2016 23:30:08 +0200
Message-ID: <4859199.VscuxbHbWK@diego>
References: <1461743693-10671-1-git-send-email-jay.xu@rock-chips.com> <1461743693-10671-3-git-send-email-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461743693-10671-3-git-send-email-jay.xu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jianqun Xu <jay.xu@rock-chips.com>
Cc: lintao@rock-chips.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com, huangtao@rock-chips.com, davidriley@chromium.org, dianders@chromium.org, jwerner@chromium.org, smbarber@chromium.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 27. April 2016, 15:54:51 schrieb Jianqun Xu:
> This patch adds core dtsi file for Rockchip RK3399 SoCs.
> 
> The RK3399 has big/little architecture, which needs a separate
> node for the PMU of each microarchitecture, for now it missing
> the pmu node since the old one could not work well.
> 
> Tested-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

with some minor reorganizations, applied to my dts64 branch for 4.7


Thanks
Heiko
