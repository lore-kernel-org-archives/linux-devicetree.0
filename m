From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH V2 0/3] pinctrl: Support for IMG Pistachio
Date: Tue, 31 Mar 2015 10:20:37 -0700
Message-ID: <CAL1qeaFd0dz0wirFzCRfetprjs1vJqm6RrmuPj0sBiEg_mc6pg@mail.gmail.com>
References: <1427757416-14491-1-git-send-email-abrestic@chromium.org>
	<20150331140034.GE28951@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20150331140034.GE28951@linux-mips.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 31, 2015 at 7:00 AM, Ralf Baechle <ralf@linux-mips.org> wrote:
> On Mon, Mar 30, 2015 at 04:16:53PM -0700, Andrew Bresticker wrote:
>
>> This series adds support for the system pin and GPIO controller on the IMG
>> Pistachio SoC.  Pistachio's system pin controller manages 99 pins, 90 of
>> which are MFIOs which can be muxed between multiple functions or used
>> as GPIOs.  The GPIO control for the 90 MFIOs is broken up into banks
>> of 16.  Pistachio also has a second pin controller, the RPU pin controller,
>> which will be supported by a future patchset through an extension to this
>> driver.
>>
>> Test on an IMG Pistachio BuB.  Based on mips-for-linux-next which inluces my
>> series adding Pistachio platform support [1].  A branch with this series is
>> available at [2].
>
> Does this mean you want me to funnel this through the MIPS tree?  If so,
> could I have an Ack from the maintainers?

Linus mentioned in v1 that if the only dependency was a Kconfig symbol
that he could take it through his tree.  I'm fine either way, though
it would be slightly more convenient for it to go through the MIPS
tree.  Linus?

Thanks,
Andrew
