From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v7 2/6] mfd: rk808: Add RK817 and RK809 support
Date: Thu, 11 Apr 2019 14:52:47 +0200
Message-ID: <518340124.P20tlEWT52@phil>
References: <20190102102002.29245-1-tony.xie@rock-chips.com> <20190102102002.29245-3-tony.xie@rock-chips.com> <20190402063305.GZ4187@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402063305.GZ4187@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Tony Xie <tony.xie@rock-chips.com>, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, chenjh@rock-chips.com, xsf@rock-chips.com, zhangqing@rock-chips.com, huangtao@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Lee,

Am Dienstag, 2. April 2019, 08:33:05 CEST schrieb Lee Jones:
> On Wed, 02 Jan 2019, Tony Xie wrote:
> 
> > The RK809 and RK817 are a Power Management IC (PMIC) for multimedia
> > and handheld devices. They contains the following components:
> >   - Regulators
> >   - RTC
> >   - Clocking
> > 
> > Both RK809 and RK817 chips are using a similar register map,
> > so we can reuse the RTC and Clocking functionality.
> > Most of regulators have a some implementation also.
> > 
> > Signed-off-by: Tony Xie <tony.xie@rock-chips.com>
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > ---
> >  drivers/mfd/Kconfig       |   6 +-
> >  drivers/mfd/rk808.c       | 192 +++++++++++++++++++++++++++++++++++++-
> >  include/linux/mfd/rk808.h | 172 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 364 insertions(+), 6 deletions(-)
> 
> For my own reference:
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

do you have some sort of merge plan for this or are you waiting for
specific Acks? I guess if we're waiting for an Ack from Mark Brown,
we'll need a resend of the patch.

All other patches have Acks from their subsystem maintainers (rtc, clk)
so you could pick up all patches except patch3 and I could just resend
this one, which in turn could also go through the regulator tree.

Otherwise we'll probably need a resend of the series, as Mark most of
the time doesn't keep old patch series around.


Heiko
