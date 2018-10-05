From: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v7 4/6] media: Add JPEG_RAW format
Date: Fri, 05 Oct 2018 08:53:14 -0300
Message-ID: <90ef806ecfab6e93dc08e4acdce11cc2e15df637.camel@collabora.com>
References: <20181005001226.12789-1-ezequiel@collabora.com>
 <20181005001226.12789-5-ezequiel@collabora.com>
 <20181005080924.78a1654b@coco.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20181005080924.78a1654b-qA1ZUp+OV9c@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mauro Carvalho Chehab <mchehab+samsung-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Dufresne <nicolas.dufresne-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Miouyouyou <myy-tmjzNUIc0P1+EYZtW95mkQ@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-10-05 at 08:09 -0300, Mauro Carvalho Chehab wrote:
> Em Thu,  4 Oct 2018 21:12:24 -0300
> Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> escreveu:
> 
> > From: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > 
> > Add V4L2_PIX_FMT_JPEG_RAW format that does not contain
> > JPEG header in the output frame.
> > 
> > Signed-off-by: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > Signed-off-by: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> > ---
> >  Documentation/media/uapi/v4l/pixfmt-compressed.rst | 9 +++++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c               | 1 +
> >  include/uapi/linux/videodev2.h                     | 1 +
> >  3 files changed, 11 insertions(+)
> > 
> > diff --git a/Documentation/media/uapi/v4l/pixfmt-compressed.rst b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
> > index ba0f6c49d9bf..ad73076276ec 100644
> > --- a/Documentation/media/uapi/v4l/pixfmt-compressed.rst
> > +++ b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
> > @@ -23,6 +23,15 @@ Compressed Formats
> >        - 'JPEG'
> >        - TBD. See also :ref:`VIDIOC_G_JPEGCOMP <VIDIOC_G_JPEGCOMP>`,
> >  	:ref:`VIDIOC_S_JPEGCOMP <VIDIOC_G_JPEGCOMP>`.
> > +    * .. _V4L2-PIX-FMT-JPEG-RAW:
> > +
> > +      - ``V4L2_PIX_FMT_JPEG_RAW``
> > +      - 'Raw JPEG'
> > +      - Raw JPEG bitstream, containing a compressed payload. This format
> > +        contains an image scan, i.e. without any metadata or headers.
> > +        The user is expected to set the needed metadata such as
> > +        quantization and entropy encoding tables, via ``V4L2_CID_JPEG``
> > +        controls, see :ref:`jpeg-control-id`.
> 
> IMO, it is not very clear when someone should use V4L2_CID_JPEG or
> V4L2_PIX_FMT_JPEG_RAW. Some drivers do add a JPEG header internally.
> 

For device drivers, if the hardware can parse JPEG frames, then
V4L2_PIX_FMT_JPEG should be used. Otherwise, if the hardware can
only accept a parsed JPEG (i.e. payload and tables), then
only V4L2_PIX_FMT_JPEG_RAW should be supported.

Parsing headers in the driver is discouraged by the stateful codec
API specification.

With the Request API in place, and the stateful and stateless specs,
device driver writers should be now using the right model for each
type of hardware.

There are exceptions, though. If the hardware handles full JPEG frames,
but requires some extra parsing on the OS side, then the driver
should be using V4L2_PIX_FMT_JPEG, and doing some extra parsing.
For instance, mtk-jpeg seems to work like this.

> Also, if we're now starting to accept headerless JPEG images, you should
> very patch libv4l as well, in order to accept this new format.
> 

Right.

Thanks,
Eze
