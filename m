From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] ARM: dts: imx7ulp: add crypto support
Date: Wed, 12 Jun 2019 21:59:52 +0800
Message-ID: <20190612135952.ds6zzh7ppahiuodd@gondor.apana.org.au>
References: <20190606080255.25504-1-horia.geanta@nxp.com>
 <20190612103926.GE11086@dragon>
 <VI1PR0402MB3485A573518D60A573BA55C298EC0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <20190612130602.GH11086@dragon>
 <VI1PR0402MB348596BF52CE43B5D4CD534798EC0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <20190612132600.GI11086@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190612132600.GI11086@dragon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Aymen Sghaier <aymen.sghaier@nxp.com>, Horia Geanta <horia.geanta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Franck Lenormand <franck.lenormand@nxp.com>, Rob Herring <robh+dt@kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "David S. Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 12, 2019 at 09:26:02PM +0800, Shawn Guo wrote:
>
> Yes, it happens from time to time depending on maintainer's style. I'm
> fine with the DT changes going through other subsystem tree, if the
> subsystem maintainer wants to and is willing to take the risk of merge
> conflict between his tree and arm-soc tree.

I have no problems with potential merge conflicts.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
