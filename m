From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCHv13][ 2/4] video: imxfb: Also add pwmr for the device tree.
Date: Fri, 6 Dec 2013 08:05:25 +0100
Message-ID: <20131206070525.GV24559@pengutronix.de>
References: <1386258219-26437-1-git-send-email-denis@eukrea.com>
 <1386258219-26437-2-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1386258219-26437-2-git-send-email-denis@eukrea.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Denis Carikli <denis@eukrea.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, Eric =?iso-8859-15?Q?B=E9nard?= <eric@eukrea.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 05, 2013 at 04:43:37PM +0100, Denis Carikli wrote:
> pwmr has to be set to get the imxfb backlight work,
> though pwmr was only configurable trough the platform data.
> =

> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: devicetree@vger.kernel.org
> Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Eric B=E9nard <eric@eukrea.com>
> Signed-off-by: Denis Carikli <denis@eukrea.com>
> Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> Acked-by: Grant Likely <grant.likely@linaro.org>
> ---
>  .../devicetree/bindings/video/fsl,imx-fb.txt       |    3 +++
>  drivers/video/imxfb.c                              |    2 ++
>  2 files changed, 5 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/video/fsl,imx-fb.txt b/Doc=
umentation/devicetree/bindings/video/fsl,imx-fb.txt
> index 46da08d..ac457ae 100644
> --- a/Documentation/devicetree/bindings/video/fsl,imx-fb.txt
> +++ b/Documentation/devicetree/bindings/video/fsl,imx-fb.txt
> @@ -17,6 +17,9 @@ Required nodes:
>  Optional properties:
>  - fsl,dmacr: DMA Control Register value. This is optional. By default, t=
he
>  	register is not modified as recommended by the datasheet.
> +- fsl,pwmr:  LCDC PWM Contrast Control Register value. That property is
> +	optional, but defining it is necessary to get the backlight working. If=
 that
> +	property is ommited, the register is zeroed.

Why isn't this implemented as a backlight driver? Static devicetree
provided values is very limiting.

Sascha

-- =

Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
