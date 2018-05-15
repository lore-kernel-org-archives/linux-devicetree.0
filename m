Return-Path: <SRS0=t5sx=IC=verge.net.au=horms@kernel.org>
Date: Tue, 15 May 2018 09:26:19 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH/RFT v3 1/3] thermal: rcar_thermal: add r8a77995 support
Message-ID: <20180515072618.r6ag2qe5c4xensqj@verge.net.au>
References: <1522759385-17661-1-git-send-email-ykaneko0929@gmail.com>
 <1522759385-17661-2-git-send-email-ykaneko0929@gmail.com>
 <20180509181110.56ylpjqtefwnau3r@verge.net.au>
 <CAH1o70JNjsgeb5CHPZs3UunGR6jg6_C3d+EZjWs_B0389Z2Y-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH1o70JNjsgeb5CHPZs3UunGR6jg6_C3d+EZjWs_B0389Z2Y-A@mail.gmail.com>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, May 14, 2018 at 06:11:59AM +0900, Yoshihiro Kaneko wrote:
> Hi Simon-san,
> 
> 2018年5月10日(木) 3:11 Simon Horman <horms@verge.net.au>:
> 
> > On Tue, Apr 03, 2018 at 09:43:03PM +0900, Yoshihiro Kaneko wrote:
> > > Add support for R-Car D3 (r8a77995) thermal sensor.
> > >
> > > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > > ---
> > >  drivers/thermal/rcar_thermal.c | 154
> > ++++++++++++++++++++++++++++++++---------
> > >  1 file changed, 122 insertions(+), 32 deletions(-)
> > >
> > > diff --git a/drivers/thermal/rcar_thermal.c
> > b/drivers/thermal/rcar_thermal.c
> > > index 73e5fee..5ec47a9 100644
> > > --- a/drivers/thermal/rcar_thermal.c
> > > +++ b/drivers/thermal/rcar_thermal.c
> > > @@ -58,10 +58,43 @@ struct rcar_thermal_common {
> > >       spinlock_t lock;
> > >  };
> > >
> > > +struct rcar_thermal_chip {
> > > +     unsigned int use_of_thermal : 1;
> > > +     unsigned int has_filonoff : 1;
> > > +     unsigned int irq_per_ch : 1;
> > > +     unsigned int needs_suspend_resume : 1;
> > > +     unsigned int nirqs;
> > > +};
> > > +
> > > +static const struct rcar_thermal_chip rcar_thermal = {
> > > +     .use_of_thermal = 0,
> > > +     .has_filonoff = 1,
> > > +     .irq_per_ch = 0,
> > > +     .needs_suspend_resume = 0,
> > > +     .nirqs = 1,
> > > +};
> > > +
> > > +static const struct rcar_thermal_chip rcar_gen2_thermal = {
> > > +     .use_of_thermal = 1,
> > > +     .has_filonoff = 1,
> > > +     .irq_per_ch = 0,
> > > +     .needs_suspend_resume = 0,
> > > +     .nirqs = 1,
> > > +};
> > > +
> > > +static const struct rcar_thermal_chip rcar_gen3_thermal = {
> > > +     .use_of_thermal = 1,
> > > +     .has_filonoff = 0,
> > > +     .irq_per_ch = 1,
> > > +     .needs_suspend_resume = 1,
> > > +     .nirqs = 2,
> > > +};
> >
> > The binding and dts patches in this series describe 3 interrupts
> > for R-Car D3. But the above specifies two. Am I missing something obvious?
> 
> 
> R-Car D3 has 3 interrupts, but this driver uses only 2 interrupts to detect
> a temperature change, rise or fall.

Thanks, that makes perfect sense.

Perhaps a comment above ".nirqs = 2" would make it more obvious to the casual
observer?
