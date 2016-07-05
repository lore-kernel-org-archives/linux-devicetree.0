From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] iio: adc: max1363: Add device tree binding
 documentation
Date: Tue, 5 Jul 2016 21:42:32 +0100
Message-ID: <f77d8d66-32e7-8064-57d2-cddbf6884f6b@kernel.org>
References: <1467272586-28761-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1467272586-28761-2-git-send-email-florian.vaussard@heig-vd.ch>
 <57424d5d-2b28-2ea1-153c-6282899492a9@kernel.org> <577A0885.10209@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <577A0885.10209-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Cc: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/07/16 07:56, Florian Vaussard wrote:
> Hi Jonathan,
> 
> On 07/03/2016 12:41 PM, Jonathan Cameron wrote:
>> On 30/06/16 08:43, Florian Vaussard wrote:
>>> Add the device tree documentation for all the supported parts. Mandatory
>>> binding is the compatible string and the slave I2C address.
>>>
>>> Optional properties can be used to specify the Vcc / Vref regulators, as
>>> well as the IRQ line if available.
>>>
>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Signed-off-by: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
>> Really small point, but typically author sign off goes first then acks etc
>> that are gained at any intermediate states, then the sign off of whoever takes
>> the patch and applies it (here, that's me).  So it kind of communicates some
>> idea of when in the process various tags were obtained.  It's not a rule
>> set in stone though so I'll be lazy and leave this as it is.
>>
> 
> Agree, I will try to stick to this in the future. Looking at some previous
> patches, I see that I used both styles without noticing.
> 
>> Anyhow, great and applied to the togreg branch of iio.git initially pushed
>> out as testing for the autobuilders to poke it (or not in the case of this
>> docume
>>
> 
> Great. Do you plan to send them for the next merge window, or will you wait for
> the 4.9 cycle?
> 
Just sending now...  Should be in time for the coming merge window.

Jonathan
> Best,
> Florian
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
