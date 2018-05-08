From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v9 06/12] ARM: smp: Add initialization of CNTVOFF
Date: Tue, 8 May 2018 09:06:26 +0100
Message-ID: <0a377a75-d99c-b00c-ec96-bf5a7daf721a@arm.com>
References: <20180504190545.5114-1-mylene.josserand@bootlin.com>
 <20180504190545.5114-7-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180504190545.5114-7-mylene.josserand@bootlin.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Myl=c3=a8ne_Josserand?= <mylene.josserand@bootlin.com>, linux@armlinux.org.uk, maxime.ripard@bootlin.com, wens@csie.org, mark.rutland@arm.com, robh+dt@kernel.org, horms@verge.net.au, geert@linux-m68k.org, magnus.damm@gmail.com
Cc: f.fainelli@gmail.com, opendmb@gmail.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, clabbe.montjoie@gmail.com, quentin.schulz@bootlin.com, thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/05/18 20:05, Mylène Josserand wrote:
> The CNTVOFF register from arch timer is uninitialized.
> It should be done by the bootloader but it is currently not the case,
> even for boot CPU because this SoC is booting in secure mode.
> It leads to an random offset value meaning that each CPU will have a
> different time, which isn't working very well.
> 
> Add assembly code used for boot CPU and secondary CPU cores to make
> sure that the CNTVOFF register is initialized. Because this code can
> be used by different platforms, add this assembly file in ARM's common
> folder.
> 
> Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny...
