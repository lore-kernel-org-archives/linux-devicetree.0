From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: Re: [PATCH v2] ARM: Exynos4: Add cpu-offset property in gic device
 tree node
Date: Tue, 31 Jan 2012 17:41:52 +0100
Message-ID: <4F2819D0.7090002@samsung.com>
References: <1328023789-4672-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1328023789-4672-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On 31.01.2012 16:29, Thomas Abraham wrote:
> Commit db0d4db22a78 ('ARM: gic: allow GIC to support non-banked setups)
> requires a cpu-offset property to be specified for non-banked gic
> controllers, which is the case for Exynos4.
>
> Reported-by: Karol Lewandowski<k.lewandowski@samsung.com>

( Minor note - my email address lacks 'i' at the end, i.e. it's
   k.lewandowsk@ :)

> Signed-off-by: Thomas Abraham<thomas.abraham@linaro.org>
> ---
> This patch solves the issue of boot failure with SMP enabled kernel for
> Exynos4 device tree enabled machine.

Tested-by: Karol Lewandowski <k.lewandowsk@samsung.com>

Thanks!
