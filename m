From: Shaohui Xie <shaohui.xie@nxp.com>
Subject: RE: [PATCH 2/3] [v2] powerpc: fsl: update fman dt binding for PCS PHY
Date: Fri, 15 Jan 2016 04:03:22 +0000
Message-ID: <VI1PR04MB1664E081AEA03DE388AF6202E8CD0@VI1PR04MB1664.eurprd04.prod.outlook.com>
References: <1452760038-12442-1-git-send-email-shh.xie@gmail.com>
 <20160115025341.GA13316@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20160115025341.GA13316@rob-hp-laptop>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, "shh.xie@gmail.com" <shh.xie@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, Shaohui Xie <Shaohui.Xie@freescale.com>
List-Id: devicetree@vger.kernel.org

> > +  - fsl-lane-handle: phandle, specifies a reference to a node representing a
> Serdes.
> > +  - fsl-lane-reg: offset and length of the register set for the serdes lane.
> 
> These should be fsl,... not fsl-...
Will fix it.

Thank you!

 Shaohui
