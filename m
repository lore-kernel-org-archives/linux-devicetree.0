From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rockchip: disable tx ipgap linecheck for rk3399 dwc3
Date: Fri, 18 Aug 2017 11:18:24 +0200
Message-ID: <4718044.sxV3Y2WdLf@phil>
References: <1502958272-1384-1-git-send-email-william.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502958272-1384-1-git-send-email-william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 17. August 2017, 16:24:32 CEST schrieb William Wu:
> RK3399 USB DWC3 controller has a issue that FS/LS devices not
> recognized if inserted through USB 3.0 HUB. It's because that
> the inter-packet delay between the SSPLIT token to SETUP token
> is about 566ns, more then the USB spec requirement.
> 
> This patch adds a quirk "snps,dis-tx-ipgap-linecheck-quirk" to
> disable the u2mac linestate check to decrease the SSPLIT token
> to SETUP token inter-packet delay from 566ns to 466ns.
> 
> Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

applied for 4.14


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
