From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH v2 4/4] ARM: dts: imx6q-cm-fx6: Relicense under GPLv2/X11
Date: Mon, 6 Jun 2016 19:24:56 +0200
Message-ID: <a07d079d2dcd4a55a09b66486324d399@rwthex-s1-b.rwth-ad.de>
References: <20160605182657.1706-1-christopher.spinrath@rwth-aachen.de>
 <c2d37f17a8b049169909c7a9391fa9a3@rwthex-s1-b.rwth-ad.de>
 <c2c21863a715471880d2369d111bc28e@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c2c21863a715471880d2369d111bc28e-gtPewvpZjL8umhiu9RXYRl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "Spinrath, Christopher" <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Igor,

On 06/06/2016 09:53 AM, Igor Grinberg wrote:
> Hi Christopher,
> 
> On 06/05/2016 09:26 PM, christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org wrote:
>> From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
>>
>> GPLv2-only devicetrees make reuse difficult for software components
>> licensed under a different license. In particular, the Utilite Pro
>> devicetree file (which includes on imx6q-cm-fx5.dts) is already dual
>                                                ^^^
> That's a downgrade ;-)
> With the above fixed, please add my ack below.
> 

uups, I will fix it.

Thanks,
Christopher

>> licensed under GPLv2/X11.
>>
>> Hence, relicense imx6q-cm-fx6.dts under GPLv2/X11 dual license.
> 
> Off topic of this patch, I think SPDX works much better than having
> this huge license "hat" in each file.
> 
>>
>> Signed-off-by: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
>> Cc: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> 
> Acked-by: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> 

[...]
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
