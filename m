From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v3 00/10] arm64: dts: hi3660: add more device nodes
Date: Tue, 15 Aug 2017 14:36:05 +0100
Message-ID: <5992F8C5.1030109@hisilicon.com>
References: <20170814095049.27701-1-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170814095049.27701-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guodong Xu <guodong.xu@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, keescook@chromium.org, anton@enomsg.org, ccross@android.com, tony.luck@intel.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Guodong,

On 2017/8/14 10:50, Guodong Xu wrote:
> This patchset adds more device nodes for hi3660 and hikey960, including:
>  - cpu idle states
>  - L2 cache
>  - PMU
>  - OP-TEE
>  - reboot
>  - pstore
>  - DMA
>  - watchdog
> 
> Patch 7 fixes an issue in mmc nodes, by adding 'reset'
> Patch 8 change bluetooth uart max-speed to 3Mbps
> 
> HiKey960 is one of 96boards. For details information about it, please
> refer to [1].
> 
> ===
> Major changes in v3:
>  - update commit message of patch 1, as suggested by Daniel Lezcano
>  - add patch 10 for watchdog bindings
> 
> Major changes in v2:
>  - add patch 8 to change bluetooth uart max-speed to 3Mbps
>  - add patch 9 for DMA node.
> 
> [1] https://github.com/96boards/documentation/tree/master/ConsumerEdition/HiKey960
> 
> Guodong Xu (4):
>   arm64: dts: hikey960: Add support for syscon-reboot-mode
>   arm64: dts: hikey960: Add pstore support
>   arm64: dts: hi3660: Reset the mmc hosts
>   arm64: dts: hikey960: change bluetooth uart max-speed to 3mbps
> 
> Leo Yan (3):
>   arm64: dts: hi3660: enable idle states
>   arm64: dts: hi3660: add L2 cache topology
>   arm64: dts: hi3660: enable watchdog
> 
> Victor Chong (1):
>   arm64: dts: hikey960: Add optee node
> 
> Wang Ruyi (1):
>   arm64: dts: hi3660: add bindings for DMA
> 
> YiPing Xu (1):
>   arm64: dts: hi3660: add pmu dt node for hi3660
> 
>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts |  37 +++++-
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi         | 130 ++++++++++++++++++++++
>  2 files changed, 166 insertions(+), 1 deletion(-)
> 

Thanks!
Series applied to the hisilicon dt tree.

Best Regards,
Wei
