From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx7ulp: add crypto support
Date: Wed, 12 Jun 2019 21:26:02 +0800
Message-ID: <20190612132600.GI11086@dragon>
References: <20190606080255.25504-1-horia.geanta@nxp.com>
 <20190612103926.GE11086@dragon>
 <VI1PR0402MB3485A573518D60A573BA55C298EC0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <20190612130602.GH11086@dragon>
 <VI1PR0402MB348596BF52CE43B5D4CD534798EC0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <VI1PR0402MB348596BF52CE43B5D4CD534798EC0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Horia Geanta <horia.geanta@nxp.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Aymen Sghaier <aymen.sghaier@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, Franck Lenormand <franck.lenormand@nxp.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 12, 2019 at 01:15:46PM +0000, Horia Geanta wrote:
> On 6/12/2019 4:06 PM, Shawn Guo wrote:
> > On Wed, Jun 12, 2019 at 11:45:18AM +0000, Horia Geanta wrote:
> >> On 6/12/2019 1:40 PM, Shawn Guo wrote:
> >>> On Thu, Jun 06, 2019 at 11:02:55AM +0300, Horia Geantă wrote:
> >>>> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> >>>>
> >>>> Add crypto node in device tree for CAAM support.
> >>>>
> >>>> Noteworthy is that on 7ulp the interrupt line is shared
> >>>> between the two job rings.
> >>>>
> >>>> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> >>>> Signed-off-by: Franck LENORMAND <franck.lenormand@nxp.com>
> >>>> Signed-off-by: Horia Geantă <horia.geanta@nxp.com>
> >>>> ---
> >>>>
> >>>> I've just realized that this patch should be merged through the crypto tree,
> >>>> else bisectability could be affected due to cryptodev-2.6
> >>>> commit 385cfc84a5a8 ("crypto: caam - disable some clock checks for iMX7ULP")
> >>>> ( https://patchwork.kernel.org/patch/10970017/ )
> >>>> which should come first.
> >>>
> >>> I'm not sure I follow it.  This is a new device added to imx7ulp DT.
> >>> It's never worked before on imx7ulp.  How would it affect git bisect?
> >>>
> >> Driver corresponding to this device (drivers/crypto/caam) has to be updated
> >> before adding the node in DT.
> >> Is there any guarantee wrt. merge order of the crypto and DT trees?
> > 
> > Do not merge DT changes until driver part hits mainline.
> > 
> That would mean driver changes would be merged in v5.3 and DT node in v5.4.

It's quite normal that dependent changes land on mainline in multiple
cycles.

> 
> Would going through the crypto tree with this patch be such a big issue?

The only issue would be the potential merge conflict.

> I don't think it's the first time (relatively small) DT patches
> are merged via other trees.

Yes, it happens from time to time depending on maintainer's style. I'm
fine with the DT changes going through other subsystem tree, if the
subsystem maintainer wants to and is willing to take the risk of merge
conflict between his tree and arm-soc tree.

Shawn
