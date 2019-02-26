From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH v2 0/2] Add and document the i.MX8MQ OTP controller
Date: Tue, 26 Feb 2019 09:01:48 +0000
Message-ID: <20190226090147.fohb7ez7pprnxfvb@fsr-ub1664-175>
References: <20190202150638.13672-1-ccaione@baylibre.com>
 <20190225151127.elg2iuaxa4otdb46@fsr-ub1664-175>
 <e0af9818-86cf-c341-61a4-0a1406b07880@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e0af9818-86cf-c341-61a4-0a1406b07880@baylibre.com>
Content-Language: en-US
Content-ID: <8DC7F742E4ADD548A54687F54AFAEB12@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <ccaione@baylibre.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On 19-02-26 08:57:13, Carlo Caione wrote:
> On 25/02/2019 15:11, Abel Vesa wrote:
> > On 19-02-02 15:06:36, Carlo Caione wrote:
> > > Add a new node to enable the On-Chip OTP controller and add the new
> > > binding in the documentation.
> > > 
> > > Carlo Caione (2):
> > >    arm64: dts: imx8mq: Add on-chip OTP controller node
> > >    dt-bindings: imx-ocotp: Add i.MX8MQ compatible
> > > 
> > >   Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 1 +
> > >   arch/arm64/boot/dts/freescale/imx8mq.dtsi             | 8 ++++++++
> > >   2 files changed, 9 insertions(+)
> > > 
> > > -- 
> > > 2.19.1
> > > 
> > 
> > What's the status of this patchseries ?
> > 
> > It would help a lot if we would manage to get this in.
> 
> Uh, for some reason I thought Lucas was going to take care of this.
> I'll submit a v2 now.
> 

I tried this morning to apply and test both yours and Lucas's.

Your second patch overlaps with Lucas's.

Plus, Lucas's patch updates the the list in the description too.

So I would suggest you send only the dts update since Lucas's patch series
already has R-b and it's good to go.

> --
> Carlo Caione
> 
