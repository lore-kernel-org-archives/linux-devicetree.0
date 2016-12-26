Return-Path: <SRS0=9rIi=YJ=linaro.org=jun.nie@kernel.org>
Subject: Re: [PATCH v8 0/5] Add intial support to DW MMC host on ZTE SoC
References: <1482382657-16681-1-git-send-email-jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Message-ID: <d1e00e51-9cc0-1487-e858-607dd117c755@linaro.org>
Date: Mon, 26 Dec 2016 10:24:09 +0800
MIME-Version: 1.0
In-Reply-To: <1482382657-16681-1-git-send-email-jun.nie@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: jh80.chung@samsung.com, shawn.guo@linaro.org, xie.baoyou@zte.com.cn, devicetree@vger.kernel.org
Cc: ulf.hansson@linaro.org, jason.liu@linaro.org, chen.chaokai@zte.com.cn, lai.binz@zte.com.cn, linux-mmc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

On 2016年12月22日 12:57, Jun Nie wrote:
> Add intial support to DW MMC host on ZTE SoC. It include platform
> specific wrapper driver and workarounds for fifo quirk.
>
> Changes vs version 7:
>   - Re-order patches sequence so that new dts property is introduced before usage.
>   - Remove unecessary property in zx mmc dts.
>
> Changes vs version 6:
>   - Resolve confilict when rebase to latest dw-mmc.git for-ulf branch.
>   - Add Shawn Lin's review tag.
>
> Changes vs version 5:
>   - Add clock delay lock status check to save CPU cycle in timing tuning CMD.
>
> Changes vs version 4:
>   - Fix missing empty dts compatible element in the end of compatible array.
>
> Changes vs version 3:
>   - Fix brace error in document.
>
> Changes vs version 2:
>   - Change dt property fifo-addr to data-addr and fifo-watermark-quirk to
>     fifo-watermark-aligned.
>   - Polish ZX MMC driver on minor coding style issues.
>
> Changes vs version 1:
>   - Change fifo-addr-override to fifo-addr and remove its workaround tag in comments.
>   - Remove ZX DW MMC driver reset cap in driver, which can be added in dt nodes.
>
>
> Jun Nie (5):
>   Documentation: synopsys-dw-mshc: add binding for fifo quirks
>   mmc: dw: Add fifo address property
>   mmc: dw: Add fifo watermark alignment property
>   mmc: dt-bindings: add ZTE ZX296718 MMC bindings
>   mmc: zx: Initial support for ZX mmc controller
>
>  .../devicetree/bindings/mmc/synopsys-dw-mshc.txt   |  13 ++
>  .../devicetree/bindings/mmc/zx-dw-mshc.txt         |  33 +++
>  drivers/mmc/host/Kconfig                           |   9 +
>  drivers/mmc/host/Makefile                          |   1 +
>  drivers/mmc/host/dw_mmc-zx.c                       | 242 +++++++++++++++++++++
>  drivers/mmc/host/dw_mmc-zx.h                       |  31 +++
>  drivers/mmc/host/dw_mmc.c                          |  17 +-
>  include/linux/mmc/dw_mmc.h                         |   5 +
>  8 files changed, 348 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mmc/zx-dw-mshc.txt
>  create mode 100644 drivers/mmc/host/dw_mmc-zx.c
>  create mode 100644 drivers/mmc/host/dw_mmc-zx.h
>

Jaehoon，

Could you help add this patch set to your branch that for next merge 
window? Thank you very much!

Jun
