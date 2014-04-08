From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH] of: add vendor prefix for I2SE GmbH
Date: Tue, 08 Apr 2014 09:35:16 +0200
Message-ID: <5343A6B4.9030309@i2se.com>
References: <1396514029-5769-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396514029-5769-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Am 03.04.2014 10:33, schrieb Stefan Wahren:
> Add i2se to the list of DT vendor prefixes.
>
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index e9d19e2..f27f6c9 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -45,6 +45,7 @@ haoyu	Haoyu Microelectronic Co. Ltd.
>  hisilicon	Hisilicon Limited.
>  honeywell	Honeywell
>  hp	Hewlett Packard
> +i2se	I2SE GmbH
>  ibm	International Business Machines (IBM)
>  idt	Integrated Device Technologies, Inc.
>  img	Imagination Technologies Ltd.

i forgot to mention that my patch is an addition to this patch:

https://git.linaro.org/people/shawn.guo/linux-2.6.git/commit/df0355f2b06caf8e7948534c278114bafc2f72e0

The prefix i2se is used in imx28-duckbill.dts.

Kind regards
Stefan Wahren
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
