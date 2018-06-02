From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] clk: imx6ul: add GPIO clock gates
Date: Sat, 2 Jun 2018 11:07:40 -0300
Message-ID: <CAOMZO5DfpwEDrBrMaTCt1_2Kkkm_tuVLE2WMy5z2=iO_rRFVEg@mail.gmail.com>
References: <1526959560-6014-1-git-send-email-Anson.Huang@nxp.com>
 <1439344955.9677.1526991935718@email.1und1.de> <CAOMZO5BVhjwGpJ22qBihKcjWyvBkzNPU0cNtNY9HToLLEkYByA@mail.gmail.com>
 <CAOf5uwneWyjNpD-tGGL7CgL2_jJFvDtzbi+NBg7wqGMGR4qGCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOf5uwneWyjNpD-tGGL7CgL2_jJFvDtzbi+NBg7wqGMGR4qGCw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Anson Huang <Anson.Huang@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Michael,

On Sat, Jun 2, 2018 at 11:04 AM, Michael Nazzareno Trimarchi
<michael@amarulasolutions.com> wrote:

> ull is a preatty new platform so one board was listed. Are you sure
> that we need?

There are several imx6ul based dts in mainline and it is better if we
can avoid dtb breakage when possible.

In this case we can avoid the dtb breakage by adding the new clock
definitions at the end of the file, just like we do for all the other
imx devices.
