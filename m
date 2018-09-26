From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3] arm64: dts: rockchip: add initial dts support for Rockpro64
Date: Wed, 26 Sep 2018 13:35:15 +0200
Message-ID: <6748636.LqZcXZ9sFQ@phil>
References: <Akash_Gajjar@mentor.com> <1537943105-21247-1-git-send-email-Akash_Gajjar@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537943105-21247-1-git-send-email-Akash_Gajjar@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Akash Gajjar <Akash_Gajjar@mentor.com>
Cc: Deepak_das@mentor.com, Pragnesh_patel@mentor.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Levin Du <djw@t-chip.com.cn>, Klaus Goger <klaus.goger@theobroma-systems.com>, Ezequiel Garcia <ezequiel@collabora.com>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shohei Maruyama <cheat.sc.linux@outlook.com>, Pierre-Hugues Husson <phh@phh.me>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 26. September 2018, 08:24:57 CEST schrieb Akash Gajjar:
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

applied for 4.20.

For future patches, please keep in mind to transfer received tags from
one version to the next. v2 received a "Reviewed-by" from Rob, so ideally
it should have been included below your Signed-off in v3.

I've picked that tag myself from v2, so no need to do anything now,
just for the next time ;-)

Thanks
Heiko
