From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 0/3] devicetree includes for i.MX5 clocks
Date: Thu, 14 Nov 2013 11:13:13 +0800
Message-ID: <20131114031309.GB17819@S2101-09.ap.freescale.net>
References: <1384369879-11878-1-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1384369879-11878-1-git-send-email-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 13, 2013 at 08:11:16PM +0100, Lucas Stach wrote:
> This series introduces devicetree includes for the i.MX5
> SoC clocks. It makes devicetrees easier to read for humans and
> less error prone.
> 
> The series is spun against Shawns for-next branch, as there are
> already some clock related patches in there. I would like to
> see those patches sitting in -next for a while.
> 
> Lucas Stach (3):
>   clk: imx5: introduce DT includes for clock provider
>   ARM: imx53: use clock defines in DTS files
>   ARM: imx51: use clock defines in DTS files

You need one more patch to cover imx50 now.

Shawn

> 
>  .../devicetree/bindings/clock/imx5-clock.txt       | 196 +----
>  arch/arm/boot/dts/imx51.dtsi                       |  98 ++-
>  arch/arm/boot/dts/imx53-m53evk.dts                 |   2 +-
>  arch/arm/boot/dts/imx53-mba53.dts                  |   2 +-
>  arch/arm/boot/dts/imx53-qsb.dts                    |   2 +-
>  arch/arm/boot/dts/imx53.dtsi                       | 122 ++--
>  arch/arm/mach-imx/clk-imx51-imx53.c                | 786 ++++++++++-----------
>  include/dt-bindings/clock/imx5-clock.h             | 202 ++++++
>  8 files changed, 718 insertions(+), 692 deletions(-)
>  create mode 100644 include/dt-bindings/clock/imx5-clock.h
> 
> -- 
> 1.8.4.2
> 
