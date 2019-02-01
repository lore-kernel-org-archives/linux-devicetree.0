From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH 0/4] Add new device nodes for Spreadtrum SC9860 platform
Date: Fri, 1 Feb 2019 20:05:30 +0800
Message-ID: <CAMz4kuLotnNom9kx2EmdfVEb+gvWfEbxoh6+hiqk87EjmtYJwA@mail.gmail.com>
References: <cover.1548052878.git.baolin.wang@linaro.org> <CAK8P3a3UROFLTtEcNXKtMUN283UQ6auQUOXCR=6e3BdLu5K8Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3UROFLTtEcNXKtMUN283UQ6auQUOXCR=6e3BdLu5K8Nw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Thu, 31 Jan 2019 at 00:46, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Jan 21, 2019 at 8:39 AM Baolin Wang <baolin.wang@linaro.org> wrote:
> >
> > This patch set adds charger and fuel gauge device nodes for Spreadtrum
> > SC2731 PMIC, it also removes redundant irq trigger setting for PMIC
> > devices and adds nvmem cells for ADC to calibrate the ADC channel scales.
> >
> > Baolin Wang (4):
> >   arm64: dts: sprd: Remove PMIC INTC irq trigger type
> >   arm64: dts: sprd: Add ADC calibration support
> >   arm64: dts: sprd: Add SC2731 charger device
> >   arm64: dts: sprd: Add SC27XX fuel gauge device
>
> I did not apply these because of the 'sc27xx' wildcard matching.
>
> Please fix those up and resend.
>

On Spreadtrum platform, we use one mfd driver [1] to populate the
SC27XX series PMICs including SC2731, SC2721, SC2720 and SC2730. So we
use sc27xx to be compatible with different PMICs' devices, otherwise
it will be difficult to define the mfd cell arrays in mfd driver. Do
you have any good suggestion? Thanks.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mfd/sprd-sc27xx-spi.c

-- 
Baolin Wang
Best Regards
