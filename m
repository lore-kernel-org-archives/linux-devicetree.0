From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 03/12] of: Add binding document for MIPS GIC
Date: Sun, 31 Aug 2014 11:34:36 -0700
Message-ID: <CAL1qeaE1jKLM0kK95efvcaeQwS4qjAR9-77Maa2q8aTJ4TC3jw@mail.gmail.com>
References: <1409350479-19108-1-git-send-email-abrestic@chromium.org>
	<1409350479-19108-4-git-send-email-abrestic@chromium.org>
	<6798670.9zbxUzsGyC@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6798670.9zbxUzsGyC@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jeffrey Deans <jeffrey.deans-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 30, 2014 at 12:53 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 29 August 2014 15:14:30 Andrew Bresticker wrote:
>> The Global Interrupt Controller (GIC) present on certain MIPS systems
>> can be used to route external interrupts to individual VPEs and CPU
>> interrupt vectors.  It also supports a timer and software-generated
>> interrupts.
>>
>> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/mips/gic.txt | 50 ++++++++++++++++++++++++++
>>
>
> This may be a stupid question, but is this related to the ARM GIC
> in any way or does it just share the name?

There's no relation.  Note that it's also "Global Interrupt
Controller" vs. "Generic Interrupt Controller".

> In either case the binding belongs into
> Documentation/devicetree/bindings/interrupt-controller/.

Will do.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
