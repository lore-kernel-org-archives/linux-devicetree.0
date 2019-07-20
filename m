From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Question] orphan platform data header
Date: Sat, 20 Jul 2019 15:54:59 +0200
Message-ID: <CAK8P3a2AeUpmNfFLJSvHT=AJ0kFRT2B=TWDm0HsTwoHt2jQ0gQ@mail.gmail.com>
References: <CAK7LNASyzmYjjBkFxRc06rqf36-en-bvJvrKcg6iiRfjoPCxhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNASyzmYjjBkFxRc06rqf36-en-bvJvrKcg6iiRfjoPCxhQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, DTML <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, masahiroy@kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 20, 2019 at 5:26 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> masahiro@grover:~/ref/linux$ git grep netxbig_led_platform_data
> drivers/leds/leds-netxbig.c:                          struct
> netxbig_led_platform_data *pdata,
> drivers/leds/leds-netxbig.c:                                 struct
> netxbig_led_platform_data *pdata)
> drivers/leds/leds-netxbig.c:                      struct
> netxbig_led_platform_data *pdata)
> drivers/leds/leds-netxbig.c:    struct netxbig_led_platform_data
> *pdata = dev_get_platdata(&pdev->dev);
> include/linux/platform_data/leds-kirkwood-netxbig.h:struct
> netxbig_led_platform_data {
>
>
>
> So, what shall we do?
>
> Drop the board-file support? Or, keep it
> in case somebody is still using their board-files
> in downstream?

Generally speaking, I'd remove the board file support in another
case like this, but it's worth looking at when it was last used and by
what.

For this file, all boards got converted to DT, and the old setup
code removed in commit ebc278f15759 ("ARM: mvebu: remove static
LED setup for netxbig boards"), four years ago, so it's a fairly
easy decision to make it DT only.

      Arnd
