From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 3/7] [v2] arm64: dts: add QorIQ LS1046A SoC support
Date: Thu, 8 Sep 2016 21:05:49 +0800
Message-ID: <20160908130549.GA16911@tiger>
References: <1473069695-33092-1-git-send-email-shh.xie@gmail.com>
 <1473069695-33092-4-git-send-email-shh.xie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473069695-33092-4-git-send-email-shh.xie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shh.xie@gmail.com
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, Mihai Bantea <mihai.bantea@nxp.com>, Chenhui Zhao <chenhui.zhao@nxp.com>, arnd@arndb.de, Shaohui Xie <Shaohui.Xie@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Minghuan Lian <Minghuan.Lian@nxp.com>, Mingkai Hu <Mingkai.Hu@nxp.com>, Horia Geant? <horia.geanta@nxp.com>, Gong Qianyu <Qianyu.Gong@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 05, 2016 at 06:01:31PM +0800, shh.xie@gmail.com wrote:
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		clockgen: clocking@1ee1000 {
> +			compatible = "fsl,ls1046a-clockgen";
> +			reg = <0x0 0x1ee1000 0x0 0x1000>;
> +			#clock-cells = <2>;
> +			clocks = <&sysclk>;
> +		};
> +
> +		scfg: scfg@1570000 {

Instead of having device node in arbitrary place, can we sort all the
nodes under 'simple-bus' in order of unit-address?

Shawn

> +			compatible = "fsl,ls1046a-scfg", "syscon";
> +			reg = <0x0 0x1570000 0x0 0x10000>;
> +			big-endian;
> +		};
