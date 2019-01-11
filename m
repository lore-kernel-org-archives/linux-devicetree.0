From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: rockchip: add ROCK Pi 4 DTS support
Date: Fri, 11 Jan 2019 16:01:43 -0600
Message-ID: <20190111220143.GA9773@bogus>
References: <20190106044030.1484-1-Pragnesh_Patel@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190106044030.1484-1-Pragnesh_Patel@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: heiko@sntech.de, Akash Gajjar <Akash_Gajjar@mentor.com>, Pragnesh Patel <Pragnesh_Patel@mentor.com>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Levin Du <djw@t-chip.com.cn>, Ezequiel Garcia <ezequiel@collabora.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Liang Chen <cl@rock-chips.com>, Vicente Bergas <vicencb@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 6 Jan 2019 10:10:10 +0530, <Pragnesh_Patel@mentor.com> wrote:
> From: Akash Gajjar <Akash_Gajjar@mentor.com>
> 
> ROCK Pi 4 is RK3399 based SBC from radxa.com. board has a 1G/2G/4G lpddr4, CSI,
> DSI, HDMI, OTG, USB 2.0, USB 3.0, 10/100/1000 RGMII Ethernet Phy, es8316 codec,
> POE, WIFI (for Model B only), PCIE M.2 support on board.
> 
> This patch enables
> - HDMI Display
> - Console
> - MMC, EMMC
> - USB 2.0, USB-3.0
> - Ethernet
> 
> Signed-off-by: Akash Gajjar <Akash_Gajjar@mentor.com>
> Signed-off-by: Pragnesh Patel <Pragnesh_Patel@mentor.com>
> ---
> changes in v2
> - hdmi regulator name correction
> - replace gpio pin number with appropriate macro
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3399-rock-pi-4.dts    | 606 ++++++++++++++++++
>  3 files changed, 612 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dts
> 

Reviewed-by: Rob Herring <robh@kernel.org>
