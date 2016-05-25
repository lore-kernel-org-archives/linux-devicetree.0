From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: imx6q: add support for the Utilite Pro
Date: Wed, 25 May 2016 16:05:13 +0200
Message-ID: <0cf90ebe86e0461f82cb22b2a6b6ea83@rwthex-s1-b.rwth-ad.de>
References: <1463957258-4893-1-git-send-email-christopher.spinrath@rwth-aachen.de>
 <c4ab0387041f42ada68296141befe332@rwthex-s1-b.rwth-ad.de>
 <20abc2f6769b4369ba87ec27274a090e@rwthex-s2-a.rwth-ad.de>
 <644530ff6bb04b5898dc33604dc7a93a@rwthex-s1-b.rwth-ad.de>
 <9b905766c6cc4680be4b33f79a179d5a@rwthex-w1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9b905766c6cc4680be4b33f79a179d5a-cBaz+nnMw18umhiu9RXYRl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Spinrath, Christopher" <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On 05/24/2016 01:20 AM, Fabio Estevam wrote:
> Hi Christopher,
> 
> On Mon, May 23, 2016 at 8:08 PM, Christopher Spinrath
> <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org> wrote:
> 
>> I would like to but I'm not sure if I'm allowed to. As I stated in the
>> license header some nodes are copied (and cleaned up) from the vendor
>> kernel/devicetree. They are licensed GPL-v2 only. So I don't know, can I
>> add the X11 license?
> 
> Maybe you could contact the original author anc check?
> 
I have sent an email to the author and will wait about a week for a
reply before I send v2.

>>> Better to avoid 0x80000000. Replace it with the real iomux value
>>> instead so that you don't need to rely on the bootloader
>>> configuration.
>> hmm, I don't know how to determine this value. The device documentation
>> I have does not say anything about it and the vendor kernel uses
>> 0x80000000...
> 
> The default value of register IOMUXC_SW_PAD_CTL_PAD_ENET_TX_DATA1 is
> 0x1b0b0, so you can use this value.
>
> Another thing I forgot to comment: instead of putting this pin inside
> the hog group you could put it inside the gpio-keys node.
> 

OK, done. Can I always use the default value in this case? If yes, can
you point me to a proper documentation of these?

Thanks,
Christopher
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
