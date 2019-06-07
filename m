From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH 2/3] clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver
Date: Fri, 7 Jun 2019 08:08:46 -0600
Message-ID: <CAOCk7NqYptsLkYyfUCSvh0J0FZd_9gPDZJoyjB5Ng4v8aLFUNw@mail.gmail.com>
References: <20190528164616.38517-1-jeffrey.l.hugo@gmail.com>
 <20190528164803.38642-1-jeffrey.l.hugo@gmail.com> <20190606230050.2F33720645@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606230050.2F33720645@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Jordan Crouse <jcrouse@codeaurora.org>, MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 6, 2019 at 5:00 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Jeffrey Hugo (2019-05-28 09:48:03)
> > diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
> > new file mode 100644
> > index 000000000000..e45062e40718
> > --- /dev/null
> > +++ b/drivers/clk/qcom/gpucc-msm8998.c
> > +
> > +static int gpucc_msm8998_probe(struct platform_device *pdev)
> > +{
> > +       struct regmap *regmap;
> > +       struct clk *xo;
> > +
> > +       /*
> > +        * We must have a valid XO to continue until orphan probe defer is
> > +        * implemented.
> > +        */
> > +       xo = clk_get(&pdev->dev, "xo");
>
> Why is this necessary?

As you well know, XO is the root clock for pretty much everything on
Qualcomm platforms.  We are trying to do things "properly" on 8998.
We are planning on having rpmcc manage it (see my other series), and
all the other components consume xo from there.  Unfortunately we
cannot control the probe order, particularly when things are built as
modules, so its possible gpucc might be the first thing to probe.
Currently, the clock framework will allow that since everything in
gpucc will just be an orphan.  However that doesn't prevent gpucc
consumers from grabbing their clocks, and we've seen that cause
issues.

As you've previously explained, you have a ton of work to do to
refactor things so that a clock will probe defer if its dependencies
are not present.  We'd prefer that functionality, but are not really
willing to wait for it.  Thus, we are implementing the same
functionality in the driver until the framework handles it for us, at
which point we'll gladly rip this out.

>
> > +       if (IS_ERR(xo))
> > +               return PTR_ERR(xo);
> > +       clk_put(xo);
> > +
> > +       regmap = qcom_cc_map(pdev, &gpucc_msm8998_desc);
> > +       if (IS_ERR(regmap))
> > +               return PTR_ERR(regmap);
> > +
> > +       /* force periph logic on to acoid perf counter corruption */
>
> avoid?

Yes.  Do you want a v3 with this fixed?

>
> > +       regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(13), BIT(13));
> > +       /* tweak droop detector (GPUCC_GPU_DD_WRAP_CTRL) to reduce leakage */
> > +       regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(0), BIT(0));
> > +
> > +       return qcom_cc_really_probe(pdev, &gpucc_msm8998_desc, regmap);
> > +}
> > +
