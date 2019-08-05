From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Subject: Re: [linux-sunxi] [PATCH 2/3] rtc: sun6i: Add support for H6 RTC
Date: Mon, 5 Aug 2019 12:20:01 +0200
Message-ID: <20190805102001.guo7e52bl5agp2w4@core.my.home>
References: <20190412120730.473-1-megous@megous.com>
 <20190412120730.473-3-megous@megous.com>
 <CAGb2v675j-aCLMgPJOzr9yx1XxsUvHRr_K7VnL=p8mSdwpu2jw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v675j-aCLMgPJOzr9yx1XxsUvHRr_K7VnL=p8mSdwpu2jw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-rtc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 05, 2019 at 06:16:14PM +0800, Chen-Yu Tsai wrote:
> On Fri, Apr 12, 2019 at 8:07 PM megous via linux-sunxi
> <linux-sunxi@googlegroups.com> wrote:
> >
> > From: Ondrej Jirman <megous@megous.com>
> >
> > RTC on H6 is mostly the same as on H5 and H3. It has slight differences
> > mostly in features that are not yet supported by this driver.
> >
> > Some differences are already stated in the comments in existing code.
> > One other difference is that H6 has extra bit in LOSC_CTRL_REG, called
> > EXT_LOSC_EN to enable/disable external low speed crystal oscillator.
> >
> > It also has bit EXT_LOSC_STA in LOSC_AUTO_SWT_STA_REG, to check whether
> > external low speed oscillator is working correctly.
> >
> > This patch adds support for enabling LOSC when necessary:
> >
> > - during reparenting
> > - when probing the clock
> >
> > H6 also has capacbility to automatically reparent RTC clock from
> > external crystal oscillator, to internal RC oscillator, if external
> > oscillator fails. This is enabled by default. Disable it during
> > probe.
> >
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > ---
> >  drivers/rtc/rtc-sun6i.c | 40 ++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 38 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > index 11f56de52179..7375a530c565 100644
> > --- a/drivers/rtc/rtc-sun6i.c
> > +++ b/drivers/rtc/rtc-sun6i.c
> > @@ -41,9 +41,11 @@
> >  /* Control register */
> >  #define SUN6I_LOSC_CTRL                                0x0000
> >  #define SUN6I_LOSC_CTRL_KEY                    (0x16aa << 16)
> > +#define SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS                BIT(15)
> 
> Manual says bit 14? Or is this different from LOSC_AUTO_SWT_EN?
> 
> The rest looks ok.

Yes, see H6 BSP:

drivers/rtc/rtc-sunxi.h

 20 #define REG_CLK32K_AUTO_SWT_EN                  BIT(14)
 21 #define REG_CLK32K_AUTO_SWT_BYPASS              BIT(15)

regards,
	Ondrej

> ChenYu
