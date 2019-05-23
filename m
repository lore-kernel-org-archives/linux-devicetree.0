From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [RESEND][PATCH] arm64: dts: lx2160a: Enable usb3-lpm-capable for
 usb3 node
Date: Thu, 23 May 2019 16:16:47 +0800
Message-ID: <20190523081646.GK9261@dragon>
References: <20190515060434.33581-1-ran.wang_1@nxp.com>
 <20190523074300.GH9261@dragon>
 <AM5PR0402MB2865A81EB93DBAC90DB22E87F1010@AM5PR0402MB2865.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM5PR0402MB2865A81EB93DBAC90DB22E87F1010@AM5PR0402MB2865.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ran Wang <ran.wang_1@nxp.com>
Cc: Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 07:51:41AM +0000, Ran Wang wrote:
> Hi Shawn,
> 
> On Thursday, May 23, 2019 15:43, Shawn Guo wrote:
> > 
> > On Wed, May 15, 2019 at 02:04:34PM +0800, Ran Wang wrote:
> > > Enable USB3 HW LPM feature for lx2160a and active patch for snps
> > > erratum A-010131. It will disable U1/U2 temperary when initiate U3
> > > request.
> > >
> > > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > > ---
> > > Depend on:
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore
> > > .kernel.org%2Fpatchwork%2Fpatch%2F870134%2F&amp;data=02%7C01%7Cr
> > an.wan
> > >
> > g_1%40nxp.com%7Cc6df41748bc243397d3008d6df526c04%7C686ea1d3bc2b4c
> > 6fa92
> > >
> > cd99c5c301635%7C0%7C0%7C636941942428322802&amp;sdata=NR2zs8BE%2
> > FNn8KdP
> > > do6%2FsNwJJdx2VgaQTy5H4bAlTJgw%3D&amp;reserved=0
> > 
> > Is the dependency accepted?
> 
> No, I got no comment for that post since then.
> lore.kernel.org/patchwork/patch/870134/

Please post dts patch only after dependency gets accepted.

Shawn
