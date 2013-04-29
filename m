From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH RFC] media: i2c: mt9p031: add OF support
Date: Mon, 29 Apr 2013 13:17:47 +0200
Message-ID: <4939259.oneuZqWHcM@avalon>
References: <1367222401-26649-1-git-send-email-prabhakar.csengg@gmail.com>
 <20130429082128.GG32299@pengutronix.de>
 <CA+V-a8uM61Rzqa2y9b6FZVin2FWHg6o9kO7fqHupqq2dcBT3SA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CA+V-a8uM61Rzqa2y9b6FZVin2FWHg6o9kO7fqHupqq2dcBT3SA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, LMML <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Prabhakar,

On Monday 29 April 2013 16:41:07 Prabhakar Lad wrote:
> On Mon, Apr 29, 2013 at 1:51 PM, Sascha Hauer wrote:
> <Snip>
> 
> >> +Required Properties :
> >> +- compatible : value should be either one among the following
> >> +     (a) "aptina,mt9p031-sensor" for mt9p031 sensor
> >> +     (b) "aptina,mt9p031m-sensor" for mt9p031m sensor
> >> +
> >> +- ext_freq: Input clock frequency.
> >> +
> >> +- target_freq:  Pixel clock frequency.
> > 
> > For devicetree properties '-' is preferred over '_'. Most devicetree
> > bindings we already have suggest that we shoud use 'frequency' and no
> > abbreviation. probably 'clock-frequency' should be used.
> 
> Yeah i missed it..  following is the proposed bindings,
> let me know if something is wrong with it.
> 
> Required Properties :
> - compatible : value should be either one among the following
> 	(a) "aptina,mt9p031-sensor" for mt9p031 sensor
> 	(b) "aptina,mt9p031m-sensor" for mt9p031m sensor

What about just "aptina,mt9p031" and "aptina,mt9p031m" ?

> - input-clock-frequency: Input clock frequency.
> 
> - pixel-clock-frequency: Pixel clock frequency.
> 
> Optional Properties :
> -gpio-reset: Chip reset GPIO (If not specified defaults to -1)

You can remove the "(If not specified defaults to -1)".

> Example:
> 
> i2c0@1c22000 {
> 	...
> 	...
> 	mt9p031@5d {
> 		compatible = "aptina,mt9p031-sensor";
> 		reg = <0x5d>;
> 
> 		port {
> 			mt9p031_1: endpoint {
> 				input-clock-frequency = <6000000>;
> 				pixel-clock-frequency = <96000000>;
> 				gpio-reset = <&gpio3 30 0>;

At least the reset GPIO should be a property of the mt9p031 node, not the 
endpoint.

> 			};
> 		};
> 	};
> 	...
> };
> 
> >> +
> >> +Optional Properties :
> >> +-reset: Chip reset GPIO (If not specified defaults to -1)
> > 
> > gpios must be specified as phandles, see of_get_named_gpio().
> 
> Fixed it.
> 
> >> +
> >> +Example:
> >> +
> >> +i2c0@1c22000 {
> >> +     ...
> >> +     ...
> >> +     mt9p031@5d {
> >> +             compatible = "aptina,mt9p031-sensor";
> >> +             reg = <0x5d>;
> >> +
> >> +             port {
> >> +                     mt9p031_1: endpoint {
> >> +                             ext_freq = <6000000>;
> >> +                             target_freq = <96000000>;
> >> +                     };
> >> +             };
> >> +     };
> >> +     ...
> >> +};
> >> \ No newline at end of file
> >> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> >> index 28cf95b..66078a6 100644
> >> --- a/drivers/media/i2c/mt9p031.c
> >> +++ b/drivers/media/i2c/mt9p031.c
> >> @@ -23,11 +23,13 @@
> >>  #include <linux/regulator/consumer.h>
> >>  #include <linux/slab.h>
> >>  #include <linux/videodev2.h>
> >> +#include <linux/of_device.h>

Please keep headers alphabetically sorted.

> >>  #include <media/mt9p031.h>
> >>  #include <media/v4l2-chip-ident.h>
> >>  #include <media/v4l2-ctrls.h>
> >>  #include <media/v4l2-device.h>
> >> +#include <media/v4l2-of.h>
> >>  #include <media/v4l2-subdev.h>
> >>  
> >>  #include "aptina-pll.h"
> >> 
> >> @@ -928,10 +930,66 @@ static const struct v4l2_subdev_internal_ops
> >> mt9p031_subdev_internal_ops = {>> 
> >>   * Driver initialization and probing
> >>   */
> >> 
> >> +#if defined(CONFIG_OF)
> >> +static const struct of_device_id mt9p031_of_match[] = {
> >> +     {.compatible = "aptina,mt9p031-sensor", },
> >> +     {.compatible = "aptina,mt9p031m-sensor", },
> >> +     {},
> >> +};
> >> +MODULE_DEVICE_TABLE(of, mt9p031_of_match);
> >> +
> >> +static struct mt9p031_platform_data
> >> +     *mt9p031_get_pdata(struct i2c_client *client)

Please split the line after the * and align the function name on the left:

static struct mt9p031_platform_data *
mt9p031_get_pdata(struct i2c_client *client)

> >> +
> >> +{
> >> +     if (!client->dev.platform_data && client->dev.of_node) {
> > 
> > Just because the Kernel is compiled with devicetree support does not
> > necessarily mean you actually boot from devicetree. You must still
> > handle platform data properly.
> 
> OK. which one should be given higher preference  client->dev.of_node
> or the client->dev.platform_data ?

of_node should have a higher priority.

-- 
Regards,

Laurent Pinchart
