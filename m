From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH 0/3] HiSilicon LPC defconfig and DT patches
Date: Fri, 11 May 2018 15:00:28 +0100
Message-ID: <5AF5A1FC.5000900@hisilicon.com>
References: <1525101342-27120-1-git-send-email-john.garry@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525101342-27120-1-git-send-email-john.garry@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Garry <john.garry@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, xuwei5@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi John,

On 2018/4/30 16:15, John Garry wrote:
> This series introduces 3 patches, to enable the
> HISILICON_LPC config in the arm64 defconfig
> and also add the relevant LPC DT entries.
> 
> For hip06 UART support, we depend on this patch:
> https://lkml.org/lkml/2018/4/27/258
> 
> John Garry (3):
>   arm64: defconfig: Enable HISILICON_LPC
>   arm64: dts: hisi: Enable Hisi LPC node for hip06
>   arm64: dts: hisi: Enable Hisi LPC node for hip07
> 
>  arch/arm64/boot/dts/hisilicon/hip06-d03.dts |  8 ++++++++
>  arch/arm64/boot/dts/hisilicon/hip06.dtsi    | 21 +++++++++++++++++++++
>  arch/arm64/boot/dts/hisilicon/hip07-d05.dts |  4 ++++
>  arch/arm64/boot/dts/hisilicon/hip07.dtsi    | 14 ++++++++++++++
>  arch/arm64/configs/defconfig                |  1 +
>  5 files changed, 48 insertions(+)
> 

Series applied into the hisilicon tree.
Thanks!

BR,
Wei
