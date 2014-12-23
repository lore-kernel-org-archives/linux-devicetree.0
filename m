From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH RFC v3 02/18] of: Add vendor prefix for Himax
 Technologies Inc.
Date: Tue, 23 Dec 2014 09:09:12 +0100 (CET)
Message-ID: <789433791.920346.1419322152848.JavaMail.open-xchange@oxbaltgw08.schlund.de>
References: <1419306399-9387-1-git-send-email-Ying.Liu@freescale.com> <1419306399-9387-3-git-send-email-Ying.Liu@freescale.com>
Reply-To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419306399-9387-3-git-send-email-Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liu Ying <Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, andyshrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Liu,

> Liu Ying <Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org> hat am 23. Dezember 2014 um 04:46
> geschrieben:
>
>
> Signed-off-by: Liu Ying <Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> v2->v3:
> * None.
>
> v1->v2:
> * None.
>
> Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
> b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 78efebb..3cee528 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -69,6 +69,7 @@ hannstar HannStar Display Corporation
> haoyu Haoyu Microelectronic Co. Ltd.
> hisilicon Hisilicon Limited.
> hit Hitachi Ltd.
> +himax Himax Technologies, Inc.

please fix the ordering. himax comes before hisilicon.

Thanks

Stefan

> honeywell Honeywell
> hp Hewlett Packard
> i2se I2SE GmbH
> --
> 2.1.0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
