From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: utilite-pro: add mmc card slot support
Date: Sun, 12 Jun 2016 16:10:06 +0200
Message-ID: <acc71f8948b54994b692c805e8da5b46@rwthex-s1-b.rwth-ad.de>
References: <20160612132046.1363-1-christopher.spinrath@rwth-aachen.de>
 <30f2c9e9b50d47d893218811f3223b3f@rwthex-s1-b.rwth-ad.de>
 <b6f3c46c5ae54abdab846effbed6c8fe@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b6f3c46c5ae54abdab846effbed6c8fe-gtPewvpZjL8umhiu9RXYRl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "Spinrath, Christopher" <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On 06/12/2016 03:45 PM, Fabio Estevam wrote:
> On Sun, Jun 12, 2016 at 10:20 AM,  <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org> wrote:
> 
>> +&usdhc3 {
>> +       pinctrl-names = "default", "state_100mhz", "state_200mhz";
>> +       pinctrl-0 = <&pinctrl_usdhc3>;
>> +       pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
>> +       pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
>> +       no-1-8-v;
>> +       broken-cd;
> 
> A comment in the commit log as to why you use the 'broken-cd' property
> would be helpful.
> 
There are no card detection pins (until board revision 1.3; which seems
to be fairly new) and adding "broken-cd" was the only way to get card
detection working on my board. I will add this information to the commit
log.

Thanks,
Christopher

> Thanks
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
