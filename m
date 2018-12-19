From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v4 4/8] drm/msm/dsi: 14nm PHY: Get ref clock from the DT
Date: Wed, 19 Dec 2018 14:32:19 -0800
Message-ID: <154525873917.79149.9742850766307036349@swboyd.mtv.corp.google.com>
References: <20181204224234.62619-1-mka@chromium.org> <20181204224234.62619-5-mka@chromium.org> <154445707953.17204.10100324387384439759@swboyd.mtv.corp.google.com> <20181219222222.GA261387@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181219222222.GA261387@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Airlie <airlied@linux.ie>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>, Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Rajesh Yadav <ryadav@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Matthias Kaehlcke (2018-12-19 14:22:22)
> On Mon, Dec 10, 2018 at 07:51:19AM -0800, Stephen Boyd wrote:
> > Quoting Matthias Kaehlcke (2018-12-04 14:42:30)
> > > diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c b/drivers/gpu=
/drm/msm/dsi/pll/dsi_pll_14nm.c
> > > index 71fe60e5f01f1..032bf3e8614bd 100644
> > > --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c
> > > +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c
> > > @@ -40,7 +40,6 @@
> > > =20
> > >  #define NUM_PROVIDED_CLKS              2
> > > =20
> > > -#define VCO_REF_CLK_RATE               19200000
> > >  #define VCO_MIN_RATE                   1300000000UL
> > >  #define VCO_MAX_RATE                   2600000000UL
> > > =20
> > > @@ -139,6 +138,7 @@ struct dsi_pll_14nm {
> > >         /* protects REG_DSI_14nm_PHY_CMN_CLK_CFG0 register */
> > >         spinlock_t postdiv_lock;
> > > =20
> > > +       struct clk *vco_ref_clk;
> >=20
> > Is there any need to keep it in the struct? Or just get the clk, find
> > the rate, and then put the clk and call pll_14nm_postdiv_register()?
>=20
> I suppose you mean passing the clock name to pll_14nm_register()?

Yes, whatever makes it possible to avoid storing the pointer in the
struct.

>=20
> Is putting the clock really needed or preferable, or is it just fine
> to auto-put it when the device is deleted?

Up to you. If you don't have a need for the clk anymore it seems fine to
just put the clk and be done.=20
