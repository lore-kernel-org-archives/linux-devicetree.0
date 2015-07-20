From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH V4 RFC 2/3] nvmem: add driver for ocotp in i.MX23 and
 i.MX28
Date: Mon, 20 Jul 2015 08:45:21 +0200
Message-ID: <55AC9901.1040402@i2se.com>
References: <1437343499-16422-1-git-send-email-stefan.wahren@i2se.com>
 <1437343499-16422-3-git-send-email-stefan.wahren@i2se.com>
 <201507200012.13608.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201507200012.13608.marex-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marek,

Am 20.07.2015 um 00:12 schrieb Marek Vasut:
> On Monday, July 20, 2015 at 12:04:58 AM, Stefan Wahren wrote:
>> This patch brings read-only support for the On-Chip OTP cells
>> in the i.MX23 and i.MX28 processor. The driver implements the
>> new NVMEM provider API.
>>
>> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> How come this driver isn't doing any manipulation with the VDDIO
> voltage -- or did I miss that? I seem to remember that the VDDIO
> had to be lowered to 2.8V before the fuses could be programmed
> and restored to 3.3V afterward. See for example recent mainline
> u-boot, drivers/misc/mxs_ocotp.c .

Why should the driver implement VDDIO manipulation when there is only
read-only support for the OTP bits? There is no ambition to implement
write support. Maybe i should clarify that in the comments.

Btw i'm on your side that because programming the OTP from userspace is
to dangerous.

Best regards
Stefan

>
> Best regards,
> Marek Vasut
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
