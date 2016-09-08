From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 5/7] [v2] arm64: dts: add LS1046A-RDB board support
Date: Thu, 8 Sep 2016 21:12:18 +0800
Message-ID: <20160908131218.GB16911@tiger>
References: <1473069695-33092-1-git-send-email-shh.xie@gmail.com>
 <1473069695-33092-6-git-send-email-shh.xie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473069695-33092-6-git-send-email-shh.xie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shh.xie@gmail.com
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, arnd@arndb.de, Mingkai Hu <Mingkai.Hu@nxp.com>, Shaohui Xie <Shaohui.Xie@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 05, 2016 at 06:01:33PM +0800, shh.xie@gmail.com wrote:
> +&ifc {
> +	status = "okay";

For sake of consistency, please have 'status' at the end of property
list.

Shawn

> +	#address-cells = <2>;
> +	#size-cells = <1>;
> +	/* NAND Flashe and CPLD on board */
> +	ranges = <0x0 0x0 0x0 0x7e800000 0x00010000
> +		  0x2 0x0 0x0 0x7fb00000 0x00000100>;
> +
> +	nand@0,0 {
> +		compatible = "fsl,ifc-nand";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0x0 0x0 0x10000>;
> +	};
> +
> +	cpld: board-control@2,0 {
> +		compatible = "fsl,ls1046ardb-cpld";
> +		reg = <0x2 0x0 0x0000100>;
> +	};
> +};
