From: Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH v2 3/3] arm64: dts: imx: Add i.mx8mm evk basic dts support
Date: Fri, 22 Mar 2019 05:53:52 +0000
Message-ID: <VI1PR0402MB35190875AE87A9F8D62AE18587430@VI1PR0402MB3519.eurprd04.prod.outlook.com>
References: <1552369779-7614-1-git-send-email-ping.bai@nxp.com>
 <1552369779-7614-3-git-send-email-ping.bai@nxp.com>
 <20190321084453.GE12513@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190321084453.GE12513@dragon>
Content-Language: en-US
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCH v2 3/3] arm64: dts: imx: Add i.mx8mm evk basic dts
> support
...
> > +
> > +/ {
> > +	model = "FSL i.MX8MM EVK board";
> > +	compatible = "fsl,imx8mm-evk", "fsl,imx8mm";
> 
> The board compatible should be added to
> Documentation/devicetree/bindings/arm/fsl.yaml as well.

Hi shawn, I just checked the binding doc in this patchset's 'patch 2/3', I think I have add the binding in the yaml file.
Anything missed?

BR
Jacky Bai
> > +
> > --
> > 1.9.1
> >
