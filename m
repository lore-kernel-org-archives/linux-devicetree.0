From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2 01/12] drm/sun4i: sun6i_mipi_dsi: Compute burst mode
 loop N1 instruction delay
Date: Mon, 19 Nov 2018 16:28:29 +0530
Message-ID: <CAMty3ZBDa2wjjCh8NtrbKNYz=mr1xhZKv9JfnmDPDBQRO+CkYw@mail.gmail.com>
References: <20181116163916.29621-1-jagan@amarulasolutions.com>
 <20181116163916.29621-2-jagan@amarulasolutions.com> <20181119082707.kbsw2gyntxxbh6no@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181119082707.kbsw2gyntxxbh6no@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Vasily Khoruzhick <anarsoul@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Mark Rutland <mark.rutland@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Michael Trimarchi <michael@amarulasolutions.com>, TL Lim <tllim@pine64.org>, linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org

On Mon, Nov 19, 2018 at 1:57 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Fri, Nov 16, 2018 at 10:09:05PM +0530, Jagan Teki wrote:
> > Loop N1 instruction delay for burst mode lcd panel are
> > computed as per BSP code.
> >
> > Reference code is available in BSP (from linux-sunxi
> > drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
> >
> > dsi_dev[sel]->dsi_inst_loop_num.bits.loop_n1=
> > (panel->lcd_ht-panel->lcd_x)*(150)/(panel->lcd_dclk_freq*8) - 50;
> > => (((mode->htotal - mode->hdisplay) * 150) /
> >      ((mode->clock / 1000) * 8)) - 50;
> >
> > So use the similar computation for loop N1 delay.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> *why* are you doing this? What is it fixing? on which devices?

You mentioned the separate function to compute the delay for all modes
[1], ie what I did. did I missing anything?

[1] https://patchwork.kernel.org/patch/10666599/
