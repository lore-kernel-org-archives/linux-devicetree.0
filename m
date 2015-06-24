From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] added device tree support to gpio-generic driver
Date: Wed, 24 Jun 2015 13:07:57 +0200
Message-ID: <CAMuHMdUCNQV=9vEmNPHtuwXw3jZ_NWwpJaTb6eBXvYJiDKhGaw@mail.gmail.com>
References: <1433487062-10647-1-git-send-email-romain.baeriswyl@alitech.com>
	<CACRpkdbWhtkMgz2qTg1y7AguLQCJXnAoi7gVnFvPb1sR7eES_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbWhtkMgz2qTg1y7AguLQCJXnAoi7gVnFvPb1sR7eES_g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Romain Baeriswyl <romain.baeriswyl@alitech.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christian Ruppert <christian.ruppert@alitech.com>, Anton Vorontsov <cbouatmailru@gmail.com>, Rojhalat Ibrahim <imr@rtschenk.de>, abdoulaye berthe <berthe.ab@gmail.com>, Anthony Fee <anthony.fee@emutex.com>, Alexander Shiyan <shc_work@mail.ru>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 10, 2015 at 10:42 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Fri, Jun 5, 2015 at 8:51 AM, Romain Baeriswyl
> <romain.baeriswyl@alitech.com> wrote:
>
>> +Required properties:
>> +- compatible : "basic-mmio-gpio" for little endian register access or
>> +               "basic-mmio-gpio-be" for big endian register access
>
> Basic I don't know.
>
> "single-register-gpio" is more to the point, don't you think?
>
>> +- ngpios: Specifies the number of gpio mapped in the register. The value is
>> +          limited to the number of bits of the LONG type.
>
> So if it is 8 for a 32 bit register, does it mean bits 0..7 little endian or
> big endian, or does it depend on endianness? Clarify this
> in the binding.

LONG can be 64-bit too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
