From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 4/6] dt-bindings: change hi6220-reset.txt according to reset-hi6220.c
Date: Tue, 22 Nov 2016 09:48:32 +0100
Message-ID: <2314383.qiZ3Cq7QsP@wuerfel>
References: <1479800961-6249-1-git-send-email-zhangfei.gao@linaro.org> <1479800961-6249-5-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479800961-6249-5-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Xia Qing <saberlily.xia-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday, November 22, 2016 3:49:19 PM CET Zhangfei Gao wrote:
>  Required properties:
>  - compatible: should be one of the following:
> -  - "hisilicon,hi6220-sysctrl", "syscon" : For peripheral reset controller.
> -  - "hisilicon,hi6220-mediactrl", "syscon" : For media reset controller.
> -- reg: should be register base and length as documented in the
> -  datasheet
> +  - "hisilicon,hi6220-reset-sysctrl" : For peripheral reset controller.
> +  - "hisilicon,hi6220-reset-mediactrl" : For media reset controller.
> +- hisi,rst-syscon: phandle of the reset's syscon.
>  - #reset-cells: 1, see below
> 

Please keep the old strings around for compatibility.

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
