From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/4] drm/panel: jh057n0090: Don't use magic constant
Date: Tue, 25 Jun 2019 23:24:54 +0200
Message-ID: <20190625212454.GC20625@ravnborg.org>
References: <cover.1561482165.git.agx@sigxcpu.org>
 <ec1993368dba4e6ec1c72faa9c7bb25cf8ca95d3.1561482165.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ec1993368dba4e6ec1c72faa9c7bb25cf8ca95d3.1561482165.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2019 at 07:05:17PM +0200, Guido Günther wrote:
> 0xBF isn't in any ST7703 data sheet so mark it as unknown. This avoids
> confusion on whether there is a missing command in that
> dsi_generic_write_seq() call.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> index 6dcb692c4701..b8a069055fbc 100644
> --- a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> +++ b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> @@ -33,6 +33,7 @@
>  #define ST7703_CMD_SETEXTC	 0xB9
>  #define ST7703_CMD_SETMIPI	 0xBA
>  #define ST7703_CMD_SETVDC	 0xBC
> +#define ST7703_CMD_UNKNOWN0	 0xBF
>  #define ST7703_CMD_SETSCR	 0xC0
>  #define ST7703_CMD_SETPOWER	 0xC1
>  #define ST7703_CMD_SETPANEL	 0xCC
> @@ -94,7 +95,7 @@ static int jh057n_init_sequence(struct jh057n *ctx)
>  	msleep(20);
>  
>  	dsi_generic_write_seq(dsi, ST7703_CMD_SETVCOM, 0x3F, 0x3F);
> -	dsi_generic_write_seq(dsi, 0xBF, 0x02, 0x11, 0x00);
> +	dsi_generic_write_seq(dsi, ST7703_CMD_UNKNOWN0, 0x02, 0x11, 0x00);
>  	dsi_generic_write_seq(dsi, ST7703_CMD_SETGIP1,
>  			      0x82, 0x10, 0x06, 0x05, 0x9E, 0x0A, 0xA5, 0x12,
>  			      0x31, 0x23, 0x37, 0x83, 0x04, 0xBC, 0x27, 0x38,
> -- 
> 2.20.1
