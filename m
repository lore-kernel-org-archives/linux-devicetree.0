From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 13/13] auxdisplay: Add HD44780 Character LCD support
Date: Tue, 7 Feb 2017 13:23:35 +0200
Message-ID: <CAHp75VcvkcO-6N59fMtr8xRogQxhicifTMaNVipmTccj078Baw@mail.gmail.com>
References: <1486391895-9554-1-git-send-email-geert@linux-m68k.org> <1486391895-9554-14-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486391895-9554-14-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Willy Tarreau <willy@haproxy.com>, Ksenija Stanojevic <ksenija.stanojevic@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 6, 2017 at 4:38 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> The Hitachi HD44780 Character LCD Controller is commonly used on
> character LCDs that can display one or more lines of text.
>
> This driver supports character LCDs connected to GPIOs, using either a
> 4-bit or 8-bit data bus, and provides access through the charlcd core
> and /dev/lcd.

Can we not limit this to OF? I can easily imagine use case with
x86/ACPI enabled platform.

On the first glance of_property-* -> device_property_* is enough.

-- 
With Best Regards,
Andy Shevchenko
