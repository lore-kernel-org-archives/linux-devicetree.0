From: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v5 0/8] drm/msm/dsi: Get PHY ref clocks from the DT
Date: Thu, 31 Jan 2019 14:24:27 -0500
Message-ID: <20190131192427.GY114153@art_vandelay>
References: <20181219235528.114830-1-mka@chromium.org>
 <20190129000534.GJ81583@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190129000534.GJ81583@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Rajesh Yadav <ryadav@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Jeykumar Sankaran <jsanka@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 28, 2019 at 04:05:34PM -0800, Matthias Kaehlcke wrote:
> Hi,
> 
> this series has gone through multiple rounds of review and there are
> no outstanding comments. It seems it should be ready to land, or is
> there anything left that needs to be addressed?

>From the drm side, I think we'll need Andy to pick up the dt-bindings
and dts changes, and then the msm/dsi changes can be picked once that's
merged. We could also do a topic branch if that suits everyone.

Sean

> 
> Thanks
> 
> Matthias
> 
> On Wed, Dec 19, 2018 at 03:55:20PM -0800, Matthias Kaehlcke wrote:
> > The MSM DSI PHY drivers currently hardcode the name and the rate of
> > the PHY ref clock. Get the ref clock from the device tree instead.
> > 
> > Note: testing of this series was limited to SDM845 and the 10nm PHY
> > 
> > Major changes in v5:
> > - none (see per-patch change log for minor changes)
> > 
> > Major changes in v4:
> > - always use parent rate for 28nm and 28nm 8960 PHYs
> > 
> > Major changes in v3:
> > - keep supporting DTs without ref clock for the 28nm and the 28nm
> >   8960 PHYs
> > - added patch to add ref clock to qcom-apq8064.dtsi
> > 
> > Major changes in v2:
> > - apply to all MSM DSI PHY drivers, not only 10nm
> > 
> > Matthias Kaehlcke (8):
> >   dt-bindings: msm/dsi: Add ref clock for PHYs
> >   drm/msm/dsi: 28nm 8960 PHY: Get ref clock from the DT
> >   drm/msm/dsi: 28nm PHY: Get ref clock from the DT
> >   drm/msm/dsi: 14nm PHY: Get ref clock from the DT
> >   drm/msm/dsi: 10nm PHY: Get ref clock from the DT
> >   arm64: dts: qcom: msm8916: Set 'xo_board' as ref clock of the DSI PHY
> >   arm64: dts: sdm845: Set 'bi_tcxo' as ref clock of the DSI PHYs
> >   ARM: dts: qcom-apq8064: Set 'xo_board' as ref clock of the DSI PHY
> > 
> >  .../devicetree/bindings/display/msm/dsi.txt   |  1 +
> >  arch/arm/boot/dts/qcom-apq8064.dtsi           |  5 +--
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi         |  5 +--
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 10 +++---
> >  drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c    | 20 +++++++++--
> >  drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c    | 23 +++++++++---
> >  drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c    | 36 +++++++++++++------
> >  .../gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c   | 24 ++++++++++---
> >  8 files changed, 92 insertions(+), 32 deletions(-)
> > 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
