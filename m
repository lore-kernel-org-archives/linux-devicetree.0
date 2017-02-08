From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 13/13] auxdisplay: Add HD44780 Character LCD support
Date: Wed, 8 Feb 2017 15:38:13 +0200
Message-ID: <CAHp75Ve0SmQg+oaDU7zJ3zpi2GHJJkQ9HFJk-CuxR5Woq4x7rQ@mail.gmail.com>
References: <1486391895-9554-1-git-send-email-geert@linux-m68k.org>
 <1486391895-9554-14-git-send-email-geert@linux-m68k.org> <CAHp75VcvkcO-6N59fMtr8xRogQxhicifTMaNVipmTccj078Baw@mail.gmail.com>
 <CAMuHMdXav5kyuSENYwKH0iVwT=Z25TfL=di-nbHb0zjHXdyY=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdXav5kyuSENYwKH0iVwT=Z25TfL=di-nbHb0zjHXdyY=w@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Willy Tarreau <willy-W4YR9g1X7EZBDgjK7y7TUQ@public.gmane.org>, Ksenija Stanojevic <ksenija.stanojevic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 8, 2017 at 3:18 PM, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> Hi Andy,
>
> On Tue, Feb 7, 2017 at 12:23 PM, Andy Shevchenko
> <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Mon, Feb 6, 2017 at 4:38 PM, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>>> The Hitachi HD44780 Character LCD Controller is commonly used on
>>> character LCDs that can display one or more lines of text.
>>>
>>> This driver supports character LCDs connected to GPIOs, using either a
>>> 4-bit or 8-bit data bus, and provides access through the charlcd core
>>> and /dev/lcd.
>>
>> Can we not limit this to OF? I can easily imagine use case with
>> x86/ACPI enabled platform.
>
> Sure!
>
>> On the first glance of_property-* -> device_property_* is enough.
>
> And of_gpio_named_count() -> gpiod_count().

Indeed.

Btw, have you any plans to make an order among spreaded LCD drivers in
kernel? Perhaps we may gather them under auxdisplay hood?

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
