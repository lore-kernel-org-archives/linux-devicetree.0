From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 13/13] auxdisplay: Add HD44780 Character LCD support
Date: Wed, 8 Feb 2017 18:19:03 +0100
Message-ID: <CAMuHMdUmCOD-mDCzHoHBSLBS6GsZz55EWCnGdK5idB+UDp14Gw@mail.gmail.com>
References: <1486391895-9554-1-git-send-email-geert@linux-m68k.org>
 <1486391895-9554-14-git-send-email-geert@linux-m68k.org> <CAHp75VcvkcO-6N59fMtr8xRogQxhicifTMaNVipmTccj078Baw@mail.gmail.com>
 <CAMuHMdXav5kyuSENYwKH0iVwT=Z25TfL=di-nbHb0zjHXdyY=w@mail.gmail.com>
 <CAHp75Ve0SmQg+oaDU7zJ3zpi2GHJJkQ9HFJk-CuxR5Woq4x7rQ@mail.gmail.com>
 <CAMuHMdWpW77eJmuuDzyXqZZ9HcwsxPdhsR6GNR3NL91rZyoVPw@mail.gmail.com> <CAHp75Vfy=GsHurE0G=BO6cxuT7qwc+zYAXGep7mrH==KXsJaEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75Vfy=GsHurE0G=BO6cxuT7qwc+zYAXGep7mrH==KXsJaEw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Willy Tarreau <willy-W4YR9g1X7EZBDgjK7y7TUQ@public.gmane.org>, Ksenija Stanojevic <ksenija.stanojevic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

On Wed, Feb 8, 2017 at 5:27 PM, Andy Shevchenko
<andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Feb 8, 2017 at 3:41 PM, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>> On Wed, Feb 8, 2017 at 2:38 PM, Andy Shevchenko
>> <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Btw, have you any plans to make an order among spreaded LCD drivers in
>>> kernel? Perhaps we may gather them under auxdisplay hood?
>>
>> I have no such plan. I just had a long-standing personal interest in hd44780.
>
> I have one too regarding to I2C/SPI interfaced hardware.
> If you remember it was an attempt for lcd-linux to be upstreamed,
> which provides (besides i2c/spi bus drivers) those LCDs as tty
> devices.
> Also interesting feature to have.

I'm actually driving mine from SPI, using a 74HCT595 shift register and
the 74x164 GPIO driver.  Should work with i2c and a PCF8574 GPIO
expander too, except that my SoC has 3.3V I/Os, while my display
needs 5V, which is taken care of by the HCT shift register.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
