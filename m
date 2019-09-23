From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 4/5] clk: meson: meson8b: don't register the XTAL clock
 when provided via OF
Date: Mon, 23 Sep 2019 22:57:19 +0200
Message-ID: <CAFBinCDrN2Rvu6ry+voB5itU6X+ezCzT=ZkQ6Qz8rz_+1kCLCg@mail.gmail.com>
References: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
 <20190921151223.768842-5-martin.blumenstingl@googlemail.com> <1jwodzs6ir.fsf@starbuckisacylon.baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1jwodzs6ir.fsf@starbuckisacylon.baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, robh+dt@kernel.org, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 23, 2019 at 11:31 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Sat 21 Sep 2019 at 17:12, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > The XTAL clock is an actual crystal on the PCB. Thus the meson8b clock
> > driver should not register the XTAL clock - instead it should be
> > provided via .dts and then passed to the clock controller.
> >
> > Skip the registration of the XTAL clock if a parent clock is provided
> > via OF. Fall back to registering the XTAL clock if this is not the case
> > to keep support for old .dtbs.
> >
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >  drivers/clk/meson/meson8b.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> > index b785b67baf2b..15ec14fde2a0 100644
> > --- a/drivers/clk/meson/meson8b.c
> > +++ b/drivers/clk/meson/meson8b.c
> > @@ -3682,10 +3682,16 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
> >               meson8b_clk_regmaps[i]->map = map;
> >
> >       /*
> > -      * register all clks
> > -      * CLKID_UNUSED = 0, so skip it and start with CLKID_XTAL = 1
> > +      * always skip CLKID_UNUSED and also skip XTAL if the .dtb provides the
> > +      * XTAL clock as input.
> >        */
> > -     for (i = CLKID_XTAL; i < CLK_NR_CLKS; i++) {
> > +     if (of_clk_get_parent_count(np))
>
> If we are going for this, I'd prefer if could explicity check for the
> clock named "xtal" instead of just checking if DT has clocks.
OK, I'll wait a few days and then fix this in v2


Martin
