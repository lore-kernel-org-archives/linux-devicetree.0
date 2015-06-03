From: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] GPIO support for BRCMSTB
Date: Tue, 2 Jun 2015 21:13:19 -0700
Message-ID: <CADtm3G7mKJ6b9Koy0DeTAVUeJyhS9Lw+AzEvKf-xmFXTmAuG2w@mail.gmail.com>
References: <1430901477-10678-1-git-send-email-gregory.0xf0@gmail.com>
 <CACRpkda3EDa7YdzeT6FQ=cQw1RrDath7pQsCos-JeB2y4r18gw@mail.gmail.com>
 <CADtm3G45-u82Rp_0dHf2EfdMokf8E4FaQ84PHnocpvXxU+5_+g@mail.gmail.com>
 <CACRpkdaTYAr-7K5_QZh1CyeyA1224obqEB2Sz8UHZmrWcfv+ow@mail.gmail.com>
 <CADtm3G4ao=3sHx2F1+V9rwS=jWf6ZdEQi4d24HxQ6MEc+CQ8CQ@mail.gmail.com> <CACRpkdY_-zq-1srBC213MK_RoVvPsfTpRTQyx-4yRvCOV5JdxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdY_-zq-1srBC213MK_RoVvPsfTpRTQyx-4yRvCOV5JdxQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 2, 2015 at 2:05 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Wed, May 27, 2015 at 5:26 AM, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> I've now actually attempted to use the gpiolib irqchip code.  This
>> driver can't directly use gpiochip_irqchip_add() because of the
>> multiple gpiochip : one irqchip map.  At first, I thought it might be
>> possible to simply add a new argument (or break things into a helper
>> function) to allow setting the associated IRQ domain, but then I can't
>> use the generic map and unmap functions which expect the irq_domain
>> host_data member to be struct gpiochip *, which makes no sense in this
>> case.  That puts me right back to implementing a special version of
>> the map and unmap function.
>
> I see.
>

I think I was wrong, it isn't actually necessary to have a single
irq_chip as long as all of the IRQs use the same handler.  I have a
preliminary implementation doing that instead that seems to work fine.
Once I've had a chance to verify that it works in all cases, will post
that as v3.

Cheers,
Gregory
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
