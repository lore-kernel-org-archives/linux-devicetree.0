From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 3/7] [v2] arm64: dts: add QorIQ LS1046A SoC support
Date: Fri, 9 Sep 2016 10:10:52 +0100
Message-ID: <20160909091052.GA10562@leverpostej>
References: <1473069695-33092-1-git-send-email-shh.xie@gmail.com>
 <1473069695-33092-4-git-send-email-shh.xie@gmail.com>
 <20160908131326.GE26570@leverpostej>
 <20160908131818.GF26570@leverpostej>
 <DB5PR0401MB21831908B0438CEA29921A71E8FA0@DB5PR0401MB2183.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB5PR0401MB21831908B0438CEA29921A71E8FA0@DB5PR0401MB2183.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "S.H. Xie" <shaohui.xie@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, Vincent Hu <mingkai.hu@nxp.com>, Horia Geanta Neag <horia.geanta@nxp.com>, Mihai Emilian Bantea <mihai.bantea@nxp.com>, "C.H. Zhao" <chenhui.zhao@nxp.com>, "Q.Y. Gong" <qianyu.gong@nxp.com>, "M.H. Lian" <minghuan.lian@nxp.com>, "Z.Q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 09, 2016 at 06:55:30AM +0000, S.H. Xie wrote:
> > On Thu, Sep 08, 2016 at 02:13:26PM +0100, Mark Rutland wrote:
> > > On Mon, Sep 05, 2016 at 06:01:31PM +0800, shh.xie@gmail.com wrote:
> > > > +	cpus {
> > > > +		#address-cells = <1>;
> > > > +		#size-cells = <0>;
> > > > +
> > > > +		cpu0: cpu@0 {
> > > > +			device_type = "cpu";
> > > > +			compatible = "arm,cortex-a72";
> > > > +			reg = <0x0>;
> > > > +			clocks = <&clockgen 1 0>;
> > > > +			next-level-cache = <&l2>;
> > > > +			cpu-idle-states = <&CPU_PH20>;
> > > > +		};
> > >
> > > [...]
> > >
> > > > +	};
> > > > +
> > > > +	idle-states {
> > > > +		entry-method = "arm,psci";
> > > > +
> > > > +		CPU_PH20: cpu-ph20 {
> > > > +			compatible = "arm,idle-state";
> > > > +			idle-state-name = "PH20";
> > > > +			arm,psci-suspend-param = <0x00010000>;
> > > > +			entry-latency-us = <1000>;
> > > > +			exit-latency-us = <1000>;
> > > > +			min-residency-us = <3000>;
> > > > +		};
> > > > +	};
> > >
> > > There's no PSCI node in this file, and none from am included file, so
> > > this doesn't look right.
> > 
> > Looking again, none of the cpu nodes has an enable-method property, and
> > subsequent patches don't seem to add that to any cpu node.
> > 
> > Has this DT actually been tested?
> [S.H] The PSCI node and the enable-method property are added by U-boot. 
> U-boot can determine if using PSCI. If U-boot enables PSCI, it will add these 
> missed parts in the dts. If not, it will not add these missed parts, 
> so kernel will not use PSCI.
> 
> In other words, the dts does not enable PSCI by default. 
> It's U-boot which adds the missed part if it determines to use PSCI.

Ok. Could you please place a comment in the dts to that effect?

Thanks,
Mark.
