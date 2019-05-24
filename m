From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: mainline/master boot bisection: v5.2-rc1-172-g4dde821e4296 on meson-g12a-x96-max
Date: Fri, 24 May 2019 06:50:18 -0700
Message-ID: <7hmujc0xnp.fsf@baylibre.com>
References: <5ce78689.1c69fb81.58097.eacf@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5ce78689.1c69fb81.58097.eacf@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "kernelci.org bot" <bot@kernelci.org>, tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com, mgalka@collabora.com, Neil Armstrong <narmstrong@baylibre.com>, broonie@kernel.org, matthew.hart@linaro.org, enric.balletbo@collabora.com, Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

"kernelci.org bot" <bot@kernelci.org> writes:

> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>
> mainline/master boot bisection: v5.2-rc1-172-g4dde821e4296 on meson-g12a-x96-max
>
> Summary:
>   Start:      4dde821e4296 Merge tag 'xfs-5.2-fixes-1' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux
>   Details:    https://kernelci.org/boot/id/5ce72c6259b514ed817a3640
>   Plain log:  https://storage.kernelci.org//mainline/master/v5.2-rc1-172-g4dde821e4296/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-baylibre/boot-meson-g12a-x96-max.txt
>   HTML log:   https://storage.kernelci.org//mainline/master/v5.2-rc1-172-g4dde821e4296/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-baylibre/boot-meson-g12a-x96-max.html
>   Result:     11a7bea17c9e arm64: dts: meson: g12a: add pinctrl support controllers

False alarm.

This one is failing in one lab but passing in another:
https://kernelci.org/boot/all/job/mainline/branch/master/kernel/v5.2-rc1-172-g4dde821e4296/

I'll look into what's the difference between labs.

Kevin
