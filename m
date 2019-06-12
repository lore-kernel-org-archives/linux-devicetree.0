From: Horia Geanta <horia.geanta@nxp.com>
Subject: Re: [PATCH] ARM: dts: imx7ulp: add crypto support
Date: Wed, 12 Jun 2019 13:15:46 +0000
Message-ID: <VI1PR0402MB348596BF52CE43B5D4CD534798EC0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <20190606080255.25504-1-horia.geanta@nxp.com>
 <20190612103926.GE11086@dragon>
 <VI1PR0402MB3485A573518D60A573BA55C298EC0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <20190612130602.GH11086@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Aymen Sghaier <aymen.sghaier@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, Franck Lenormand <franck.lenormand@nxp.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 6/12/2019 4:06 PM, Shawn Guo wrote:=0A=
> On Wed, Jun 12, 2019 at 11:45:18AM +0000, Horia Geanta wrote:=0A=
>> On 6/12/2019 1:40 PM, Shawn Guo wrote:=0A=
>>> On Thu, Jun 06, 2019 at 11:02:55AM +0300, Horia Geant=E3 wrote:=0A=
>>>> From: Iuliana Prodan <iuliana.prodan@nxp.com>=0A=
>>>>=0A=
>>>> Add crypto node in device tree for CAAM support.=0A=
>>>>=0A=
>>>> Noteworthy is that on 7ulp the interrupt line is shared=0A=
>>>> between the two job rings.=0A=
>>>>=0A=
>>>> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>=0A=
>>>> Signed-off-by: Franck LENORMAND <franck.lenormand@nxp.com>=0A=
>>>> Signed-off-by: Horia Geant=E3 <horia.geanta@nxp.com>=0A=
>>>> ---=0A=
>>>>=0A=
>>>> I've just realized that this patch should be merged through the crypto=
 tree,=0A=
>>>> else bisectability could be affected due to cryptodev-2.6=0A=
>>>> commit 385cfc84a5a8 ("crypto: caam - disable some clock checks for iMX=
7ULP")=0A=
>>>> ( https://patchwork.kernel.org/patch/10970017/ )=0A=
>>>> which should come first.=0A=
>>>=0A=
>>> I'm not sure I follow it.  This is a new device added to imx7ulp DT.=0A=
>>> It's never worked before on imx7ulp.  How would it affect git bisect?=
=0A=
>>>=0A=
>> Driver corresponding to this device (drivers/crypto/caam) has to be upda=
ted=0A=
>> before adding the node in DT.=0A=
>> Is there any guarantee wrt. merge order of the crypto and DT trees?=0A=
> =0A=
> Do not merge DT changes until driver part hits mainline.=0A=
> =0A=
That would mean driver changes would be merged in v5.3 and DT node in v5.4.=
=0A=
=0A=
Would going through the crypto tree with this patch be such a big issue?=0A=
I don't think it's the first time (relatively small) DT patches=0A=
are merged via other trees.=0A=
=0A=
Thanks,=0A=
Horia=0A=
