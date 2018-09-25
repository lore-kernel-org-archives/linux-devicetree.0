From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: add initial dts support for
 Rockpro64 board
Date: Tue, 25 Sep 2018 04:24:39 -0700
Message-ID: <5baa1af8.1c69fb81.b6252.4425@mx.google.com>
References: <Akash_Gajjar@mentor.com>
 <1537368206-22058-1-git-send-email-Akash_Gajjar@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1537368206-22058-1-git-send-email-Akash_Gajjar@mentor.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Akash Gajjar <Akash_Gajjar@mentor.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Shohei Maruyama <cheat.sc.linux@outlook.com>, Matthias Brugger <mbrugger@suse.com>, heiko@sntech.de, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Lin <shawn.lin@rock-chips.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pragnesh_Patel@mentor.com, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Deepak_Das@mentor.com, Levin Du <djw@t-chip.com.cn>, Ezequiel Garcia <ezequiel@collabora.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 19 Sep 2018 20:13:18 +0530, Akash Gajjar wrote:
> This patch basic node support for Rockpro64 board and make it able to bring up.
> 
> Peripheral Works
> - SDIO, Sdcard
> - USB 2.0, 3.0
> - Leds
> 
> Not working:
> - USB Type-C
> 
> Signed-off-by: Akash Gajjar <Akash_Gajjar@mentor.com>
> ---
> 
> Changes in v2:
> - add support for usb 2.0, 3.0
> - add fusb302 node and its regulator support
> - cleanup pinctrl node
> - remove backlight, pcie, sound codec node inherited from firefly-rk3399 dts
> 
>  Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts  | 692 +++++++++++++++++++++
>  3 files changed, 697 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
> 

Reviewed-by: Rob Herring <robh@kernel.org>
