From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 06/11] staging: drm/imx: Add LDB support
Date: Thu, 06 Jun 2013 17:54:42 +0200
Message-ID: <1370534082.3931.7.camel@pizza.hi.pengutronix.de>
References: <1364484215-13935-1-git-send-email-p.zabel@pengutronix.de>
 <1364484215-13935-7-git-send-email-p.zabel@pengutronix.de>
 <20130606151608.GE28270@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <20130606151608.GE28270@S2101-09.ap.freescale.net>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel/>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: "devel" <devel-bounces@linuxdriverproject.org>
To: Shawn Guo <shawn.guo@linaro.org>
Cc: devel@driverdev.osuosl.org, Fabio Estevam <fabio.estevam@freescale.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, kernel@pengutronix.de, Martin Fuzzey <mfuzzey@parkeon.com>, Sean Cross <xobs@kosagi.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

Am Donnerstag, den 06.06.2013, 23:16 +0800 schrieb Shawn Guo:
> On Thu, Mar 28, 2013 at 04:23:30PM +0100, Philipp Zabel wrote:
> > +static void imx_ldb_encoder_prepare(struct drm_encoder *encoder)
> > +{
> > +	struct imx_ldb_channel *imx_ldb_ch = enc_to_imx_ldb_ch(encoder);
> > +	struct imx_ldb *ldb = imx_ldb_ch->ldb;
> > +	struct drm_display_mode *mode = &encoder->crtc->mode;
> > +	unsigned long serial_clk;
> > +	unsigned long di_clk = mode->clock * 1000;
> > +	int mux = imx_drm_encoder_get_mux_id(imx_ldb_ch->imx_drm_encoder,
> > +					     encoder->crtc);
> > +
> > +	if (ldb->ldb_ctrl & LDB_SPLIT_MODE_EN) {
> > +		/* dual channel LVDS mode */
> > +		serial_clk = 3500UL * mode->clock;
> > +		imx_ldb_set_clock(ldb, mux, 0, serial_clk, di_clk);
> > +		imx_ldb_set_clock(ldb, mux, 1, serial_clk, di_clk);
> > +	} else {
> > +		serial_clk = 7000UL * mode->clock;
> > +		imx_ldb_set_clock(ldb, mux, imx_ldb_ch->chno, serial_clk, di_clk);
> > +	}
> > +
> > +	imx_drm_crtc_panel_format(encoder->crtc, DRM_MODE_ENCODER_LVDS,
> > +			V4L2_PIX_FMT_RGB24);
> 
> I have panel which needs it to be V4L2_PIX_FMT_BGR666.  We should
> probably have a device tree property for that like interface_pix_fmt in
> parallel display support?

I'm not sure. Is this something that should be done unconditionally for
fsl,data-width = <18>?

regards
Philipp
