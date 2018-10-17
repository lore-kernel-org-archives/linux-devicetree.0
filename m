From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v4 2/4] crypto: mxs-dcp - Add support for dcp clk
Date: Wed, 17 Oct 2018 10:02:41 -0300
Message-ID: <CAOMZO5DCzM_NnqD4tHTAn4pAaUdQGo38Ami1h3pu9SzgyQ7GnQ@mail.gmail.com>
References: <cover.1539779579.git.leonard.crestez@nxp.com> <95dce7010676581691b1ac9906e9298470e0aa1a.1539779579.git.leonard.crestez@nxp.com>
 <CAOMZO5BMeHjsyZWhUb5RmEBRCYViUN-Vx8KyLBWtDJGKBHHpCg@mail.gmail.com> <a97517bf72f649915bccf555ab7d3c8c4551298d.camel@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a97517bf72f649915bccf555ab7d3c8c4551298d.camel@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: NXP Linux Team <linux-imx@nxp.com>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Aymen Sghaier <aymen.sghaier@nxp.com>, Franck LENORMAND <franck.lenormand@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "David S. Miller" <davem@davemloft.net>, Horia Geanta Neag <horia.geanta@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Herbert Xu <herbert@gondor.apana.org.au>, Marek Vasut <marek.vasut@gmail.com>"open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <l>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 17, 2018 at 9:59 AM Leonard Crestez <leonard.crestez@nxp.com> wrote:

> There is a changelog in the cover letter.

It did not show up:
https://lkml.org/lkml/2018/10/17/673

> This only looks slightly odd in git diff but it's not unrelated.
>
> I placed clk get/prepare/enable just before stmp_reset_block and made
> stmp_reset_block print a message and goto err_disable_unprepare_clk on
> failure instead of just "if (ret) return ret;"

Got it! Then it looks fine, thanks:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
