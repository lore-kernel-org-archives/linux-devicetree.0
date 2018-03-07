From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/8] ARTPEC-6 ARM SoC device tree updates
Date: Wed, 7 Mar 2018 15:48:49 +0100
Message-ID: <CAK8P3a3=nNvR=Dk_fYKwbb+srgQ6XQ73E1i_2GNwvs44ZhFyug@mail.gmail.com>
References: <20180221090000.18091-1-niklas.cassel@axis.com>
 <CAK8P3a0ykwsO40w49TL9xgVKv3wrvx7KXz1o6XD5+qXQ6n8YUA@mail.gmail.com> <20180307144027.GA17727@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180307144027.GA17727@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@axis.com>
Cc: arm-soc <arm@kernel.org>, linux-arm-kernel@axis.com, DTML <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 7, 2018 at 3:40 PM, Niklas Cassel <niklas.cassel@axis.com> wrote:
> On Tue, Mar 06, 2018 at 05:45:30PM +0100, Arnd Bergmann wrote:
>> On Wed, Feb 21, 2018 at 9:59 AM, Niklas Cassel <niklas.cassel@axis.com> wrote:
>> > Hello,
>> >
>> > Here comes some ARTPEC-6 ARM SoC device tree updates.
>> >
>> > Niklas Cassel (8):
>> >   ARM: dts: artpec: disable Accelerator Coherency Port
>> >   ARM: dts: artpec: use 1 GiB RAM
>> >   ARM: dts: artpec: remove 0x prefix from clkctrl unit address
>> >   ARM: dts: artpec: migrate ethernet to stmmac binding
>> >   ARM: dts: artpec: add and utilize artpec6 pin controller
>> >   ARM: dts: artpec: add and utilize nbpfaxi DMA controllers
>> >   ARM: dts: artpec: add disabled node for PCIe endpoint mode
>> >   ARM: dts: artpec: add node for hardware crypto accelerator
>>
>> For a series eight patches, a pull request would save me some work, but
>> I applied it anyway.
>
> Thank you Arnd.
> You will receive pull requests in the future.
>
>>
>> Are you sure that the first three patches shouldn't be applied to stable
>> backports?
>
> The only DTS available upstream is for the ARTPEC-6 devboard.
> Considering that ARTPEC-6 devboards are only used in-house,
> I don't see a reason to backport anything from this series.

Ok, makes sense. Thanks for checking!

      Arnd
