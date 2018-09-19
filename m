From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 5/6] media: Add controls for JPEG quantization tables
Date: Wed, 19 Sep 2018 13:21:08 +0900
Message-ID: <CAAFQd5BieqODJWO0wzHZ_zikU+v8JdiJ2zYu=WPHmZKzJ1EELQ@mail.gmail.com>
References: <20180905220011.16612-1-ezequiel@collabora.com>
 <20180905220011.16612-6-ezequiel@collabora.com>
 <718d8a73-008a-a610-d090-91cc54a992ad@xs4all.nl>
 <710d4e77de63b46e6ffd440c9c98ca9af133117f.camel@collabora.com>
 <928a021c1e402f99eadd20e00aa5ec0cc218edbd.camel@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <928a021c1e402f99eadd20e00aa5ec0cc218edbd.camel-W9ppeneeCTY@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: contact-W9ppeneeCTY@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Dufresne <nicolas.dufresne-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, myy-tmjzNUIc0P1+EYZtW95mkQ@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 16, 2018 at 1:48 AM Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> wrote:
>
> Hi,
>
> On Mon, 2018-09-10 at 10:25 -0300, Ezequiel Garcia wrote:
> > Hi Hans,
> >
> > Thanks for the review.
> >
> > On Mon, 2018-09-10 at 14:42 +0200, Hans Verkuil wrote:
> > > On 09/06/2018 12:00 AM, Ezequiel Garcia wrote:
> > > > From: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > > >
> > > > Add V4L2_CID_JPEG_QUANTIZATION compound control to allow userspace
> > > > configure the JPEG quantization tables.
> > > >
> > > > Signed-off-by: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > > > Signed-off-by: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> > > > ---
> > > >  .../media/uapi/v4l/extended-controls.rst      | 31 +++++++++++++++++++
> > > >  .../media/videodev2.h.rst.exceptions          |  1 +
> > > >  drivers/media/v4l2-core/v4l2-ctrls.c          | 10 ++++++
> > > >  include/uapi/linux/v4l2-controls.h            | 12 +++++++
> > > >  include/uapi/linux/videodev2.h                |  1 +
> > > >  5 files changed, 55 insertions(+)
> > > >
> > > > diff --git a/Documentation/media/uapi/v4l/extended-controls.rst b/Documentation/media/uapi/v4l/extended-controls.rst
> > > > index 9f7312bf3365..1335d27d30f3 100644
> > > > --- a/Documentation/media/uapi/v4l/extended-controls.rst
> > > > +++ b/Documentation/media/uapi/v4l/extended-controls.rst
> > > > @@ -3354,7 +3354,38 @@ JPEG Control IDs
> > > >      Specify which JPEG markers are included in compressed stream. This
> > > >      control is valid only for encoders.
> > > >
> > > > +.. _jpeg-quant-tables-control:
> > > >
> > > > +``V4L2_CID_JPEG_QUANTIZATION (struct)``
> > > > +    Specifies the luma and chroma quantization matrices for encoding
> > > > +    or decoding a V4L2_PIX_FMT_JPEG_RAW format buffer. The :ref:`itu-t81`
> > > > +    specification allows 8-bit quantization coefficients for
> > > > +    baseline profile images, and 8-bit or 16-bit for extended profile
> > > > +    images. Supporting or not 16-bit precision coefficients is driver-specific.
> > > > +    Coefficients must be set in JPEG zigzag scan order.
> > > > +
> > > > +
> > > > +.. c:type:: struct v4l2_ctrl_jpeg_quantization
> > > > +
> > > > +.. cssclass:: longtable
> > > > +
> > > > +.. flat-table:: struct v4l2_ctrl_jpeg_quantization
> > > > +    :header-rows:  0
> > > > +    :stub-columns: 0
> > > > +    :widths:       1 1 2
> > > > +
> > > > +    * - __u8
> > > > +      - ``precision``
> > > > +      - Specifies the coefficient precision. User shall set 0
> > > > +        for 8-bit, and 1 for 16-bit.
> > >
> > > So does specifying 1 here switch the HW encoder to use extended profile?
> > > What if the HW only supports baseline? The rockchip driver doesn't appear
> > > to check the precision field at all...
> > >
> >
> > The driver is missing to check that, when the user sets this control.
> >
> > > I think this needs a bit more thought.
> > >
> > > I am not at all sure that this is the right place for the precision field.
> > > This is really about JPEG profiles, so I would kind of expect a JPEG PROFILE
> > > control (just like other codec profiles), or possibly a new pixelformat for
> > > extended profiles.
> > >
> > > And based on that the driver would interpret these matrix values as 8 or
> > > 16 bits.
> > >
> >
> > Right, the JPEG profile control is definitely needed. I haven't add it because
> > it wouldn't be used, since this VPU can only do baseline.
>
> Well, I suppose it would still be relevant that you add it for the
> encoder and only report baseline there.
>
> > However, the problem is that some JPEGs in the wild have with 8-bit data and
> > 16-bit quantization coefficients, as per [1] and [2]:
> >
> > [1] https://github.com/martinhath/jpeg-rust/issues/1
> > [2] https://github.com/libjpeg-turbo/libjpeg-turbo/pull/90
> >
> > So, in order to support decoding of these images, I've added the precision
> > field to the quantization control. The user would be able to set a baseline
> > or extended profile thru a (future) profile control, and if 16-bit
> > tables are found, and if the hardware supports them, the driver
> > would be able to support them.
> >
> > Another option, which might be even better, is have explicit baseline
> > and extended quantization tables controls, e.g.: V4L2_CID_JPEG_QUANT
> > and V4L2_CID_JPEG_EXT_QUANT.
>
> I think this makes more sense than a common structure with an indication
> bit on how to interpret the data.
>
> However, it seems problematic that userspace can't figure out whether
> 16-bit quant tables are supported with a baseline profile and just has
> to try and see.
>
> Hans, do you think this is an acceptable approach or should we rather
> stick to the standard here, at the cost of not supporting these pictures
> that were encoded with this common abuse of the standard?

Perhaps we just need a control called V4L2_CID_JPEG_QUANT_PRECISION,
where drivers can set the min/max (e.g. min = 8, max = 16, step = 8)
to the range they support and user space can select the precision it
wants, if the hardware gives a choice?

Best regards,
Tomasz
