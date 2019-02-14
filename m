From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: sprd: Remove wildcard compatible string
Date: Thu, 14 Feb 2019 09:56:26 +0800
Message-ID: <CAMz4kuJ3-tjXUKk0Hcr3gJLRNmg1REe4NPm3AaXc=Nq21AKzZg@mail.gmail.com>
References: <cover.1550060543.git.baolin.wang@linaro.org> <f34970a034946bacda19202e2ce9973ca732c925.1550060544.git.baolin.wang@linaro.org>
 <CAK8P3a38=4JZvqPi8f8Mpup2P70c+_xsM48-b35BVRYWGeHp9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a38=4JZvqPi8f8Mpup2P70c+_xsM48-b35BVRYWGeHp9w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 13 Feb 2019 at 22:32, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Feb 13, 2019 at 1:34 PM Baolin Wang <baolin.wang@linaro.org> wrote:
> >
> > Remove wildcard compatible string.
> >
> > Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
>
>
> Looks good to me. It does break using the new dtb file on older kernels,
> but I suppose this is not a case we care much about yet on your
> platform, given that both the dts file sand the drivers in the
> kernel are still  work in progress.

Right. Thanks for your reviewing.

>
> I had started the other reply I just sent before I saw this new mail.
>
>     Arnd



-- 
Baolin Wang
Best Regards
