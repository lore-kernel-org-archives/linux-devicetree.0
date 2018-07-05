From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH] arm64: dts: marvell: fix CP110 ICU node size
Date: Thu, 05 Jul 2018 15:26:16 +0200
Message-ID: <87k1q924qv.fsf@bootlin.com>
References: <20180705123449.6052-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180705123449.6052-1-miquel.raynal@bootlin.com> (Miquel
        Raynal's message of "Thu, 5 Jul 2018 14:34:49 +0200")
Sender: stable-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: stable@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Nadav Haklai <nadavh@marvell.com>
List-Id: devicetree@vger.kernel.org

Hi Miquel,
 
 On jeu., juil. 05 2018, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> commit 2f872ddcdb1e8e2186162616cea4581b8403849d upstream.
>
> ICU size in CP110 is not 0x10 but at least 0x440 bytes long (from the
> specification).
>
> Fixes: 6ef84a827c37 ("arm64: dts: marvell: enable GICP and ICU on Armada 7K/8K")
> Cc: stable@vger.kernel.org # 4.14.x
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

See
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2f872ddcdb1e8e2186162616cea4581b8403849d

it is already in the linux kernel.

Gregory

> ---
>
> Backport to 4.14 stable tree: the original patch did not applied
> because of the effort of DT de-duplication that merged two files in one.
>
>
>  arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi | 2 +-
>  arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
> index 9a7b63cd63a3..7c19f32d0f44 100644
> --- a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
> @@ -169,7 +169,7 @@
>  
>  			cpm_icu: interrupt-controller@1e0000 {
>  				compatible = "marvell,cp110-icu";
> -				reg = <0x1e0000 0x10>;
> +				reg = <0x1e0000 0x440>;
>  				#interrupt-cells = <3>;
>  				interrupt-controller;
>  				msi-parent = <&gicp>;
> diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
> index faf28633a309..150e97a1dfea 100644
> --- a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
> @@ -169,7 +169,7 @@
>  
>  			cps_icu: interrupt-controller@1e0000 {
>  				compatible = "marvell,cp110-icu";
> -				reg = <0x1e0000 0x10>;
> +				reg = <0x1e0000 0x440>;
>  				#interrupt-cells = <3>;
>  				interrupt-controller;
>  				msi-parent = <&gicp>;
> -- 
> 2.14.1
>

-- 
Gregory Clement, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
