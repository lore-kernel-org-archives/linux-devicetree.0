From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: Re: [PATCH v1 2/2] drm/panel: simple: add display timings for logic
 technologies displays
Date: Fri, 4 Oct 2019 07:09:22 +0000
Message-ID: <f6f7055534e0843eaccd6269f867ef44e4953849.camel@toradex.com>
References: <20190920075411.15735-1-marcel@ziswiler.com>
 <20190920075411.15735-2-marcel@ziswiler.com> <20191001220539.GA16232@bogus>
 <e6fdfd7f46308dbc8fd33d4a2ff0b242ec39a84c.camel@toradex.com>
 <CAL_JsqKmCVP3Fc2sUY=FpM5-HLQ0-=uTf6PEwn0XzyC5BBHBOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqKmCVP3Fc2sUY=FpM5-HLQ0-=uTf6PEwn0XzyC5BBHBOA@mail.gmail.com>
Content-Language: en-US
Content-ID: <8219941CBD310146973D8E8CCB36BEC4@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "robh@kernel.org" <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "airlied@linux.ie" <airlied@linux.ie>, "j.bauer@endrich.com" <j.bauer@endrich.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, "info@logictechno.com" <info@logictechno.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "marcel@ziswiler.com" <marcel@ziswiler.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "sam@ravnborg.org" <sam@ravnborg.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2019-10-03 at 10:59 -0500, Rob Herring wrote:
> On Wed, Oct 2, 2019 at 5:27 AM Philippe Schenker
> <philippe.schenker@toradex.com> wrote:
> > On Tue, 2019-10-01 at 17:05 -0500, Rob Herring wrote:
> > > On Fri, Sep 20, 2019 at 09:54:11AM +0200, Marcel Ziswiler wrote:
> > > > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > > > 
> > > > Add display timings for the following 3 display panels
> > > > manufactured
> > > > by
> > > > Logic Technologies Limited:
> > > > 
> > > > - LT161010-2NHC e.g. as found in the Toradex Capacitive Touch
> > > > Display
> > > >   7" Parallel [1]
> > > > - LT161010-2NHR e.g. as found in the Toradex Resistive Touch
> > > > Display
> > > > 7"
> > > >   Parallel [2]
> > > > - LT170410-2WHC e.g. as found in the Toradex Capacitive Touch
> > > > Display
> > > >   10.1" LVDS [3]
> > > > 
> > > > Those panels may also be distributed by Endrich Bauelemente
> > > > Vertriebs
> > > > GmbH [4].
> > > > 
> > > > [1]
> > > > https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
> > > > [2]
> > > > https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
> > > > [3]
> > > > https://docs.toradex.com/105952-10-1-inch-lvds-capacitive-touch-display-1280x800-datasheet.pdf
> > > > [4]
> > > > https://www.endrich.com/isi50_isi30_tft-displays/lt170410-1whc_isi30
> > > > 
> > > > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > > > 
> > > > ---
> > > > 
> > > >  drivers/gpu/drm/panel/panel-simple.c | 65
> > > > ++++++++++++++++++++++++++++
> > > >  1 file changed, 65 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c
> > > > b/drivers/gpu/drm/panel/panel-simple.c
> > > > index 28fa6ba7b767..42bd0de25167 100644
> > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > @@ -2034,6 +2034,62 @@ static const struct panel_desc lg_lp129qe
> > > > = {
> > > >     },
> > > >  };
> > > > 
> > > > +static const struct display_timing
> > > > logictechno_lt161010_2nh_timing
> > > > = {
> > > > +   .pixelclock = { 26400000, 33300000, 46800000 },
> > > > +   .hactive = { 800, 800, 800 },
> > > > +   .hfront_porch = { 16, 210, 354 },
> > > > +   .hback_porch = { 46, 46, 46 },
> > > > +   .hsync_len = { 1, 20, 40 },
> > > > +   .vactive = { 480, 480, 480 },
> > > > +   .vfront_porch = { 7, 22, 147 },
> > > > +   .vback_porch = { 23, 23, 23 },
> > > > +   .vsync_len = { 1, 10, 20 },
> > > > +   .flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> > > > +            DISPLAY_FLAGS_DE_HIGH |
> > > > DISPLAY_FLAGS_PIXDATA_POSEDGE |
> > > > +            DISPLAY_FLAGS_SYNC_POSEDGE,
> > > > +};
> > > > +
> > > > +static const struct panel_desc logictechno_lt161010_2nh = {
> > > > +   .timings = &logictechno_lt161010_2nh_timing,
> > > > +   .num_timings = 1,
> > > > +   .size = {
> > > > +           .width = 154,
> > > > +           .height = 86,
> > > > +   },
> > > > +   .bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> > > > +   .bus_flags = DRM_BUS_FLAG_DE_HIGH |
> > > > +                DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> > > > +                DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
> > > > +};
> > > > +
> > > > +static const struct display_timing
> > > > logictechno_lt170410_2whc_timing
> > > > = {
> > > > +   .pixelclock = { 68900000, 71100000, 7340000 },
> > > > +   .hactive = { 1280, 1280, 1280 },
> > > > +   .hfront_porch = { 23, 60, 71 },
> > > > +   .hback_porch = { 23, 60, 71 },
> > > > +   .hsync_len = { 15, 40, 47 },
> > > > +   .vactive = { 800, 800, 800 },
> > > > +   .vfront_porch = { 5, 7, 10 },
> > > > +   .vback_porch = { 5, 7, 10 },
> > > > +   .vsync_len = { 6, 9, 12 },
> > > > +   .flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> > > > +            DISPLAY_FLAGS_DE_HIGH |
> > > > DISPLAY_FLAGS_PIXDATA_POSEDGE |
> > > > +            DISPLAY_FLAGS_SYNC_POSEDGE,
> > > > +};
> > > > +
> > > > +static const struct panel_desc logictechno_lt170410_2whc = {
> > > > +   .timings = &logictechno_lt170410_2whc_timing,
> > > > +   .num_timings = 1,
> > > > +   .size = {
> > > > +           .width = 217,
> > > > +           .height = 136,
> > > > +   },
> > > > +   .bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> > > > +   .bus_flags = DRM_BUS_FLAG_DE_HIGH |
> > > > +                DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> > > > +                DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
> > > > +};
> > > > +
> > > >  static const struct drm_display_mode mitsubishi_aa070mc01_mode
> > > > = {
> > > >     .clock = 30400,
> > > >     .hdisplay = 800,
> > > > @@ -3264,6 +3320,15 @@ static const struct of_device_id
> > > > platform_of_match[] = {
> > > >     }, {
> > > >             .compatible = "lg,lp129qe",
> > > >             .data = &lg_lp129qe,
> > > > +   }, {
> > > > +           .compatible = "logictechno,lt161010-2nhc",
> > > > +           .data = &logictechno_lt161010_2nh,
> > > > +   }, {
> > > > +           .compatible = "logictechno,lt161010-2nhr",
> > > > +           .data = &logictechno_lt161010_2nh,
> > > > +   }, {
> > > > +           .compatible = "logictechno,lt170410-2whc",
> > > > +           .data = &logictechno_lt170410_2whc,
> > > 
> > > The vendor prefix wasn't documented, but the compatible string and
> > > rest
> > > already are?
> > 
> > Marcel added the vendor prefix in the first patch of the series [1]
> 
> Right, but where's the panel's binding documentation with the above
> compatible strings documented?
> 

That one is indeed missing, we will provide that week. Thanks for
pointing this out!

Philippe
