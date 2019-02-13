From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 5/5] arm64: dts: sprd: Remove wildcard compatible string
Date: Wed, 13 Feb 2019 15:31:47 +0100
Message-ID: <CAK8P3a38=4JZvqPi8f8Mpup2P70c+_xsM48-b35BVRYWGeHp9w@mail.gmail.com>
References: <cover.1550060543.git.baolin.wang@linaro.org> <f34970a034946bacda19202e2ce9973ca732c925.1550060544.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f34970a034946bacda19202e2ce9973ca732c925.1550060544.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 13, 2019 at 1:34 PM Baolin Wang <baolin.wang@linaro.org> wrote:
>
> Remove wildcard compatible string.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>


Looks good to me. It does break using the new dtb file on older kernels,
but I suppose this is not a case we care much about yet on your
platform, given that both the dts file sand the drivers in the
kernel are still  work in progress.

I had started the other reply I just sent before I saw this new mail.

    Arnd
