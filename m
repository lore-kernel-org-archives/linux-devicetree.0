From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCHv2 1/3] Documentation: ad5064: Added devicetree bindings
 documentation
Date: Tue, 13 Oct 2015 13:11:17 +0200
Message-ID: <561CE6D5.2000400@metafoo.de>
References: <1444650634-12025-1-git-send-email-paul.cercueil@analog.com> <20151012151857.GC7452@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151012151857.GC7452@leverpostej>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Hennerich <Michael.Hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

>> +
>> +Optional properties:
>> +	- vref-supply: phandle to the external reference voltage supply.
>> +	  This should only be set if there is an external reference voltage
>> +	  connected to the vref or vref[A-D] pins.
> 
> I don't understand. Surely the latter case means you're describing the
> same supply twice (as it should already be in vref*-supply)?
> 
> What vref pins does the HW actually have?

Some off the devices supported by the binding have a shared reference for
all DAC outputs, while others have a separate reference for each output. In
addition to that some of them have an internal reference that can used, in
which case the external reference is optional, otherwise the external
reference is required. The bindings documentation should clarify on which
applies to which device.
