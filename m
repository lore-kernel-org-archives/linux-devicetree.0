From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCHv7][ 2/6] video: imxfb: Also add pwmr for the device tree.
Date: Thu, 24 Oct 2013 11:13:06 +0100
Message-ID: <20131024101306.C8882C4039D@trevor.secretlab.ca>
References: <1382605103-9595-1-git-send-email-denis@eukrea.com>
 <1382605103-9595-2-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0847574885754723211=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1382605103-9595-2-git-send-email-denis@eukrea.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sascha Hauer <kernel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Denis Carikli <denis@eukrea.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Shawn Guo <shawn.guo@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============0847574885754723211==
Content-Type: text/plain

On Thu, 24 Oct 2013 10:58:19 +0200, Denis Carikli <denis@eukrea.com> wrote:
> pwmr has to be set to get the imxfb backlight work,
> though pwmr was only configurable trough the platform data.
> 
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
> Cc: Eric Bénard <eric@eukrea.com>
> Signed-off-by: Denis Carikli <denis@eukrea.com>
> Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

For binding:
Acked-by: Grant Likely <grant.likely@linaro.org>

> ---
>  .../devicetree/bindings/video/fsl,imx-fb.txt       |    3 +++
>  drivers/video/imxfb.c                              |    2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/video/fsl,imx-fb.txt b/Documentation/devicetree/bindings/video/fsl,imx-fb.txt
> index 46da08d..ac457ae 100644
> --- a/Documentation/devicetree/bindings/video/fsl,imx-fb.txt
> +++ b/Documentation/devicetree/bindings/video/fsl,imx-fb.txt
> @@ -17,6 +17,9 @@ Required nodes:
>  Optional properties:
>  - fsl,dmacr: DMA Control Register value. This is optional. By default, the
>  	register is not modified as recommended by the datasheet.
> +- fsl,pwmr:  LCDC PWM Contrast Control Register value. That property is
> +	optional, but defining it is necessary to get the backlight working. If that
> +	property is ommited, the register is zeroed.
>  - fsl,lscr1: LCDC Sharp Configuration Register value.
>  
>  Example:
> diff --git a/drivers/video/imxfb.c b/drivers/video/imxfb.c
> index 4bf3837..f09372d 100644
> --- a/drivers/video/imxfb.c
> +++ b/drivers/video/imxfb.c
> @@ -833,6 +833,8 @@ static int imxfb_init_fbinfo(struct platform_device *pdev)
>  
>  		of_property_read_u32(np, "fsl,dmacr", &fbi->dmacr);
>  
> +		of_property_read_u32(np, "fsl,pwmr", &fbi->pwmr);
> +
>  		/* These two function pointers could be used by some specific
>  		 * platforms. */
>  		fbi->lcd_power = NULL;
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



--===============0847574885754723211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0847574885754723211==--
