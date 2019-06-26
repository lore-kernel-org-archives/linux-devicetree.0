From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add support for Hugsun X99 TV Box
Date: Thu, 27 Jun 2019 00:38:25 +0200
Message-ID: <3247989.aGYRIomCNH@phil>
References: <2273961.GTPgWWlV5T@phil>
 <20190621205308.5177-1-npcomplete13@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190621205308.5177-1-npcomplete13@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vivek Unune <npcomplete13@gmail.com>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 21. Juni 2019, 22:53:08 CEST schrieb Vivek Unune:
> Add devicetree support for Hugsun X99 TV Box based on RK3399 SoC
> 
> Tested with LibreElec running kernel v5.1.2.
> Following peripherals tested and work:
> 
> Peripheral works:
> - UART2 debug
> - eMMC
> - USB 3.0 port
> - USB 2.0 port
> - sdio, sd-card
> - HDMI
> - Ethernet
> - WiFi/BT
> 
> Not tested:
> - Type-C port
> - OPTICAL
> - IR
> 
> Signed-off-by: Vivek Unune <npcomplete13@gmail.com>

applied for 5.3 after doing some reordering to make things
alphabetical.

Heiko
