From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] ARM: dts: rockchip: A few fixes for veyron-{fievel,tiger}
Date: Tue, 30 Jul 2019 11:19:16 -0700
Message-ID: <20190730181916.GJ250418@google.com>
References: <20190730173444.56741-1-mka@chromium.org>
 <CAD=FV=Wub9Wkc5t4iQRjBK8R_d_oh4PoHPwLHb4T5+Meij7sSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=Wub9Wkc5t4iQRjBK8R_d_oh4PoHPwLHb4T5+Meij7sSg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 30, 2019 at 11:01:42AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Jul 30, 2019 at 10:34 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > @@ -130,12 +138,13 @@
> >                         regulator-max-microvolt = <1800000>;
> >                         regulator-name = "vdd18_lcdt";
> >                         regulator-state-mem {
> > -                               regulator-on-in-suspend;
> > +                               regulator-off-in-suspend;
> >                                 regulator-suspend-microvolt = <1800000>;
> 
> Please remove "regulator-suspend-microvolt = <1800000>;" which doesn't
> make sense once you have "regulator-off-in-suspend".

will remove all instances

> >                         };
> >                 };
> >
> > -               /* This is not a pwren anymore, but the real power supply,
> > +               /*
> > +                * This is not a pwren anymore, but the real power supply,
> >                  * vdd10_lcd for HDMI_AVDD_1V0
> >                  */
> >                 vdd10_lcd: LDO_REG7 {
> > @@ -145,7 +154,7 @@
> >                         regulator-max-microvolt = <1000000>;
> >                         regulator-name = "vdd10_lcd";
> >                         regulator-state-mem {
> > -                               regulator-on-in-suspend;
> > +                               regulator-off-in-suspend;
> >                                 regulator-suspend-microvolt = <1000000>;
> 
> Please remove "regulator-suspend-microvolt = <1000000>;" which doesn't
> make sense once you have "regulator-off-in-suspend".
> 
> 
> >                         };
> >
> > @@ -159,7 +168,7 @@
> >                         regulator-max-microvolt = <3300000>;
> >                         regulator-name = "vcc33_ccd";
> >                         regulator-state-mem {
> > -                               regulator-on-in-suspend;
> > +                               regulator-off-in-suspend;
> >                                 regulator-suspend-microvolt = <3300000>;
> 
> Please remove "regulator-suspend-microvolt = <3300000>;" which doesn't
> make sense once you have "regulator-off-in-suspend".
> 
> 
> Other than those things, this patch looks good to me and feel free to
> add my Reviewed-by.

Thanks for your review!

> NOTE: when I tried applying this to my tree git
> complained and I had to apply manually.  Could you try sending this
> patch atop Heiko's for-next tree?  The yell I got:
> 
> error: sha1 information is lacking or useless
> (arch/arm/boot/dts/rk3288-veyron-fievel.dts).
> error: could not build fake ancestor

Ok, I'll rebase v2 on Heiko's for-next
