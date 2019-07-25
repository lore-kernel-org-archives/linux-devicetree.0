From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: imx8mn: Fix tab indentation for yaml file
Date: Thu, 25 Jul 2019 15:37:24 -0600
Message-ID: <CAL_JsqKZHG-y_cKitU0=EksgyVU-YLOi1gAcFXx4ve21CMki1g@mail.gmail.com>
References: <20190725020551.27034-1-Anson.Huang@nxp.com> <20190725210619.5EB94218D4@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725210619.5EB94218D4@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Anson Huang <Anson.Huang@nxp.com>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <Linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 25, 2019 at 3:06 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Anson.Huang@nxp.com (2019-07-24 19:05:51)
> > From: Anson Huang <Anson.Huang@nxp.com>
> >
> > YAML file can NOT contain tab as indentation, fix it.
> >
>
> Would be nice if checkpatch could check for this.

Would be nice if folks just ran 'make dt_binding_check'. :) It
wouldn't be hard to add a tab check to checkpatch, but that's just one
potential problem.

Rob
