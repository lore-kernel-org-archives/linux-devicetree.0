From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH v2 01/12] drm/sun4i: sun6i_mipi_dsi: Compute burst mode
 loop N1 instruction delay
Date: Tue, 20 Nov 2018 08:01:36 -0800
Message-ID: <CA+E=qVc8c4u6yMw0Gtq41_vbV-zy7B8CLV0WadFCqRfSR2LPgQ@mail.gmail.com>
References: <20181116163916.29621-1-jagan@amarulasolutions.com>
 <20181116163916.29621-2-jagan@amarulasolutions.com> <20181119082707.kbsw2gyntxxbh6no@flea>
 <CAMty3ZBDa2wjjCh8NtrbKNYz=mr1xhZKv9JfnmDPDBQRO+CkYw@mail.gmail.com>
 <20181120132357.xge6gkurjjjvwi2i@flea> <CAMty3ZDex+UQcZdp2nr3Bd=_PVZH-pAU=GBmLL6sdrfA-dZoVQ@mail.gmail.com>
 <20181120155826.j5rja22jnxpkmjrs@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120155826.j5rja22jnxpkmjrs@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, maarten.lankhorst@linux.intel.com, sean@poorly.run, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, thierry.reding@gmail.com, Mark Rutland <mark.rutland@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, TL Lim <tllim@pine64.org>, linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org

On Tue, Nov 20, 2018 at 7:59 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Tue, Nov 20, 2018 at 07:06:30PM +0530, Jagan Teki wrote:
> > On Tue, Nov 20, 2018 at 6:53 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > On Mon, Nov 19, 2018 at 04:28:29PM +0530, Jagan Teki wrote:
> > > > On Mon, Nov 19, 2018 at 1:57 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > > >
> > > > > On Fri, Nov 16, 2018 at 10:09:05PM +0530, Jagan Teki wrote:
> > > > > > Loop N1 instruction delay for burst mode lcd panel are
> > > > > > computed as per BSP code.
> > > > > >
> > > > > > Reference code is available in BSP (from linux-sunxi
> > > > > > drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
> > > > > >
> > > > > > dsi_dev[sel]->dsi_inst_loop_num.bits.loop_n1=
> > > > > > (panel->lcd_ht-panel->lcd_x)*(150)/(panel->lcd_dclk_freq*8) - 50;
> > > > > > => (((mode->htotal - mode->hdisplay) * 150) /
> > > > > >      ((mode->clock / 1000) * 8)) - 50;
> > > > > >
> > > > > > So use the similar computation for loop N1 delay.
> > > > > >
> > > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > >
> > > > > *why* are you doing this? What is it fixing? on which devices?
> > > >
> > > > You mentioned the separate function to compute the delay for all modes
> > > > [1], ie what I did. did I missing anything?
> > >
> > > You're missing that you are never explaining why that patch is needed
> > > in the first place. Or answering the question I asked a couple of
> > > lines above.
> >
> > OK.
> >
> > The instruction delay varies between video and burst mode. for burst
> > mode panels it is computed based on the panel clock along with
> > horizontal sync+porch timings.
>
> You're still stating a fact. What issue, that you experienced, are you
> trying to solve here?

IIRC that's what BSP driver does. Otherwise panels that use burst mode
just don't work.

> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
