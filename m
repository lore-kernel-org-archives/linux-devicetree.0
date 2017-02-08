From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 13/13] auxdisplay: Add HD44780 Character LCD support
Date: Wed, 8 Feb 2017 14:41:29 +0100
Message-ID: <CAMuHMdWpW77eJmuuDzyXqZZ9HcwsxPdhsR6GNR3NL91rZyoVPw@mail.gmail.com>
References: <1486391895-9554-1-git-send-email-geert@linux-m68k.org>
 <1486391895-9554-14-git-send-email-geert@linux-m68k.org> <CAHp75VcvkcO-6N59fMtr8xRogQxhicifTMaNVipmTccj078Baw@mail.gmail.com>
 <CAMuHMdXav5kyuSENYwKH0iVwT=Z25TfL=di-nbHb0zjHXdyY=w@mail.gmail.com> <CAHp75Ve0SmQg+oaDU7zJ3zpi2GHJJkQ9HFJk-CuxR5Woq4x7rQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Ve0SmQg+oaDU7zJ3zpi2GHJJkQ9HFJk-CuxR5Woq4x7rQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Willy Tarreau <willy@haproxy.com>, Ksenija Stanojevic <ksenija.stanojevic@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

On Wed, Feb 8, 2017 at 2:38 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> Btw, have you any plans to make an order among spreaded LCD drivers in
> kernel? Perhaps we may gather them under auxdisplay hood?

I have no such plan. I just had a long-standing personal interest in hd44780.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
