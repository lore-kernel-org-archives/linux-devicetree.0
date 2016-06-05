From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH v2 2/4] ARM: dts: imx6q: extend support for the cm-fx6
Date: Sun, 5 Jun 2016 21:53:54 +0200
Message-ID: <2ade5c2a94f146269ece29d5761cb528@rwthex-s1-b.rwth-ad.de>
References: <20160605182657.1706-1-christopher.spinrath@rwth-aachen.de>
 <90e7dea7dee342cf82ccedcd463a60fc@rwthex-s1-b.rwth-ad.de>
 <db27a6f6905b4683bb256f884c25b088@rwthex-s2-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <db27a6f6905b4683bb256f884c25b088-gtPewvpZjL+krInni0qv/15UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, "Spinrath, Christopher" <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

Thanks for your review!

On 06/05/2016 09:14 PM, Fabio Estevam wrote:
> On Sun, Jun 5, 2016 at 3:26 PM,  <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org> wrote:
> 
>> +&pcie {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_pcie>;
>> +       reset-gpio = <&gpio1 26 GPIO_ACTIVE_HIGH>;
> 
> I suppose this should be active low, right?
> 
hmm, the vendor devicetree uses active high but does not set
reset-gpio-active-high. In a quick test it turned out that setting this
property keeps the pci bus in reset.
In fact, the linux driver ignores the polarity and falls back to active
low. This explains why specifying active high "worked" here...

So you are right and it should be active low. I'll fix that.

> With this fixed:
> 
> Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> 

Thanks,
Christopher
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
