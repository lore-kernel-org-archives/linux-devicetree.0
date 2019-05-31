From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: fsl: ls1046: Modify the qspi flash frequency
Date: Fri, 31 May 2019 15:41:31 +0800
Message-ID: <20190531074128.GD23453@dragon>
References: <20190521150336.8409-1-pankaj.bansal@nxp.com>
 <20190523124806.GU9261@dragon>
 <VI1PR0401MB24966C5BB07836D5FA00BC12F11D0@VI1PR0401MB2496.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <VI1PR0401MB24966C5BB07836D5FA00BC12F11D0@VI1PR0401MB2496.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pankaj Bansal <pankaj.bansal@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rajesh Bhagat <rajesh.bhagat@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mingkai Hu <mingkai.hu@nxp.com>, Leo Li <leoyang.li@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, May 27, 2019 at 06:12:28AM +0000, Pankaj Bansal wrote:
> HI Shawn,
> 
> > -----Original Message-----
> > From: Shawn Guo <shawnguo@kernel.org>
> > Sent: Thursday, 23 May, 2019 06:18 PM
> > To: Pankaj Bansal <pankaj.bansal@nxp.com>
> > Cc: Leo Li <leoyang.li@nxp.com>; Mingkai Hu <mingkai.hu@nxp.com>; Rajesh
> > Bhagat <rajesh.bhagat@nxp.com>; linux-arm-kernel@lists.infradead.org;
> > devicetree@vger.kernel.org
> > Subject: Re: [PATCH] arm64: dts: fsl: ls1046: Modify the qspi flash frequency
> > 
> > On Tue, May 21, 2019 at 09:40:09AM +0000, Pankaj Bansal wrote:
> > > The qspi flash in ls1046a based QDS and RDB boards can operate at
> > > 50MHz frequency.
> > > Therefore, update the maximum supported freq in their respective dts
> > > files.
> > >
> > > Signed-off-by: Pankaj Bansal <pankaj.bansal@nxp.com>
> > 
> > Do not use base64 encoding for patch posting.
> 
> I did not understand this comment? Do you want me to change something in patch?
> I had run checkpatch script on the patch before sending and it did not report any waning or error.
> Can this patch not be merged in current tree ?

You mail server is using a content-transfer-encoding that makes patch
applying very difficult.  Talk to NXP colleague Anson Huang
<Anson.Huang@nxp.com> to find out how to fix it.

https://patchwork.kernel.org/patch/10944169/#22656941

Shawn
