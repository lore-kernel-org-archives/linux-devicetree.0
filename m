From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: ls1046a: drop incomplete memory node
Date: Mon, 26 Feb 2018 12:35:33 +0800
Message-ID: <20180226043532.GT3217@dragon>
References: <1519455896-8924-1-git-send-email-shawnguo@kernel.org>
 <AM4PR0401MB1699AD47DE96B4299F680E498FC10@AM4PR0401MB1699.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <AM4PR0401MB1699AD47DE96B4299F680E498FC10@AM4PR0401MB1699.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leo Li <leoyang.li@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shaohui Xie <Shaohui.Xie@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 26, 2018 at 01:33:34AM +0000, Leo Li wrote:
> 
> 
> > -----Original Message-----
> > From: Shawn Guo [mailto:shawnguo@kernel.org]
> > Sent: Saturday, February 24, 2018 3:05 PM
> > To: linux-arm-kernel@lists.infradead.org
> > Cc: devicetree@vger.kernel.org; Shawn Guo <shawnguo@kernel.org>;
> > Mingkai Hu <mingkai.hu@nxp.com>; Shaohui Xie <Shaohui.Xie@nxp.com>;
> > Leo Li <leoyang.li@nxp.com>
> > Subject: [PATCH] arm64: dts: ls1046a: drop incomplete memory node
> > 
> > The memory node in fsl-ls1046a.dtsi has no 'reg' property, and causes the
> > dtc warning below.
> > 
> > Warning (unit_address_vs_reg): Node /memory@80000000 has a unit name,
> > but no reg property
> > 
> > This is clearly an incomplete memory node.  Let's drop it.  Either a complete
> > memory should be added, or bootloader needs to fill the node as a whole.
> 
> Or we can put in a dummy reg property to be updated by bootloader like the mac-address property?

Yeah, I'm fine with either way, as long as we get rid of the warning.
I will post v2 shortly.

Shawn
