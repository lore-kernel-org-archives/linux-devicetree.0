From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: mt8173: Fix auxadc node
Date: Mon, 31 Oct 2016 01:15:53 +0100
Message-ID: <c283e582-68d2-fc9d-956f-bc99d78a5736@gmail.com>
References: <20161026141500.27105-1-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161026141500.27105-1-matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, dawei.chien-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 10/26/2016 04:15 PM, Matthias Brugger wrote:
> The devicetree node for mt8173-auxadc lacks the clock and
> io-channel-cells property. This leads to a non-working driver.
>
> 	mt6577-auxadc 11001000.auxadc: failed to get auxadc clock
> 	mt6577-auxadc: probe of 11001000.auxadc failed with error -2
>
> Fix these fields to get the device up and running.
>
> Fixes: 748c7d4de46a ("ARM64: dts: mt8173: Add thermal/auxadc device
> nodes")
> Signed-off-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---

Applied.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
