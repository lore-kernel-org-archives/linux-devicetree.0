From: Xu Wei <xuwei04@gmail.com>
Subject: Re: [PATCH v2 RESEND 2/4] arm64: Kconfig: select sp804 timer for
 ARCH_HISI
Date: Mon, 18 Apr 2016 16:14:53 +0100
Message-ID: <5714F9ED.3020907@gmail.com>
References: <1453373630-4693-1-git-send-email-leo.yan@linaro.org> <1453373630-4693-3-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453373630-4693-3-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yiping Xu <xuyiping@hisilicon.com>, Yu Dongbin <yudongbin@hisilicon.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Chen Feng <puck.chen@hisilicon.com>, Tyler Baker <tyler.baker@linaro.org>, Bintian Wang <bintian.wang@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>, Wei Xu <xuwei5@hisilicon.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Leo,

On 21/01/16 10:53, Leo Yan wrote:
> Select sp804 timer for ARCH_HISI, which is used as broadcast timer.
>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>   arch/arm64/Kconfig.platforms | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 4043c35..94c410d 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -36,6 +36,7 @@ config ARCH_LAYERSCAPE
>   
>   config ARCH_HISI
>   	bool "Hisilicon SoC Family"
> +	select ARM_TIMER_SP804
>   	help
>   	  This enables support for Hisilicon ARMv8 SoC family
>   
Just applied this to the hisilicon soc tree.
The others have been picked up from Guodong's patch set.
Thanks!

Best Regards,
Wei
