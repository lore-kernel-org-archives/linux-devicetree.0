From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v15 12/12] drm: bridge/dw_hdmi: add rockchip rk3288 support
Date: Wed, 03 Dec 2014 14:09:57 +0100
Message-ID: <1417612197.5124.12.camel@pengutronix.de>
References: <1417505778-18341-1-git-send-email-andy.yan@rock-chips.com>
 <1417506327-18908-1-git-send-email-andy.yan@rock-chips.com>
 <1417515882.3411.8.camel@pengutronix.de> <547DB1ED.7000409@rock-chips.com>
 <1417525257.3411.12.camel@pengutronix.de> <547F02CF.9010804@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <547F02CF.9010804@rock-chips.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, rmk+kernel@arm.linux.org.uk, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.com
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Mittwoch, den 03.12.2014, 20:32 +0800 schrieb Andy Yan:
> > My question is not about the available gates at the SoC level, but about
> > the actual clock inputs from point of view of the HDMI TX IP.
> >
> > It could be that the hdmi_ctrl_clk gates all inputs to the module and
> > bus clocks together. If so, you could just reuse "isfr" and "iahb" and
> > set it to the same clock. If not, we'd need to think of something else.
> > Unfortunately I don't have any Synopsys documentation of the HDMI TX at
> > that level.
> 
>     After confirming with the IC designer, we finally make clear that
>     Rockchip RK3288 almost use the same clock design with imx:
>     clk-----iahbclk, used for hdmi module and bus
>     hdcp_clk-----isfrclk, used for hdcp and i2cm
>     cecclk -----cecclk, but this clk can be gated on rockchip, this is 
> different with imx,
>     but we don't handle the cec stuff now. So i will try to reuse the 
> imx clk binds. do you
>    think that is ok?

Thank you for taking the time to verify this. So we should move the
clock handling out of the soc specific parts into the common driver and
reuse the existing clock bindings ("iahb", "isfr").
I'd suggest to add the "cec" clock now to the binding document as an
optional clock, then you can already specify it in the rockchip dtsi.

regards
Philipp
