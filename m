Return-Path: <SRS0=dLme=TJ=martin.sperl.org=kernel@kernel.org>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] ARM: bcm283x: Enable DMA support for SPI controller
From: kernel@martin.sperl.org
In-Reply-To: <ab21b59ece7db065ee86f6f0c0a7623144db52b4.1557419583.git.lukas@wunner.de>
Date: Thu, 9 May 2019 20:08:20 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <6D30E7D8-BD48-4268-B6F9-62FEE0349C8B@martin.sperl.org>
References: <ab21b59ece7db065ee86f6f0c0a7623144db52b4.1557419583.git.lukas@wunner.de>
To: Lukas Wunner <lukas@wunner.de>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Noralf Tronnes <noralf@tronnes.org>, linux-rpi-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


> On 09.05.2019, at 19:03, Lukas Wunner <lukas@wunner.de> wrote:
>=20
> Without this, the driver for the BCM2835 SPI controller uses interrupt
> mode instead of DMA mode, incurring a significant performance penalty.
> The Foundation's device tree has had these attributes for years, but =
for
> some reason they were never upstreamed.
>=20
> They were originally contributed by Noralf Tr=C3=B8nnes and Martin =
Sperl:
> https://github.com/raspberrypi/linux/commit/25f3e064afc8
> https://github.com/raspberrypi/linux/commit/e0edb52b47e6
I believe the the original patch that I had provided has been turned =
down
was because:
* we do not want to =E2=80=9Cconsume=E2=80=9D dma resources =
automatically
* to use spi correctly you have to apply several changes to the dt =
already=20
  (think GPIO mode for CS and status=3Denable).

If this mindset has changed, then I am happy.

> Tested-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Cc: Martin Sperl <kernel@martin.sperl.org>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
Reviewed-by: Martin Sperl <kernel@martin.sperl.org>
