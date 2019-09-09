From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [PATCH 3/3] arm64: alpine: select AL_POS
Date: Mon, 9 Sep 2019 16:58:56 +0300
Message-ID: <0d36f94d-596f-0ec7-6951-b097b5ee0d2d@amazon.com>
References: <1568020220-7758-1-git-send-email-talel@amazon.com>
 <1568020220-7758-4-git-send-email-talel@amazon.com>
 <CAK8P3a0DEMeFWK+RuAdSLyDYduWWwj9DxP_Beipays-d_6ixnA@mail.gmail.com>
 <ab512ced-d989-5c10-a550-2a4723d38e7e@amazon.com>
 <CAK8P3a34eKFXoAPOfkFN5+H4kxOhRjXgws_0wy+d-186LFxcTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a34eKFXoAPOfkFN5+H4kxOhRjXgws_0wy+d-186LFxcTw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, David Miller <davem@davemloft.net>, gregkh <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Maxime Ripard <mripard@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, paul.kocialkowski@bootlin.com, mjourdan@baylibre.com, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, DTML <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>Dav
List-Id: devicetree@vger.kernel.org


On 9/9/2019 4:45 PM, Arnd Bergmann wrote:
> On Mon, Sep 9, 2019 at 12:17 PM Shenhar, Talel <talel@amazon.com> wrote:
>> On 9/9/2019 12:40 PM, Arnd Bergmann wrote:
>>> On Mon, Sep 9, 2019 at 11:14 AM Talel Shenhar <talel@amazon.com> wrote:
>>>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>>>> index 4778c77..bd86b15 100644
>>>> --- a/arch/arm64/Kconfig.platforms
>>>> +++ b/arch/arm64/Kconfig.platforms
>>>> @@ -25,6 +25,7 @@ config ARCH_SUNXI
>>>>    config ARCH_ALPINE
>>>>           bool "Annapurna Labs Alpine platform"
>>>>           select ALPINE_MSI if PCI
>>>> +       select AL_POS
>>>>           help
>>>>             This enables support for the Annapurna Labs Alpine
>>>>             Soc family.
>>> Generally I think this kind of thing should go into the defconfig
>>> rather than being hard-selected. There might be users that
>>> want to not enable the driver.
>> The reason for selecting it is because this is a driver that we will
>> always want for ARCH_ALPINE.
> Can you put the exact requirement (other than "we want this")
> in the changelog text then? It's still not clear to me what breaks
> without this driver.
>
>          Arnd

Its not that something will get broken. its error event detector for POS 
events which allows seeing bad accesses to registers.

What is the general rule of which configs to put under select and which 
under defconfig?

I was thinking that "general" SoC support is good under select - those 
things that we always want.

And specific features, e.g. RAID support or features that supported only 
on specific HW shall go under defconfig.


Similar, I see ARCH_LAYERSCAPE selecting EDAC_SUPPORT.


Will love to hear the general rule for select vs defconfig.
