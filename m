From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 2/8] drm/msm/dsi: 28nm 8960 PHY: Get ref clock from the DT
Date: Tue, 04 Dec 2018 10:26:47 -0800
Message-ID: <154394800757.88331.14079790416847469573@swboyd.mtv.corp.google.com>
References: <20181201005254.139908-1-mka@chromium.org>
 <20181201005254.139908-3-mka@chromium.org>
 <154394184065.88331.4558186365546696323@swboyd.mtv.corp.google.com>
 <20181204173549.GB14307@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204173549.GB14307@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Airlie <airlied@linux.ie>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>, Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Rajesh Yadav <ryadav@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Matthias Kaehlcke (2018-12-04 09:35:49)
> On Tue, Dec 04, 2018 at 08:44:00AM -0800, Stephen Boyd wrote:
> > Quoting Matthias Kaehlcke (2018-11-30 16:52:48)
> > > +
> > >         /* custom byte clock divider */
> > >         struct clk_bytediv *bytediv;
> > >  =

> > > @@ -125,7 +127,10 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_=
hw *hw, unsigned long rate,
> > >         DBG("rate=3D%lu, parent's=3D%lu", rate, parent_rate);
> > >  =

> > >         temp =3D rate / 10;
> > > -       val =3D VCO_REF_CLK_RATE / 10;
> > > +       if (parent_rate)
> > > +               val =3D parent_rate / 10;
> > > +       else
> > > +               val =3D VCO_REF_CLK_DEFAULT_RATE / 10;
> > =

> > Is the clk not properly hooked up to a parent sometimes so parent_rate
> > is 0? That sounds odd given the fact that it used to be 'pxo' and that
> > has always existed on the system as 27 MHz. So I'd remove this and just
> > use parent_rate all the time.
> =

> I wondered about this, but since I don't have hardware for testing I
> kept the previous hardcoded rate. If we know for sure that 'pxo'
> always exists it should indeed be fine to use the parent rate.

Yes we know for sure. The 'pxo' board clk is there on apq8064 dtsi file
which seems to be the only place this is used. The pxo_board clk is sent
through a 'pxo' clk that's created in drivers/clk/qcom/common.c
qcom_cc_register_board_clk().
