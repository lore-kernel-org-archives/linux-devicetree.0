From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 3/7] drm/msm/dsi: 28nm 8960 PHY: Get ref clock from
 the DT
Date: Fri, 30 Nov 2018 14:32:38 -0800
Message-ID: <20181130223238.GD22824@google.com>
References: <20181126231159.122298-1-mka@chromium.org>
 <20181126231159.122298-4-mka@chromium.org>
 <CAD=FV=X5r1CCSeTDXy_cYOBDf4ExNe276pFQSC6T+WWg2=SchA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=X5r1CCSeTDXy_cYOBDf4ExNe276pFQSC6T+WWg2=SchA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Rajesh Yadav <ryadav@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, freedreno <freedreno@lists.freedesktop.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 27, 2018 at 10:00:50PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Mon, Nov 26, 2018 at 3:12 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > @@ -409,8 +410,9 @@ static void dsi_pll_28nm_destroy(struct msm_dsi_pll *pll)
> >  static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
> >  {
> >         char *clk_name, *parent_name, *vco_name;
> > +       const char *ref_clk_name = __clk_get_name(pll_28nm->vco_ref_clk);
> 
> IMO for the 28nm PHY driver you should probably make things work OK
> even if the "ref" clock wasn't supplied.  In the spirit of the stable
> device tree it would be nice (even if nobody actually ships device
> trees separate from kernels).  ...and also it makes the whole thing
> easier to land.  If you add compatibility here then the code and
> device tree patch can go in separately.

Ok, I'll make it fall back to the 'default' values if the ref clock is
not specified.
