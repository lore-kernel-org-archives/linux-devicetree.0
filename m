From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 2/2] arm64: dts: imx8qxp: Add EDMA0/EDMA1 nodes
Date: Wed, 27 Mar 2019 10:33:56 +0100
Message-ID: <1553679236.2561.27.camel@pengutronix.de>
References: <20190326094239.5910-1-daniel.baluta@nxp.com>
         <20190326094239.5910-3-daniel.baluta@nxp.com>
         <VI1PR04MB4222A8DBC2312E72AAD3AFAE805F0@VI1PR04MB4222.eurprd04.prod.outlook.com>
         <CAEnQRZCb=rZMdBYyYCSCQ3Dba5Nk43BvV6whHx-vNPmox-OOSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAEnQRZCb=rZMdBYyYCSCQ3Dba5Nk43BvV6whHx-vNPmox-OOSw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, Anson Huang <anson.huang@nxp.com>, Teo Hall <teo.hall@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

Am Mittwoch, den 27.03.2019, 10:51 +0200 schrieb Daniel Baluta:
[...]
> 
> > or
> > "fsl,imx8qxp-edma", "fsl,imx8qm-edma"?
> 
> One thing that it is not clear for me is why there are places
> where we use two compatible strings?
> 
> I understand the situation where are two distinct drivers, but is there
> any other reason to add multiple compatible strings for a node in dts?

We use 2 compatible string where there should not be any differences
between the IP blocks of this SoC and a version the driver already
supports.

So if the eDMA driver already supports the software interface for
"fsl,imx8qm-edma" and the IP block is compatible with this, we add this
to the DT, so the we don't need any driver changes just to support a
new SoC. But as you can never be sure if there are subtle differences
in the IP block and/or SOC integration when adding the DT support, we
also add a more specific compatible to the DT. If it turns out that
there are software visible differences, we only need to adapt the
driver to check for the more specific compatible to trigger the changed
behavior, allowing to keep the DT stable.

Regards,
Lucas
