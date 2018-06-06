From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: allwinner: a64: Add PWM controllers
Date: Wed, 6 Jun 2018 21:32:26 +0200
Message-ID: <20180606193226.3u7cr2dva63aupm7@flea>
References: <20180606051702.6478-1-anarsoul@gmail.com>
 <20180606051702.6478-3-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180606051702.6478-3-anarsoul@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 05, 2018 at 10:17:01PM -0700, Vasily Khoruzhick wrote:
> From: Andre Przywara <andre.przywara@arm.com>
> 
> The Allwinner A64 SoC features two PWM controllers, which are fully
> compatible to the one used in the A13 and H3 chips.
> 
> Add the nodes for the devices (one for the "normal" PWM, the other for
> the one in the CPUS domain) and the pins their outputs are connected to.
> 
> On the A64 the "normal" PWM is muxed together with one of the MDIO pins
> used to communicate with the Ethernet PHY, so it won't be usable on many
> boards. But the Pinebook laptop uses this pin for controlling the LCD
> backlight.
> 
> On Pine64 the CPUS PWM pin however is routed to the "RPi2" header,
> at the same location as the PWM pin on the RaspberryPi.
> 
> Tested on Pinebook and Teres-I
> 
> [vasily: fixed comment message as requested by Stefan Bruens, added default
>          muxing options to pwm and r_pwm nodes]
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> Tested-by: Harald Geyer <harald@ccbib.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
