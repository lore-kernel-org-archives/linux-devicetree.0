From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V7 12/12] arm64: dts: add clocks for SC9860
Date: Thu, 4 Jan 2018 22:34:27 +0100
Message-ID: <CAK8P3a3XA+p__p9+B-jCONUDe1MuOgsee6oD0USmwK06iXqH9g@mail.gmail.com>
References: <20171207125715.16160-1-chunyan.zhang@spreadtrum.com> <20171207125715.16160-13-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20171207125715.16160-13-chunyan.zhang@spreadtrum.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-clk <linux-clk@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Mark Brown <broonie@kernel.org>, Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>, Ben Li <ben.li@spreadtrum.com>, Orson Zhai <orson.zhai@spreadtrum.com>, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 7, 2017 at 1:57 PM, Chunyan Zhang
<chunyan.zhang@spreadtrum.com> wrote:
> Some clocks on SC9860 are in the same address area with syscon devices,
> those are what have a property of 'sprd,syscon' which would refer to
> syscon devices, others would have a reg property indicated their address
> ranges.
>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
> ---
>  arch/arm64/boot/dts/sprd/sc9860.dtsi | 115 +++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/sprd/whale2.dtsi |  18 +++++-
>  2 files changed, 131 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/sprd/sc9860.dtsi b/arch/arm64/boot/dts/sprd/sc9860.dtsi
> index 7b7d8ce..bf03da4 100644
> --- a/arch/arm64/boot/dts/sprd/sc9860.dtsi
> +++ b/arch/arm64/boot/dts/sprd/sc9860.dtsi
> @@ -7,6 +7,7 @@
>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/sprd,sc9860-clk.h>
>  #include "whale2.dtsi"

This caused a build error since the sprd,sc9860-clk.h file does not
exist, I'll revert or
undo the patch tomorrow.

        Arnd
