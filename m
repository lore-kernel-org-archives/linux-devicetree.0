From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] usb: add pxa1928 ehci support
Date: Thu, 14 May 2015 08:25:06 -0500
Message-ID: <CAL_JsqJdQZUO3CFcHNbqAYdfKgCsrnsE3W5NGoow_5ka_4_PUQ@mail.gmail.com>
References: <1431557340-5421-1-git-send-email-robh@kernel.org>
 <1431557340-5421-6-git-send-email-robh@kernel.org> <1431591878.2650.26.camel@x220>
 <6133267.5eXXf8lNuG@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6133267.5eXXf8lNuG@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 14, 2015 at 5:42 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 14 May 2015 10:24:38 Paul Bolle wrote:
>>
>> > --- a/drivers/usb/host/Makefile
>> > +++ b/drivers/usb/host/Makefile
>>
>> > +obj-$(CONFIG_USB_EHCI_MV_OF) += ehci-mv-of.o
>>
>> USB_EHCI_MV_OF is a bool symbol so ehci-mv-of.o will never be part of a
>> module, correct?
>>
>>
>
> I think that's a bug.

Indeed.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
