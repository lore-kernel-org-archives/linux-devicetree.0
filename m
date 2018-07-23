From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drivers/memory/Kconfig: Add CONFIG_OF dependency
Date: Mon, 23 Jul 2018 20:39:20 +0200
Message-ID: <CAK8P3a1D=zY9EBSvH6mXQbB01tSRsiKBiJ9_dqJJHCH05t0z=A@mail.gmail.com>
References: <20180721200049.7553-1-anders.roxell@linaro.org>
 <a83ff193-be57-f566-cafb-132075025b56@infradead.org> <20180722082939.2de739f1@bbrezillon>
 <CAK8P3a1_8OSqyKsbw+m3ZzLWfPqDK4ynG3WoPTk+K2uJJsiq5A@mail.gmail.com>
 <20180723114107.664164d2@bbrezillon> <CAK8P3a10SsWuPXzOyRcNKa+ukvj_Gq13JyDTngoU8DJu6_MR0Q@mail.gmail.com>
 <CAK8P3a0p_8HWz0kLLrkwmpcbt4BsMiDG=hFK4SxeJygucZ1yMg@mail.gmail.com> <20180723181424.3c07f5b8@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723181424.3c07f5b8@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Anders Roxell <anders.roxell@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 23, 2018 at 6:14 PM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> On Mon, 23 Jul 2018 18:04:52 +0200
> Arnd Bergmann <arnd@arndb.de> wrote:
>
>> On Mon, Jul 23, 2018 at 5:40 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>> > On Mon, Jul 23, 2018 at 11:41 AM, Boris Brezillon
>> > <boris.brezillon@bootlin.com> wrote:
>> >> On Mon, 23 Jul 2018 11:34:43 +0200
>> >> Arnd Bergmann <arnd@arndb.de> wrote:
>> >>
>> >>> On Sun, Jul 22, 2018 at 8:29 AM, Boris Brezillon
>> >>> <boris.brezillon@bootlin.com> wrote:
>> >>> > +Arnd, Rob and the DT ML.

> Yep, somehow io.h was indirectly included by gpio.h. I fixed that in my
> patch when replacing gpio.h by gpio/consumer.h by including linux/io.h.

Ok, looks good. With the patch from you plus the one from Anders,
I don't see any more randconfig failures in this driver.

    Arnd
