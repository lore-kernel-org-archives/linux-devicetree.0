From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 06/18] ARM: mvebu: a390: add missing compatibility string and add missing bracket
Date: Wed, 27 Jul 2016 18:13:52 +0200
Message-ID: <871t2fm533.fsf@free-electrons.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
	<1469105055-25181-7-git-send-email-jaz@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1469105055-25181-7-git-send-email-jaz@semihalf.com> (Grzegorz
	Jaszczyk's message of "Thu, 21 Jul 2016 14:44:02 +0200")
Sender: stable-owner@vger.kernel.org
To: Grzegorz Jaszczyk <jaz@semihalf.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, jason@lakedaemon.net, andrew@lunn.ch, sebastian.hesselbarth@gmail.com, linux@armlinux.org.uk, thomas.petazzoni@free-electrons.com, mw@semihalf.com, alior@marvell.com, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Grzegorz,
 
 On jeu., juil. 21 2016, Grzegorz Jaszczyk <jaz@semihalf.com> wrote:

> The armada-390.dtsi was broken since the first patch which adds Device Tree
> files for Armada 39x SoC was introduced.
>
> Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
> Cc: <stable@vger.kernel.org> # 4.0+
> Fixes 538da83 ("ARM: mvebu: add Device Tree files for Armada 39x SoC and board")

Change the title prefix to "ARM: dts: mvebu:". Alos usually we use
armada-390 instead of a390 to match the file name.

Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Thanks,

Gregory
> ---
>  arch/arm/boot/dts/armada-390.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/dts/armada-390.dtsi b/arch/arm/boot/dts/armada-390.dtsi
> index 094e39c..6cd18d8 100644
> --- a/arch/arm/boot/dts/armada-390.dtsi
> +++ b/arch/arm/boot/dts/armada-390.dtsi
> @@ -47,6 +47,8 @@
>  #include "armada-39x.dtsi"
>  
>  / {
> +	compatible = "marvell,armada390";
> +
>  	soc {
>  		internal-regs {
>  			pinctrl@18000 {
> @@ -54,4 +56,5 @@
>  				reg = <0x18000 0x20>;
>  			};
>  		};
> +	};
>  };
> -- 
> 1.8.3.1
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
