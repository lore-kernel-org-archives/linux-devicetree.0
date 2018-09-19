From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 5/6] media: Add controls for JPEG quantization tables
Date: Wed, 19 Sep 2018 13:28:31 +0900
Message-ID: <CAAFQd5Bir0uMsaJPHdgQDvcYHpxZ4sUSn10OPpRXcnn-THUx2A@mail.gmail.com>
References: <20180905220011.16612-1-ezequiel@collabora.com>
 <20180905220011.16612-6-ezequiel@collabora.com>
 <e7126e89d8984eb93216ec75c83ce1fc5afc437d.camel@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <e7126e89d8984eb93216ec75c83ce1fc5afc437d.camel-W9ppeneeCTY@public.gmane.org>
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
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Dufresne <nicolas.dufresne-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, myy-tmjzNUIc0P1+EYZtW95mkQ@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 13, 2018 at 9:15 PM Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> wrote:
>
> Hi,
>
> On Wed, 2018-09-05 at 19:00 -0300, Ezequiel Garcia wrote:
> > From: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >
> > Add V4L2_CID_JPEG_QUANTIZATION compound control to allow userspace
> > configure the JPEG quantization tables.
> >
> > Signed-off-by: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > Signed-off-by: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> > ---
> >  .../media/uapi/v4l/extended-controls.rst      | 31 +++++++++++++++++++
> >  .../media/videodev2.h.rst.exceptions          |  1 +
> >  drivers/media/v4l2-core/v4l2-ctrls.c          | 10 ++++++
> >  include/uapi/linux/v4l2-controls.h            | 12 +++++++
> >  include/uapi/linux/videodev2.h                |  1 +
> >  5 files changed, 55 insertions(+)
> >
> > diff --git a/Documentation/media/uapi/v4l/extended-controls.rst b/Documentation/media/uapi/v4l/extended-controls.rst
> > index 9f7312bf3365..1335d27d30f3 100644
> > --- a/Documentation/media/uapi/v4l/extended-controls.rst
> > +++ b/Documentation/media/uapi/v4l/extended-controls.rst
> > @@ -3354,7 +3354,38 @@ JPEG Control IDs
> >      Specify which JPEG markers are included in compressed stream. This
> >      control is valid only for encoders.
> >
> > +.. _jpeg-quant-tables-control:
>
> I just had a look at how the Allwinner VPU handles JPEG decoding and it
> seems to require the following information (in addition to
> quantization):

I assume the hardware doesn't have the ability to parse those from the
stream and so they need to be parsed by user space and given to the
driver?

>
> * Horizontal and vertical sampling factors for each Y/U/V component:
>
> The number of components and sampling factors are coded separately in
> the bitstream, but it's probably easier to use the already-existing
> V4L2_CID_JPEG_CHROMA_SUBSAMPLING control for specifying that.
>
> However, this is potentially very much related to the destination
> format. If we decide that this format should match the format resulting
> from decompression, we don't need to specify it through an external
> control. On the other hand, it's possible that the VPU has format
> conversion block integrated in its pipeline so it would also make sense
> to consider the destination format as independent.

+1 for keeping it separate.

>
> * Custom Huffman tables (DC and AC), both for luma and chroma
>
> It seems that there is a default table when no Huffman table is provided
> in the bitstream (I'm not too sure how standard that is, just started
> learning about JPEG). We probably need a specific control for that.

What happens if there is one in the bitstream? Would the hardware pick
it automatically?

I think it might make sense to just have a general control for Huffman
table, which would be always provided by the user space, regardless of
whether it's parsed from the stream or default, so that drivers don't
have to care and could just always use it.

Best regards,
Tomasz
