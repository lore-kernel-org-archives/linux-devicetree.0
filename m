From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH] ARM: dts: vf610: Add ZII CFU1 board
Date: Thu, 19 Jul 2018 12:07:54 -0700
Message-ID: <CAHQ1cqE7m6WO1t3YggrMrApFV2m2Y2G4NPDMcb6Ry9zQHC8xqw@mail.gmail.com>
References: <20180719005941.10458-1-andrew.smirnov@gmail.com> <CAOMZO5D1rKH+_wuJrhD6Cr4psQwnk7CHVWm6qi0Jv7vnTiazUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5D1rKH+_wuJrhD6Cr4psQwnk7CHVWm6qi0Jv7vnTiazUQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, linux-kernel <linux-kernel@vger.kernel.org>, Chris Healy <cphealy@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 19, 2018 at 5:45 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Andrey,
>
> On Wed, Jul 18, 2018 at 9:59 PM, Andrey Smirnov
> <andrew.smirnov@gmail.com> wrote:
>
> > +/ {
> > +       model = "ZII VF610 CFU1 Board";
> > +       compatible = "zii,vf610cfu1", "zii,vf610dev", "fsl,vf610";
> > +
> > +       chosen {
> > +               stdout-path = &uart0;
> > +       };
> > +
> > +       memory {
>
> memory@80000000 to avoid dtc warnings with W=1, please.
>
> Please make sure that this patch does not introduce any W=1 warning.
>

I foolishly assumed building it with W=2 would reveal W=1 level
problems as well, but apparently not. Will fix in v2. Same problems
were missed in SPU3 patch that just went it. I'll send fixes for that
one as well.

Thanks,
Andrey Smirnov
