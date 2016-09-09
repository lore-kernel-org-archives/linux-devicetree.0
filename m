From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 2/3] ARM: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual
 initial support
Date: Fri, 9 Sep 2016 19:25:46 -0300
Message-ID: <CAOMZO5CpdL62frpVkHOQ4gGoXrVQv3AjiXqHoXfZW8RKTuxJXw@mail.gmail.com>
References: <1473457525-27768-1-git-send-email-jagan@amarulasolutions.com>
 <1473457525-27768-2-git-send-email-jagan@amarulasolutions.com>
 <CAOMZO5BPhY14S4G541MTpsCW64SsCiNcsksJarBCWqGOnaPf3A@mail.gmail.com>
 <CAMty3ZC+49D7aALOKcsjoiqptQwrrtHGMAGCtcPn51QDsksSSQ@mail.gmail.com>
 <CAMty3ZAM-sZ0aZU0Z+8WhDcepx8KM96xUbn+n3UcDSjFTafC-A@mail.gmail.com>
 <CAOMZO5AuZ5DqqKngLw67_-3PdoYx5pMNmm1ZHwRd79rYPJY-+Q@mail.gmail.com>
 <CAOMZO5D2WNBh6fy8iFYasSZnovfBJRxzBt55ceaPqwCn3zvepg@mail.gmail.com> <CAMty3ZAPbJM5EQD_OqN9nr---y1P0e+5Y5ujL4g7YoPEsuU+aw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMty3ZAPbJM5EQD_OqN9nr---y1P0e+5Y5ujL4g7YoPEsuU+aw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jagan Teki <jagannadh.teki@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Matteo Lisi <matteo.lisi@engicam.com>, Michael Trimarchi <michael@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 9, 2016 at 7:21 PM, Jagan Teki <jagan@amarulasolutions.com> wrote:

> Why? can't we update iomux reg value any side effects or something.

Sure you can change it.

You were using 0x8000000 before and I assume you tested flexcan and it
worked well.

Putting 1b0b0 will keep the same setting, so no functional change.

Why did you select 0x1b020?
