From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v1 0/4] Add clock ids for RK3228 HDMI/VOP modules
Date: Fri, 26 Feb 2016 02:14:26 +0100
Message-ID: <2198453.NY4VYR4LaI@phil>
References: <1456308303-29706-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456308303-29706-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Jeffy Chen <jeffy.chen@rock-chips.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 24. Februar 2016, 18:05:03 schrieb Yakir Yang:
> Add clocks ids for RK3228 HDMI/VOP modules which driver already have been
> posted.
> 
> RK3228 HDMI driver: https://patchwork.kernel.org/patch/7974671
> RK3228 VOP driver: https://patchwork.kernel.org/patch/7952591
> 
> Yakir Yang (4):
>   clk: rockchip: add the new clock ids for RK3228 VOP
>   clk: rockchip: set the clock ids for RK3228 VOP
>   clk: rockchip: add the new clock ids for RK3228 HDMI
>   clk: rockchip: set the clock ids for RK3228 HDMI

applied all 4 to my clk-branch


Thanks
Heiko
