From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2] arm64: dts: rockchip: add rk805 node for rk3328-evb
Date: Mon, 21 Aug 2017 12:05:35 +0200
Message-ID: <1567365.GLZbXPjLJs@phil>
References: <1502244224-11999-1-git-send-email-chenjh@rock-chips.com> <1502244224-11999-2-git-send-email-chenjh@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502244224-11999-2-git-send-email-chenjh-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Chen <chenjh-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: wdc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 9. August 2017, 10:03:44 CEST schrieb Joseph Chen:
> RK805 consists of 4 DCDCs, 3 LDOs. It's different from RK808
> and RK818 that there are 2 output only GPIOs, we should add
> properties "gpio-controller" and "gpio-cells = <2>".
> 
> Signed-off-by: Joseph Chen <chenjh-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

adapted to the meanwhile changed rk3328-evb.dts and then
applied for 4.14


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
