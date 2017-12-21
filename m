From: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 1/3] media: V3s: Add support for
 Allwinner CSI.
Date: Thu, 21 Dec 2017 10:38:58 +0800
Message-ID: <20171221103858.94ead278ccc591ff218e72f6@magewell.com>
References: <1510558216-43800-1-git-send-email-yong.deng@magewell.com>
	<CAGb2v65vSRs-OzR91VWG=LMk2z0y=f9CSSJm_3-U_ywyMidgaw@mail.gmail.com>
Reply-To: yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD2JNYHK4MEBBWV55TIQKGQEA3M3D3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v65vSRs-OzR91VWG=LMk2z0y=f9CSSJm_3-U_ywyMidgaw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>linux-arm-kernel <linu>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, 19 Dec 2017 18:35:49 +0800
Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:

> On Mon, Nov 13, 2017 at 3:30 PM, Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org> wrote:
> > Allwinner V3s SoC have two CSI module. CSI0 is used for MIPI interface
> > and CSI1 is used for parallel interface. This is not documented in
> > datasheet but by testing and guess.
> >
> > This patch implement a v4l2 framework driver for it.
> >
> > Currently, the driver only support the parallel interface. MIPI-CSI2,
> > ISP's support are not included in this patch.
> >
> > Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/media/platform/Kconfig                     |   1 +
> >  drivers/media/platform/Makefile                    |   2 +
> >  drivers/media/platform/sunxi/sun6i-csi/Kconfig     |   9 +
> >  drivers/media/platform/sunxi/sun6i-csi/Makefile    |   3 +
> >  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 918 +++++++++++++++++++++
> >  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h | 146 ++++
> >  .../media/platform/sunxi/sun6i-csi/sun6i_csi_reg.h | 203 +++++
> >  .../media/platform/sunxi/sun6i-csi/sun6i_video.c   | 722 ++++++++++++++++
> >  .../media/platform/sunxi/sun6i-csi/sun6i_video.h   |  61 ++
> >  9 files changed, 2065 insertions(+)
> >  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/Kconfig
> >  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/Makefile
> >  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> >  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> >  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_reg.h
> >  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
> >  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.h
> >
> 
> [...]
> 
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
> > new file mode 100644
> > index 0000000..0cebcbd
> > --- /dev/null
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
> 
> [...]
> 
> > +/* -----------------------------------------------------------------------------
> > + * Media Operations
> > + */
> > +static int sun6i_video_formats_init(struct sun6i_video *video)
> > +{
> > +       struct v4l2_subdev_mbus_code_enum mbus_code = { 0 };
> > +       struct sun6i_csi *csi = video->csi;
> > +       struct v4l2_format format;
> > +       struct v4l2_subdev *subdev;
> > +       u32 pad;
> > +       const u32 *pixformats;
> > +       int pixformat_count = 0;
> > +       u32 subdev_codes[32]; /* subdev format codes, 32 should be enough */
> > +       int codes_count = 0;
> > +       int num_fmts = 0;
> > +       int i, j;
> > +
> > +       subdev = sun6i_video_remote_subdev(video, &pad);
> > +       if (subdev == NULL)
> > +               return -ENXIO;
> > +
> > +       /* Get supported pixformats of CSI */
> > +       pixformat_count = sun6i_csi_get_supported_pixformats(csi, &pixformats);
> > +       if (pixformat_count <= 0)
> > +               return -ENXIO;
> > +
> > +       /* Get subdev formats codes */
> > +       mbus_code.pad = pad;
> > +       mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> > +       while (!v4l2_subdev_call(subdev, pad, enum_mbus_code, NULL,
> > +                                &mbus_code)) {
> > +               if (codes_count >= ARRAY_SIZE(subdev_codes)) {
> > +                       dev_warn(video->csi->dev,
> > +                                "subdev_codes array is full!\n");
> > +                       break;
> > +               }
> > +               subdev_codes[codes_count] = mbus_code.code;
> > +               codes_count++;
> > +               mbus_code.index++;
> > +       }
> > +
> > +       if (!codes_count)
> > +               return -ENXIO;
> > +
> > +       /* Get supported formats count */
> > +       for (i = 0; i < codes_count; i++) {
> > +               for (j = 0; j < pixformat_count; j++) {
> > +                       if (!sun6i_csi_is_format_support(csi, pixformats[j],
> > +                                       mbus_code.code)) {
> 
> Bug here. You are testing against mbus_code.code, which would be whatever
> was leftover from the previous section. Instead you should be testing
> against subdev_codes[i], the list you just built.
> 
> Without it, it won't get past this part of the code if the last enumerated
> media bus format isn't supported.
> 
> > +                               continue;
> > +                       }
> > +                       num_fmts++;
> > +               }
> > +       }
> > +
> > +       if (!num_fmts)
> > +               return -ENXIO;
> > +
> > +       video->num_formats = num_fmts;
> > +       video->formats = devm_kcalloc(video->csi->dev, num_fmts,
> > +                       sizeof(struct sun6i_csi_format), GFP_KERNEL);
> > +       if (!video->formats)
> > +               return -ENOMEM;
> > +
> > +       /* Get supported formats */
> > +       num_fmts = 0;
> > +       for (i = 0; i < codes_count; i++) {
> > +               for (j = 0; j < pixformat_count; j++) {
> > +                       if (!sun6i_csi_is_format_support(csi, pixformats[j],
> > +                                       mbus_code.code)) {
> 
> Same here.
> 
> This gets me past the enumeration part of things...
> 
> > +                               continue;
> > +                       }
> > +
> > +                       video->formats[num_fmts].fourcc = pixformats[j];
> > +                       video->formats[num_fmts].mbus_code =
> > +                                       mbus_code.code;
> > +                       video->formats[num_fmts].bpp =
> > +                                       v4l2_pixformat_get_bpp(pixformats[j]);
> > +                       num_fmts++;
> > +               }
> > +       }
> > +
> > +       /* setup default format */
> > +       format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> > +       format.fmt.pix.width = 1280;
> > +       format.fmt.pix.height = 720;
> > +       format.fmt.pix.pixelformat = video->formats[0].fourcc;
> > +       sun6i_video_set_fmt(video, &format);
> 
> But my system crashes here within the OV5640 driver.
> So no tests about the actual functionality. This was on the Bananapi M3,
> which has an A83T SoC.
> 
> 
> In general I think you should make your driver much more noisy than it
> currently is. I spent the whole afternoon adding error messages and
> debug traces to narrow down the issue.

Sorry for making such a simple mistake.

> 
> ChenYu


Thanks,
Yong
