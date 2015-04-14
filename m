From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 6/6] arm64: dts: Add dts files for Hisilicon Hi6220 SoC
Date: Tue, 14 Apr 2015 16:44:34 +0200
Message-ID: <13386244.3fdoQHV2u9@wuerfel>
References: <1428916660-25910-1-git-send-email-bintian.wang@huawei.com> <1428916660-25910-7-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428916660-25910-7-git-send-email-bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, victor.lixin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, z.liuxinliang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, heyunlei@huawe
List-Id: devicetree@vger.kernel.org

On Monday 13 April 2015 17:17:40 Bintian Wang wrote:
> +
> +       soc {
> +               compatible = "simple-bus";
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;

Just one comment here: on a 64-bit system, the bus nodes must have
"dma-ranges" properties that describe the width of the bus. By default,
we assume that the bus is only 32-bit wide, which means that if you
install memory over the 4GB address boundary, devices will not be
able to do DMA there, even if the devices themselves are 64-bit DMA
capable.

> +               ao_ctrl: ao_ctrl {
> +                       compatible = "hisilicon,aoctrl", "syscon";
> +                       reg = <0x0 0xf7800000 0x0 0x2000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               sys_ctrl: sys_ctrl {
> +                       compatible = "hisilicon,sysctrl", "syscon";
> +                       reg = <0x0 0xf7030000 0x0 0x2000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               media_ctrl: media_ctrl {
> +                       compatible = "hisilicon,mediactrl", "syscon";
> +                       reg = <0x0 0xf4410000 0x0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               pm_ctrl: pm_ctrl {
> +                       compatible = "hisilicon,pmctrl", "syscon";
> +                       reg = <0x0 0xf7032000 0x0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               uart0: uart@f8015000 {  /* console */
> +                       compatible = "arm,pl011", "arm,primecell";
> +                       reg = <0x0 0xf8015000 0x0 0x1000>;
> +                       interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&ao_ctrl HI6220_UART0_PCLK>, <&ao_ctrl HI6220_UART0_PCLK>;
> +                       clock-names = "uartclk", "apb_pclk";

So far, none of hte devices you list are DMA masters, so there is no
effect, but please check what DMA masters you have in the system, and
whether they are capable of doing 64-bit DMA.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
