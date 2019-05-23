From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/5] 32-bit Meson: add the canvas module
Date: Wed, 22 May 2019 18:21:23 -0700
Message-ID: <7h1s0q55kc.fsf@baylibre.com>
References: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, mjourdan@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This adds the canvas module on Meson8, Meson8b and Meson8m2. The canvas
> IP is used by the video decoder hardware as well as the VPU (video
> output) hardware.
>
> Neither the VPU nor the video decoder driver support the 32-bit SoCs
> yet. However, we can still add the canvas module to have it available
> once these drivers gain support for the older SoCs.
>
> I have tested this on my Meson8m2 board by hacking the VPU driver to
> not re-initialize the VPU (and to use the configuration set by u-boot).
> With that hack I could get some image out of the CVBS connector. No
> changes to the canvas driver were required.
>
> Due to lack of hardware I could not test Meson8, but I'm following (as
> always) what the Amlogic 3.10 vendor kernel uses.
> Meson8b is also not tested because u-boot of my EC-100 doesn't have
> video output enabled (so I couldn't use the same hack I used on my
> Meson8m2 board).

Queued for v5.3...

> Martin Blumenstingl (5):
>   dt-bindings: soc: amlogic: canvas: document support for Meson8/8b/8m2
>   soc: amlogic: canvas: add support for Meson8, Meson8b and Meson8m2

these two in v5.3/drivers

>   ARM: dts: meson8: add the canvas module
>   ARM: dts: meson8m2: update the offset of the canvas module
>   ARM: dts: meson8b: add the canvas module

and these 3 in v5.3/dt.

Thanks,

Kevin
