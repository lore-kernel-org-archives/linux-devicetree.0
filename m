From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v10 0/6] support a new type of PMIC,including two chips(rk817 and rk809)
Date: Thu, 27 Jun 2019 10:18:54 +0200
Message-ID: <2084806.DiqCa91xLP@phil>
References: <20190621103258.8154-1-tony.xie@rock-chips.com> <20190626115251.GR21119@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626115251.GR21119@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Tony Xie <tony.xie@rock-chips.com>, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, chenjh@rock-chips.com, xsf@rock-chips.com, zhangqing@rock-chips.com, huangtao@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Lee,

Am Mittwoch, 26. Juni 2019, 13:52:51 CEST schrieb Lee Jones:
> On Fri, 21 Jun 2019, Tony Xie wrote:
> 
> > Most of functions and registers of the rk817 and rk808 are the same,
> > so they can share allmost all codes.
> > 
> > Their specifications are as follows:
> >   1) The RK809 and RK809 consist of 5 DCDCs, 9 LDOs and have the same
> > registers
> >      for these components except dcdc5.
> >   2) The dcdc5 is a boost dcdc for RK817 and is a buck for RK809.
> >   3) The RK817 has one switch but The Rk809 has two.
> 
> Just tried to apply this set to a v5.2-rc1 base, but it doesn't seem
> to do so cleanly.  Would you be able to rebase and resend please?

I took the liberty of rebasing patch 3 accordingly and sent it as reply
to the original patch3 as (v10.1). The other patches did apply cleanly
after that.


Heiko
