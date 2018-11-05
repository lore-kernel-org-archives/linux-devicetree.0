From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] ARM: dts: replace gpio-key,wakeup with wakeup-source
 property
Date: Mon, 5 Nov 2018 13:40:53 +0100
Message-ID: <71a26287-1c64-ba4a-50da-d058d8ab0bb6@xilinx.com>
References: <20181024114540.5196-1-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181024114540.5196-1-sudeep.holla@arm.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michal Simek <michal.simek@xilinx.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Peter Rosin <peda@axentia.se>
List-Id: devicetree@vger.kernel.org

On 24. 10. 18 13:45, Sudeep Holla wrote:
> Most of the legacy "gpio-key,wakeup" and "enable-sdio-wakeup" boolean
> properties are already replaced with "wakeup-source". However few
> occurrences of old property has popped up again, probably from the
> remnants in downstream trees.
> 
> This patch replaces the legacy properties with the unified
> "wakeup-source" property.
> 
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 2 +-
>  arch/arm/boot/dts/at91-wb45n.dts            | 2 +-
>  arch/arm/boot/dts/at91-wb50n.dts            | 4 ++--
>  arch/arm/boot/dts/imx6q-pistachio.dts       | 2 +-
>  arch/arm/boot/dts/imx6sll-evk.dts           | 2 +-
>  arch/arm/boot/dts/zynq-zturn.dts            | 2 +-

Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
