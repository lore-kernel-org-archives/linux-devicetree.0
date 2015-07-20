From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH V4 RFC 0/3] nvmem: add ocotp support for i.MX23 and i.MX28
Date: Mon, 20 Jul 2015 08:37:01 +0200
Message-ID: <55AC970D.6090707@i2se.com>
References: <1437343499-16422-1-git-send-email-stefan.wahren@i2se.com>
 <201507200007.30100.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201507200007.30100.marex-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marek,

Am 20.07.2015 um 00:07 schrieb Marek Vasut:
> On Monday, July 20, 2015 at 12:04:56 AM, Stefan Wahren wrote:
>> This patch series brings read-only support for the On-Chip OTP cells
>> in the i.MX23 and i.MX28 processor.
>>
>> It has been a long time since V3 of this series [1]. The last version has
>> been rejected because there was no standard interface to the OTP data. So
>> this version bases on V7 of the new NVMEM framework [2] which required a
>> nearly complete rewrite of the driver.
>>
>> [1] -
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-October/295228.
>> html [2] -
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-July/355652.htm
>> l
> Are you sure you even want this support in kernel ?

definitely. But only read-only support make sense. Please believe me, i
didn't wait since last year for the NVMEM framework just for fun.

> Isn't it enough to have
> this in some manufacturing-time mutated bootloader to program the OTP once
> and never touch it again ?

No, our products uses a previous version of this patch series to set the
MAC address of a network interface from OTP data. I also get some
feedback from other users that they are happy about this driver.

Regards
Stefan

>
> Best regards,
> Marek Vasut


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
