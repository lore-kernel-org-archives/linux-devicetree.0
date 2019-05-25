Return-Path: <SRS0=6tYr=TZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:35881 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbfEYLHM (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 25 May 2019 07:07:12 -0400
Subject: Re: [PATCH] ARM: bcm283x: Enable DMA support for SPI controller
References: <ab21b59ece7db065ee86f6f0c0a7623144db52b4.1557419583.git.lukas@wunner.de>
From: Stefan Wahren <wahrenst@gmx.net>
Message-ID: <37bdc9e0-3f38-2ec4-4084-9cf46798589e@gmx.net>
Date: Sat, 25 May 2019 13:06:42 +0200
MIME-Version: 1.0
In-Reply-To: <ab21b59ece7db065ee86f6f0c0a7623144db52b4.1557419583.git.lukas@wunner.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Martin Sperl <kernel@martin.sperl.org>, Noralf Tronnes <noralf@tronnes.org>, linux-rpi-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Am 09.05.19 um 19:03 schrieb Lukas Wunner:
> Without this, the driver for the BCM2835 SPI controller uses interrupt
> mode instead of DMA mode, incurring a significant performance penalty.
> The Foundation's device tree has had these attributes for years, but for
> some reason they were never upstreamed.
>
> They were originally contributed by Noralf Tr=C3=B8nnes and Martin Sperl=
:
> https://github.com/raspberrypi/linux/commit/25f3e064afc8
> https://github.com/raspberrypi/linux/commit/e0edb52b47e6
>
> The DREQ numbers 6 and 7 are documented in section 4.2.1.3 of:
> https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.=
pdf
>
> Tested-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Cc: Martin Sperl <kernel@martin.sperl.org>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
Applied to bcm2835-dt-next
