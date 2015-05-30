From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: stm32f429: Adopt STM32F4 clock driver
Date: Sat, 30 May 2015 11:38:47 +0200
Message-ID: <55698527.1050504@gmail.com>
References: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org> <1432972448-10332-1-git-send-email-daniel.thompson@linaro.org> <1432972448-10332-5-git-send-email-daniel.thompson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432972448-10332-5-git-send-email-daniel.thompson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kamil Lulko <rev13@wp.pl>, Andreas Farber <afaerber@suse.de>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org



On 05/30/2015 09:54 AM, Daniel Thompson wrote:
> New bindings and driver have been created for STM32F42xxx series parts.
> This patch integrates these changes.
>
> Note: Earlier device tree blobs (those without st,stm32f42xxx
>        compatibles for the rcc) could still be used to boot basic
>        systems. Such systems rely on the bootloader to configure the
>        clock gates for vital periperhals.
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>   arch/arm/boot/dts/stm32f429-disco.dts |  4 ++
>   arch/arm/boot/dts/stm32f429.dtsi      | 79 +++++++++++------------------------
>   2 files changed, 28 insertions(+), 55 deletions(-)
>
>
Reviewed-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>

Thanks!
Maxime
