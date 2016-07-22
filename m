From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH v1 0/2] Add Hisilicon Djtag driver
Date: Fri, 22 Jul 2016 11:56:49 +0100
Message-ID: <20160722105648.GD17584@leverpostej>
References: <1469177332-72156-1-git-send-email-tanxiaojun@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1469177332-72156-1-git-send-email-tanxiaojun@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tan Xiaojun <tanxiaojun@huawei.com>
Cc: devicetree@vger.kernel.org, k.kozlowski@samsung.com, khilman@linaro.org, qiang.zhao@freescale.com, heiko@sntech.de, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, f.fainelli@gmail.com, alex.aring@gmail.com, xuwei5@hisilicon.com, linux-kernel@vger.kernel.org, gregory.clement@free-electrons.com, robh+dt@kernel.org, galak@codeaurora.org, rmk+kernel@arm.linux.org.uk, amitdanielk@gmail.com, geert+renesas@glider.be, treding@nvidia.com, linux-arm-kernel@lists.infradead.org, wxt@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi,

I understand that some SoC/socket level PMU is accessed via these
registers. It doesn't make sense to review either in isolation. Please
put together a unified series, with both the djtag accessors and the
PMU code.

On it's own, it's *very* difficult to understand how this fits into the
SoC, and how it is to be used.

Thanks,
Mark.

On Fri, Jul 22, 2016 at 04:48:50PM +0800, Tan Xiaojun wrote:
> 
> Tan Xiaojun (2):
>   Documentation: arm64: Add Hisilicon HiP05/06/07 Sysctrl and Djtag dts
>     bindings
>   drivers: soc: Add support for Hisilicon Djtag driver
> 
>  .../bindings/arm/hisilicon/hisilicon.txt           |   98 +++++
>  drivers/soc/Kconfig                                |    1 +
>  drivers/soc/Makefile                               |    1 +
>  drivers/soc/hisilicon/Kconfig                      |   12 +
>  drivers/soc/hisilicon/Makefile                     |    1 +
>  drivers/soc/hisilicon/djtag.c                      |  373 ++++++++++++++++++++
>  include/linux/soc/hisilicon/djtag.h                |   18 +
>  7 files changed, 504 insertions(+)
>  create mode 100644 drivers/soc/hisilicon/Kconfig
>  create mode 100644 drivers/soc/hisilicon/Makefile
>  create mode 100644 drivers/soc/hisilicon/djtag.c
>  create mode 100644 include/linux/soc/hisilicon/djtag.h
> 
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
