From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH v2 1/4] mtd: brcmnand: Fix pointer type-cast in
 brcmnand_write()
Date: Sat, 17 Oct 2015 02:52:26 +0000
Message-ID: <39063E8F96E11742B35A201CC5D095B7AEE5AD@SJEXCHMB10.corp.ad.broadcom.com>
References: <1444986537-28387-1-git-send-email-anup.patel@broadcom.com>
 <1444986537-28387-2-git-send-email-anup.patel@broadcom.com>
 <56211976.1030401@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56211976.1030401-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pramod Kumar <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Vikram Prakash <vikramp-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sandeep Tripathy <tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Ray Jui [mailto:rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org]
> Sent: 16 October 2015 21:06
> To: Anup Patel; David Woodhouse; Brian Norris; linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Rob Herring; Pawel Moll; Mark Rutland; Ian Campbell; Kumar Gala; Catalin
> Marinas; Will Deacon; Scott Branden; Florian Fainelli; Pramod Kumar; Vikram
> Prakash; Sandeep Tripathy; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; bcm-kernel-
> feedback-list
> Subject: Re: [PATCH v2 1/4] mtd: brcmnand: Fix pointer type-cast in
> brcmnand_write()
> 
> Correct me if I remember it wrong, but I thought this patch has already been
> merged by Brian?

Yes, patch1 and patch2 were merged by Brian. I realized this after I had
send-out v2. Anyways we can ignore patch1 and patch2 from this patchset
because they are same as v1.

Regards,
Anup
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
