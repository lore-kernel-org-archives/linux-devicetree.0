From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: fsl: Add devicetree binding for
 Oxalis
Date: Tue, 22 Jan 2019 11:00:12 +0800
Message-ID: <20190122030011.GC19233@dragon>
References: <20190114102053.16013-1-manivannan.sadhasivam@linaro.org>
 <20190114102053.16013-3-manivannan.sadhasivam@linaro.org>
 <CAL_JsqJpRPrCpRTpqh1v6JZwpEtZnaeuLTHR+0EiMSoxbk9zeQ@mail.gmail.com>
 <20190116022100.GC15808@dragon>
 <CAL_Jsq+myeZ1n4X=KhHZjtPDHnGH=L65xxYbzMrt8Rq6Bur4Bg@mail.gmail.com>
 <20190116101441.GH15808@dragon>
 <20190121060950.GA8713@Mani-XPS-13-9360>
 <AM6PR04MB5863AE2A3DD74882BEC680CA8F9F0@AM6PR04MB5863.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM6PR04MB5863AE2A3DD74882BEC680CA8F9F0@AM6PR04MB5863.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Li <leoyang.li@nxp.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "a.tropschug@ebs-systart.com" <a.tropschug@ebs-systart.com>, "m.bittner@ebs-systart.com" <m.bittner@ebs-systart.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 07:57:20PM +0000, Leo Li wrote:
> > > So it seems the compatible of the boards below are missing there.
> > >
> > >   ls1021a-moxa-uc-8410a.dts
> > >   ls1021a-qds.dts
> > >   ls1021a-twr.dts
> > 
> > So how should we proceed here? The above mentioned boards are lacking
> > compatible in dts files and I guess that's the reason they didn't get
> > mentioned in "fsl" binding file.
> > 
> > Should I just go ahead and add the compatibles for these boards and list
> > them in binding file?
> 
> Please go ahead and do that.  One thing is that the moxa-uc-8410a board is a 3rd-party board, not sure if it should belong to the fsl binding file.

The fsl.yaml is designed to contain various boards using fsl SoCs, so
it's fine.

Shawn
