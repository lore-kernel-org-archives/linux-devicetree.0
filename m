Return-Path: <SRS0=tn9z=TL=i2se.com=stefan.wahren@kernel.org>
Subject: Re: [PATCH] ARM: bcm283x: Enable DMA support for SPI controller
References: <ab21b59ece7db065ee86f6f0c0a7623144db52b4.1557419583.git.lukas@wunner.de>
 <6D30E7D8-BD48-4268-B6F9-62FEE0349C8B@martin.sperl.org>
From: Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <7b604542-c6c4-dd51-6c25-c6b255dadc60@i2se.com>
Date: Sat, 11 May 2019 20:00:32 +0200
MIME-Version: 1.0
In-Reply-To: <6D30E7D8-BD48-4268-B6F9-62FEE0349C8B@martin.sperl.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
To: kernel@martin.sperl.org, Lukas Wunner <lukas@wunner.de>
Cc: Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Noralf Tronnes <noralf@tronnes.org>, linux-rpi-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

Am 09.05.19 um 20:08 schrieb kernel@martin.sperl.org:
>> On 09.05.2019, at 19:03, Lukas Wunner <lukas@wunner.de> wrote:
>>
>> Without this, the driver for the BCM2835 SPI controller uses interrupt=

>> mode instead of DMA mode, incurring a significant performance penalty.=

>> The Foundation's device tree has had these attributes for years, but f=
or
>> some reason they were never upstreamed.
>>
>> They were originally contributed by Noralf Tr=C3=B8nnes and Martin Spe=
rl:
>> https://github.com/raspberrypi/linux/commit/25f3e064afc8
>> https://github.com/raspberrypi/linux/commit/e0edb52b47e6
> I believe the the original patch that I had provided has been turned do=
wn
> was because:
> * we do not want to =E2=80=9Cconsume=E2=80=9D dma resources automatical=
ly
as long as we don't enable SPI per default, this shouldn't be a problem.
I remember that the downstream MMC driver "wasted" a DMA channel at the
beginning, so we were a little bit careful in the past.
> * to use spi correctly you have to apply several changes to the dt alre=
ady=20
>   (think GPIO mode for CS and status=3Denable).

This is something we can't provide, since the GPIO header should be
flexible as possible. But this has nothing to do with Lukas patch,
because i consider the patch as SoC related and common practice.

Yes, overlays are a big improvement to define a SPI bus here.

Thanks
Stefan

>
> If this mindset has changed, then I am happy.
>
>> Tested-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>> Signed-off-by: Lukas Wunner <lukas@wunner.de>
>> Cc: Martin Sperl <kernel@martin.sperl.org>
>> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Reviewed-by: Martin Sperl <kernel@martin.sperl.org>
>
>
>
>
>
>
>
