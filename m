From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: vf610: Add ZII CFU1 board
Date: Thu, 19 Jul 2018 09:45:56 -0300
Message-ID: <CAOMZO5D1rKH+_wuJrhD6Cr4psQwnk7CHVWm6qi0Jv7vnTiazUQ@mail.gmail.com>
References: <20180719005941.10458-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180719005941.10458-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, linux-kernel <linux-kernel@vger.kernel.org>, Chris Healy <cphealy@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Andrey,

On Wed, Jul 18, 2018 at 9:59 PM, Andrey Smirnov
<andrew.smirnov@gmail.com> wrote:

> +/ {
> +       model = "ZII VF610 CFU1 Board";
> +       compatible = "zii,vf610cfu1", "zii,vf610dev", "fsl,vf610";
> +
> +       chosen {
> +               stdout-path = &uart0;
> +       };
> +
> +       memory {

memory@80000000 to avoid dtc warnings with W=1, please.

Please make sure that this patch does not introduce any W=1 warning.

With this fixed:

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
