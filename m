From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/7] [v2] arm64: dts: add QorIQ LS1046A SoC support
Date: Thu, 8 Sep 2016 14:18:18 +0100
Message-ID: <20160908131818.GF26570@leverpostej>
References: <1473069695-33092-1-git-send-email-shh.xie@gmail.com>
 <1473069695-33092-4-git-send-email-shh.xie@gmail.com>
 <20160908131326.GE26570@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160908131326.GE26570@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, Mingkai Hu <Mingkai.Hu-3arQi8VN3Tc@public.gmane.org>, Horia Geant? <horia.geanta-3arQi8VN3Tc@public.gmane.org>, Mihai Bantea <mihai.bantea-3arQi8VN3Tc@public.gmane.org>, Chenhui Zhao <chenhui.zhao-3arQi8VN3Tc@public.gmane.org>, Gong Qianyu <Qianyu.Gong-3arQi8VN3Tc@public.gmane.org>, Minghuan Lian <Minghuan.Lian-3arQi8VN3Tc@public.gmane.org>, Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>, Shaohui Xie <Shaohui.Xie-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 08, 2016 at 02:13:26PM +0100, Mark Rutland wrote:
> On Mon, Sep 05, 2016 at 06:01:31PM +0800, shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> > +	cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		cpu0: cpu@0 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a72";
> > +			reg = <0x0>;
> > +			clocks = <&clockgen 1 0>;
> > +			next-level-cache = <&l2>;
> > +			cpu-idle-states = <&CPU_PH20>;
> > +		};
> 
> [...]
> 
> > +	};
> > +
> > +	idle-states {
> > +		entry-method = "arm,psci";
> > +
> > +		CPU_PH20: cpu-ph20 {
> > +			compatible = "arm,idle-state";
> > +			idle-state-name = "PH20";
> > +			arm,psci-suspend-param = <0x00010000>;
> > +			entry-latency-us = <1000>;
> > +			exit-latency-us = <1000>;
> > +			min-residency-us = <3000>;
> > +		};
> > +	};
> 
> There's no PSCI node in this file, and none from am included file, so
> this doesn't look right.

Looking again, none of the cpu nodes has an enable-method property, and
subsequent patches don't seem to add that to any cpu node.

Has this DT actually been tested?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
