From: Shubhrajyoti Datta <shubhrajyoti.datta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] Axi-usb: Add support for 64-bit addressing.
Date: Fri, 3 Jun 2016 20:46:08 +0530
Message-ID: <CAKfKVtHfGXvXeOC-vsVaRNtttO+nyG40sAxqaswXEbsEOUotbA@mail.gmail.com>
References: <1464626798-1334-1-git-send-email-navam@xilinx.com>
 <CAKfKVtF1hOn9QwiqtjqqPYtUz5PscTBs4kBC1zRH6FY-4vVoUA@mail.gmail.com> <C89496FEAE474D468F30D558A9468D9F26CEF0EF@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C89496FEAE474D468F30D558A9468D9F26CEF0EF-4lKfpRxZ5enZMOc0yg5rMog+Gb3gawCHQz34XiSyOiE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nava kishore Manne <nava.manne-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Radhey Shyam Pandey <radheys-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 31, 2016 at 10:45 AM, Nava kishore Manne
<nava.manne-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Shubhrajyoti,
>
>
>         Thanks for the review...
>
>> >  /**
>> > + * xudc_write64 - write 64bit value to device registers
>> > + * @ep: pointer to the usb device endpoint structure.
>> > + * @offset: register offset
>> > + * @val: data to be written
>> > + **/
>> > +static void xudc_write64(struct xusb_ep *ep, u32 offset, u64 val) {
>> > +       struct xusb_udc *udc = ep->udc;
>> > +
>> > +       udc->write_fn(udc->addr, offset, lower_32_bits(val));
>> > +       udc->write_fn(udc->addr, offset+0x04, upper_32_bits(val));
>>
>> can we move this to a single 64 bit write?
>
> Initially I sent the patches with writeq() ,lo_hi_writeq()  later we decided to replace with write_fun().
> The reason for this is lo_hi_writeq() always assumes a little-endian register, so it's broken if anyone builds this device with big-endian registers.
> So replaced the 64bit calls with write_fun() as suggested by Arnd Bergmann. Hope it clears your query.
> Please refer to the below thread
>
>         http://lkml.iu.edu/hypermail/linux/kernel/1604.2/02046.html

missed that discurssion.

thanks
>
>
> Regards,
> Navakishore.
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
