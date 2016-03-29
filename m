From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] arm64: dts: Move NS2 clock DT nodes to separate DT file
Date: Tue, 29 Mar 2016 13:27:43 -0700
Message-ID: <2FCC19A3-B758-4150-B9A1-FCAD968E7165@gmail.com>
References: <1459236454-26285-1-git-send-email-anup.patel@broadcom.com> <1459236454-26285-4-git-send-email-anup.patel@broadcom.com> <CAGt4E5vadj_Z8tqapA02z6hHkztM5YgLU4Sv-EYeR-ohk2Jkgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGt4E5vadj_Z8tqapA02z6hHkztM5YgLU4Sv-EYeR-ohk2Jkgg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Mayer <markus.mayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On March 29, 2016 11:47:10 AM PDT, Markus Mayer <markus.mayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>> diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi
>b/arch/arm64/boot/dts/broadcom/ns2.dtsi
>> index 940ed52..0a92a68 100644
>> --- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
>> +++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
>> @@ -1,7 +1,7 @@
>>  /*
>>   *  BSD LICENSE
>>   *
>> - *  Copyright(c) 2015 Broadcom Corporation.  All rights reserved.
>> + *  Copyright (c) 2015 Broadcom.  All rights reserved.
>
>I am thinking the 2015 copyright notice should remain as is and a new
>2016 notice should be added underneath.
>
>Copyright (c) 2016 Broadcom.  All rights reserved.

IANAL, but the directions given by our management on how to deal with these were clear, and they mentioned the use of Broadcom as holder name here irrespective of the time frame.

-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
