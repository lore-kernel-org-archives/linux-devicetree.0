From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v9 0/9] drm/sun4i: Allwinner A64 MIPI-DSI support
Date: Fri, 31 May 2019 12:55:52 +0530
Message-ID: <CAMty3ZCfc=xh1cZrM0PST-=QNT8qFRLkjWb4B=7YtLitXo6MGw@mail.gmail.com>
References: <20190529105615.14027-1-jagan@amarulasolutions.com> <20190531065806.fl4y2kex427qtysz@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190531065806.fl4y2kex427qtysz@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-amarula <linux-amarula@amarulasolutions.com>, Sergey Suloev <ssuloev@orpaltech.com>, Ryan Pannell <ryan@osukl.com>, Bhushan Shah <bshah@mykolab.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 31, 2019 at 12:28 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> Hi,
>
> On Wed, May 29, 2019 at 04:26:06PM +0530, Jagan Teki wrote:
> > This is v9 version for Allwinner A64 MIPI-DSI support
> > and here is the previous version set[1].
> >
> > This depends on dsi host controller fixes which were
> > supported in this series[2].
> >
> > All these changes are tested in Allwinner A64 with
> > 2, 4 lanes devices and whose pixel clocks are 27.5 MHz,
> > 30MHz, 55MHz and 147MHz.
>
> I wanted to apply this, but it wouldn't apply, can you send it without
> dependencies?

I can do that no problem, but [2] has dsi and dclk divider fixes that
would require A64 MIPI-DSI to work.
