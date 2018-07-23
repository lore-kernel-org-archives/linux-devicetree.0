From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drivers/memory/Kconfig: Add CONFIG_OF dependency
Date: Mon, 23 Jul 2018 11:34:43 +0200
Message-ID: <CAK8P3a1_8OSqyKsbw+m3ZzLWfPqDK4ynG3WoPTk+K2uJJsiq5A@mail.gmail.com>
References: <20180721200049.7553-1-anders.roxell@linaro.org>
 <a83ff193-be57-f566-cafb-132075025b56@infradead.org> <20180722082939.2de739f1@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722082939.2de739f1@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Anders Roxell <anders.roxell@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 22, 2018 at 8:29 AM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> +Arnd, Rob and the DT ML.
>
> On Sat, 21 Jul 2018 14:53:47 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
>
>> On 07/21/2018 01:00 PM, Anders Roxell wrote:
>> > JZ4780_NEMC doesn't depend on OF, and if OF isn't enabled we get this
>> > error:
>> > drivers/memory/jz4780-nemc.c: In function =E2=80=98jz4780_nemc_num_ban=
ks=E2=80=99:
>> > drivers/memory/jz4780-nemc.c:72:10: error: implicit declaration of
>> >  function =E2=80=98of_read_number=E2=80=99; did you mean =E2=80=98down=
_read_nested=E2=80=99?
>> >  [-Werror=3Dimplicit-function-declaration]
>> >    bank =3D of_read_number(prop, 1);
>> >           ^~~~~~~~~~~~~~
>> >           down_read_nested
>
> Looks like of.h defines stubs so that people can compile-test without
> CONFIG_OF selected. Maybe we should move of_read_number() and
> of_read_ulong() out of the #ifdef CONFIG_OF section.

That seems fine, though the added dependency seems appropriate
here as well. of_read_number() is rarely used, and for the most part in
powerpc specific code that is guaranteed to have CONFIG_OF enabled,
so it's not that likely to cause many more problems.

> Alternatively, we could patch jz4780-nemc.c to not use of_read_number
> and instead rely on of_read_property_u32_index() +
> of_property_count_elems_of_size() + of_n_{addr,size}_cells():

That seems noticeably longer for no good reason, I'd go with either
the header file change you suggested or Anders' patch.

       Arnd
