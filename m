Return-Path: <SRS0=gqjC=FW=linaro.org=ard.biesheuvel@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CABb+yY3PNoGAazn2JNWZScb_a8iNRmv94B0D=4xFRi3_mb2CXA@mail.gmail.com>
References: <1519736182-3650-1-git-send-email-jassisinghbrar@gmail.com>
 <1519736330-3985-1-git-send-email-jassisinghbrar@gmail.com>
 <1519840555.25567.218.camel@impinj.com> <CABb+yY3PNoGAazn2JNWZScb_a8iNRmv94B0D=4xFRi3_mb2CXA@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 28 Feb 2018 18:36:55 +0000
Message-ID: <CAKv+Gu-E82Fuj9hUjYLNvuDFQL0-MOSezVN-b8Ti7sU37Nooxw@mail.gmail.com>
Subject: Re: [PATCHv4 2/3] spi: Add spi driver for Socionext Synquacer platform
Content-Type: text/plain; charset="UTF-8"
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Trent Piepho <tpiepho@impinj.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jaswinder.singh@linaro.org" <jaswinder.singh@linaro.org>, "broonie@kernel.org" <broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "masami.hiramatsu@linaro.org" <masami.hiramatsu@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 28 February 2018 at 18:29, Jassi Brar <jassisinghbrar@gmail.com> wrote:
> On Wed, Feb 28, 2018 at 11:25 PM, Trent Piepho <tpiepho@impinj.com> wrote:
>> On Tue, 2018-02-27 at 18:28 +0530, jassisinghbrar@gmail.com wrote:
>>> From: Jassi Brar <jaswinder.singh@linaro.org>
>>>
>>> This patch adds support for controller found on synquacer platforms.
>>>
>>> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
>>> ---
>>>  drivers/spi/Kconfig         |  11 +
>>>  drivers/spi/Makefile        |   1 +
>>>  drivers/spi/spi-synquacer.c | 663 ++++++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 675 insertions(+)
>>>  create mode 100644 drivers/spi/spi-synquacer.c
>>>
>>> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
>>> index 6037839..9e04bbe 100644
>>> --- a/drivers/spi/Kconfig
>>> +++ b/drivers/spi/Kconfig
>>> @@ -659,6 +659,17 @@ config SPI_SUN6I
>>>       help
>>>         This enables using the SPI controller on the Allwinner A31 SoCs.
>>>
>>> +config SPI_SYNQUACER
>>> +     tristate "Socionext's Synquacer HighSpeed SPI controller"
>>> +     depends on ARCH_SYNQUACER || COMPILE_TEST
>>> +     select SPI_BITBANG
>>> +     help
>>> +       SPI driver for Socionext's High speed SPI controller which provides
>>> +       various operating modes for interfacing to serial peripheral devices
>>> +       that use the de-facto standard SPI protocol.
>>> +
>>> +       It also supports the new dual-bit and quad-bit SPI protocol.
>>> +
>>
>> As someone who designs and develops embedded Linux devices, it would be
>> really useful if there was a bit more documentation about the driver.
>>
>> The hardware doesn't support DMA or even interrupts, and must busy wait
>> for the duration of the entire SPI transfers.  That's kind of a Big
>> Deal.  A design that involves lots of SPI transfers on a slow clock
>> will work fine on most SPI hardware, but will be utterly unfeasible
>> here.  It would be nice to say something about that.  I'd probably put
>> it in driver code.
>>
> From marketing point of view, why would I want to advertise my limitations? :)
>
> Its not like any random platform might want to use this driver, nor
> the enduser could do anything about it (its not a s/w issue). The
> decision to integrate the ip in a SoC is already taken before the
> driver is written. Obviously the users that need high spi performance
> are not its intended target.
>
> BTW, the IP is actually not that bad. It is meant for interfacing
> flash devices and can operate in two modes - "direct" mode where it
> maps flash memory as i/o region and the other last resort "spi" mode
> where we could manually drive the flash. This driver implements that
> limited "spi" mode.
>

My SoC manual does list interrupts for this IP block. Are you sure
SynQuacer uses the same version of the IP as before?
