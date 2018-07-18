From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: vf610: Add ZII SSMB SPU3 board
Date: Wed, 18 Jul 2018 19:50:15 -0300
Message-ID: <CAOMZO5Dp5aTZF0drkD+QSRyX6qGxAe0yeYGUS8-v=FtJwA7=SA@mail.gmail.com>
References: <20180717040651.641-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180717040651.641-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, linux-kernel <linux-kernel@vger.kernel.org>, Chris Healy <cphealy@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Andrey,

On Tue, Jul 17, 2018 at 1:06 AM, Andrey Smirnov
<andrew.smirnov@gmail.com> wrote:

> +/dts-v1/;
> +#include "vf610.dtsi"
> +
> +/ {
> +       model = "ZII VF610 SSMB SPU3 Board";
> +       compatible = "zii,vf610spu3", "zii,vf610dev", "fsl,vf610";

Looks good to me.

Just a minor comment: Is " "zii,vf610dev" really needed here?

Anyway:

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
