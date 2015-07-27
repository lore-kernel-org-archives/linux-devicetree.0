From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4][v4] ARM: imx: imx7d-pinfunc: add gpio pad iomuxc settings
Date: Mon, 27 Jul 2015 13:55:06 +0200
Message-ID: <CACRpkda9JjZZ0=qEajeR7dxPUy1bcXXB+VDy=QnnG_ifC_aV0Q@mail.gmail.com>
References: <1437078887-2524-1-git-send-email-aalonso@freescale.com>
	<20150717035115.GE12927@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150717035115.GE12927@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Adrian Alonso <aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?B?5p2O5pm6?= <lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, nitin.garg-KZfg59tc24xl57MIdRCFDg@public.gmane.org, "Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, yibin.gong-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 17, 2015 at 5:51 AM, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Jul 16, 2015 at 03:34:44PM -0500, Adrian Alonso wrote:
>> * Add iMX7D SoC imx7d-pinfunc gpio pad settings
>>   <mux_reg conf_reg input_reg mux_mode input_val>
>> * iMX7D GPIO1_IO7 to GPIO1_IO0 encode the pad group id in the most
>>   significant bits of input_val to avoid group id overlap bweeten
>>   iomuxc and iomuxc-lpsr.
>>
>> Signed-off-by: Adrian Alonso <aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>
> Unless you can convince me that this approach which hacks select input
> value is better than two instances one, it's an NACK for me on the whole
> patch series.

I'm dropping this patch series until this is resolved.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
