From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 2/3] ARM: berlin: add broken-cd and set bus width for
 eMMC in Marvell DMP DT
Date: Wed, 07 Jan 2015 15:22:50 +0100
Message-ID: <54AD413A.8030208@gmail.com>
References: <1420016272-6789-1-git-send-email-jszhang@marvell.com> <1420016272-6789-3-git-send-email-jszhang@marvell.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1420016272-6789-3-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>, mturquette@linaro.org, sboyd@codeaurora.org, alexandre.belloni@free-electrons.com, antoine.tenart@free-electrons.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 31.12.2014 09:57, Jisheng Zhang wrote:
> There's no card detection for the eMMC, so this patch adds the missing
> broken-cd property. This patch also sets bus width as 8 to add
> MMC_CAP_8_BIT_DATA in the Host capabilities.
>
> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
> Cc: stable@vger.kernel.org # 3.16+

Applied to berlin/fixes.

Thanks!

> ---
>   arch/arm/boot/dts/berlin2q-marvell-dmp.dts | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> index 28e7e20..a98ac1b 100644
> --- a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> +++ b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> @@ -65,6 +65,8 @@
>   };
>
>   &sdhci2 {
> +	broken-cd;
> +	bus-width = <8>;
>   	non-removable;
>   	status = "okay";
>   };
>
