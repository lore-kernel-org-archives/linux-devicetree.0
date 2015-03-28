From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/3] Documentation: rename of_selftest.txt to
 of_unittest.txt
Date: Fri, 27 Mar 2015 21:11:04 -0700
Message-ID: <20150328041104.36084C40BEA@trevor.secretlab.ca>
References: <1426562400-102415-1-git-send-email-long.wanglong@huawei.com>
	<1426562400-102415-3-git-send-email-long.wanglong@huawei.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426562400-102415-3-git-send-email-long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 17 Mar 2015 03:19:59 +0000
, Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
 wrote:
> Since the test of the devicetree's OF api use unittest as
> its name. so we should rename of_selftest.txt to of_unittest.txt.
> 
> Signed-off-by: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

Applied, thanks.

g.

> ---
>  Documentation/devicetree/{of_selftest.txt => of_unittest.txt} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/{of_selftest.txt => of_unittest.txt} (100%)
> 
> diff --git a/Documentation/devicetree/of_selftest.txt b/Documentation/devicetree/of_unittest.txt
> similarity index 100%
> rename from Documentation/devicetree/of_selftest.txt
> rename to Documentation/devicetree/of_unittest.txt
> -- 
> 1.8.3.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
