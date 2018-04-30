From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH 11/17] arm64: marvell: enable SEI driver
Date: Mon, 30 Apr 2018 15:01:26 +0200
Message-ID: <87in88c0gp.fsf@bootlin.com>
References: <20180421135537.24716-1-miquel.raynal@bootlin.com>
 <20180421135537.24716-12-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180421135537.24716-12-miquel.raynal@bootlin.com> (Miquel
 Raynal's message of "Sat, 21 Apr 2018 15:55:31 +0200")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Hanna Hawa <hannah@marvell.com>, Haim Boot <hayim@marvell.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Miquel,
 
 On sam., avril 21 2018, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Enable the newly introduced Marvell SEI driver for the 64-bit Marvell
> EBU platforms.
>
> Suggested-by: Haim Boot <hayim@marvell.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Once the driver will be accepted, I will apply this patch on mvebu/arm64

Thanks,

Gregory


> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 2b1535cdeb7c..dc3c42938051 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -121,6 +121,7 @@ config ARCH_MVEBU
>  	select MVEBU_ICU
>  	select MVEBU_ODMI
>  	select MVEBU_PIC
> +	select MVEBU_SEI
>  	select OF_GPIO
>  	select PINCTRL
>  	select PINCTRL_ARMADA_37XX
> -- 
> 2.14.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
