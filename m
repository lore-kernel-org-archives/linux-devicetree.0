From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] arm64: dts: rockchip: add initial dts support for
 Rockpro64
Date: Thu, 27 Sep 2018 15:02:51 -0500
Message-ID: <20180927200251.GA4060@bogus>
References: <Akash_Gajjar@mentor.com>
 <1537943105-21247-1-git-send-email-Akash_Gajjar@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1537943105-21247-1-git-send-email-Akash_Gajjar@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Akash Gajjar <Akash_Gajjar@mentor.com>
Cc: heiko@sntech.de, Deepak_das@mentor.com, Pragnesh_patel@mentor.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Levin Du <djw@t-chip.com.cn>, Klaus Goger <klaus.goger@theobroma-systems.com>, Ezequiel Garcia <ezequiel@collabora.com>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shohei Maruyama <cheat.sc.linux@outlook.com>, Pierre-Hugues Husson <phh@phh.me>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 26 Sep 2018 11:54:57 +0530, Akash Gajjar wrote:
> Rockpro64 is a rockchip RK3399 based board from pine64.org.
> This patch adds basic device node support for Rockpro64 board and make it able
> to bring up.
> 
> Peripheral Works
> - Sdcard
> - USB 2.0, 3.0
> - Leds
> - Ethernet
> - Debug console
> 
> Not working:
> - USB Type-C
> 
> Signed-off-by: Akash Gajjar <Akash_Gajjar@mentor.com>
> ---
> changes for v2
> - Added support for usb 2.0, 3.0
> - Added fusb302 node and its regulator support
> - Cleanup pinctrl node
> - Remove backlight, pcie, sound codec node inherited from firefly-rk3399 dts
> changes for v3
> - Added copyright properly
> - Typo correction in commit message
> 
>  Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts  | 692 +++++++++++++++++++++
>  3 files changed, 697 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
> 

Reviewed-by: Rob Herring <robh@kernel.org>
