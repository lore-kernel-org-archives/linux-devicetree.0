From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: rtc: mediatek: add bindings for
 MediaTek SoC based RTC
Date: Wed, 18 Oct 2017 21:32:09 +0800
Message-ID: <1508333529.13340.26.camel@mtksdaap41>
References: <cover.1508231935.git.sean.wang@mediatek.com>
         <235e4bdaa605021facf4ab5c4e8a2ecc5293516d.1508231935.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <235e4bdaa605021facf4ab5c4e8a2ecc5293516d.1508231935.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2017-10-17 at 17:40 +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Add device-tree binding for MediaTek SoC based RTC
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/rtc/rtc-mediatek.txt        | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mediatek.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-mediatek.txt b/Documentation/devicetree/bindings/rtc/rtc-mediatek.txt
> new file mode 100644
> index 0000000..09fe8f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-mediatek.txt


How about change this filename to match driver filename change?

Joe.C


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
