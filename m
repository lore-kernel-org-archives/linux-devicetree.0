From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH 0/5] add DTS for hi6220 and HiKey
Date: Sat, 27 Feb 2016 18:13:01 +0800
Message-ID: <56D176AD.1080703@hisilicon.com>
References: <1455859148-29098-1-git-send-email-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455859148-29098-1-git-send-email-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guodong Xu <guodong.xu@linaro.org>, mark.rutland@arm.com, robh@kernel.org, grant.likely@secretlab.ca
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kong.kongxinwei@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi Guodong,

On 19/02/2016 13:19, Guodong Xu wrote:
> This patchset include more dts changes for hi6220 SoC and HiKey board.
> 
> Patch 1 adds pinctrl to uart ports in SoC and enables them for HiKey board.
> Patch 2 adds gpio LEDs device nodes.
> Patch 3 adds dwmmc nodes description for hi6220. It refers to two LDO's
> which are defined in regulator patchsets which pending on review:
> [PATCH v8 5/5] arm64: dts: hisilicon: Add hi655x pmic dts node
> http://thread.gmane.org/gmane.linux.kernel/2151688
> 
> Patch 4 adds resets property into dwmmc nodes.
> Patch 5 adds wifi device nodes (TI's wl1835) for HiKey board.
> 
> Guodong Xu (4):
>   arm64: dts: hi6220: add pinctrl for uarts and enable them
>   arm64: dts: add LED nodes for hi6220-hikey
>   arm64: dts: hi6220: add resets property into dwmmc nodes
>   arm64: dts: add wifi nodes support for hi6220-hikey
> 
> Xinwei Kong (1):
>   arm64: dts: add dwmmc nodes for hi6220
> 
>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 81 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi      | 66 +++++++++++++++++++++
>  2 files changed, 147 insertions(+)
> 


Applied all the patches into the hisilicon soc tree.
Thanks!

Best Regards,
Wei
