From: Troy Kisky <troy.kisky@boundarydevices.com>
Subject: Re: [PATCHv4][ 3/7] staging: imx-drm: Add RGB666 support for parallel
 display.
Date: Wed, 13 Nov 2013 11:43:44 -0700
Message-ID: <5283C860.3020103@boundarydevices.com>
References: <1384334603-14208-1-git-send-email-denis@eukrea.com>
 <1384334603-14208-3-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1384334603-14208-3-git-send-email-denis@eukrea.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Denis Carikli <denis@eukrea.com>, Shawn Guo <shawn.guo@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, driverdev-devel@linuxdriverproject.org, Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>, linux-media@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, Mauro Carvalho Chehab <m.chehab@samsung.com>
List-Id: devicetree@vger.kernel.org

On 11/13/2013 2:23 AM, Denis Carikli wrote:
>   
> +	/* rgb666 */
> +	ipu_dc_map_clear(priv, IPU_DC_MAP_RGB666);
> +	ipu_dc_map_config(priv, IPU_DC_MAP_RGB666, 2, 17, 0xfc); /* red */
> +	ipu_dc_map_config(priv, IPU_DC_MAP_RGB666, 1, 11, 0xfc); /* green */
> +	ipu_dc_map_config(priv, IPU_DC_MAP_RGB666, 0, 5, 0xfc); /* blue */
> +
>   	return 0;
>   }
>   
>

Since,  rgb24 and bgr24 reverse the byte numbers
/* rgb24 */
         ipu_dc_map_clear(priv, IPU_DC_MAP_RGB24);
         ipu_dc_map_config(priv, IPU_DC_MAP_RGB24, 0, 7, 0xff); /* blue */
         ipu_dc_map_config(priv, IPU_DC_MAP_RGB24, 1, 15, 0xff); /* green */
         ipu_dc_map_config(priv, IPU_DC_MAP_RGB24, 2, 23, 0xff); /* red */

/* bgr24 */
         ipu_dc_map_clear(priv, IPU_DC_MAP_BGR24);
         ipu_dc_map_config(priv, IPU_DC_MAP_BGR24, 2, 7, 0xff); /* red */
         ipu_dc_map_config(priv, IPU_DC_MAP_BGR24, 1, 15, 0xff); /* green */
         ipu_dc_map_config(priv, IPU_DC_MAP_BGR24, 0, 23, 0xff); /* blue */


Shouldn't rgb666 and bgr666 do the same?
Currently we have,

/* bgr666 */
         ipu_dc_map_clear(priv, IPU_DC_MAP_BGR666);
         ipu_dc_map_config(priv, IPU_DC_MAP_BGR666, 0, 5, 0xfc); /* blue */
         ipu_dc_map_config(priv, IPU_DC_MAP_BGR666, 1, 11, 0xfc); /* 
green */
         ipu_dc_map_config(priv, IPU_DC_MAP_BGR666, 2, 17, 0xfc); /* red */

Where I'd expect to see
/* bgr666 */
         ipu_dc_map_clear(priv, IPU_DC_MAP_BGR666);
         ipu_dc_map_config(priv, IPU_DC_MAP_BGR666, 0, 17, 0xfc); /* blue */
         ipu_dc_map_config(priv, IPU_DC_MAP_BGR666, 1, 11, 0xfc); /* 
green */
         ipu_dc_map_config(priv, IPU_DC_MAP_BGR666, 2, 5, 0xfc); /* red */


So, it looks like you are adding a duplicate of bgr666 because bgr666 is 
wrong.
Also, I'd prefer to keep the entries in 0,1,2 byte number order(blue, 
green, red,
assuming byte 0 is always blue) so that duplicates are easier to spot.

Not related to this patch, but the comments on gbr24 appear wrong as well.

/* gbr24 */
         ipu_dc_map_clear(priv, IPU_DC_MAP_GBR24);
         ipu_dc_map_config(priv, IPU_DC_MAP_GBR24, 2, 15, 0xff); /* green */
         ipu_dc_map_config(priv, IPU_DC_MAP_GBR24, 1, 7, 0xff); /* blue */
         ipu_dc_map_config(priv, IPU_DC_MAP_GBR24, 0, 23, 0xff); /* red */

Should be
/* brg24 */
         ipu_dc_map_clear(priv, IPU_DC_MAP_BRG24);
         ipu_dc_map_config(priv, IPU_DC_MAP_BRG24, 0, 23, 0xff); /* blue*/
         ipu_dc_map_config(priv, IPU_DC_MAP_BRG24, 1, 7, 0xff); /* green */
         ipu_dc_map_config(priv, IPU_DC_MAP_BRG24, 2, 15, 0xff); /* red */

Of course, my understanding may be totally wrong. If so, please show me 
the light!


Troy
