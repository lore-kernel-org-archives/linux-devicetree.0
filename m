From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCHv3 0/2] Variscite DART-6UL SoM support
Date: Thu, 13 Jun 2019 09:38:32 +0800
Message-ID: <20190613013830.GC20747@dragon>
References: <1559839624-12286-1-git-send-email-oliver.graute@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1559839624-12286-1-git-send-email-oliver.graute@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oliver Graute <oliver.graute@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, narmstrong@baylibre.com, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 06, 2019 at 06:47:00PM +0200, Oliver Graute wrote:
> Need feedback to the following patches which adds support for a DART-6UL Board
> 
> Product Page: https://www.variscite.com/product/evaluation-kits/dart-6ul-kits
> 
> Oliver Graute (2):
>   ARM: dts: imx6ul: Add Variscite DART-6UL SoM support
>   ARM: dts: Add support for i.MX6 UltraLite DART Variscite Customboard

It's already v3?  I did not find previous versions.  What's changed
since previous versions?

Shawn

> 
>  arch/arm/boot/dts/Makefile                         |   1 +
>  .../boot/dts/imx6ul-imx6ull-var-dart-common.dtsi   | 458 +++++++++++++++++++++
>  arch/arm/boot/dts/imx6ul-var-6ulcustomboard.dts    | 209 ++++++++++
>  3 files changed, 668 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6ul-imx6ull-var-dart-common.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6ul-var-6ulcustomboard.dts
> 
> -- 
> 2.7.4
> 
