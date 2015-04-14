From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 3/6] clk: hi6220: Document devicetree bindings for hi6220 clock
Date: Tue, 14 Apr 2015 12:19:56 +0200
Message-ID: <2456827.cDpE8M58pn@wuerfel>
References: <1428916660-25910-1-git-send-email-bintian.wang@huawei.com> <7304398.GVjUsTVoce@wuerfel> <552C8AFE.9040907@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <552C8AFE.9040907-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Bintian <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, btw-aAikPa0K0u50tdys+9eLAQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, victor.lixin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, heyunlei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, z.liuxinliang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, xuejianc
List-Id: devicetree@vger.kernel.org

On Tuesday 14 April 2015 11:35:26 Bintian wrote:
> Hello Arnd,
> 
> On 2015/4/13 23:32, Arnd Bergmann wrote:
> > On Monday 13 April 2015 17:17:37 Bintian Wang wrote:
> >> +- compatible: the compatible should be one of the following strings to
> >> +       indicate the clock controller functionality.
> >> +
> >> +       - "hisilicon,aoctrl"
> >> +       - "hisilicon,sysctrl"
> >> +       - "hisilicon,mediactrl"
> >> +       - "hisilicon,pmctrl"
> >> +
> >>
> >
> > These ones already have bindings, you can't reuse the strings.
> > Please work with someone in hisilicon to set up a registry of
> > device names so you can avoid conflicts in the future.
> All the clock registers are under above four system controllers, 
> discussed with Mark and Haojian two months ago, I think using above
> same four binding strings is enough for clk module.
> On second thoughts, there really some problems for future hisilicon
> code upstream, how about change back to the first version of this
> patch set, just like following:
> +		sys_ctrl: sys_ctrl {
> +			compatible = "hisilicon,sysctrl", "syscon";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			reg = <0x0 0xf7030000 0x0 0x2000>;
> +			ranges = <0 0x0 0xf7030000 0x2000>;
> +
> +			clock_sys: clock1@0 {
> +				compatible = "hisilicon,hi6220-clock-sys";
> +				reg = <0 0x1000>;
> +				#clock-cells = <1>;
> +			};
> +		};

Sub-nodes are fine, but you also can't have a device node that
is just 'compatible = "hisilicon,sysctrl", "syscon";' when
hisilicon,sysctrl can refer to multiple mutually incompatible
controllers.

The minimum fix would be to mandate the string to be
compatible = "hisilicon,hi6220-sysctrl", "hisilicon,sysctrl", "syscon";
for this model, and use respective compatible strings for the other
chips.

For the documentation, I think it would make sense to move that
description to "hisilicon,sysctrl" and list all the variants of that
component and the respective compatible strings there, rather than
have one document per chip and list multiple components in it.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
