From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] arm64: dts: rockchip: Add basic support for orion-r68
Date: Sun, 17 Jul 2016 15:10:19 -0500
Message-ID: <20160717201019.GA30063@rob-hp-laptop>
References: <1468577391-5096-1-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468577391-5096-1-git-send-email-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, heiko@sntech.de, catalin.marinas@arm.com, will.deacon@arm.com, dianders@chromium.org, briannorris@chromium.org, romain.perier@gmail.com, amstan@chromium.org, wxt@rock-chips.com, zyw@rock-chips.com, jay.xu@rock-chips.com, olof@lixom.net, afaerber@suse.de, mbrugger@suse.com, chauveau.julien@gmail.com, edubezval@gmail.com, sudeep.holla@arm.com, shawn.lin@rock-chips.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 15, 2016 at 12:09:51PM +0200, Matthias Brugger wrote:
> This patch adds basic support for the Tronsmart orion r86 set-top-box.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
> Changes since v2:
> - gpio-keys cleanpup
> - set sdmmc properties correctly
> 
>  Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  .../boot/dts/rockchip/rk3368-orion-r68-meta.dts    | 385 +++++++++++++++++++++
>  3 files changed, 390 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts

Acked-by: Rob Herring <robh@kernel.org>
