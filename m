From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 2/7] drm/msm/dsi: 14nm PHY: Get ref clock from the DT
Date: Fri, 30 Nov 2018 14:18:57 -0800
Message-ID: <20181130221857.GC22824@google.com>
References: <20181126231159.122298-1-mka@chromium.org>
 <20181126231159.122298-3-mka@chromium.org>
 <CAD=FV=WNHUL+W1ozoRaCCd=-OcAD3QmqZaNLK0PNJQVbDqdaLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=WNHUL+W1ozoRaCCd=-OcAD3QmqZaNLK0PNJQVbDqdaLQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Rajesh Yadav <ryadav@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, freedreno <freedreno@lists.freedesktop.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 27, 2018 at 09:56:46PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Mon, Nov 26, 2018 at 3:12 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Get the ref clock of the PHY from the device tree instead of
> > hardcoding its name and rate.
> 
> In the case of the 14nm PHY I think it's OK that you break
> compatibility with old device tree files (as this patch does) since
> the 14nm support was added sorta recently and "git grep" shows no
> users in linuxnext.  You should note that you're breaking
> compatibility with old DTS files in the commit message here so that if
> someone crawls out of the woodwork it will be easy for them to
> understand what happened.

ok, I'll add the note

> > +       pll_14nm->vco_ref_clk = devm_clk_get(&pdev->dev, "ref");
> > +       if (IS_ERR(pll_14nm->vco_ref_clk)) {
> > +               ret = PTR_ERR(pll_14nm->vco_ref_clk);
> > +               if (ret != EPROBE_DEFER)
> 
> Shouldn't this check against -EPROBE_DEFER, not against EPROBE_DEFER?
> It's negative.  Presumably this same feedback needs to be applied to
> the whole patch series.

You are right, will fix it throughout the series, thanks!

> Other than that this looks good to me and you can feel free to add my
> Reviewed-by tag FWIW.

Great, thanks for the review!

Matthias
