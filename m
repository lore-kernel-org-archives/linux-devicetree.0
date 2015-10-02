From: Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 5/6] Documentation: dt-bindings: pci: altera pcie
 device tree binding
Date: Fri, 2 Oct 2015 15:56:16 +0800
Message-ID: <CAFiDJ5-yMBw6Ff1++F5DTg6u_rAgoivGJeNj1tr9fwo-hdKDkg@mail.gmail.com>
References: <1442801587-3812-1-git-send-email-lftan@altera.com>
	<CAFiDJ59PuhRj3F288A_451pLiKnqPUKin9C2t5uuH2iNPnJfAg@mail.gmail.com>
	<CAL_JsqL9eoTRa2-eeNJgVoO=0LyuaaJ87E4_BS0KocRKBXGdGA@mail.gmail.com>
	<1803658.W77SUJGE4K@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1803658.W77SUJGE4K@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 29, 2015 at 3:38 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday 28 September 2015 12:31:36 Rob Herring wrote:
>> >> > +
>> >> > +Required properties:
>> >> > +- compatible :       should contain "altr,pcie-root-port-1.0"
>> >> > +- reg:               a list of physical base address and length for TXS and CRA.
>> >> > +- reg-names: must include the following entries:
>> >> > +             "Txs" or "txs": TX slave port region
>> >> > +             "Cra" or "cra": Control register access region
>> >>
>> >> Why both cases? Can we please just have one (or none is better IMO).
>> > The PCIe IP on different device families use different register names.
>> > And our device tree generator will auto generate the register names
>> > based on the hardware description name. Too bad we can't change the
>> > hardware description names now.
>>
>> Okay, your problem to maintain. Hopefully the driver just goes by index then.
>>
>> Strictly speaking, if you have undocumented bindings downstream that
>> is your problem and we don't have to accept them as-is upstream. I'm
>> not going to worry about that here.
>
> Are they always in the same order? If you don't mandate any names for the
> registers in the binding but just use them by index, we can keep that
> bit of ugliness out of the binding and the driver and still be compatible
> with all the devices.
Too bad the order might change in future devices. We will fix the
tool, so only have one reg-name case.

Regards
Ley Foon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
