From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [linux-sunxi] Re: [PATCH v2 1/8] mfd: axp20x: name voltage
 ramping define properly
Date: Fri, 21 Dec 2018 09:26:58 +0000
Message-ID: <20181221092658.GB13248@dell>
References: <cover.923997dd7d7396bb4d71f8967698b58ca956b929.1544512919.git-series.plaes@plaes.org>
 <01367c4f4f1e174fefbef9aac645f6792bda07e5.1544512919.git-series.plaes@plaes.org>
 <20181221083927.GQ4497@dell>
 <20181221084246.myrtv6n4jrv6lajl@plaes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181221084246.myrtv6n4jrv6lajl@plaes.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Priit Laes <plaes@plaes.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Olliver Schinagl <oliver@schinagl.nl>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Fri, 21 Dec 2018, Priit Laes wrote:

> On Fri, Dec 21, 2018 at 08:39:27AM +0000, Lee Jones wrote:
> > On Tue, 11 Dec 2018, Priit Laes wrote:
> > 
> > > From: Olliver Schinagl <oliver@schinagl.nl>
> > > 
> > > The current axp20x names the ramping register 'scal' which probably
> > > means scaling. Since the register really has nothing to do with
> > > scaling, but really is the voltage ramp we rename it appropriately.
> > > 
> > > Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
> > > Signed-off-by: Priit Laes <plaes@plaes.org>
> > > Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  include/linux/mfd/axp20x.h | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > I've lost track of what's happening with this set now.
> > 
> > Mark,
> > 
> > Did you take this patch in the end?
> 
> Yes, this is in linux-next.

I have no idea why Mark's tracker isn't mailing me (this is not the
first time this has happened).

Could you please rebase this set and resubmit all of the patches which
have not yet been applied?

Thank you.

> > > diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> > > index 2302b62..a353cd2 100644
> > > --- a/include/linux/mfd/axp20x.h
> > > +++ b/include/linux/mfd/axp20x.h
> > > @@ -35,7 +35,7 @@ enum axp20x_variants {
> > >  #define AXP152_ALDO_OP_MODE		0x13
> > >  #define AXP152_LDO0_CTRL		0x15
> > >  #define AXP152_DCDC2_V_OUT		0x23
> > > -#define AXP152_DCDC2_V_SCAL		0x25
> > > +#define AXP152_DCDC2_V_RAMP		0x25
> > >  #define AXP152_DCDC1_V_OUT		0x26
> > >  #define AXP152_DCDC3_V_OUT		0x27
> > >  #define AXP152_ALDO12_V_OUT		0x28
> > > @@ -53,7 +53,7 @@ enum axp20x_variants {
> > >  #define AXP20X_USB_OTG_STATUS		0x02
> > >  #define AXP20X_PWR_OUT_CTRL		0x12
> > >  #define AXP20X_DCDC2_V_OUT		0x23
> > > -#define AXP20X_DCDC2_LDO3_V_SCAL	0x25
> > > +#define AXP20X_DCDC2_LDO3_V_RAMP	0x25
> > >  #define AXP20X_DCDC3_V_OUT		0x27
> > >  #define AXP20X_LDO24_V_OUT		0x28
> > >  #define AXP20X_LDO3_V_OUT		0x29
> > 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
