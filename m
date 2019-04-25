From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 2/6] mfd: rk808: Add RK817 and RK809 support
Date: Thu, 25 Apr 2019 10:11:44 +0100
Message-ID: <20190425091144.GH14758@dell>
References: <20190102102002.29245-1-tony.xie@rock-chips.com>
 <20190102102002.29245-3-tony.xie@rock-chips.com>
 <20190402063305.GZ4187@dell>
 <518340124.P20tlEWT52@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <518340124.P20tlEWT52@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Tony Xie <tony.xie@rock-chips.com>, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, chenjh@rock-chips.com, xsf@rock-chips.com, zhangqing@rock-chips.com, huangtao@rock-chips.com
List-Id: devicetree@vger.kernel.org

On Thu, 11 Apr 2019, Heiko Stuebner wrote:

> Hi Lee,
> 
> Am Dienstag, 2. April 2019, 08:33:05 CEST schrieb Lee Jones:
> > On Wed, 02 Jan 2019, Tony Xie wrote:
> > 
> > > The RK809 and RK817 are a Power Management IC (PMIC) for multimedia
> > > and handheld devices. They contains the following components:
> > >   - Regulators
> > >   - RTC
> > >   - Clocking
> > > 
> > > Both RK809 and RK817 chips are using a similar register map,
> > > so we can reuse the RTC and Clocking functionality.
> > > Most of regulators have a some implementation also.
> > > 
> > > Signed-off-by: Tony Xie <tony.xie@rock-chips.com>
> > > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > > ---
> > >  drivers/mfd/Kconfig       |   6 +-
> > >  drivers/mfd/rk808.c       | 192 +++++++++++++++++++++++++++++++++++++-
> > >  include/linux/mfd/rk808.h | 172 ++++++++++++++++++++++++++++++++++
> > >  3 files changed, 364 insertions(+), 6 deletions(-)
> > 
> > For my own reference:
> >   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 
> do you have some sort of merge plan for this or are you waiting for
> specific Acks? I guess if we're waiting for an Ack from Mark Brown,
> we'll need a resend of the patch.
> 
> All other patches have Acks from their subsystem maintainers (rtc, clk)
> so you could pick up all patches except patch3 and I could just resend
> this one, which in turn could also go through the regulator tree.
> 
> Otherwise we'll probably need a resend of the series, as Mark most of
> the time doesn't keep old patch series around.

Try resending it.  Hopefully he will review in the next week or so can
I can collect it when I return back from Shared Parental Leave.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
