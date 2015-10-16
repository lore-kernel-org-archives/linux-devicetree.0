From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 0/2] Common SerDes driver for TI's Keystone Platforms
Date: Thu, 15 Oct 2015 20:00:41 -0500
Message-ID: <CAL_JsqJTjCT8D-3OryFPEF8nnaPtrai7Mvf-gJRkh60aDixx-g@mail.gmail.com>
References: <1444919145-30845-1-git-send-email-w-kwok2@ti.com> <20151015165105.GE32532@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151015165105.GE32532-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: WingMan Kwok <w-kwok2-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 15, 2015 at 11:51 AM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Thu, Oct 15, 2015 at 10:25:43AM -0400, WingMan Kwok wrote:
>> On TI's Keystone platforms, several peripherals such as the
>> gbe ethernet switch, 10gbe ethether switch and PCIe controller
>> require the use of a SerDes for converting SoC parallel data into
>> serialized data that can be output over a high-speed electrical
>> interface, and also converting high-speed serial input data
>> into parallel data that can be processed by the SoC.  The
>> SerDeses used by those peripherals, though they may be different,
>> are largely similar in functionality and setup.
>
> Given that serdes is not specific to TI, should this be specific to
> TI, or should there be an effort to come up with something which
> everyone who has serdes links can make use of?
>
> Serdes comes in multiple different forms: PCIe, 1G SGMII ethernet,
> 1000base-X ethernet, 10g ethernet, SATA... I'd hate to see a
> plethora of SoC specific stuff for this.

The licensed IP I've seen doesn't provide a standard register
interface, but just signals to the IP block. Same with PLL IP. So
we'll probably get to see vendors continue to differentiate on PHY
register design. :)

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
