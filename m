From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 1/9] arm64: dts: rockchip: add eMMC's power domain support for rk3399
Date: Mon, 14 Nov 2016 16:26:00 +0100
Message-ID: <10661534.hlmFYCF6CI@phil>
References: <1478697721-2323-1-git-send-email-wxt@rock-chips.com> <2342292.tK2jqRKrXH@phil> <5829D1C7.9020105@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5829D1C7.9020105@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Elaine Zhang <zhangqing@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>, Brian Norris <briannorris@chromium.org>, Ziyuan Xu <xzy.xu@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, tfiga@chromium.org, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, eddie.cai@rock-chips.com, linux-arm-kernel@lists.infradead.org, David Wu <david.wu@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Montag, 14. November 2016, 23:01:27 CET schrieb Caesar Wang:
> On 2016年11月14日 22:45, Heiko Stuebner wrote:
> > Am Mittwoch, 9. November 2016, 21:21:53 CET schrieb Caesar Wang:
> >> From: Ziyuan Xu <xzy.xu@rock-chips.com>
> >> 
> >> Control power domain for eMMC via genpd to reduce power consumption.
> >> 
> >> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> >> Signed-off-by: Ziyuan Xu <xzy.xu@rock-chips.com>
> >> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> > 
> > Authorship / Signed-off mismatch. From above suggest Ziyuan is the author
> > while first Signed-off-by indicates Elaine as author. Please clarify.
> 
> I believe the Elaine is the first author. Sorry for this kind of
> question to brother you again. :(

no problem :-) and thanks for the very fast reply.

Applied to my dts64 branch.


Thanks
Heiko
