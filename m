From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH] ARM: dts: vf610: Add ZII SSMB SPU3 board
Date: Wed, 18 Jul 2018 17:51:08 -0700
Message-ID: <CAHQ1cqG+-7sxJjqs86HG3iOdqDWNQZRpTDTev8XYi2jH=BVFOg@mail.gmail.com>
References: <20180717040651.641-1-andrew.smirnov@gmail.com> <CAOMZO5Dp5aTZF0drkD+QSRyX6qGxAe0yeYGUS8-v=FtJwA7=SA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5Dp5aTZF0drkD+QSRyX6qGxAe0yeYGUS8-v=FtJwA7=SA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, linux-kernel <linux-kernel@vger.kernel.org>, Chris Healy <cphealy@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 18, 2018 at 3:50 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Andrey,
>
> On Tue, Jul 17, 2018 at 1:06 AM, Andrey Smirnov
> <andrew.smirnov@gmail.com> wrote:
>
> > +/dts-v1/;
> > +#include "vf610.dtsi"
> > +
> > +/ {
> > +       model = "ZII VF610 SSMB SPU3 Board";
> > +       compatible = "zii,vf610spu3", "zii,vf610dev", "fsl,vf610";
>
> Looks good to me.
>
> Just a minor comment: Is " "zii,vf610dev" really needed here?
>

It's not used in Linux, but I do rely on it in Barebox here:

https://git.pengutronix.de/cgit/barebox/tree/arch/arm/boards/zii-vf610-dev/board.c#n94

and here:

https://git.pengutronix.de/cgit/barebox/tree/arch/arm/boards/zii-vf610-dev/board.c#n137

so it's pretty handy to have. I can remove it if it is too much of an eyesore.

Thanks,
Andrey Smirnov
