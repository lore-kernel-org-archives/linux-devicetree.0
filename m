From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [Patch v2][ 05/37] fbdev: Add the lacking FB_SYNC_* for matching
 the DISPLAY_FLAGS_*
Date: Sat, 19 Oct 2013 13:08:53 +0200
Message-ID: <20131019110853.GO18477@ns203013.ovh.net>
References: <1382022155-21954-1-git-send-email-denis@eukrea.com>
 <1382022155-21954-6-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1382022155-21954-6-git-send-email-denis@eukrea.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, Eric B??nard <eric@eukrea.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 17:02 Thu 17 Oct     , Denis Carikli wrote:
> Without that fix, drivers using the fb_videomode_from_videomode
>   function will not be able to get certain information because
>   some DISPLAY_FLAGS_* have no corresponding FB_SYNC_*.
> =

> Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: devicetree@vger.kernel.org
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Eric B=E9nard <eric@eukrea.com>
> Signed-off-by: Denis Carikli <denis@eukrea.com>
> ---
Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

Best Regards,
J.
>  drivers/video/fbmon.c   |    4 ++++
>  include/uapi/linux/fb.h |    2 ++
>  2 files changed, 6 insertions(+)
> =

> diff --git a/drivers/video/fbmon.c b/drivers/video/fbmon.c
> index 6103fa6..29a9ed0 100644
> --- a/drivers/video/fbmon.c
> +++ b/drivers/video/fbmon.c
> @@ -1402,6 +1402,10 @@ int fb_videomode_from_videomode(const struct video=
mode *vm,
>  		fbmode->sync |=3D FB_SYNC_HOR_HIGH_ACT;
>  	if (vm->flags & DISPLAY_FLAGS_VSYNC_HIGH)
>  		fbmode->sync |=3D FB_SYNC_VERT_HIGH_ACT;
> +	if (vm->flags & DISPLAY_FLAGS_DE_HIGH)
> +		fbmode->sync |=3D FB_SYNC_DE_HIGH_ACT;
> +	if (vm->flags & DISPLAY_FLAGS_PIXDATA_POSEDGE)
> +		fbmode->sync |=3D FB_SYNC_PIXDAT_HIGH_ACT;
>  	if (vm->flags & DISPLAY_FLAGS_INTERLACED)
>  		fbmode->vmode |=3D FB_VMODE_INTERLACED;
>  	if (vm->flags & DISPLAY_FLAGS_DOUBLESCAN)
> diff --git a/include/uapi/linux/fb.h b/include/uapi/linux/fb.h
> index fb795c3..30487df 100644
> --- a/include/uapi/linux/fb.h
> +++ b/include/uapi/linux/fb.h
> @@ -215,6 +215,8 @@ struct fb_bitfield {
>  					/* vtotal =3D 144d/288n/576i =3D> PAL  */
>  					/* vtotal =3D 121d/242n/484i =3D> NTSC */
>  #define FB_SYNC_ON_GREEN	32	/* sync on green */
> +#define FB_SYNC_DE_HIGH_ACT	64	/* data enable high active */
> +#define FB_SYNC_PIXDAT_HIGH_ACT	64	/* data enable high active */
>  =

>  #define FB_VMODE_NONINTERLACED  0	/* non interlaced */
>  #define FB_VMODE_INTERLACED	1	/* interlaced	*/
> -- =

> 1.7.9.5
> =
