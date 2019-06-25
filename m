From: Robin Gong <yibin.gong@nxp.com>
Subject: RE: [PATCH v4 1/6] dmaengine: fsl-edma: add drvdata for fsl-edma
Date: Tue, 25 Jun 2019 07:08:23 +0000
Message-ID: <VE1PR04MB66387F57FA3B625CBA5D23B189E30@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <20190614081724.13366-1-yibin.gong@nxp.com>
 <20190614081724.13366-2-yibin.gong@nxp.com>
 <20190625041216.GE2962@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625041216.GE2962@vkoul-mobl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "angelo@sysam.it" <angelo@sysam.it>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Okay, will correct it and send v5 after rebase.
>On 25-06-19, 16:17, Vinod Koul wrote:
> On 14-06-19, 16:17, yibin.gong@nxp.com wrote:
> > From: Robin Gong <yibin.gong@nxp.com>
> >
> > There are some differences between vf610 and next i.mx7ulp. Put such
> > differences into static driver data for distiguish easily at driver
>=20
> Typo distiguish
>=20
> Though I tried to apply 1-5 it doesnt apply for me, can you rebase and re=
send
>=20
> Thanks
>=20
> --
> ~Vinod
