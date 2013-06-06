From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 06/11] staging: drm/imx: Add LDB support
Date: Thu, 6 Jun 2013 23:16:10 +0800
Message-ID: <20130606151608.GE28270@S2101-09.ap.freescale.net>
References: <1364484215-13935-1-git-send-email-p.zabel@pengutronix.de>
 <1364484215-13935-7-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1364484215-13935-7-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 28, 2013 at 04:23:30PM +0100, Philipp Zabel wrote:
> +static void imx_ldb_encoder_prepare(struct drm_encoder *encoder)
> +{
> +	struct imx_ldb_channel *imx_ldb_ch = enc_to_imx_ldb_ch(encoder);
> +	struct imx_ldb *ldb = imx_ldb_ch->ldb;
> +	struct drm_display_mode *mode = &encoder->crtc->mode;
> +	unsigned long serial_clk;
> +	unsigned long di_clk = mode->clock * 1000;
> +	int mux = imx_drm_encoder_get_mux_id(imx_ldb_ch->imx_drm_encoder,
> +					     encoder->crtc);
> +
> +	if (ldb->ldb_ctrl & LDB_SPLIT_MODE_EN) {
> +		/* dual channel LVDS mode */
> +		serial_clk = 3500UL * mode->clock;
> +		imx_ldb_set_clock(ldb, mux, 0, serial_clk, di_clk);
> +		imx_ldb_set_clock(ldb, mux, 1, serial_clk, di_clk);
> +	} else {
> +		serial_clk = 7000UL * mode->clock;
> +		imx_ldb_set_clock(ldb, mux, imx_ldb_ch->chno, serial_clk, di_clk);
> +	}
> +
> +	imx_drm_crtc_panel_format(encoder->crtc, DRM_MODE_ENCODER_LVDS,
> +			V4L2_PIX_FMT_RGB24);

I have panel which needs it to be V4L2_PIX_FMT_BGR666.  We should
probably have a device tree property for that like interface_pix_fmt in
parallel display support?

Shawn

> +}
