From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/4] Add new device nodes for Spreadtrum SC9860 platform
Date: Wed, 30 Jan 2019 17:46:29 +0100
Message-ID: <CAK8P3a3UROFLTtEcNXKtMUN283UQ6auQUOXCR=6e3BdLu5K8Nw@mail.gmail.com>
References: <cover.1548052878.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1548052878.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 8:39 AM Baolin Wang <baolin.wang@linaro.org> wrote:
>
> This patch set adds charger and fuel gauge device nodes for Spreadtrum
> SC2731 PMIC, it also removes redundant irq trigger setting for PMIC
> devices and adds nvmem cells for ADC to calibrate the ADC channel scales.
>
> Baolin Wang (4):
>   arm64: dts: sprd: Remove PMIC INTC irq trigger type
>   arm64: dts: sprd: Add ADC calibration support
>   arm64: dts: sprd: Add SC2731 charger device
>   arm64: dts: sprd: Add SC27XX fuel gauge device

I did not apply these because of the 'sc27xx' wildcard matching.

Please fix those up and resend.

      Arnd
