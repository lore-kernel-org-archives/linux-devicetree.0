From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v5 5/6] arm64: marvell: enable ICU and GICP drivers
Date: Wed, 21 Jun 2017 17:50:47 +0200
Message-ID: <87injp1grs.fsf@free-electrons.com>
References: <20170621132917.14187-1-thomas.petazzoni@free-electrons.com>
 <20170621132917.14187-6-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170621132917.14187-6-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 21 Jun 2017 15:29:16 +0200")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Yehuda Yitschak <yehuday@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Hanna Hawa <hannah@marvell.com>, =?utf-8?Q?Miqu?= =?utf-8?Q?=C3=A8l?= Raynal <miquel.raynal@free-electrons.com>, linux-kernel@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Antoine Tenart <antoine.tenart@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Thomas,
 
 On mer., juin 21 2017, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> This commit enables the newly introduced Marvell GICP and ICUs driver
> for the 64-bit Marvell EBU platforms.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: Marc Zyngier <marc.zyngier@arm.com>

Applied on mvebu/arm64

Thanks,

Gregory


> ---
>  arch/arm64/Kconfig.platforms | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 4afcffc..bf3b505 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -106,6 +106,8 @@ config ARCH_MVEBU
>  	select ARMADA_AP806_SYSCON
>  	select ARMADA_CP110_SYSCON
>  	select ARMADA_37XX_CLK
> +	select MVEBU_GICP
> +	select MVEBU_ICU
>  	select MVEBU_ODMI
>  	select MVEBU_PIC
>  	help
> -- 
> 2.9.4
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
