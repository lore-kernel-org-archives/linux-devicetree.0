From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v3 2/6] ARM: dts: rockchip: use the same pmu node name as before
Date: Sat, 11 Oct 2014 19:43:08 +0200
Message-ID: <1817294.fFByve75fK@phil>
References: <1412976370-14468-1-git-send-email-kever.yang@rock-chips.com> <1412976370-14468-3-git-send-email-kever.yang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412976370-14468-3-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kever Yang <kever.yang@rock-chips.com>
Cc: dianders@chromium.org, sonnyrao@chromium.org, addy.ke@rock-chips.com, cf@rock-chips.com, xjq@rock-chips.com, hj@rock-chips.com, huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 10. Oktober 2014, 14:26:06 schrieb Kever Yang:
> We use the "rockchip,rk3066-pmu" for rk3288 instead of creat
> a new one.

No, it should stay keep the rk3288-pmu compatible. While the 4 powerdomains 
for the cores are similar, the pmu in general is very much specific to the 
rk3288.

Also, this renaming of the pmu compatible only is a workaround for the 
underlying problem, that your tree is probably missing the early syscon 
support and there falling back to mapping the node directly.

If you apply the patch 
	[PATCH v7] mfd: syscon: Decouple syscon interface from platform devices
to your tree, it will work as expected by really using the pmu reference from 
patch3 - it did for me - making this patch unnecessary.


Heiko

> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v3:
> - add this patch in version 3
> 
> Changes in v2: None
> 
>  arch/arm/boot/dts/rk3288.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 874e66d..06f39be 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -440,7 +440,7 @@
>  	};
> 
>  	pmu: power-management@ff730000 {
> -		compatible = "rockchip,rk3288-pmu", "syscon";
> +		compatible = "rockchip,rk3066-pmu", "syscon";
>  		reg = <0xff730000 0x100>;
>  	};
