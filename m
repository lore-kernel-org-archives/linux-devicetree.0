From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 4/6] arm64: dts: rockchip: enable typec-phy for rk3399-firefly.
Date: Fri, 16 Mar 2018 11:38:44 +0100
Message-ID: <1887626.1ycpCmxoJD@phil>
References: <20180301152515.20940-1-enric.balletbo@collabora.com> <20180301152515.20940-5-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180301152515.20940-5-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: kishon@ti.com, groeck@chromium.org, gwendal@chromium.org, kernel@collabora.com, vicencb@gmail.com, devicetree@vger.kernel.org, Pierre-Hugues Husson <phh@phh.me>, Jianqun Xu <jay.xu@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 1. März 2018, 16:25:13 CET schrieb Enric Balletbo i Serra:
> Commit c301b327aea898af ("arm64: dts: rockchip: add usb3-phy otg-port
> support for rk3399") caused a regression regarding the USB3. During boot,
> the following message appears a few times:
> 
>       dwc3: failed to initialize core
> 
> The driver is deferred waiting for the typec-phy, but this never happens
> beause is disabled. So, enable it.
> 
> Fixes: c301b327aea898af ("arm64: dts: rockchip: add usb3-phy otg-port support for rk3399")
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

[Same blurb as in patch 3/6]
I've amended the message a bit to clarify that the offending commit
has been reverted for now and this change is needed for reenabling it
and also dropped the Fixes tag.

I've also moved the node to a better place - if in doubt please sort
the "&foo {" things alphabetically.

I've applied the result in my 4.17 branch, but may move that to 4.18
depending on timing. The reenablement of the otg-port will be in
4.18 only anyway.


Heiko
