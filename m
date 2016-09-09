From: "S.H. Xie" <shaohui.xie@nxp.com>
Subject: RE: [PATCH 3/7] [v2] arm64: dts: add QorIQ LS1046A SoC support
Date: Fri, 9 Sep 2016 06:46:37 +0000
Message-ID: <DB5PR0401MB21837ABC4366AA0040A235A3E8FA0@DB5PR0401MB2183.eurprd04.prod.outlook.com>
References: <1473069695-33092-1-git-send-email-shh.xie@gmail.com>
 <1473069695-33092-4-git-send-email-shh.xie@gmail.com>
 <20160908130549.GA16911@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160908130549.GA16911@tiger>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mihai Emilian Bantea <mihai.bantea@nxp.com>, "C.H. Zhao" <chenhui.zhao@nxp.com>, "arnd@arndb.de" <arnd@arndb.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "Z.Q. Hou" <zhiqiang.hou@nxp.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "M.H.
 Lian" <minghuan.lian@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Vincent Hu <mingkai.hu@nxp.com>, Horia Geanta Neag <horia.geanta@nxp.com>, "Q.Y. Gong" <qianyu.gong@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo@kernel.org]
> Sent: Thursday, September 08, 2016 9:06 PM
> To: shh.xie@gmail.com
> Cc: devicetree@vger.kernel.org; robh+dt@kernel.org; mark.rutland@arm.com;
> linux-arm-kernel@lists.infradead.org; catalin.marinas@arm.com;
> will.deacon@arm.com; linux-kernel@vger.kernel.org; Mihai Emilian Bantea
> <mihai.bantea@nxp.com>; C.H. Zhao <chenhui.zhao@nxp.com>; arnd@arndb.de;
> S.H. Xie <shaohui.xie@nxp.com>; Z.Q. Hou <zhiqiang.hou@nxp.com>; M.H. Lian
> <minghuan.lian@nxp.com>; Vincent Hu <mingkai.hu@nxp.com>; Horia Geanta
> Neag <horia.geanta@nxp.com>; Q.Y. Gong <qianyu.gong@nxp.com>
> Subject: Re: [PATCH 3/7] [v2] arm64: dts: add QorIQ LS1046A SoC support
> 
> On Mon, Sep 05, 2016 at 06:01:31PM +0800, shh.xie@gmail.com wrote:
> > +	soc {
> > +		compatible = "simple-bus";
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +
> > +		clockgen: clocking@1ee1000 {
> > +			compatible = "fsl,ls1046a-clockgen";
> > +			reg = <0x0 0x1ee1000 0x0 0x1000>;
> > +			#clock-cells = <2>;
> > +			clocks = <&sysclk>;
> > +		};
> > +
> > +		scfg: scfg@1570000 {
> 
> Instead of having device node in arbitrary place, can we sort all the nodes under
> 'simple-bus' in order of unit-address?
[S.H] Will sort the nodes in order of unit-address in next version.

Thanks,
Shaohui
