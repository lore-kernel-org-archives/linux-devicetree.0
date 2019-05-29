From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [PATCH v6 0/6] Allwinner H6 Mali GPU support
Date: Wed, 29 May 2019 17:09:22 +0200
Message-ID: <CAAObsKD8bij1ANLqX6y11Y6mDEXiymNjrDkmHmvGWiFLKWu_FA@mail.gmail.com>
References: <20190521161102.29620-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521161102.29620-1-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Neil Armstrong <narmstrong@baylibre.com>, Steven Price <steven.price@arm.com>, devicetree@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux IOMMU <iommu@lists.linux-foundation.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 21 May 2019 at 18:11, Clément Péron <peron.clem@gmail.com> wrote:
>
[snip]
> [  345.204813] panfrost 1800000.gpu: mmu irq status=1
> [  345.209617] panfrost 1800000.gpu: Unhandled Page fault in AS0 at VA
> 0x0000000002400400

>From what I can see here, 0x0000000002400400 points to the first byte
of the first submitted job descriptor.

So mapping buffers for the GPU doesn't seem to be working at all on
64-bit T-760.

Steven, Robin, do you have any idea of why this could be?

Thanks,

Tomeu
