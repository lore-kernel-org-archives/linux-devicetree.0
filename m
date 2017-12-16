From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2] ARM: dts: add reset property for rk3066a-rayeager emac
 phy
Date: Sat, 16 Dec 2017 21:11:17 +0100
Message-ID: <9893397.vbQdaeDkgV@phil>
References: <1510134642-18797-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1510134642-18797-1-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Chris,

Am Mittwoch, 8. November 2017, 17:50:41 CET schrieb Chris Zhong:
> The ethernet phy of rk3066a-rayeager has a reset pin, it controlled by
> GPIO1_D6, this pin should be pull down then pull up to reset the phy.
> Add a reset-gpios property in phy0, make the phy can be reset when emac
> power on.
> 
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> ---
> 
> Changes in v2:
> use a generic property for reset, and this patch follow these 2 pathes
> from Geert Uytterhoeven <geert+renesas@glider.be>
> http://patchwork.ozlabs.org/patch/828499/
> http://patchwork.ozlabs.org/patch/828505/

looks like the phylib-patches were accepted some days ago,
so I've now also applied this patch for 4.16, after fixing the subject
by adding the "rockchip:" to "ARM: dts: rockchip": :-)


Heiko
