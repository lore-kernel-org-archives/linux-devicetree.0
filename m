From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [EXT] Re: [v2 2/2] arm64: dts: ls1028a: Update the DT node
 definition for dpclk
Date: Mon, 14 Oct 2019 14:21:52 +0800
Message-ID: <20191014062150.GC12262@dragon>
References: <20190920083419.5092-1-wen.he_1@nxp.com>
 <20190920083419.5092-2-wen.he_1@nxp.com>
 <20191007123512.GM7150@dragon>
 <DB7PR04MB5195760127B83B88B68CC602E29A0@DB7PR04MB5195.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB7PR04MB5195760127B83B88B68CC602E29A0@DB7PR04MB5195.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen He <wen.he_1@nxp.com>
Cc: "linux-devel@linux.nxdi.nxp.com" <linux-devel@linux.nxdi.nxp.com>, Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 08, 2019 at 04:08:57AM +0000, Wen He wrote:
> 
> 
> > -----Original Message-----
> > From: Shawn Guo <shawnguo@kernel.org>
> > Sent: 2019年10月7日 20:35
> > To: Wen He <wen.he_1@nxp.com>
> > Cc: linux-devel@linux.nxdi.nxp.com; Leo Li <leoyang.li@nxp.com>; Rob Herring
> > <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org
> > Subject: [EXT] Re: [v2 2/2] arm64: dts: ls1028a: Update the DT node definition
> > for dpclk
> > 
> > 
> > On Fri, Sep 20, 2019 at 04:34:19PM +0800, Wen He wrote:
> > > Update DT node name clock-controller to clock-display,
> > 
> > The node name clock-controller is so good, and I do not understand why you
> > need to change it.
> > 
> 
> The node name clock-controller used for the system clockgen and this clock only used for
> the Display core. 
> To clearly the node, that why I have to use clock-display to instead of the clock-controller

Label is being used to specify things, and node name should just be as
generic as possible.

Shawn
