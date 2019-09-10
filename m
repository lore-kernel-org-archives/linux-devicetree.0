From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [PATCH 3/3] arm64: alpine: select AL_POS
Date: Tue, 10 Sep 2019 09:17:11 +0300
Message-ID: <a616c903-6d3e-cf84-8afb-ade48d5ca68f@amazon.com>
References: <1568020220-7758-1-git-send-email-talel@amazon.com>
 <1568020220-7758-4-git-send-email-talel@amazon.com>
 <CAK8P3a0DEMeFWK+RuAdSLyDYduWWwj9DxP_Beipays-d_6ixnA@mail.gmail.com>
 <ab512ced-d989-5c10-a550-2a4723d38e7e@amazon.com>
 <CAK8P3a34eKFXoAPOfkFN5+H4kxOhRjXgws_0wy+d-186LFxcTw@mail.gmail.com>
 <0d36f94d-596f-0ec7-6951-b097b5ee0d2d@amazon.com>
 <CAK8P3a0RUHxcpyUJU5bpd8nqpm0Sqhy4aJaoh7K9jVn8zJC6aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a0RUHxcpyUJU5bpd8nqpm0Sqhy4aJaoh7K9jVn8zJC6aQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, David Miller <davem@davemloft.net>, gregkh <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Maxime Ripard <mripard@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, paul.kocialkowski@bootlin.com, mjourdan@baylibre.com, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, DTML <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>Dav
List-Id: devicetree@vger.kernel.org


On 9/9/2019 6:08 PM, Arnd Bergmann wrote:
> On Mon, Sep 9, 2019 at 3:59 PM Shenhar, Talel <talel@amazon.com> wrote:
>> On 9/9/2019 4:45 PM, Arnd Bergmann wrote:
>>
>> Its not that something will get broken. its error event detector for POS
>> events which allows seeing bad accesses to registers.
>>
>> What is the general rule of which configs to put under select and which
>> under defconfig?
>>
>> I was thinking that "general" SoC support is good under select - those
>> things that we always want.
> I generally want as little as possible to be selected, basically only
> things that are required for linking the kernel and booting it without
> potentially destroying the hardware.
>
> In particular, I want most drivers to be enabled as loadable modules
> if possible. When you have general-purpose distributions support
> your platform, there is no need to have this module built-in while
> running on a different chip, even if you always want to load the
> module when it's running on yours.
>
>> And specific features, e.g. RAID support or features that supported only
>> on specific HW shall go under defconfig.
>>
>> Similar, I see ARCH_LAYERSCAPE selecting EDAC_SUPPORT.
> I think this was done to avoid a link failure. It's also possible that this
> is a mistake and just did not get caught in review.
>
>         Arnd


I see.

Will remove this from v2.
