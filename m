From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [Patch v2 16/21] media: ti-vpe: vpe: use standard struct instead
 of duplicating fields
Date: Mon, 7 Oct 2019 07:45:29 -0500
Message-ID: <20191007124529.nnrzx2btnraimivq@ti.com>
References: <20191004162952.4963-1-bparrot@ti.com>
 <20191004162952.4963-17-bparrot@ti.com>
 <cb01914f-3bca-2558-2b07-86ddbfc9626e@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cb01914f-3bca-2558-2b07-86ddbfc9626e@xs4all.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hans Verkuil <hverkuil@xs4all.nl> wrote on Mon [2019-Oct-07 09:57:26 +0200]:
> On 10/4/19 6:29 PM, Benoit Parrot wrote:
> > For each queue we need to maintain resolutions, pixel format,
> > bytesperline, sizeimage, colorspace, etc.
> > 
> > Instead of manually adding more entries in the vpe_q_data struct, it is
> > better to just add a "struct v4l2_format" member and use that to store
> > all needed information.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/platform/ti-vpe/vpe.c | 185 ++++++++++++++--------------
> >  1 file changed, 91 insertions(+), 94 deletions(-)
> > 
> > diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
> > index d7f8eb901475..5b1e9908fff2 100644
> > --- a/drivers/media/platform/ti-vpe/vpe.c
> > +++ b/drivers/media/platform/ti-vpe/vpe.c
> > @@ -319,14 +319,9 @@ static struct vpe_fmt vpe_formats[] = {
> >   * there is one source queue and one destination queue for each m2m context.
> >   */
> >  struct vpe_q_data {
> > -	unsigned int		width;				/* frame width */
> > -	unsigned int		height;				/* frame height */
> > -	unsigned int		nplanes;			/* Current number of planes */
> > -	unsigned int		bytesperline[VPE_MAX_PLANES];	/* bytes per line in memory */
> > -	enum v4l2_colorspace	colorspace;
> > -	enum v4l2_field		field;				/* supported field value */
> > +	/* current v4l2 format info */
> > +	struct v4l2_format	format;
> 
> Wouldn't it make more sense to use struct v4l2_pix_format_mplane? That avoid having to
> use the '.fmt.pix_mp' sequence every time you need to access it.

Maybe, I chose "struct v4l2_format" because that is the parameter type used
in all related IOCTL. But I guess I can change it, if it make the code
cleaner :).

Benoit

> 
> Regards,
> 
> 	Hans
> 
