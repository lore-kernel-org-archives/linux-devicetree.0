From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: add initial dts support for Rockpro64 board
Date: Mon, 24 Sep 2018 15:05:13 +0200
Message-ID: <2222229.AXOL4E5CHo@phil>
References: <Akash_Gajjar@mentor.com> <1537368206-22058-1-git-send-email-Akash_Gajjar@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537368206-22058-1-git-send-email-Akash_Gajjar@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Akash Gajjar <Akash_Gajjar@mentor.com>
Cc: Deepak_Das@mentor.com, Pragnesh_Patel@mentor.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Levin Du <djw@t-chip.com.cn>, Klaus Goger <klaus.goger@theobroma-systems.com>, Ezequiel Garcia <ezequiel@collabora.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shohei Maruyama <cheat.sc.linux@outlook.com>, Matthias Brugger <mbrugger@suse.com>, Shawn Lin <shawn.lin@rock-chips.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 19. September 2018, 16:43:18 CEST schrieb Akash Gajjar:
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

I've looked through the patch and didn't find any bigger issues, so please
fix the nits Deepak found and submit v3, which I can then apply :-) .


Thanks
Heiko
