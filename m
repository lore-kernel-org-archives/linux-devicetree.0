From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 06/13] ARM: dts: omap3-gta04: Enable power-off using
 twl4030
Date: Thu, 22 Jan 2015 13:37:48 -0800
Message-ID: <20150122213748.GX7718@atomide.com>
References: <1421959099-28319-1-git-send-email-marek@goldelico.com>
 <1421959099-28319-7-git-send-email-marek@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1421959099-28319-7-git-send-email-marek@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
To: Marek Belisko <marek@goldelico.com>
Cc: bcousson@baylibre.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hns@goldelico.com, neilb@suse.de
List-Id: devicetree@vger.kernel.org

* Marek Belisko <marek@goldelico.com> [150122 12:42]:
> From: "H. Nikolaus Schaller" <hns@goldelico.com>
> 
> Enabled poweroff through PMIC on GTA04.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/arm/boot/dts/omap3-gta04.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi b/arch/arm/boot/dts/omap3-gta04.dtsi
> index 0265474..b56c85b 100644
> --- a/arch/arm/boot/dts/omap3-gta04.dtsi
> +++ b/arch/arm/boot/dts/omap3-gta04.dtsi
> @@ -209,6 +209,11 @@
>  			codec {
>  			};
>  		};
> +
> +		twl_power: power {
> +			compatible = "ti,twl4030-power";
> +			ti,use_poweroff;
> +		};
>  	};
>  };
>  

No need to change this patch, but you may want to get things working
with ti,twl4030-power-idle-osc-off for PM if you're running it on
batteries :)

Regards,

Tony
