From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH] arm64: dts: hi3798cv200: fix malformed SPDX license
 identifier
Date: Fri, 1 Feb 2019 16:57:02 +0000
Message-ID: <585b4540-6d51-72c0-730f-9bb6cfefaa85@hisilicon.com>
References: <20190118005404.10452-1-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190118005404.10452-1-shawnguo@kernel.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On 1/18/2019 12:54 AM, Shawn Guo wrote:
> It fixes malformed SPDX license identifier in Hi3798CV200 and Poplar
> DTS, accroding to Documentation/process/license-rules.rst.
> 
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>

Applied to the hisilicon soc dt tree.
Thanks!

Best Regards,
Wei

> ---
>  arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts | 4 +---
>  arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi       | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
> index 32716c96b457..c563d3eb2d98 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
> @@ -1,10 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * DTS File for HiSilicon Poplar Development Board
>   *
>   * Copyright (c) 2016-2017 HiSilicon Technologies Co., Ltd.
> - *
> - * Released under the GPLv2 only.
> - * SPDX-License-Identifier: GPL-2.0
>   */
>  
>  /dts-v1/;
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> index 7c0fddd7c8cf..13821a0ff524 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> @@ -1,10 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * DTS File for HiSilicon Hi3798cv200 SoC.
>   *
>   * Copyright (c) 2016-2017 HiSilicon Technologies Co., Ltd.
> - *
> - * Released under the GPLv2 only.
> - * SPDX-License-Identifier: GPL-2.0
>   */
>  
>  #include <dt-bindings/clock/histb-clock.h>
> 
