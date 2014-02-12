From: delicious quinoa <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] export of_irq_count
Date: Wed, 12 Feb 2014 12:43:34 -0600
Message-ID: <CANk1AXTbnBXzxf_WiQAbWKxNhm2wKVrj0O=nDcW7j27i4T3YBw@mail.gmail.com>
References: <1392226444-30507-1-git-send-email-delicious.quinoa@gmail.com>
	<CAL_JsqLT=w5wDnFBcQdeF5KgpJK76xJhH=ZYJy24CEeV2uQ2aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLT=w5wDnFBcQdeF5KgpJK76xJhH=ZYJy24CEeV2uQ2aQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Yves Vandervennet <rocket.yvanderv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 12, 2014 at 12:32 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Feb 12, 2014 at 11:34 AM, delicious quinoa
> <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>>
>> export of_irq_count so it can be used in drivers that are built
>> as modules.
>
> What drivers? Drivers generally should be using resources rather than
> this function directly.

It's for the DesignWare GPIO driver I've been upstreaming.  The
DesignWare IP can be configured to be one irq for all the gpios or one
irq per gpio.  I want to support both cases.  So I need to know how
many irqs are specified in the device tree.

Alan
aka
delicious quinoa
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
