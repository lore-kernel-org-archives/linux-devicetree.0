From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 1/3] arm: dts: rk322x: fix i2s1 pinctrl error
Date: Wed, 17 May 2017 20:10:48 +0200
Message-ID: <1634694.eXjXQc2COO@phil>
References: <1495014746-27621-1-git-send-email-frank.wang@rock-chips.com>
 <1495014746-27621-2-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1495014746-27621-2-git-send-email-frank.wang@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Frank Wang <frank.wang@rock-chips.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, huangtao@rock-chips.com, charles.chen@rock-chips.com, wmc@rock-chips.com, kevan.lan@rock-chips.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, sugar.zhang@rock-chips.com, linux-rockchip@lists.infradead.org, wim@iguana.be, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, cody.xie@rock-chips.com, ellisys@163.com, linux@roeck-us.net
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 17. Mai 2017, 17:52:24 CEST schrieb Frank Wang:
> From: Sugar Zhang <sugar.zhang@rock-chips.com>
> 
> Refer to Chapter 5.3.2 of rk3229 TRM, we can see that GPIO1A[2,4,5]
> using RK_FUNC_2 not RK_FUNC_1. This patch fixes it.
> 
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>

applied for 4.13, after fixing the subject up a bit (ARM: dts: rockchip: ...)


Thanks
Heiko
