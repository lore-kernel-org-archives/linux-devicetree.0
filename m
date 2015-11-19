From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH RESEND] arm: dts: berlin2q-marvell-dmp: remove broken-cd
 from eMMC node
Date: Thu, 19 Nov 2015 21:21:06 +0100
Message-ID: <564E2F32.40202@gmail.com>
References: <1447670617-7778-1-git-send-email-jszhang@marvell.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447670617-7778-1-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 16.11.2015 11:43, Jisheng Zhang wrote:
> The eMMC is non-removable so is marked with the non-removable DT
> property to avoid having to redetect it after a suspend/resume.
> 
> But it also has the broken-cd property which is wrong since only
> one of the DT properties for card detection should be used
> 
> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>

Applied to berlin64/dt.

Thanks!

> ---
>  arch/arm/boot/dts/berlin2q-marvell-dmp.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> index da28c97..cdcf89b 100644
> --- a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> +++ b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> @@ -94,7 +94,6 @@
>  };
>  
>  &sdhci2 {
> -	broken-cd;
>  	bus-width = <8>;
>  	non-removable;
>  	status = "okay";
> 
