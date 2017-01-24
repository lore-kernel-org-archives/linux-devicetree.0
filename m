From: Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
Subject: Re: [PATCH v2 0/9] ARM: dts: support I2SE Duckbill devices
Date: Tue, 24 Jan 2017 06:44:55 +0000
Message-ID: <20170124064455.Horde.BVd2TVghMJl52nkc24d9p40@www.mhei.heimpold.org>
References: <1485123764-14754-1-git-send-email-mhei@heimpold.de>
 <CAOMZO5CbPPR7GSjUvPQaHGCTTiFw8PrQfiwa_j2x9+WyKuseZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5CbPPR7GSjUvPQaHGCTTiFw8PrQfiwa_j2x9+WyKuseZg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

Zitat von Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:

> Hi Michael,
>
> On Sun, Jan 22, 2017 at 8:22 PM, Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org> wrote:
>
>> - Duckbill 485/Duckbill 2 485: as the name implies, these
>>   devices are intended to be used as Ethernet - RS485 converters
>
> Just curious: do you use mxs-auart to interface to a rs485
> transceiver? If so, would you have mxs-auart patches that add rs485?

Due to the lack of hardware support in mxs-auart for rs485, we decided
to use a more expensive hardware transceiver with auto direction feature.
So the rs485 is (mostly) transparent for upper layers.

Regards,
Michael

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
