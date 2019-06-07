From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/3] clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver
Date: Fri, 07 Jun 2019 13:32:44 -0700
Message-ID: <20190607203245.3AEA320868@mail.kernel.org>
References: <20190528164616.38517-1-jeffrey.l.hugo@gmail.com> <20190528164803.38642-1-jeffrey.l.hugo@gmail.com> <20190606230050.2F33720645@mail.kernel.org> <CAOCk7NqYptsLkYyfUCSvh0J0FZd_9gPDZJoyjB5Ng4v8aLFUNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOCk7NqYptsLkYyfUCSvh0J0FZd_9gPDZJoyjB5Ng4v8aLFUNw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Jordan Crouse <jcrouse@codeaurora.org>, MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Jeffrey Hugo (2019-06-07 07:08:46)
>=20
> As you well know, XO is the root clock for pretty much everything on
> Qualcomm platforms.  We are trying to do things "properly" on 8998.
> We are planning on having rpmcc manage it (see my other series), and

I don't have the rpmcc series in my queue. I think it needs a resend?

> all the other components consume xo from there.  Unfortunately we
> cannot control the probe order, particularly when things are built as
> modules, so its possible gpucc might be the first thing to probe.
> Currently, the clock framework will allow that since everything in
> gpucc will just be an orphan.  However that doesn't prevent gpucc
> consumers from grabbing their clocks, and we've seen that cause
> issues.
>=20
> As you've previously explained, you have a ton of work to do to
> refactor things so that a clock will probe defer if its dependencies
> are not present.  We'd prefer that functionality, but are not really
> willing to wait for it.  Thus, we are implementing the same
> functionality in the driver until the framework handles it for us, at
> which point we'll gladly rip this out.

Can you add more to the comment? Right now it doesn't explain the _why_
part that you describe in the first paragraph here. That's what I'm
asking to be put here as a comment. Also, GCC is the one exporting the
XO clk on this platform so I'm a little lost why we're talking about rpm
here.

I guess I'm left to do the ton of work myself and get to have clk
providers like this be clk consumers so that probe ordering is correct
and clks aren't exposed until the whole parent chain exists. This is
taking a step backwards and causes me to be sad.

>=20
> >
> > > +       if (IS_ERR(xo))
> > > +               return PTR_ERR(xo);
> > > +       clk_put(xo);
> > > +
> > > +       regmap =3D qcom_cc_map(pdev, &gpucc_msm8998_desc);
> > > +       if (IS_ERR(regmap))
> > > +               return PTR_ERR(regmap);
> > > +
> > > +       /* force periph logic on to acoid perf counter corruption */
> >
> > avoid?
>=20
> Yes.  Do you want a v3 with this fixed?

Yes, please resend without the binding patch that I've already applied.
