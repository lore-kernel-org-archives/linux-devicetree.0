From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/5] arm64: dts: add QorIQ LS1046A SoC support
Date: Tue, 23 Aug 2016 12:04:00 +0200
Message-ID: <2061455.WN6nWWqTiZ@wuerfel>
References: <1467972944-12293-1-git-send-email-shh.xie@gmail.com>
 <1984740.gmAYAJ1bIT@wuerfel>
 <DB5PR0401MB21834BD67F0EA86B3A22E9D6E8150@DB5PR0401MB2183.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <DB5PR0401MB21834BD67F0EA86B3A22E9D6E8150@DB5PR0401MB2183.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shaohui Xie <shaohui.xie@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mihai Emilian Bantea <mihai.bantea@nxp.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, Zhiqiang Hou <zhiqiang.hou@nxp.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Minghuan Lian <minghuan.lian@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>, "galak@codeaurora.org" <galak@codeaurora.org>, Qianyu Gong <qianyu.gong@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thursday, August 18, 2016 10:27:36 AM CEST Shaohui Xie wrote:
> Hello Arnd,
> 
> Thank you for reviewing!
> 
> I'm seriously Sorry for the late response! I was on business travel on a project and had been very busy for a  long time.

No worries.

> > -----Original Message-----
> > From: Arnd Bergmann [mailto:arnd@arndb.de]
> > Sent: Friday, July 08, 2016 8:00 PM
> > On Friday, July 8, 2016 6:15:40 PM CEST shh.xie@gmail.com wrote:
> > > +
> > > +   memory@80000000 {
> > > +           device_type = "memory";
> > > +           reg = <0x0 0x80000000 0 0x80000000>;
> > > +                 /* DRAM space 1, size: 2GiB DRAM */
> > > +   };
> > 
> > The memory size is usually in the .dts file, unless this is on-chip eDRAM.
> [S.H] The memory size will be fixup by U-boot, if it's not proper to have it in .dtsti,
> How about remove it?
> 

Sounds fine to me. A lot of board specific files have a memory node
regardless of the override, but I don't see a reason to require it.

	Arnd
