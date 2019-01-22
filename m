From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: add dpaa2-console node for DPAA2 platforms
Date: Tue, 22 Jan 2019 10:53:57 +0800
Message-ID: <20190122025355.GA19233@dragon>
References: <1545406240-3061-1-git-send-email-ioana.ciornei@nxp.com>
 <1545406240-3061-2-git-send-email-ioana.ciornei@nxp.com>
 <20190112024725.GO32649@dragon>
 <VI1PR0402MB2800E8F9F1884EB0669EE9F0E0820@VI1PR0402MB2800.eurprd04.prod.outlook.com>
 <20190116105559.GM15808@dragon>
 <VI1PR0402MB28007817A29E6116D1FAFC2BE0820@VI1PR0402MB2800.eurprd04.prod.outlook.com>
 <VI1PR0402MB2800477D1F1FE0E78F1D8D33E0820@VI1PR0402MB2800.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <VI1PR0402MB2800477D1F1FE0E78F1D8D33E0820@VI1PR0402MB2800.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 16, 2019 at 05:31:46PM +0000, Ioana Ciornei wrote:
> > > Subject: Re: [PATCH 1/3] arm64: dts: add dpaa2-console node for DPAA2
> > > platforms
> > >
> > > On Wed, Jan 16, 2019 at 10:02:01AM +0000, Ioana Ciornei wrote:
> > > > > Subject: Re: [PATCH 1/3] arm64: dts: add dpaa2-console node for
> > > > > DPAA2 platforms
> > > > >
> > > > > On Fri, Dec 21, 2018 at 03:31:09PM +0000, Ioana Ciornei wrote:
> > > > > > Add the dpaa2-console device tree node for the following
> > > > > > DPAA2 based platforms: LS1088A, LS2080A and LS2088A.
> > > > > >
> > > > > > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > > > >
> > > > > DTS patch generally goes to the last in a series.
> > > >
> > > > Should I resend this with the DTS patch the last?
> > >
> > > You do not have to resend the series only for this.  It's pretty much
> > > a suggestion for future posting.
> > 
> 
> One more thing, do you have any other feedback on the DTS part?
> I think the best path for this patch set is through Leo's fsl soc tree but of course we need an ack from the DTS part also.

I do not see there is a hard dependency between driver and dts part,
e.g. build error or causing regression.  In that case, dts should just
go via its channel.

Shawn
